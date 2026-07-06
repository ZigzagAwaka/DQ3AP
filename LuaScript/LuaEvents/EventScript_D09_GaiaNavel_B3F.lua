print("Load Script EventScript_D09_GaiaNavel_B3F")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdChangeStageCameraToGlobalPoint(560, 3463, 400, CAMERA_BLEND_EASE_IN_OUT, 1, 2, 1600, {
    Yaw = 0,
    Pitch = -15,
    Roll = 0
  })
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_EYE")
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_1", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  HideMessageWindowPageFeedIcon()
  CmdMessageDetail("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_010_1", MESSAGE_WINDOW_BATTLE, MESSAGE_POSITION_BOTTOM)
  Wait(2.5)
  CloseMessage()
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_1")
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetFlag(Flag.FE816, true)
  SetVisibleActor("BP_SearchEvent_Ground_1_1", true)
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_011(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  TurnParty(1, 0)
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_1", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  CmdEventClosingMessage("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_010_2")
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_1")
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdChangeStageCameraToGlobalPoint(560, -530, 400, CAMERA_BLEND_EASE_IN_OUT, 1, 2, 1600, {
    Yaw = 0,
    Pitch = -15,
    Roll = 0
  })
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_EYE")
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_2", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  HideMessageWindowPageFeedIcon()
  CmdMessageDetail("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_010_1", MESSAGE_WINDOW_BATTLE, MESSAGE_POSITION_BOTTOM)
  Wait(2.5)
  CloseMessage()
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_2")
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetFlag(Flag.FE817, true)
  SetVisibleActor("BP_SearchEvent_Ground_1_2", true)
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_021(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  TurnParty(1, 0)
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_2", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  CmdEventClosingMessage("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_010_2")
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_2")
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdChangeStageCameraToGlobalPoint(3770, -510, 800, CAMERA_BLEND_EASE_IN_OUT, 1, 2, 1600, {
    Yaw = 0,
    Pitch = -15,
    Roll = 0
  })
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_EYE")
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_3", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  HideMessageWindowPageFeedIcon()
  CmdMessageDetail("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_010_1", MESSAGE_WINDOW_BATTLE, MESSAGE_POSITION_BOTTOM)
  Wait(2.5)
  CloseMessage()
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_3")
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetFlag(Flag.FE818, true)
  SetVisibleActor("BP_SearchEvent_Ground_1_3", true)
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_031(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  TurnParty(1, 0)
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_3", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  CmdEventClosingMessage("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_010_2")
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_3")
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdChangeStageCameraToGlobalPoint(8493, 3720, 400, CAMERA_BLEND_EASE_IN_OUT, 1, 2, 1600, {
    Yaw = 0,
    Pitch = -15,
    Roll = 0
  })
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_EYE")
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_4", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  HideMessageWindowPageFeedIcon()
  CmdMessageDetail("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_010_1", MESSAGE_WINDOW_BATTLE, MESSAGE_POSITION_BOTTOM)
  Wait(2.5)
  CloseMessage()
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_4")
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetFlag(Flag.FE819, true)
  SetVisibleActor("BP_SearchEvent_Ground_1_4", true)
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_041(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  TurnParty(1, 0)
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_4", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  CmdEventClosingMessage("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_010_2")
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_4")
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdChangeStageCameraToGlobalPoint(6166, 1079, 800, CAMERA_BLEND_EASE_IN_OUT, 1, 2, 1600, {
    Yaw = 0,
    Pitch = -15,
    Roll = 0
  })
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_EYE")
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_5", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  HideMessageWindowPageFeedIcon()
  CmdMessageDetail("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_010_1", MESSAGE_WINDOW_BATTLE, MESSAGE_POSITION_BOTTOM)
  Wait(2.5)
  CloseMessage()
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_5")
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetFlag(Flag.FE820, true)
  SetVisibleActor("BP_SearchEvent_Ground_1_5", true)
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_051(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  TurnParty(1, 0)
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_5", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  CmdEventClosingMessage("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_010_2")
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_1_5")
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_110(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdChangeStageCameraToGlobalPoint(560, 1079, 400, CAMERA_BLEND_EASE_IN_OUT, 1, 2, 1600, {
    Yaw = 0,
    Pitch = -15,
    Roll = 0
  })
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_EYE")
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_1", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  HideMessageWindowPageFeedIcon()
  CmdMessageDetail("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_020_1", MESSAGE_WINDOW_BATTLE, MESSAGE_POSITION_BOTTOM)
  Wait(2.5)
  CloseMessage()
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_1")
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetFlag(Flag.FE821, true)
  SetVisibleActor("BP_SearchEvent_Ground_2_1", true)
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_111(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  TurnParty(1, 0)
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_1", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  CmdEventClosingMessage("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_020_2")
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_1")
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_120(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdChangeStageCameraToGlobalPoint(560, -2076, 400, CAMERA_BLEND_EASE_IN_OUT, 1, 2, 1600, {
    Yaw = 0,
    Pitch = -15,
    Roll = 0
  })
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_EYE")
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_2", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  HideMessageWindowPageFeedIcon()
  CmdMessageDetail("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_020_1", MESSAGE_WINDOW_BATTLE, MESSAGE_POSITION_BOTTOM)
  Wait(2.5)
  CloseMessage()
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_2")
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetFlag(Flag.FE822, true)
  SetVisibleActor("BP_SearchEvent_Ground_2_2", true)
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_121(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  TurnParty(1, 0)
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_2", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  CmdEventClosingMessage("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_020_2")
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_2")
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_130(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdChangeStageCameraToGlobalPoint(3770, -2896, 800, CAMERA_BLEND_EASE_IN_OUT, 1, 2, 1600, {
    Yaw = 0,
    Pitch = -15,
    Roll = 0
  })
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_EYE")
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_3", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  HideMessageWindowPageFeedIcon()
  CmdMessageDetail("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_020_1", MESSAGE_WINDOW_BATTLE, MESSAGE_POSITION_BOTTOM)
  Wait(2.5)
  CloseMessage()
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_3")
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetFlag(Flag.FE823, true)
  SetVisibleActor("BP_SearchEvent_Ground_2_3", true)
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_131(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  TurnParty(1, 0)
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_3", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  CmdEventClosingMessage("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_020_2")
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_3")
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_140(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdChangeStageCameraToGlobalPoint(3770, 1079, 800, CAMERA_BLEND_EASE_IN_OUT, 1, 2, 1600, {
    Yaw = 0,
    Pitch = -15,
    Roll = 0
  })
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_EYE")
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_4", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  HideMessageWindowPageFeedIcon()
  CmdMessageDetail("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_020_1", MESSAGE_WINDOW_BATTLE, MESSAGE_POSITION_BOTTOM)
  Wait(2.5)
  CloseMessage()
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_4")
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetFlag(Flag.FE824, true)
  SetVisibleActor("BP_SearchEvent_Ground_2_4", true)
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_141(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  TurnParty(1, 0)
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_4", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  CmdEventClosingMessage("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_020_2")
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_4")
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_150(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdChangeStageCameraToGlobalPoint(8493, 67, 400, CAMERA_BLEND_EASE_IN_OUT, 1, 2, 1600, {
    Yaw = 0,
    Pitch = -15,
    Roll = 0
  })
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_EYE")
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_5", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  HideMessageWindowPageFeedIcon()
  CmdMessageDetail("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_020_1", MESSAGE_WINDOW_BATTLE, MESSAGE_POSITION_BOTTOM)
  Wait(2.5)
  CloseMessage()
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_5")
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetFlag(Flag.FE825, true)
  SetVisibleActor("BP_SearchEvent_Ground_2_5", true)
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_151(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  TurnParty(1, 0)
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_5", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  CmdEventClosingMessage("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_020_2")
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_2_5")
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_210(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdChangeStageCameraToGlobalPoint(3770, 2673, 800, CAMERA_BLEND_EASE_IN_OUT, 1, 2, 1600, {
    Yaw = 0,
    Pitch = -15,
    Roll = 0
  })
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_EYE")
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_3_1", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  CmdMessage("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_030_1")
  CmdMessage("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_030_2")
  CmdEventClosingMessage("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_030_3")
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_3_1")
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetFlag(Flag.FE826, true)
  SetVisibleActor("BP_SearchEvent_Ground_3_1", true)
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_SUB_0_VOLUME_0010_211(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  TurnParty(1, 0)
  PlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_3_1", "D09_EyeFlash")
  PlaySEEvent("EVESE_GAIANAVEL_STATUE_CRY")
  CmdMessage("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_030_1")
  CmdMessage("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_030_2")
  CmdEventClosingMessage("NPC_Talk_GaiaNavel_B3F_SUB_0_VOLUME_0010_030_3")
  WaitPlayEffectSearchObject("BP_SearchEvent_Ground_D09_WallK_3_1")
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_MAIN_0_VOLUME_0020_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  RequestPreloadEventBattle("BATTLE_EVENT_NEWBOSS_GAIA_1")
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  SetVisibleActorsTag("BlueOrb_Light", false)
  CmdPlayEventSequenceNextEventBattle(0)
  CmdStartEventBattle("BATTLE_EVENT_NEWBOSS_GAIA_1")
  EventEnd(eventInfo, "")
end

function GaiaNavel_B3F_MAIN_0_BATTLE_END_0020_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_IMPORTANT_BLUE_ORB")
  SetVisibleActorsTag("BlueOrb_Light", false)
  CmdPlayEventSequencePrevEventBattle(1)
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 0, 2)
  SetVisibleActorsTag("BlueOrb", false)
  PlayBGM(GetCurrentMapBgmId(), 0)
  CmdFadeIn(EFadingPriorityTopMost, 0.5)
  -- AP
  AP.Log("GaiaNavel_B3F_MAIN_0_BATTLE_END_0020_020 called (Gaia's Navel - Get blue orb boss event)")
  AP.CheckLocation("GaiaNavel_B3F_MAIN_0_BATTLE_END_0020_020")
  local ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
    AddItem(ItemId)
  else
    AddItem("ITEM_IMPORTANT_BLUE_ORB")
  end
  -- AP end
  SetFlag(Flag.FE74, true) -- blue orb flag is not possible to skip or else it will softlock the player into an infinite boss battle
  -- AP
  if ItemId == "ITEM_ARCHIPELAGO" then
  else
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_GAIANAVEL_GetBlueOrb, true)
    CheckGopEnum_MAIN_MULTI_GetAllOrb()
  end
  -- AP end
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function SEARCH_GaiaNavel_B3F_EVENT_FigureStatue_1(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  TurnParty(1, 1)
  PlaySEEvent("EVESE_GAIANAVEL_MOVE_STATUE")
  PlayOpenAnimSearchObj("BP_SearchAnimEvent_D09_FigureStatue_01_1")
  WaitPlayAnimSearchObj("BP_SearchAnimEvent_D09_FigureStatue_01_1")
  SetVisibleActor(targetActorId, false)
  SetFlag(Flag.FE729, true)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_GAIANAVEL_CheckStatue, true)
  EventEnd(eventInfo, "")
end
