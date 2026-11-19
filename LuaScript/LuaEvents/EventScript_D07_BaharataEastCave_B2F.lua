print("Load Script EventScript_D07_BaharataEastCave_B2F")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function debug()
end

function BaharataEastCave_B2F_MAIN_0_VOLUME_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  -- AP
  if not GetFlag(Flag.FE55) then
    EventEnd(eventInfo, "")
    return
  end
  -- AP end
  local Minion01, Minion02, MapTime
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  EndSkillInvisibleNoEffect()
  EndSkillTransformNoEffect()
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Minion01 = "BaharataEastCave_B2F_KandarMinion_01_L3"
    Minion02 = "BaharataEastCave_B2F_KandarMinion_02_L3"
  else
    Minion01 = "BaharataEastCave_B2F_KandarMinion_01_L1"
    Minion02 = "BaharataEastCave_B2F_KandarMinion_02_L1"
  end
  if GetFlag(Flag.FF1) == false then
    OpenDoor("BP_Door_MagicLarge_D07_Door_01", true, "")
  end
  ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
  CmdMoveParty({
    X = 4640,
    Y = 2750,
    Z = 0
  })
  TurnParty(1, 2)
  if GetFlag(Flag.FF1) == false then
    MoveNpc(Minion01, {
      X = 4450,
      Y = 2710,
      Z = 0
    }, 250)
    Wait(0.1)
    CmdMoveNpc(Minion02, {
      X = 4450,
      Y = 2790,
      Z = 0
    }, 250)
    TurnNpc(Minion01, NPC_D_UP)
    Wait(0.1)
    CmdTurnNpc(Minion02, NPC_D_UP)
  end
  CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_ACTOR_0110_010_2")
  CmdMoveParty({
    X = 4840,
    Y = 2750,
    Z = 0
  })
  SetFlag(Flag.FF1, true)
  SetDispMiniMap(true)
  EventEnd(eventInfo, "")
end

function BaharataEastCave_B2F_MAIN_0_VOLUME_0010_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  -- AP
  if not GetFlag(Flag.FE55) then
    EventEnd(eventInfo, "")
    return
  end
  -- AP end
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  EndSkillInvisibleNoEffect()
  EndSkillTransformNoEffect()
  RequestPreloadEventBattle("BATTLE_EVENT_BOSS_BAHARATAEASTCAVE_KANDATA_MINION_1")
  local Minion01, Minion02, Minion03, Minion04, MapTime
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Minion01 = "BaharataEastCave_B2F_KandarMinion_01_L3"
    Minion02 = "BaharataEastCave_B2F_KandarMinion_02_L3"
    Minion03 = "BaharataEastCave_B2F_KandarMinion_03_L3"
    Minion04 = "BaharataEastCave_B2F_KandarMinion_04_L3"
  else
    Minion01 = "BaharataEastCave_B2F_KandarMinion_01_L1"
    Minion02 = "BaharataEastCave_B2F_KandarMinion_02_L1"
    Minion03 = "BaharataEastCave_B2F_KandarMinion_03_L1"
    Minion04 = "BaharataEastCave_B2F_KandarMinion_04_L1"
  end
  if GetFlag(Flag.FF1) == false then
    OpenDoor("BP_Door_MagicLarge_D07_Door_01", true, "")
  end
  ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
  CmdMoveParty({
    X = 4640,
    Y = 2750,
    Z = 0
  })
  TurnParty(1, 2)
  if GetFlag(Flag.FF1) == false then
    MoveNpc(Minion01, {
      X = 4450,
      Y = 2710,
      Z = 0
    }, 250)
    Wait(0.1)
    CmdMoveNpc(Minion02, {
      X = 4450,
      Y = 2790,
      Z = 0
    }, 250)
    TurnNpc(Minion01, NPC_D_UP)
    Wait(0.1)
    CmdTurnNpc(Minion02, NPC_D_UP)
  end
  local result = CmdChoiceMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_ACTOR_0110_020_1")
  if result == true then
    CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_ACTOR_0110_020_5")
    SetFlag(Flag.FF1, true)
    CmdMoveParty({
      X = 4840,
      Y = 2750,
      Z = 0
    })
    SetDispMiniMap(true)
  else
    CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_ACTOR_0110_020_6")
    MoveNpc(Minion03, {
      X = 4390,
      Y = 2850,
      Z = 0
    }, 800)
    CmdMoveNpc(Minion04, {
      X = 3630,
      Y = 2650,
      Z = 0
    }, 1000)
    CmdMoveNpc(Minion04, {
      X = 4390,
      Y = 2650,
      Z = 0
    }, 1000)
    CmdStartEventBattle("BATTLE_EVENT_BOSS_BAHARATAEASTCAVE_KANDATA_MINION_1")
  end
  SetFlag(Flag.FF1, true)
  EventEnd(eventInfo, "")
