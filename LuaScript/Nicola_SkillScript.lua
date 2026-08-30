print("Nicola_SkillScript.lua load start")

local AP = require("Src/DQ3AP") -- AP

local function SS_ShowMessage(gopId, bIsHideNextPageIcon)
  if bIsHideNextPageIcon == true then
    HideMessageWindowPageFeedIcon()
  end
  ShowMessage(gopId)
end

local function SS_GetCommonArgs(...)
  local scriptId = tonumber(...)
  local tbl = GetSkillScriptArgs(scriptId)
  print("Nicola_SkillScript.lua SS_GetCommonArgs: scriptId:" .. tostring(scriptId) .. " \229\188\149\230\149\176\229\143\150\229\190\151:")
  for key, value in pairs(tbl) do
    if value ~= nil then
      print(key .. "," .. tostring(value))
    end
  end
  SetTagItemId(tbl.SkillId)
  SetTagWordMagicId(tbl.SkillId)
  return tbl
end

local function SS_ForceEncount()
  ForceEncount()
end

local function SS_Effect_Message(textId)
  MapTimeNotifyStartSystemProcessing()
  SetActionInputMode(INPUT_MODE_NO_INPUT, true)
  SS_ShowMessage(textId, true)
  _retry(SYS_WaitShowMessage)
  CloseMessage()
  SetActionInputMode(INPUT_MODE_NO_INPUT, false)
  MapTimeNotifyEndSystemProcessing()
end

function SS_Success_Effect_Message(BeginOverlap, table, ...)
  MapTimeNotifyStartSystemProcessing()
  local args = SS_GetCommonArgs(...)
  SS_Effect_Message(args.SuccessText)
  MapTimeNotifyEndSystemProcessing()
end

function SS_Failed_Effect_Message(BeginOverlap, table, ...)
  MapTimeNotifyStartSystemProcessing()
  local args = SS_GetCommonArgs(...)
  SS_Effect_Message(args.FailedText)
  MapTimeNotifyEndSystemProcessing()
end

function SS_End_Effect_Message(BeginOverlap, table, ...)
  MapTimeNotifyStartSystemProcessing()
  local args = SS_GetCommonArgs(...)
  SS_Effect_Message(args.EndEffectText)
  MapTimeNotifyEndSystemProcessing()
end

function SS_Effect_INVISIBLE_PARTY(BeginOverlap, table, ...)
  local args = SS_GetCommonArgs(...)
  local Type = args.SkillId
  MapTimeNotifyStartSystemProcessing()
  SetActionInputMode(INPUT_MODE_NO_INPUT, true)
  SS_ShowMessage(args.SuccessText, true)
  _retry(SYS_WaitShowMessage)
  CloseMessage()
  PlaySE2D("SE_SYS_KIESARISOU", "PLAYER")
  StartInvisiblePartyLooks(1)
  _retry(SYS_WaitInvisibleLooks)
  Wait(1)
  SetActionInputMode(INPUT_MODE_NO_INPUT, false)
  MapTimeNotifyEndSystemProcessing()
end

function SS_End_Effect_INVISIBLE_PARTY(BeginOverlap, table, ...)
  local args = SS_GetCommonArgs(...)
  MapTimeNotifyStartSystemProcessing()
  SetActionInputMode(INPUT_MODE_NO_INPUT, true)
  PlaySE2D("SE_SYS_KIESARISOU", "PLAYER")
  EndInvisiblePartyLooks(1)
  _retry(SYS_WaitInvisibleLooks)
  Wait(1)
  SS_ShowMessage(args.EndEffectText, true)
  _retry(SYS_WaitShowMessage)
  CloseMessage()
  SetActionInputMode(INPUT_MODE_NO_INPUT, false)
  MapTimeNotifyEndSystemProcessing()
end

function SS_Effect_MONSTER_ATTRACT2(BeginOverlap, table, ...)
  print("SS_Effect_MONSTER_ATTRACT2")
  local args = SS_GetCommonArgs(...)
  local Type = args.Type
  MapTimeNotifyStartSystemProcessing()
  SetActionInputMode(INPUT_MODE_NO_INPUT, true)
  print(args.Type)
  SS_ShowMessage(args.SuccessText, true)
  if Type == "Tategoto" then
    RequestPlayJingle("BGM_JINGLE_017", EBgmPlayerManagerMEPlayRequestTypePAUSE, 0.5, EBgmPlayerManagerLineTypeOnMEEndNONE, 0, "")
    _retry(SYS_WaitPlayJingle)
  else
    PlaySE2D("SE_SYS_KUTIBUE", "PLAYER")
    Wait(1)
  end
  _retry(SYS_WaitShowMessage)
  CloseMessage()
  SetActionInputMode(INPUT_MODE_NO_INPUT, false)
  MapTimeNotifyEndSystemProcessing()
  SS_ForceEncount()
