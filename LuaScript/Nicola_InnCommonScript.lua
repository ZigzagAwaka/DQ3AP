print("Nicola_InnCommonScript.lua load start")

local AP = require("Src/DQ3AP") -- AP

function ICS_CallInnUI(InnId, CallMemberIndex)
  CallInnUI(InnId, CallMemberIndex)
  _retry(ICS_WaitInnUIWithTransition)
  if GetSysInfo(SysInfo.TRANSITION_INN_START_FLAG) ~= 0 then
    TransitionInn()
  end
  _retry(SYS_WaitInnUI)
  AP.GiveItemsIfAvailable() -- AP
end

function ICS_WaitInnUIWithTransition()
  local retVal
  if IsClosedInnUI() == true then
    retVal = true
  end
  if GetSysInfo(SysInfo.TRANSITION_INN_START_FLAG) ~= 0 then
    print("Request TransitionInn")
    retVal = true
  end
  return retVal
end

print("Nicola_InnCommonScript.lua load end")
