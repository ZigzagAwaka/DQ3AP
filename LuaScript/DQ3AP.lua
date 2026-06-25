-- AP CODE

local AP = {}

-- log some text in log file
function AP.Log(text)
  local time = os.time()
  local file = io.open("Archipelago/LuaAP.log", "a")
  if file then
    file:write("[" .. os.date("%d/%m/%y %H:%M:%S", time) .. "] " .. text .. "\n")
    file:close()
  end
end

-- mark the given treasure as checked
function AP.CheckLocation(TreasureId)
  local file = io.open("Archipelago/locations.data", "a")
  if file then
    file:write(tostring(TreasureId) .. "\n")
    file:close()
  end
end

return AP