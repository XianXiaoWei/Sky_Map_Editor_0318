
-------------------------------------------------------------------------------
-- Notes:  Defines DebugPrint, which is just like the standard Lua print,
--         except it turns itself off for release builds.  DebugPrintError is
--         like DebugPrint, but it write to stderr, instead of stdout.
--
-- Author: John Edwards
-- Date C: 11-10-2007
-------------------------------------------------------------------------------

function DebugPrint( ... )
	if CONFIG ~= "Release" and CONFIG ~= "PublicBeta" and CONFIG ~= "Gold" then
		return print( ... )
	end
end

function DebugPrintError( ... )
	if CONFIG ~= "Release" and CONFIG ~= "PublicBeta" and CONFIG ~= "Gold" then
		local sep = ""
		for i,arg in ipairs( { ... } ) do
			io.stderr:write( sep..tostring( arg ) )
			sep = "\t"
		end
		io.stderr:write( "\n" )
	end
end

-------------------------------------------------------------------------------
-- Notes:  Defines the "new" directive.
--
--         "new" is meant to feel familiar to the C++ keyword.  Is that the
--         best fit for the Lua language?  I don't know, but I do feel it will
--         make people more inclined to adopt it.
--
--         The basic usage of new is as follows:
--             new 'ClassName'
--
--         You can do a placement new, or a new using an allocator with the
--         following syntax:
--             new ( alloc ) 'ClassName'
--
--         You can pass a construction table to the new object with the
--         following syntax:
--             new 'ClassName' { ctor-table }
--
--         We do not support traditional C++ constructor arguments.
--
-- Author: John Edwards
-- Date C: 5-8-2007
-------------------------------------------------------------------------------

local function Allocate( class, allocator )
	local mtbl = _G[ class ]
	if type( mtbl ) ~= "table" or type( mtbl.new ) ~= "function" then
		local errstr = "new directive: Cannot allocate: "..class..".\n"
		if type( mtbl ) == "table" and mtbl.__vars then
			errstr = errstr.."  "..class.." is abstract."
		else
			errstr = errstr.."  "..class.." does not represent a C++ class."
		end
		error( errstr )
	end
	return mtbl.new( allocator )
end

function new( arg )
	if type( arg ) == "string" then
		return Allocate( arg )
	elseif type( arg ) == "userdata" then
		-- Is arg really an allocator userdata?
		return function( class ) return Allocate( class, arg ) end
	else
		error( "new directive: First argument must be the name of a class, or an allocator.\n"..
			"Given: "..tostring( arg ) )
	end
end

-------------------------------------------------------------------------------
-- Notes:  Defines the PrintTable function, which writes a nicely formatted
--         table to a given file (possibly stdout).  The intended use is to
--         print the tweak vars table, and the implementation is geared toward
--         that end.
--
-- Author: John Edwards
-- Date C: 5-10-2007
-------------------------------------------------------------------------------

function StringStream()
	return {
		buffer = {},
		
		write = function( self, str )
			table.insert( self.buffer, str )
		end,
		
		output = function( self )
			return table.concat( self.buffer )
		end
	}
end

local function Eval( v )
	if type( v ) == "function" or
		(type( v ) == "table" and getmetatable( v ) and getmetatable( v ).__call) then
		v = Eval( v() )
	end
	return v
end

local function PrintValue( out, v, prefix )
	if type( v ) == "table" then
		PrintTable( out, v, prefix.."\t" )
	elseif type( v ) == "string" then
		out:write( string.format( "%q", v ) )
	else
		out:write( tostring( v ) )
	end
end

local function PrintTableInline( out, tbl, prefix )
	local first = "{"

	for i,val in ipairs( tbl ) do
		out:write( first.." " )
		local evald = Eval(val)
		if type( evald ) == "table" then
			PrintTableInline( out, evald, "" )
		elseif type( evald ) == "string" then
			out:write( string.format( "%q", evald ) )
		else
			out:write( tostring( evald ) )
		end
		first = ","
	end

	if first == "{" then out:write( "{" ) end

	out:write( " }" )
end