end

function BaharataEastCave_B2F_MAIN_0_BATTLE_END_0010_025(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  print("\227\130\171\227\131\179\227\131\128\227\130\191\227\129\147\227\129\182\227\130\147\227\129\171\229\139\157\227\129\163\227\129\159")
  local Minion01, Minion02, Minion03, Minion04, MapTime
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Minion01 = "BaharataEastCave_B2F_KandarMinion_01_L3"
    Minion02 = "BaharataEastCave_B2F_KandarMinion_02_L3"
    Minion03 = "BaharataEastCave_B2F_KandarMinion_03_L3"
    Minion04 = "BaharataEastCave_B2F_KandarMinion_04_L3"
  else
    Minion01 = "BaharataEastCave_B2F_KandarMinion_01_L1"
    Minion02 = "BaharataEastCave_B2F_KandarMinion_02_L1"
    Minion03 = "BaharataEastCave_B2F_KandarMinion_03_L1"
    Minion04 = "BaharataEastCave_B2F_KandarMinion_04_L1"
  end
  SetFlag(Flag.FE220, true)
  DestroyNpc(Minion01)
  DestroyNpc(Minion02)
  DestroyNpc(Minion03)
  DestroyNpc(Minion04)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BAHARATAEASTCAVE_DefeatHenchman, true)
  CmdFadeInAfterEventBattle()
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function BaharataEastCave_B2F_MAIN_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_ACTOR_0110_010_2")
  EventEnd(eventInfo, "", false)
end

function BaharataEastCave_B2F_MAIN_0_ACTOR_0110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  RequestPreloadEventBattle("BATTLE_EVENT_BOSS_BAHARATAEASTCAVE_KANDATA_MINION_1")
  local Minion03, Minion04, MapTime
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  local result = CmdChoiceMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_ACTOR_0110_020_1")
  if result == true then
    CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_ACTOR_0110_020_5")
    SetDispMiniMap(true)
  else
    MapTime = GetMapTimeFrame()
    if MapTime == MAPTIME_NIGHT then
      Minion03 = "BaharataEastCave_B2F_KandarMinion_03_L3"
      Minion04 = "BaharataEastCave_B2F_KandarMinion_04_L3"
    else
      Minion03 = "BaharataEastCave_B2F_KandarMinion_03_L1"
      Minion04 = "BaharataEastCave_B2F_KandarMinion_04_L1"
    end
    CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_ACTOR_0110_020_6")
    MoveNpc(Minion03, {
      X = 4390,
      Y = 2850,
      Z = 0
    }, 500)
    CmdMoveNpc(Minion04, {
      X = 3630,
      Y = 2650,
      Z = 0
    }, 600)
    CmdMoveNpc(Minion04, {
      X = 4390,
      Y = 2650,
      Z = 0
    }, 600)
    CmdStartEventBattle("BATTLE_EVENT_BOSS_BAHARATAEASTCAVE_KANDATA_MINION_1")
  end
  EventEnd(eventInfo, "", false)
end

function BaharataEastCave_B2F_MAIN_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_ACTOR_0110_010_2")
  EventEnd(eventInfo, "", false)
end

function BaharataEastCave_B2F_MAIN_0_ACTOR_0210_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_ACTOR_0110_010_2")
  EventEnd(eventInfo, "", false)
end

function BaharataEastCave_B2F_MAIN_0_VOLUME_ONE_FRAME_0010_030(BeginOverlap, table, ...)
  local eventInfo = EventStartOneFrameVolume(table)
  CallEventEndEventByOneFrameVolume(eventInfo)
  EventEndOneFrameVolume(eventInfo)
end