end

function SS_Effect_CHANGE_NIGHT(BeginOverlap, table, ...)
  print("SS_Effect_CHANGE_NIGHT")
  local args = SS_GetCommonArgs(...)
  local Type = args.SkillId
  local ChangeTime = args.ChangeTime
  MapTimeNotifyStartSystemProcessing()
  SetActionInputMode(INPUT_MODE_NO_INPUT, true)
  local doChangeToDay = ChangeTime == "Noon"
  SS_ShowMessage(args.SuccessText, true)
  _retry(SYS_WaitShowMessage)
  CloseMessage()
  PlaySE2D("SE_SYS_NIGHT_LIGHT", "PLAYER")
  local fadeType = EFadingPriorityWhiteTopMost
  local afterTime = 7
  if doChangeToDay then
    StartChangeDayEffect(3)
    _retry(SYS_WaitChangeDayEffect)
    Wait(2)
    FadeOut(fadeType, 0)
    _retry(SYS_WaitFadeOut, fadeType)
    EndChangeDayEffect()
  else
    fadeType = EFadingPriorityTopMost
    afterTime = 19
    StartChangeNightEffect(3)
    _retry(SYS_WaitChangeNightEffect)
    Wait(2)
    FadeOut(fadeType, 0)
    _retry(SYS_WaitFadeOut, fadeType)
    EndChangeNightEffect()
  end
  SetHourMapTime(afterTime)
  RequestLightDirRotatorUpdating()
  UpdateEffectParameterCollectionTime()
  Wait(1)
  FadeIn(fadeType, 0.5)
  _retry(SYS_WaitFadeIn, fadeType)
  SetActionInputMode(INPUT_MODE_NO_INPUT, false)
  MapTimeNotifyEndSystemProcessing()
end

function SS_Effect_TRANSFORM_RANDOM(BeginOverlap, table, ...)
  local args = SS_GetCommonArgs(...)
  local transType = tonumber(args.TransType)
  MapTimeNotifyStartSystemProcessing()
  SetActionInputMode(INPUT_MODE_NO_INPUT, true)
  SS_ShowMessage(args.SuccessText, true)
  _retry(SYS_WaitShowMessage)
  CloseMessage()
  PlaySE2D("SE_SYS_MOD_ROD", "PLAYER")
  SpawnEffectAttachedPartyNo(1, "Sys_CharaChangeSmoke_01", ACTOR_POSITION_CENTER, 0, 1, 2, 1)
  SpawnEffectAttachedPartyNo(2, "Sys_CharaChangeSmoke_01", ACTOR_POSITION_CENTER, 0, 1, 2, 1)
  SpawnEffectAttachedPartyNo(3, "Sys_CharaChangeSmoke_01", ACTOR_POSITION_CENTER, 0, 1, 2, 1)
  SpawnEffectAttachedPartyNo(4, "Sys_CharaChangeSmoke_01", ACTOR_POSITION_CENTER, 0, 1, 2, 1)
  Wait(0.4)
  TransformPartyLooks(transType)
  _retry(SYS_WaitPlayEffectPartyNo, 1, "Sys_CharaChangeSmoke_01")
  _retry(SYS_WaitPlayEffectPartyNo, 2, "Sys_CharaChangeSmoke_01")
  _retry(SYS_WaitPlayEffectPartyNo, 3, "Sys_CharaChangeSmoke_01")
  _retry(SYS_WaitPlayEffectPartyNo, 4, "Sys_CharaChangeSmoke_01")
  SetActionInputMode(INPUT_MODE_NO_INPUT, false)
  MapTimeNotifyEndSystemProcessing()
end

