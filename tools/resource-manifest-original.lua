dofile(arg[1])
local input = dofile(arg[2])
CONFIG = 'Release'
local outputPrint = print
local warnings = {}
print = function(msg) table.insert(warnings,msg) end
local function json(v)
  if type(v)=='table' then
    if #v>0 then local out={}; for i,x in ipairs(v) do out[i]=json(x) end; return '['..table.concat(out,',')..']' end
    local keys={};for k in pairs(v) do table.insert(keys,k) end;table.sort(keys)
    local out={};for _,k in ipairs(keys) do table.insert(out,json(k)..':'..json(v[k])) end;return '{'..table.concat(out,',')..'}'
  elseif type(v)=='string' then return '"'..v:gsub('\\','\\\\'):gsub('"','\\"'):gsub('\n','\\n'):gsub('\r','\\r'):gsub('\t','\\t')..'"'
  elseif v==nil then return 'null'
  else return tostring(v) end
end
for _,origin in ipairs(input.files) do
  resourceTable={};warnings={};resourceErrorCode=0
  local previous={};for k,v in pairs(resourceDefTable) do previous[k]=v end
  dofile(input.data..'/'..origin)
  local definitions={};for k,v in pairs(resourceDefTable) do if previous[k]~=v then table.insert(definitions,v) end end
  outputPrint(json({origin=origin,resources=resourceTable,definitions=definitions,warnings=warnings,errorCode=resourceErrorCode}))
end