function BaharataEastCave_B2F_MAIN_0_EVENT_END_0010_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local Gupta, MapTime
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Gupta = "BaharataEastCave_B2F_Gupta_01_L3"
  else
    Gupta = "BaharataEastCave_B2F_Gupta_01_L1"
  end
  EndSkillInvisibleNoEffect()
  EndSkillTransformNoEffect()
  TurnParty(1, 0)
  if GetFlag(Flag.FS1) == false then
    CmdMoveNpc(Gupta, {
      X = 800,
      Y = 2250,
      Z = 0
    }, 800)
  end
  if GetFlag(Flag.FE222) == true then
    CmdMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_VOLUME_0010_030_3")
  end
  CmdMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_VOLUME_0010_030_1")
  CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_VOLUME_0010_030_2")
  SetFlag(Flag.FE222, true)
  SetFlag(Flag.FF2, true)
  SetFlag(Flag.FS1, true)
  EventEnd(eventInfo, "")
end

function BaharataEastCave_B2F_MAIN_0_VOLUME_ONE_FRAME_0010_040(BeginOverlap, table, ...)
  local eventInfo = EventStartOneFrameVolume(table)
  CallEventEndEventByOneFrameVolume(eventInfo)
  EventEndOneFrameVolume(eventInfo)
end

function BaharataEastCave_B2F_MAIN_0_EVENT_END_0010_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local Tanya, MapTime
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Tanya = "BaharataEastCave_B2F_Tanya_01_L3"
  else
    Tanya = "BaharataEastCave_B2F_Tanya_01_L1"
  end
  EndSkillInvisibleNoEffect()
  EndSkillTransformNoEffect()
  TurnParty(1, 0)
  if GetFlag(Flag.FS2) == false then
    CmdMoveNpc(Tanya, {
      X = 800,
      Y = 3250,
      Z = 0
    }, 800)
  end
  CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_VOLUME_0010_040_1")
  SetFlag(Flag.FF3, true)
  SetFlag(Flag.FS2, true)
  EventEnd(eventInfo, "")
end

function BaharataEastCave_B2F_MAIN_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  TurnParty(1, 0)
  CmdMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_ACTOR_0310_010_1")
  CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_ACTOR_0310_010_2")
  EventEnd(eventInfo, "")
end

function BaharataEastCave_B2F_MAIN_0_ACTOR_0410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  TurnParty(1, 0)
  CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_ACTOR_0410_010_1")
  EventEnd(eventInfo, "")
end

function BaharataEastCave_B2F_LeverSwitch_00(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, "")
  targetActorId = eventInfo[1]
  TurnParty(1, 0)
  if GetFlag(Flag.FD16) == true then
    CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_SearchObj_LeverSwitch_3")
  else
    SetNicolaApertureRate(100, 0)
    SetDispMiniMap(false)
    result = CmdChoiceMessage("NPC_Talk_BaharataEastCave_B2F_SearchObj_LeverSwitch_1")
    if result == true then
      CloseMessage()
      EndSkillInvisibleNoEffect()
      EndSkillTransformNoEffect()
      PlaySEEvent("EVESE_BAHARATAEASTCAVE_LEVER")
      CmdPlayOpenAnimSearchObj("BP_SearchAnimEvent_D07_Switch_01")
      CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_SearchObj_LeverSwitch_2")
      PlaySEEvent("EVESE_BAHARATAEASTCAVE_PRISON")
      PlayOpenAnimSearchObj("BP_SearchAnimEvent_D07_JailGate_01")
      CmdPlayOpenAnimSearchObj("BP_SearchAnimEvent_D07_JailGate_02")
      SetFlag(Flag.FD16, true)
      if GetFlag(Flag.FE223) == true then
        SetDispMiniMap(true)
      end
    else
      SetDispMiniMap(true)
    end
  end
  EventEnd(eventInfo, "")
end