local function DecorateKey( key )
	-- If the key contains non-alphanumeric characters, we have to wrap it
	-- in [" ... "].
	if type( key ) == "number" then
		return "[ "..key.." ]"
	elseif string.find( key, "[^_%w]" ) or string.find( key, "^[^_%a]" ) then
		return string.format( "[%q]", key )
	else
		return key
	end
end

local function PrintTableExpanded( out, tbl, prefix )
	-- First write the numerically keyed values, and then write the string
	-- keyed values in alphabetical order by key.
	local first = "{"

	out:write( "\n" )

	local sortMe = {}
	for k,v in pairs( tbl ) do
		assert( type( k ) == "string" or type( k ) == "number" )
		table.insert( sortMe, { k, v } )
	end

	table.sort( sortMe,
		function( e1, e2 )
			if type( e1[1] ) == type( e2[1] ) then return e1[1] < e2[1] end
			return type( e1[1] ) == "number"
		end
		)

	for i,v in ipairs( sortMe ) do
		local key, val = v[1], v[2]
		out:write( prefix..first.."\t"..DecorateKey( key ).." = " )
		PrintValue( out, Eval(val), prefix )
		out:write( "\n" )

		first = ","
	end

	out:write( prefix.."}" )
end

local function IsTableSimple( tbl )
	for k,v in pairs( tbl ) do
		if type( k ) ~= "number" then
			return false
		else
			local evald = Eval( v )
			if type( evald ) == "table" and not IsTableSimple( evald ) then
				return false
			end
		end
	end

	return true
end

-- out is the file we print to.  tbl is the table we print.  prefix is only
-- used for internal recursive calls.
function PrintTable( out, tbl, prefix )
	-- Allow the user to not specify an out stream.
	if type( out ) == "table" and not tbl then
		if CONFIG == "Release" or CONFIG == "PublicBeta" or CONFIG == "Gold" then
			return
		else
			tbl = out
			out = io.stdout
		end
	end

	-- The user generally won't give a prefix.
	if not prefix then prefix = "" end

	-- A table is simple if it doesn't contain keys and doesn't contain tables
	-- that aren't simple.
	-- We print simple tables inline and other tables expanded.
	if IsTableSimple( tbl ) then
		PrintTableInline( out, tbl, prefix )
	else
		PrintTableExpanded( out, tbl, prefix )
	end
end

-------------------------------------------------------------------------------
-- Notes:  Defines the 'resource' and 'file' directives and some
--         functions for processing aggregated lists of resources.
--
--         'resource' directive:
--         Because Lua doesn't require parens around function argument lists
--         that consist of a single string or a single table constructor, we
--         can use "resource" in a keyword-like way:
--             resource "ResourceClass" "UniqueName" { class_constructor }
--         Localized resources are supported with this syntax:
--             resource "ResourceClass" "UniqueName"
--                 "Locale1" { class_constructor }
--                 "Locale2" { class_constructor }
--                                .
--                                .
--                                .
--                 { default_class_constructor }
--
--         'file' directive:
--         Used to specify a file that is required by the runtime. This
--         guarantees that the file will be available in package builds.
--
--         QueueResourcesForLoad():
--         Instances all the resources in the given table (using the given
--         allocator) into the given resource manager, adding the resources
--         to the resource manager's load list.
--
--         QueueResourcesForUnload():
--         Adds all the resources in the given table to the given resource
--         manager's unload list.
--
-- Author: John Edwards
-- Date C: 5-4-2007
-------------------------------------------------------------------------------

-- The resource directive aggregates resources in this global table.
resourceTable = {}

-- Resource constructor objects that will be referenced by resourcerefs
resourceDefTable = {}

-- Only resources that pass the filter are added to the resource table
resourceFilter = function( cons ) return true end

ignoreResourceRefs = false