function SS_End_Effect_TRANSFORM_RANDOM(BeginOverlap, table, ...)
  local args = SS_GetCommonArgs(...)
  MapTimeNotifyStartSystemProcessing()
  SetActionInputMode(INPUT_MODE_NO_INPUT, true)
  PlaySE2D("SE_SYS_MOD_ROD", "PLAYER")
  SpawnEffectAttachedPartyNo(1, "Sys_CharaChangeSmoke_01", ACTOR_POSITION_CENTER, 0, 1, 2, 1)
  SpawnEffectAttachedPartyNo(2, "Sys_CharaChangeSmoke_01", ACTOR_POSITION_CENTER, 0, 1, 2, 1)
  SpawnEffectAttachedPartyNo(3, "Sys_CharaChangeSmoke_01", ACTOR_POSITION_CENTER, 0, 1, 2, 1)
  SpawnEffectAttachedPartyNo(4, "Sys_CharaChangeSmoke_01", ACTOR_POSITION_CENTER, 0, 1, 2, 1)
  Wait(0.4)
  UndoTransformPartyLooks()
  _retry(SYS_WaitPlayEffectPartyNo, 1, "Sys_CharaChangeSmoke_01")
  _retry(SYS_WaitPlayEffectPartyNo, 2, "Sys_CharaChangeSmoke_01")
  _retry(SYS_WaitPlayEffectPartyNo, 3, "Sys_CharaChangeSmoke_01")
  _retry(SYS_WaitPlayEffectPartyNo, 4, "Sys_CharaChangeSmoke_01")
  SS_ShowMessage(args.EndEffectText, true)
  _retry(SYS_WaitShowMessage)
  CloseMessage()
  SetActionInputMode(INPUT_MODE_NO_INPUT, false)
  MapTimeNotifyEndSystemProcessing()
end

function SS_Effect_RELEASE_TRAP(BeginOverlap, table, ...)
  local args = SS_GetCommonArgs(...)
  MapTimeNotifyStartSystemProcessing()
  SetActionInputMode(INPUT_MODE_NO_INPUT, true)
  SS_ShowMessage(args.SuccessText, true)
  PlaySE2D("SE_SYS_015_SPELL_CASTING", "PLAYER")
  _retry(SYS_WaitShowMessage)
  CloseMessage()
  SetActionInputMode(INPUT_MODE_NO_INPUT, false)
  MapTimeNotifyEndSystemProcessing()
end

function SS_End_Effect_RELEASE_TRAP(BeginOverlap, table, ...)
  local args = SS_GetCommonArgs(...)
  MapTimeNotifyStartSystemProcessing()
  SetActionInputMode(INPUT_MODE_NO_INPUT, true)
  SS_ShowMessage(args.EndEffectText, true)
  _retry(SYS_WaitShowMessage)
  CloseMessage()
  SetActionInputMode(INPUT_MODE_NO_INPUT, false)
  MapTimeNotifyEndSystemProcessing()
end

function SS_Effect_TREASURE_APPRAISAL(BeginOverlap, table, ...)
  local args = SS_GetCommonArgs(...)
  MapTimeNotifyStartSystemProcessing()
  SetActionInputMode(INPUT_MODE_NO_INPUT, true)
  SS_ShowMessage(args.SuccessText)
  _retry(SYS_WaitShowMessage)
  if args.InpasuResult == "NoneResult" then
    print(args.InpasuResult)
  elseif args.InpasuResult == "Empty" then
    print(args.InpasuResult)
  elseif args.InpasuResult == "Blue" then
    print(args.InpasuResult)
  elseif args.InpasuResult == "Red" then
    print(args.InpasuResult)
  elseif args.InpasuResult == "Yellow" then
    print(args.InpasuResult)
  end
  if args.InpasuResult == "NoneResult" then
    --SS_ShowMessage("Txt_Magic_Inpasu_5", true) -- AP
  elseif args.InpasuResult == "Empty" then
    SS_ShowMessage("Txt_Magic_Inpasu_4", true)
  elseif args.InpasuResult == "Blue" then
    SS_ShowMessage("Txt_Magic_Inpasu_1", true)
  elseif args.InpasuResult == "Red" then
    SS_ShowMessage("Txt_Magic_Inpasu_2", true)
  elseif args.InpasuResult == "Yellow" then
    SS_ShowMessage("Txt_Magic_Inpasu_3", true)
  end
  PlayEffectInpasu()
  if args.InpasuResult ~= "NoneResult" then -- AP
    _retry(SYS_WaitShowMessage)
  end
  CloseMessage()
  StopEffectInpasu()
  SetActionInputMode(INPUT_MODE_NO_INPUT, false)
  MapTimeNotifyEndSystemProcessing()
  -- AP
  if args.InpasuResult == "NoneResult" then
    AP.GiveItemsIfAvailable()
  end
  -- AP end