function BaharataEastCave_B2F_MAIN_0_EVENT_END_0010_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local Gupta, Gupta02, Tanya, Tanya02, Kandar, Minion05, Minion06, MapTime
  SetNicolaApertureRate(100, 0)
  if GetFlag(Flag.FS0) == false then
    MapTime = GetMapTimeFrame()
    if MapTime == MAPTIME_NIGHT then
      Gupta = "BaharataEastCave_B2F_Gupta_01_L3"
      Gupta02 = "BaharataEastCave_B2F_Gupta_02_L3"
      Tanya = "BaharataEastCave_B2F_Tanya_01_L3"
      Tanya02 = "BaharataEastCave_B2F_Tanya_02_L3"
      Kandar = "BaharataEastCave_B2F_Kandar_2_01_L3"
      Minion05 = "BaharataEastCave_B2F_KandarMinion_05_L3"
      Minion06 = "BaharataEastCave_B2F_KandarMinion_06_L3"
    else
      Gupta = "BaharataEastCave_B2F_Gupta_01_L1"
      Gupta02 = "BaharataEastCave_B2F_Gupta_02_L1"
      Tanya = "BaharataEastCave_B2F_Tanya_01_L1"
      Tanya02 = "BaharataEastCave_B2F_Tanya_02_L1"
      Kandar = "BaharataEastCave_B2F_Kandar_2_01_L1"
      Minion05 = "BaharataEastCave_B2F_KandarMinion_05_L1"
      Minion06 = "BaharataEastCave_B2F_KandarMinion_06_L1"
    end
    SetNpcLocation(Tanya, {
      X = 500,
      Y = 3200,
      Z = 200
    })
    Wait(0.05)
    CmdMoveNpc(Gupta, {
      X = 500,
      Y = 2300,
      Z = 0
    }, 800)
    TurnNpc(Gupta, NPC_D_RIGHT)
    CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_VOLUME_0010_050_1")
    MoveNpc(Tanya, {
      X = 499,
      Y = 2800,
      Z = 0
    }, 600)
    CmdMoveNpc(Gupta, {
      X = 500,
      Y = 2750,
      Z = 0
    }, 600)
    SetNpcAnimation(Tanya, AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, true)
    SetNpcAnimation(Gupta, AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, true)
    ChangeStageCameraToGlobalPoint(400, 2600, 300, CAMERA_BLEND_EASE_IN_OUT, 2, 2, 1800, {
      Yaw = 0,
      Pitch = -22,
      Roll = 0
    })
    MoveParty({
      X = 400,
      Y = 2600,
      Z = 0
    })
    Wait(2.5)
    HideMessageWindowPageFeedIcon()
    CmdMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_VOLUME_0010_050_2")
    ChangeSpeaker()
    CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_VOLUME_0010_050_3")
    WaitAnimNpc(Gupta)
    SetNpcAnimation(Tanya, AnimationType.Act3, 1, EFlipbookPlayTypeAutoResetIdle, false)
    CmdSetNpcAnimation(Gupta, AnimationType.Act5, 1, EFlipbookPlayTypeAutoResetIdle, false)
    MoveNpc(Gupta, {
      X = 700,
      Y = 2750,
      Z = 0
    }, 400)
    Wait(0.3)
    CmdMoveNpc(Tanya, {
      X = 600,
      Y = 2800,
      Z = 0
    }, 400)
    TurnNpc(Tanya, NPC_D_LEFT)
    CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_VOLUME_0010_050_4")
    SpawnNpc(Gupta02)
    SpawnNpc(Tanya02)
    SpawnNpc(Kandar)
    SpawnNpc(Minion05)
    SpawnNpc(Minion06)
    MoveNpc(Gupta, {
      X = 3600,
      Y = 2700,
      Z = 0
    }, 800)
    Wait(0.3)
    CmdMoveNpc(Tanya, {
      X = 700,
      Y = 2800,
      Z = 0
    }, 800)
    CmdMoveNpc(Tanya, {
      X = 3500,
      Y = 2800,
      Z = 0
    }, 800)
    HideMessageWindowPageFeedIcon()
    ShowMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_VOLUME_0010_050_5")
    Wait(0.3)
    SpawnMangaIconByParty(1, "FIELD_EFX2D_SURPRISE")
    WaitShowMessage()
    CloseMessage()
    DestroyNpc(Gupta)
    DestroyNpc(Tanya)
    CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
    SetFlag(Flag.FS0, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BAHARATAEASTCAVE_OpenPrison, true)
    SetDispMiniMap(true)
    RequestAutoSaveFromEvent()
  end
  EventEnd(eventInfo, "")
end