function resourcereg( class, isDef )
	if type( class ) ~= "string" then
		error( "resource directive requires a Resource class name for arg 1.\n"..
			"Given: "..tostring( class ).."." )
	end

	return function( name )
		if type( name ) ~= "string" then
			error( "resource directive requires a unique name for arg 2.\n"..
				"Given: "..tostring( name ).."." )
		end

		local function Error( msg ) error( "resource error: class="..class..", name="..name..":\n"..msg ) end

		local argCount = 3
		local locale = nil
		function GatherCons( arg )
			if not arg then
				if argCount == 3 then Error( "Arg 3: No argument given.  Requires a Class constructor table or locale." ) end
				return
			elseif type( arg ) == "string" then
				if locale then Error( "Arg "..argCount..": Expected a table, but got a string: \""..arg.."\"." ) end
				locale = arg
			elseif type( arg ) == "table" then
				if not locale or not resourceLocale or resourceLocale == locale then
					arg.class = class
					arg.name = name
					local resDefKey = arg.class.."_"..arg.name
					if isDef then
						resourceDefTable[ resDefKey ] = arg
					elseif resourceFilter( arg ) then
						table.insert( resourceTable, arg )
					end
					if not locale then
						return function( bad )
							if bad then Error( "Default constructor table must be the final argument." ) end
						end
					elseif resourceLocale == locale then
						local function Nop( arg ) if arg then return Nop end end
						return Nop
					end
				end
				locale = nil
			else
				Error( "Arg "..argCount..": Unable to process.  Given: "..tostring( arg ).."." )
			end

			argCount = argCount + 1
			return GatherCons
		end
		return GatherCons
	end
end

function resource( class )
	return resourcereg( class, false )
end

function resourcedef( class )
	return resourcereg( class, true )
end

function resourceref( class )
	if ignoreResourceRefs then
		local function Nop() return Nop end
		return Nop
	end

	if type( class ) ~= "string" then
		error( "resourceref directive requires a Resource class name for arg 1.\n"..
			"Given: "..tostring( class ).."." )
	end

	return function( name )
		if type( name ) ~= "string" then
			error( "resourceref directive requires a unique name for arg 2.\n"..
				"Given: "..tostring( name ).."." )
		end
		
		local function Error( msg ) print( msg ); resourceErrorCode = 1; end

		local resDefKey = class.."_"..name
		local resCons = resourceDefTable[ resDefKey ]

		-- If the resourceDef is found in one of the *Def.lua files, then add it to the table for later Loading/Unloading
		-- Otherwise it may exist as a Persistant resource. If it does, then we don't need to do anything
		if resCons == nil then
			Error( "resourceref warning: Unable to find resource definition for "..class.." \""..name.."\"" )
		elseif resourceFilter( resCons ) then
			table.insert( resourceTable, resCons )
		end
	end
end

-- The file directive aggregates runtime files in this global table.
runtimeFileTable = {}

function file( path )
	if type( path ) ~= "string" then
		error( "file directive requires a file path for arg 1.\n"..
			"Given: "..tostring( path ).."." )
	end
	
	table.insert( runtimeFileTable, path )
end

--[[ The soundDefResources directive allows sound definitions to be specified
in the following manner:

soundDefResources { looping = false, streaming = true, instanceLimit = 5 } {
	GameSoundName = "filename.wav",
	GameSoundName2 = { source = "filename2.wav", instanceLimit = 2 },
	...
}
--]]

LOOP = "LOOP"
NOLOOP = "NOLOOP"
STREAM = "STREAM"
NOSTREAM = "NOSTREAM"
PRELOAD = "PRELOAD"
NOPRELOAD = "NOPRELOAD"

