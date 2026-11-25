-- Execute the source extracted from the SHA-gated original executable.
-- Reflected objects/manager/allocator are boundary services, not engine mocks
-- claimed as native behavior. Scalar setter order is not compared: pairs()
-- does not promise a particular field order.
dofile(arg[1])
local cases = dofile(arg[2])
local function json(v)
  if type(v) == 'table' then
    local keys = {}; for k in pairs(v) do table.insert(keys, k) end
    if #v > 0 then local out = {}; for i,x in ipairs(v) do out[i] = json(x) end; return '['..table.concat(out, ',')..']' end
    table.sort(keys)
    local out = {}; for _,k in ipairs(keys) do table.insert(out, json(k)..':'..json(v[k])) end
    return '{'..table.concat(out, ',')..'}'
  elseif type(v) == 'string' then
    return '"'..v:gsub('\\','\\\\'):gsub('"','\\"'):gsub('\n','\\n'):gsub('\r','\\r'):gsub('\t','\\t')..'"'
  elseif v == nil then return 'null'
  else return tostring(v) end
end
local originalPrint = print
for _,c in ipairs(cases) do
  resourceTable = {}; resourceDefTable = {}; resourceErrorCode = 0; resourceLocale = c.locale
  ignoreResourceRefs = c.ignoreRefs; resourceFilter = function() return c.filter end
  local warnings, errors, allocated, pending, unloaded, events = {}, {}, {}, {}, {}, {}
  print = function(msg) table.insert(warnings, msg) end
  local registered = {}
  local function event(row) table.insert(events, row) end
  DemoData = { new = function(alloc)
    local res = { id = #allocated, fields = {}, sources = {}, heap = 'NULL', loadCount = 0, __vars = {} }
    table.insert(allocated, res); event({'new', 'DemoData', res.id})
    for _,name in ipairs({'class','name','source','enabled','count'}) do
      res.__vars[name] = setmetatable({}, { __call = function(_, r, ...)
        if select('#',...) == 0 then return r.fields[name] end
        r.fields[name] = (...)
      end })
    end
    res.__vars.heap = setmetatable({}, { __call = function(_, r, ...) if select('#',...) == 0 then return r.heap end; r.heap = (...) end })
    local array = { __metadata = { ArrayAllocator = 'AllocateSources' }, __len = function(r) return #r.sources end }
    setmetatable(array, { __call = function(_,r) return r.sources end,
      __index = function(_,index) return function(r,value) event({'element',r.id,index,value}); r.sources[index+1]=value end end })
    res.__vars.sources = array
    res.AllocateSources = function(r,count) event({'allocate',r.id,count}); r.sources={}; for i=1,count do r.sources[i]=false end end
    res.IncLoadCount = function(r) event({'inc',r.id}); r.loadCount=r.loadCount+1 end
    res.DecLoadCount = function(r) event({'dec',r.id}); r.loadCount=r.loadCount-1 end
    res.GetLoadCount = function(r) return r.loadCount end
    return res
  end }
  local manager = {
    GetResource = function(_,class,name) event({'get',class,name}); return registered[class..'_'..name] end,
    AddToLoadList = function(_,res) event({'queue',res.id}); table.insert(pending,res) end,
    AddToUnloadList = function(_,res) event({'unload',res.id}); table.insert(unloaded,res.id) end
  }
  local function cons(source) return { source=source, enabled=false, count=3, ignored='not reflected', sources=c.array and {'a.level','b.level'} or nil } end
  local directive = c.definition and resourcedef or resource
  directive 'DemoData' 'Level' 'en' (cons('en')) 'fr' (cons('fr')) (cons('default'))
  for i=1,c.references do resourceref 'DemoData' 'Level' end
  resourceref 'DemoData' 'Missing'
  local planned, identities, uniqueTables = {}, {}, 0
  for _,r in ipairs(resourceTable) do
    table.insert(planned, {source=r.source,class=r.class,name=r.name})
    if not identities[r] then uniqueTables=uniqueTables+1; identities[r]=true end
  end
  for i=1,c.loads do
    if i==2 and c.changeSource then for _,r in ipairs(resourceTable) do r.source='changed' end end
    local ok = pcall(QueueResourcesForLoad,manager,'levelHeap'); if not ok then table.insert(errors,'configuration') end
    if c.publish then
      for _,r in ipairs(pending) do registered[r.fields.class..'_'..r.fields.name]=r end
      pending={}
    end
  end
  for i=1,c.unloads do QueueResourcesForUnload(manager) end
  resourceTable={}
  local snapshots, pendingIds, definitionSources = {}, {}, {}
  for _,r in ipairs(allocated) do table.insert(snapshots,{id=r.id,fields=r.fields,sources=r.sources,heap=r.heap,loadCount=r.loadCount}) end
  for _,r in ipairs(pending) do table.insert(pendingIds,r.id) end
  for _,r in pairs(resourceDefTable) do table.insert(definitionSources,r.source) end
  originalPrint(json({planned=planned,uniqueTables=uniqueTables,warnings=warnings,errors=errors,errorCode=resourceErrorCode,
    definitionSources=definitionSources,allocated=snapshots,pending=pendingIds,unloaded=unloaded,events=events,remainingResources=#resourceTable}))
end