function BaharataEastCave_B2F_MAIN_0_VOLUME_ONE_FRAME_0010_060(BeginOverlap, table, ...)
  local eventInfo = EventStartOneFrameVolume(table)
  CallEventEndEventByOneFrameVolume(eventInfo)
  EventEndOneFrameVolume(eventInfo)
end

function BaharataEastCave_B2F_MAIN_0_EVENT_END_0010_060(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  RequestPreloadEventBattle("BATTLE_EVENT_BOSS_BAHARATAEASTCAVE_KANDATA_2")
  local Gupta02, Tanya02, Kandar, Minion05, Minion06, MapTime
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  EndSkillInvisibleNoEffect()
  EndSkillTransformNoEffect()
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Gupta02 = "BaharataEastCave_B2F_Gupta_02_L3"
    Tanya02 = "BaharataEastCave_B2F_Tanya_02_L3"
    Kandar = "BaharataEastCave_B2F_Kandar_2_01_L3"
    Minion05 = "BaharataEastCave_B2F_KandarMinion_05_L3"
    Minion06 = "BaharataEastCave_B2F_KandarMinion_06_L3"
  else
    Gupta02 = "BaharataEastCave_B2F_Gupta_02_L1"
    Tanya02 = "BaharataEastCave_B2F_Tanya_02_L1"
    Kandar = "BaharataEastCave_B2F_Kandar_2_01_L1"
    Minion05 = "BaharataEastCave_B2F_KandarMinion_05_L1"
    Minion06 = "BaharataEastCave_B2F_KandarMinion_06_L1"
  end
  MoveParty({
    X = 3700,
    Y = 2750,
    Z = 0
  })
  ChangeStageCameraToGlobalPoint(4250, 2750, 0, CAMERA_BLEND_EASE_IN_OUT, 1.5, 2, 2000, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  MoveNpc(Kandar, {
    X = 4250,
    Y = 2750,
    Z = 0
  }, 200)
  HideMessageWindowPageFeedIcon()
  ShowMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_VOLUME_0010_060_1")
  WaitMoveNpc(Kandar)
  WaitMoveParty()
  TurnParty(1, 0)
  WaitShowMessage()
  CloseMessage()
  CmdMoveNpcDetail(Tanya02, {
    X = 4150,
    Y = 3000,
    Z = 0
  }, 100, NPC_D_LEFT, 0, 1)
  Wait(0.1)
  CmdMoveNpcDetail(Gupta02, {
    X = 4250,
    Y = 2950,
    Z = 0
  }, 100, NPC_D_LEFT, 0, 1)
  Wait(0.2)
  TurnNpc(Tanya02, NPC_D_LOW)
  Wait(0.1)
  CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_VOLUME_0010_060_3")
  Wait(0.2)
  CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_VOLUME_0010_060_2")
  MoveParty({
    X = 3800,
    Y = 2750,
    Z = 0
  })
  Wait(0.8)
  TurnNpc(Kandar, NPC_D_LOW)
  Wait(0.2)
  MoveNpc(Kandar, {
    X = 4200,
    Y = 2750,
    Z = 0
  }, 200)
  MoveNpcDetail(Gupta02, {
    X = 4050,
    Y = 3000,
    Z = 0
  }, 400, NPC_D_LEFT, 0, 1)
  Wait(0.1)
  MoveNpc(Tanya02, {
    X = 3950,
    Y = 3050,
    Z = 0
  }, 400)
  WaitMoveNpc(Gupta02)
  TurnNpc(Gupta02, NPC_D_LEFT)
  WaitMoveNpc(Tanya02)
  TurnNpc(Tanya02, NPC_D_LEFT)
  WaitMoveNpc(Kandar)
  SpawnMangaIcon(Kandar, "FIELD_EFX2D_QUESTION", false)
  CmdSetNpcAnimation(Kandar, AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
  CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_VOLUME_0010_060_4")
  SetNpcAnimation(Kandar, AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, false)
  Wait(1)
  SpawnMangaIcon(Kandar, "FIELD_EFX2D_SURPRISE", false)
  WaitAnimNpc(Kandar)
  CmdSetNpcAnimation(Kandar, AnimationType.Act4, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_VOLUME_0010_060_5")
  SetNpcAnimation(Kandar, AnimationType.Act6, 1, EFlipbookPlayTypeStopEnd, false)
  HideMessageWindowPageFeedIcon()
  CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_VOLUME_0010_060_6")
  WaitAnimNpc(Kandar)
  PlaySEEvent("EVESE_BAHARATAEASTCAVE_AXE")
  CmdSetNpcAnimation(Kandar, AnimationType.Act7, 1, EFlipbookPlayTypeStopEnd, true)
  Wait(1)
  CmdStartEventBattle("BATTLE_EVENT_BOSS_BAHARATAEASTCAVE_KANDATA_2")
  EventEnd(eventInfo, "")
end

function BaharataEastCave_B2F_MAIN_0_BATTLE_END_0010_070(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local Gupta, Gupta02, Tanya, Tanya02, Kandar, Minion05, Minion06, MapTime
  local party1 = "Party1"
  local party2 = "Party2"
  local party3 = "Party3"
  local party4 = "Party4"
  TurnParty(1, 0)
  WaitFrame(1)
  PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WARP)
  WaitFrame(1)
  SpawnPartyCloneDisableSkill(true, true, true, true)
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  ChangeStageCameraToGlobalPoint(4400, 2750, 100, CAMERA_BLEND_LINEAR, 0.05, 2, 2000, {
    Yaw = 0,
    Pitch = -10,
    Roll = 0
  })
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Gupta = "BaharataEastCave_B2F_Gupta_01_L3"
    Gupta02 = "BaharataEastCave_B2F_Gupta_02_L3"
    Tanya = "BaharataEastCave_B2F_Tanya_01_L3"
    Tanya02 = "BaharataEastCave_B2F_Tanya_02_L3"
    Kandar = "BaharataEastCave_B2F_Kandar_2_01_L3"
    Minion05 = "BaharataEastCave_B2F_KandarMinion_05_L3"
    Minion06 = "BaharataEastCave_B2F_KandarMinion_06_L3"
  else
    Gupta = "BaharataEastCave_B2F_Gupta_01_L1"
    Gupta02 = "BaharataEastCave_B2F_Gupta_02_L1"
    Tanya = "BaharataEastCave_B2F_Tanya_01_L1"
    Tanya02 = "BaharataEastCave_B2F_Tanya_02_L1"
    Kandar = "BaharataEastCave_B2F_Kandar_2_01_L1"
    Minion05 = "BaharataEastCave_B2F_KandarMinion_05_L1"
    Minion06 = "BaharataEastCave_B2F_KandarMinion_06_L1"
  end
  DestroyNpc(Minion05)
  DestroyNpc(Minion06)
  DestroyNpc(Gupta)
  DestroyNpc(Tanya)
  SpawnNpc(Gupta02)
  SpawnNpc(Tanya02)
  SpawnNpc(Kandar)
  SetNpcLocation(Gupta02, {
    X = 4050,
    Y = 3000,
    Z = 100
  })
  SetNpcLocation(Tanya02, {
    X = 3950,
    Y = 3050,
    Z = 100
  })
  SetNpcLocation(Kandar, {
    X = 4400,
    Y = 2750,
    Z = 100
  })
  SetNpcLocation(party1, {
    X = 3800,
    Y = 2750,
    Z = 100
  })
  SetNpcLocation(party2, {
    X = 4100,
    Y = 2550,
    Z = 100
  })
  SetNpcLocation(party3, {
    X = 3900,
    Y = 2650,
    Z = 100
  })
  SetNpcLocation(party4, {
    X = 3900,
    Y = 2850,
    Z = 100
  })
  WaitFrame(1)
  TurnNpc(Kandar, NPC_D_LOW)
  TurnNpc(party2, NPC_D_RIGHT)
  Wait(0.1)
  CmdSetNpcAnimation(Kandar, AnimationType.Act10, 1, EFlipbookPlayTypeStopEnd, false)
  CmdFadeInAfterEventBattle()
  CmdMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_BATTLE_END_0010_070_1")
  WaitAnimNpc(Kandar)
  local ref = 0
  while ref < 1 do
    local result = CmdChoiceMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_BATTLE_END_0010_070_2")
    if result == true then
      SetNpcAnimation(Kandar, AnimationType.Act12, 1, EFlipbookPlayTypeAutoResetIdle, false)
      CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_BATTLE_END_0010_070_4")
      ref = 1
      WaitAnimNpc(Kandar)
    else
      SetNpcAnimation(Kandar, AnimationType.Act11, 1, EFlipbookPlayTypeLoop, false)
      CmdMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_BATTLE_END_0010_070_3")
      SetNpcAnimation(Kandar, AnimationType.Act15, 1, EFlipbookPlayTypeLoop, false)
    end
  end
  PlaySEEvent("EVESE_SHAMPANE_ESCAPE")
  MoveNpc(Kandar, {
    X = 7000,
    Y = 2750,
    Z = 0
  }, 3000)
  Wait(0.2)
  SpawnMangaIcon(Gupta02, "FIELD_EFX2D_SURPRISE")
  SpawnMangaIcon(Tanya02, "FIELD_EFX2D_SURPRISE")
  SpawnMangaIcon(party1, "FIELD_EFX2D_SURPRISE")
  RequestUnlockAchievementByDefeatKandata2()
  WaitMoveNpc(Kandar)
  CmdMoveNpc(Kandar, {
    X = 7000,
    Y = 3200,
    Z = 0
  }, 1000)
  DestroyNpc(Kandar)
  MoveNpc(Gupta02, {
    X = 4200,
    Y = 3000,
    Z = 0
  }, 400)
  Wait(0.1)
  MoveNpc(Tanya02, {
    X = 4200,
    Y = 3050,
    Z = 0
  }, 400)
  WaitMoveNpc(Gupta02)
  MoveNpc(Gupta02, {
    X = 4200,
    Y = 2700,
    Z = 0
  }, 400)
  WaitMoveNpc(Tanya02)
  MoveNpc(Tanya02, {
    X = 4200,
    Y = 2800,
    Z = 0
  }, 400)
  WaitMoveNpc(Gupta02)
  TurnNpc(Gupta02, NPC_D_LOW)
  WaitMoveNpc(Tanya02)
  TurnNpc(Tanya02, NPC_D_LOW)
  CmdMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_BATTLE_END_0010_070_5")
  TurnNpc(Gupta02, NPC_D_RIGHT)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_BATTLE_END_0010_070_6")
  ChangeSpeaker()
  TurnNpc(Tanya02, NPC_D_LEFT)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_BATTLE_END_0010_070_7")
  ChangeSpeaker()
  TurnNpc(Gupta02, NPC_D_LOW)
  CmdEventClosingMessage("NPC_Talk_BaharataEastCave_B2F_MAIN_0_BATTLE_END_0010_070_8")
  TurnNpc(Tanya02, NPC_D_LOW)
  WaitFrame(1)
  PlaySEEvent("EVESE_BAHARATAEASTCAVE_CLOTH")
  SetNpcAnimation(Gupta02, AnimationType.Act6, 1, EFlipbookPlayTypeAutoResetIdle, false)
  Wait(0.1)
  CmdSetNpcAnimation(Tanya02, AnimationType.Act4, 1, EFlipbookPlayTypeAutoResetIdle, false)
  Wait(0.2)
  ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 3, 2)
  MoveNpc(Gupta02, {
    X = 4200,
    Y = 2710,
    Z = 0
  }, 400)
  Wait(0.1)
  MoveNpc(Tanya02, {
    X = 4300,
    Y = 2790,
    Z = 0
  }, 400)
  WaitMoveNpc(Gupta02)
  MoveNpc(Gupta02, {
    X = 7000,
    Y = 2710,
    Z = 0
  }, 800)
  WaitMoveNpc(Tanya02)
  MoveNpc(Tanya02, {
    X = 7000,
    Y = 2790,
    Z = 0
  }, 800)
  Wait(2.3)
  DestroyPartyClone()
  PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WALK)
  WaitStageCameraBlend()
  WaitMoveNpc(Tanya02)
  DestroyNpc(Gupta02)
  DestroyNpc(Tanya02)
  PlayOpenAnimSearchObj("BP_SearchAnimEvent_D07_Switch_01")
  PlayOpenAnimSearchObj("BP_SearchAnimEvent_D07_JailGate_01")
  PlayOpenAnimSearchObj("BP_SearchAnimEvent_D07_JailGate_02")
  SetFlag(Flag.FE223, true)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BAHARATAEASTCAVE_DefeatKandata, true)
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end