function soundDefResources( sharedCons )
	if type( sharedCons ) ~= "table" then
		error( "soundDefResources directive requires a settings table for arg 1.\n"..
			"Given: "..tostring( sharedCons ).."." )
	end

	function parseFlagsSugar( cons )
		local result = {}
		for k, v in pairs( cons ) do
			if type( k ) == "number" and type( v ) == "string" then
				if		v == LOOP		then result[ "looping" ] = true
				elseif	v == NOLOOP		then result[ "looping" ] = false
				elseif	v == STREAM		then result[ "streaming" ] = true
				elseif	v == NOSTREAM	then result[ "streaming" ] = false
				elseif	v == PRELOAD	then result[ "preload" ] = true
				elseif	v == NOPRELOAD	then result[ "preload" ] = false
				else
					error( "Unrecognized flag \""..v.."\"" )
				end
			else
				result[ k ] = v
			end
		end
		return result
	end

	function parseSourceAndInstanceCountSugar( cons )
		local result = {}
		for k, v in pairs( cons ) do if type( k ) ~= "number" then result[ k ] = v end end
		for k, v in pairs( cons ) do
			if type( k ) == "number" then
				if type( v ) == "string" and result[ "source" ] == nil then result[ "source" ] = v
				elseif type( v ) == "number" and result[ "instanceLimit" ] == nil then result[ "instanceLimit" ] = v
				else
					table.insert( result, v )
				end
			end
		end
		return result
	end

	-- source and instance-count sugar is only allowed on individual defs, not at group level
	sharedCons = parseFlagsSugar( sharedCons )

	return function( defs )
		for k,v in pairs( defs ) do
			local name = k
			local cons = v

			-- allow providing just a source file, no table
			if type( cons ) ~= "table" then
				cons = { v }
			end

			-- parse special flags and allowed syntax
			cons = parseSourceAndInstanceCountSugar( cons )
			cons = parseFlagsSugar( cons ) 

			-- merge shared settings under individual settings
			local mergedCons = {}
			for k, v in pairs( sharedCons ) do mergedCons[ k ] = v end
			for k, v in pairs( cons ) do mergedCons[ k ] = v end

			-- at this point there should be no sugar remaining
			for k, v in pairs( mergedCons ) do
				if type( k ) ~= "string" then error( "soundRefResource unrecognized setting keyword \""..v.."\"" ) end
			end

			resource( "SoundDef" )( k )( mergedCons )
		end
	end
end

function SetResConsVars( res, resCons )
	for varName,varValue in pairs( resCons ) do
		local varAccessor = res.__vars[ varName ]
		if varAccessor then
			if not varAccessor.__len then
				varAccessor( res, varValue )
			else
				-- Make sure the array is properly allocated
				local allocator = varAccessor.__metadata.ArrayAllocator
				local count = #varValue
				res[ allocator ]( res, count )
				assert( varAccessor.__len( res ) == count )

				-- Load the array elements
				for i = 1, count do
					varAccessor[ i - 1 ]( res, varValue[ i ] )
				end
			end
		end
	end
end

function QueueResourcesForLoad( resManager, alloc )
	for i,resCons in ipairs( resourceTable ) do
		-- Find this resource's meta class so we can allocate it, access its members, etc.
		local metatbl = _G[ resCons.class ]

		-- If the resource is already loaded, we can just increase its ref count ...
		local res = resManager:GetResource( resCons.class, resCons.name )
		if res then
			-- Make sure this instance of the resource is identical to the one we already loaded.
			for varName,varValue in pairs( resCons ) do
				local varAccessor = res.__vars[ varName ]
				if varAccessor and varAccessor( res ) ~= resCons[ varName ] then
					resourceErrorCode = 1
					error( "Resource of type "..resCons.class.." named '"..resCons.name.."' already loaded, but with a different configuration" )
				end
			end

			res:IncLoadCount()
		else
			-- ... otherwise, we have to go through the full loading process.

			-- Allocate the resource object.
			res = metatbl.new( alloc )

			-- Initialize some values in the resource object based on the construction table.
			SetResConsVars( res, resCons )

			-- Set the resource's Heap
			local heapAccessor = res.__vars[ "heap" ]
			heapAccessor( res, alloc )

			-- Tell the C++ end this resource is ready to be loaded.
			resManager:AddToLoadList( res )

			res:IncLoadCount()
		end
	end
end

function QueueResourcesForUnload( resManager )
	-- Unloading is much simpler than loading. If our unloading causes the
	-- resource's LoadCount to go to zero, we just need to let the native side
	-- know to kill it.
	for i,resCons in ipairs( resourceTable ) do
		local res = resManager:GetResource( resCons.class, resCons.name )
		if res then
			res:DecLoadCount()
			if res:GetLoadCount() == 0 then
				resManager:AddToUnloadList( res )
			end
		end
		-- If we can't find the resource, we assume it's still in the toLoadList,
		-- which means the C++ side will get rid of it for us.
	end
end

