print("Load Script EventScript_D03_IzanaiCave_B1F_before")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function IzanaiCave_B1F_before_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE57) == true then
    CmdEventClosingMessage("NPC_TALK_IzanaiCave_B1F_before_SUB_0_ACTOR_0110_010_1")
  else
    CmdMessage("NPC_TALK_IzanaiCave_B1F_before_SUB_0_ACTOR_0110_010_1")
    CmdEventClosingMessage("NPC_TALK_IzanaiCave_B1F_before_SUB_0_ACTOR_0110_010_2")
  end
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_IZANAICAVE_TalkOldMan, true)
  EventEnd(eventInfo, "")
end

function IzanaiCave_B1F_before_SUB_0_ACTOR_0110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_IzanaiCave_B1F_before_SUB_0_ACTOR_0110_020_1")
  EventEnd(eventInfo, "")
end

function IzanaiCave_B1F_before_MAIN_0_VOLUME_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local Oldman, MapTime
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Oldman = "IzanaiCave_B1F_before_OldMan_Izanai_01_L3"
  else
    Oldman = "IzanaiCave_B1F_before_OldMan_Izanai_01_L1"
  end
  TurnParty(1, 0)
  SetTagItemId("ITEM_IMPORTANT_WRECKING_BALL")
  CmdEventClosingMessage("NPC_Talk_IzanaiCave_B1F_before_MAIN_0_VOLUME_0110_010_5")
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  FadeIn(EFadingPriorityTopMost, 0.5)
  CmdPlayEventSequence(0)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_IZANAICAVE_BreakWall, true)
  CmdFadeOut(EFadingPriorityTopMost, 0)
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  EndSkillInvisibleNoEffect()
  EndSkillTransformNoEffect()
  SetVisibleActorsTag("Close", false)
  SetVisibleActorsTag("Open", true)
  ChangeStageCameraToGlobalPoint(4800, 808, -300, CAMERA_BLEND_EASE_IN_OUT, 0, 2, 1600, {
    Yaw = 0,
    Pitch = -18,
    Roll = 0
  })
  SetNpcLocation(Oldman, {
    X = 4076,
    Y = 513,
    Z = -445
  })
  SetVisibleActor("BP_SearchEvent_Ground_00", false)
  WaitFrame(1)
  CmdFadeIn(EFadingPriorityTopMost, 0.5)
  MoveParty({
    X = 4886,
    Y = 808,
    Z = 0
  })
  MoveNpc(Oldman, {
    X = 4896,
    Y = 648,
    Z = 0
  }, 250)
  Wait(1.9)
  SetActorRotation("PLAYER", {
    Yaw = 0,
    Pitch = 0,
    Roll = 0
  })
  WaitFrame(1)
  WaitMoveNpc(Oldman)
  Wait(0.5)
  TurnNpc(Oldman, NPC_D_RIGHT)
  Wait(0.1)
  SetActorRotation("PLAYER", {
    Yaw = -90,
    Pitch = 0,
    Roll = 0
  })
  CmdEventClosingMessage("NPC_Talk_IzanaiCave_B1F_before_MAIN_0_VOLUME_0110_010_1")
  TurnParty(1, 3)
  ItemGetMessageToActor("NPC_Talk_IzanaiCave_B1F_before_MAIN_0_VOLUME_0110_010_2", "ITEM_IMPORTANT_ADVENTURERS_MAP", Oldman)
  -- AP
  local HaveMap = IsHaveItem("ITEM_IMPORTANT_ADVENTURERS_MAP")
  if not HaveMap then
    AddItem("ITEM_IMPORTANT_ADVENTURERS_MAP")
    SetFlag(Flag.FE58, true)
  end
  -- AP end
  CmdMessage("NPC_Talk_IzanaiCave_B1F_before_MAIN_0_VOLUME_0110_010_3")
  CmdEventClosingMessage("NPC_Talk_IzanaiCave_B1F_before_MAIN_0_VOLUME_0110_010_4")
  RemoveItem("ITEM_IMPORTANT_WRECKING_BALL")
  SetFlag(Flag.FE216, true)
  -- AP
  if not HaveMap then
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_IZANAICAVE_GetWorldMap, true)
  end
  -- AP end
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end
