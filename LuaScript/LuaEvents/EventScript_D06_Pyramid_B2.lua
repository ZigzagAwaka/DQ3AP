print("Load Script EventScript_D06_Pyramid_B2")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Pyramid_B2F_Coffin_00(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  TurnParty(1, 0)
  if GetFlag(Flag.FE89) == true then
    CmdEventClosingMessage("NPC_Talk_Pyramid_B2F_SearchObj_Coffin_7")
  else
    local result = CmdChoiceMessage("NPC_Talk_Pyramid_B2F_SearchObj_Coffin_1")
    CloseMessage()
    if result == true then
      local itemId = "ITEM_EQUIP_WEAPON_GOLDEN_CLAWS"
      SetTagItemId(itemId)
      PlaySEEvent("EVESE_PYRAMID_COFFIN_2")
      CmdPlayOpenAnimSearchObj("BP_SearchAnimEvent_D06_Coffin_02_01")
      CmdMessage("NPC_Talk_Pyramid_B2F_SearchObj_Coffin_2")
      CmdLoadItemIcon("ITEM_ARCHIPELAGO"--[[itemId]]) -- AP
      CmdPlayItemGetNoWait(GetTargetActorIdFromEventInfo(eventInfo), TreasureId)
      PlayJingleOnGetItemRareDefaultFade()
      CmdMessage("NPC_Talk_Pyramid_B2F_SearchObj_Coffin_3")
      WaitPlayJingle()
      PlaySEUI("SYSSE_TD_TREASURE_BOX_ITEM")
      CmdEventClosingMessage("NPC_Talk_Pyramid_B2F_SearchObj_Coffin_4")
      -- AP
      AP.Log("Pyramid_B2F_Coffin_00 called (Pyramid - Getting Golden claws event)")
      AP.CheckLocation("Pyramid_B2F_Coffin_00")
      --AddItem(itemId)
      -- AP end
      SetFlag(Flag.FE89, true)
      SetDisableEncountFromEvent(true)
    end
  end
  EventEnd(eventInfo, "")
end

function Pyramid_B2_MAIN_0_VOLUME_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  StopBGM(1)
  SetEventFadeAlpha(0.5)
  FadeOut(EFadingPriorityEventUIBackGround, 0.5)
  CmdChangeStageCameraToGlobalPoint(2600, 5450, 1500, CAMERA_BLEND_EASE_IN_OUT, 2, 2, 2000, {
    Yaw = 0,
    Pitch = -10,
    Roll = 0
  })
  WaitFadeOut(EFadingPriorityEventUIBackGround)
  CmdMessage("NPC_Talk_Pyramid_B2F_SearchObj_Coffin_5")
  CloseMessage()
  local tagItemId = "ITEM_EQUIP_WEAPON_GOLDEN_CLAWS"
  SetTagItemId(tagItemId)
  CmdEventClosingMessageDetail("NPC_Talk_Pyramid_B2F_SearchObj_Coffin_6", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
  PlaySEEvent("EVESE_PYRAMID_VOICE_GROAN")
  Wait(1.5)
  CloseMessage()
  GameDataSetGopEnumMapBgm(FlagGOPEnumMapBgm.PYRAMID_UNDERGROUND, true)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_PYRAMID_CurseGoldenClaws, true)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_PYRAMID_HasPartyCurseGoldenClaws, true)
  ShowCurseCoffinEffect()
  Wait(2.5)
  local cameraEffectFadeTime = 3
  ShowCurseCameraEffect(cameraEffectFadeTime)
  Wait(cameraEffectFadeTime)
  SetFlag(Flag.FE248, true)
  FadeIn(EFadingPriorityEventUIBackGround, 0.5)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
  WaitFadeOut(EFadingPriorityEventUIBackGround)
  SetDispMiniMap(true)
  SetDisableEncountFromEvent(false)
  EventEnd(eventInfo, "")
end

function Pyramid_B2_MAIN_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  DisableEventFastForwardUI()
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  EventEnd(eventInfo, "")
end