function HotLoadResources( resManager, sentinel, alloc )

	-- Pull the list of rebuilt resources from the contents of the sentinel file.
	local rebuiltResources = {}
	for res in sentinel:gmatch( "%S+" ) do
		rebuiltResources[ res ] = true
	end

	-- Uniquify the resource table so that we don't hotload a resource twice.
	local loadedResources = {}
	for i,resCons in ipairs( resourceTable ) do
		loadedResources[ resCons.class..resCons.name ] = resCons;
	end

	-- See if any of the resources in the list need to be loaded or reloaded.
	for className,resCons in pairs( loadedResources ) do
		local rebuilt = rebuiltResources[ className ]
		local res = resManager:GetResource( resCons.class, resCons.name )
		if not res or rebuilt then
			DebugPrint( "Hot loading "..resCons.name..", a "..resCons.class.."." )

			if res then
				resManager:UnloadImmediate( res )
			else
				local metatbl = _G[ resCons.class ]
				res = metatbl.new( alloc )
			end

			SetResConsVars( res, resCons )

			resManager:LoadImmediate( res )
		end
	end
end

-------------------------------------------------------------------------------
-- Notes:  Defines functions for writing out and reading in tweak var files.
--
-- Author: John Edwards
-- Date C: 5-10-2007
-------------------------------------------------------------------------------
function MergeTableRecursive( dst, src )
	for k, v in pairs( src ) do
		if type( v ) == "table" then
			if dst[ k ] == nil then dst[ k ] = {} end
			MergeTableRecursive( dst[ k ], v )
		else
			dst[ k ] = v
		end
	end
end

function SaveVars( vfs, fileName )
	SaveTableAsVars( vfs, fileName, Vars )
end

function SaveTableAsVars( vfs, fileName, varsTable )
	local stringStream = StringStream()

	stringStream:write( "Vars = " )
	PrintTable( stringStream, varsTable )
	stringStream:write( "\n" )

	local output = stringStream:output()

	vfs:WriteFile( fileName, output, #output )
end

function IsEqual( metaVar, val )
	if metaVar.__ctype == "float" then
		if val > 0.01 then
			return math.abs( 1.0 - metaVar() / val ) < .002
		else
			return math.abs( metaVar() - val ) < 0.0001
		end
	else
		return metaVar() == val
	end
end

function SaveNonDefaultVars( vfs, fileName )
	local nonDefaultVars = {}

	for file, varTbl in pairs( Vars ) do
		local newTbl = {}
		local valTbl = VarValues[ file ]

		for varName, metaVar in pairs( varTbl ) do
			if not IsEqual( metaVar, valTbl[ varName ] ) then
				newTbl[ varName ] = metaVar()
			end
		end

		if next( newTbl ) ~= nil then
			nonDefaultVars[ file ] = newTbl
		end
	end

	SaveTableAsVars( vfs, fileName, nonDefaultVars )
end

VarValues = {}
function StoreCurrentVarValues()
	for file, varTbl in pairs( Vars ) do
		local valTbl = {}

		for varName, metaVar in pairs( varTbl ) do
			valTbl[ varName ] = metaVar()
		end

		VarValues[ file ] = valTbl
	end
end

function LoadVars( fileName, patchFileName )
	-- A saved Vars file is likely to overwrite the Vars table, so we have to
	-- cache it.
	local realVars = Vars
	local status = debugdofile( fileName )
	if 0 ~= status then return false end

	-- Merge the patch Vars on top of the main Vars
	if patchFileName ~= "" then
		local baseVars = Vars
		status = debugdofile( patchFileName ) -- loads patch table into Vars
		if 0 ~= status then return false end
		MergeTableRecursive( baseVars, Vars )
		Vars = baseVars
	end

	-- Update the real vars table with all the values from the saved table.
	for catName,catTbl in pairs( Vars ) do
		local realTbl = realVars[ catName ]
		if realTbl then
			for varName,varValue in pairs( catTbl ) do
				if realTbl[ varName ] then
					realTbl[ varName ]( varValue )
				end
			end
		end
	end

	-- We no longer need the table we loaded up from the file.
	Vars = realVars

	return true
end