end

function SS_Effect_TREASURE_SEARCH(BeginOverlap, table, ...)
  local args = SS_GetCommonArgs(...)
  MapTimeNotifyStartSystemProcessing()
  SetActionInputMode(INPUT_MODE_NO_INPUT, true)
  SS_ShowMessage(args.SuccessText, true)
  _retry(SYS_WaitShowMessage)
  CloseMessage()
  PlayEffectRemirama("Sys_Remirama_01", 10)
  PlaySE2D("SE_SYS_REMIRAMA", "PLAYER")
  CloseMessage()
  SetActionInputMode(INPUT_MODE_NO_INPUT, false)
  MapTimeNotifyEndSystemProcessing()
end

function SS_Effect_DIG_A_HOLE(BeginOverlap, table, ...)
end

function SS_Effect_CALL_SHOP(BeginOverlap, table, ...)
  local args = SS_GetCommonArgs(...)
  MapTimeNotifyStartSystemProcessing()
  _retry(SYS_WaitShowMessage)
  if args.CallType == "Inn" then
    ICS_CallInnUI("INN_OOGOE_0001", tonumber(args.PartyIndex))
  elseif args.CallType == "Church" then
    CallChurchUI("CHURCH_OOGOE_0001", tonumber(args.PartyIndex))
    _retry(SYS_WaitChurchUI)
  elseif args.LastShopId ~= "" and args.LastShopId ~= nil then
    print("SS_Effect_CALL_SHOP: ShopId " .. args.LastShopId)
    CallShopUI(args.LastShopId)
    _retry(SYS_WaitShopUI)
  else
    print("SS_Effect_CALL_SHOP: ShopId \230\156\170\231\153\187\233\140\178 ")
    CallShopUI("SHOP_ALIAHAN_ITEM_0001")
    _retry(SYS_WaitShopUI)
  end
  CloseMessage()
  SetDispBtnGuide(true)
  MapTimeNotifyEndSystemProcessing()
end

function SS_Effect_TREASURE_COUNT(BeginOverlap, table, ...)
end

function SS_Effect_MONSTER_RADAR(BeginOverlap, table, ...)
  local args = SS_GetCommonArgs(...)
  MapTimeNotifyStartSystemProcessing()
  SetActionInputMode(INPUT_MODE_NO_INPUT, true)
  SS_ShowMessage(args.SuccessText, true)
  PlaySE2D("SE_SYS_015_SPELL_CASTING", "PLAYER")
  _retry(SYS_WaitShowMessage)
  CloseMessage()
  SetActionInputMode(INPUT_MODE_NO_INPUT, false)
  MapTimeNotifyEndSystemProcessing()
end

function SS_Effect_ORB_RADAR(BeginOverlap, table, ...)
  local args = SS_GetCommonArgs(...)
  local result = false
  if args.Result == "true" then
    result = true
  end
  local isfield = false
  if args.isfield == "true" then
    isfield = true
  end
  MapTimeNotifyStartSystemProcessing()
  SetActionInputMode(INPUT_MODE_NO_INPUT, true)
  if result then
    SS_ShowMessage("Txt_Item_Field_Use_Effective_1_Echo_Flute", true)
    RequestPlayJingleTemporaryDefaultFade("BGM_JINGLE_011")
    Wait(4.2)
    if isfield then
      ShowMiniMapIconEchoFlute()
      PlayEffecEchoFlute("Sys_EchoNote_01", 10)
      print("Nicola_SkillScript.lua SS_Effect_ORB_RADAR PlayEffecEchoFlute")
    end
    _retry(SYS_WaitPlayJingle)
    CloseMessage()
  else
    SS_ShowMessage("Txt_Item_Field_Use_Effective_1_Echo_Flute")
    RequestPlayJingleTemporaryDefaultFade("BGM_JINGLE_010")
    _retry(SYS_WaitPlayJingle)
    CloseMessage()
    SS_ShowMessage(args.FaildText, true)
    _retry(SYS_WaitShowMessage)
    CloseMessage()
  end
  SetActionInputMode(INPUT_MODE_NO_INPUT, false)
  MapTimeNotifyEndSystemProcessing()
end

print("Nicola_SkillScript.lua load end")
