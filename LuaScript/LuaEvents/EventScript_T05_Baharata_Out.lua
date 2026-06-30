print("Load Script EventScript_T05_Baharata_Out")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Baharata_Out_MAIN_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE905) == false then
    if --[[GetFlag(Flag.FE63) ==]] true then -- AP
      PlayLocationCamera(table, false)
      SetDispMiniMap(false)
      CmdFadeOut(EFadingPriorityUIBackGround, 0)
      CmdFadeIn(EFadingPriorityTopMost, 0.5)
      Gupta_Departure()
    else
      PlayLocationCamera(table)
    end
    SetFlag(Flag.FE905, true)
    RequestAutoSaveFromEvent()
  elseif --[[GetFlag(Flag.FE63) ==]] true then -- AP
    if GetFlag(Flag.FE137) == true then
      DisableEventFastForwardUI()
      print("\227\130\185\227\130\173\227\131\131\227\131\151\233\157\158\232\161\168\231\164\186")
      CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
    else
      SetDispMiniMap(false)
      CmdFadeOut(EFadingPriorityUIBackGround, 0)
      CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
      Gupta_Departure()
      RequestAutoSaveFromEvent()
    end
  else
    DisableEventFastForwardUI()
    print("\227\130\185\227\130\173\227\131\131\227\131\151\233\157\158\232\161\168\231\164\186")
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  end
  if GetFlag(Flag.FE128) == false then
    CheckBurg()
  end
  EventEnd(eventInfo, "")
end

function Gupta_Departure()
  local Gupta, OldMan
  local MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Gupta = "Baharata_Out_Gupta_01_L3"
    OldMan = "Baharata_Out_OldMan_01_L3"
  else
    Gupta = "Baharata_Out_Gupta_01_L1"
    OldMan = "Baharata_Out_OldMan_01_L1"
  end
  SetNicolaApertureRate(100, 0)
  EndSkillInvisibleNoEffect()
  EndSkillTransformNoEffect()
  SpawnNpc(Gupta)
  SpawnNpc(OldMan)
  WaitFrame(1)
  ChangeNpcOpacity(Gupta, 0, 0, false)
  ChangeNpcOpacity(OldMan, 0, 0, false)
  SetPlayerLocation({
    X = 8400,
    Y = 1900,
    Z = 460
  })
  SetNpcLocation(OldMan, {
    X = 5500,
    Y = 2280,
    Z = 383
  })
  CmdChangeStageCameraToGlobalPoint(5460, 2700, 180, CAMERA_BLEND_EASE_IN_OUT, 0, 2, 2200, {
    Yaw = 0,
    Pitch = -25,
    Roll = 0
  })
  CmdFadeIn(EFadingPriorityUIBackGround, 0.5)
  OpenDoor("BP_Door_Normal_T05_Baharata_Door_01_2", false, "")
  Wait(0.5)
  ChangeNpcOpacity(Gupta, 1, 0, false)
  MoveNpc(Gupta, {
    X = 5465,
    Y = 2850,
    Z = 0
  }, 800)
  Wait(0.5)
  ChangeNpcOpacity(OldMan, 1, 0, false)
  MoveNpc(OldMan, {
    X = 5465,
    Y = 2850,
    Z = 0
  }, 600)
  WaitMoveNpc(Gupta)
  MoveNpc(Gupta, {
    X = 7650,
    Y = 2750,
    Z = 0
  }, 1200)
  WaitMoveNpc(OldMan)
  SpawnMangaIcon(OldMan, "FIELD_EFX2D_IMPATIENCE")
  MoveNpc(OldMan, {
    X = 7650,
    Y = 2750,
    Z = 0
  }, 600)
  Wait(1)
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  SetNpcLocation(Gupta, {
    X = 7650,
    Y = 2750,
    Z = 410
  })
  SetNpcLocation(OldMan, {
    X = 7050,
    Y = 2750,
    Z = 410
  })
  CloseDoor("BP_Door_Normal_T05_Baharata_Door_01_2", "")
  CmdChangeStageCameraToGlobalPoint(9000, 2700, 180, CAMERA_BLEND_EASE_IN_OUT, 0, 2, 2200, {
    Yaw = 0,
    Pitch = -25,
    Roll = 0
  })
  MoveParty({
    X = 8400,
    Y = 2400,
    Z = 0
  })
  CmdFadeIn(EFadingPriorityTopMost, 0.5)
  HideMessageWindowPageFeedIcon()
  ShowMessage("NPC_Talk_Baharata_Out_MAIN_0_ACTOR_0210_010_0_1")
  Wait(0.5)
  MoveNpc(Gupta, {
    X = 8600,
    Y = 2750,
    Z = 0
  }, 1200)
  MoveNpc(OldMan, {
    X = 8330,
    Y = 2750,
    Z = 0
  }, 600)
  SpawnMangaIcon(OldMan, "FIELD_EFX2D_IMPATIENCE")
  WaitMoveParty()
  SpawnMangaIconByParty(1, "FIELD_EFX2D_SURPRISE")
  WaitMoveNpc(OldMan)
  WaitShowMessage()
  ChangeSpeaker()
  CmdMoveNpc(Gupta, {
    X = 8650,
    Y = 2750,
    Z = 0
  }, 200)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Baharata_Out_MAIN_0_ACTOR_0210_010_0_2")
  ChangeSpeaker()
  ChangeStageCameraToGlobalPoint(9000, 2500, 180, CAMERA_BLEND_EASE_IN_OUT, 1.5, 2, 2200, {
    Yaw = 0,
    Pitch = -25,
    Roll = 0
  })
  Wait(0.5)
  TurnNpc(OldMan, NPC_D_LEFT)
  CmdMessage("NPC_Talk_Baharata_Out_MAIN_0_ACTOR_0210_010_0_3")
  CmdMoveNpc(OldMan, {
    X = 8330,
    Y = 2650,
    Z = 0
  }, 100)
  CmdMessage("NPC_Talk_Baharata_Out_MAIN_0_ACTOR_0210_010_1")
  SetNpcAnimation(OldMan, AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_Talk_Baharata_Out_MAIN_0_ACTOR_0210_010_2")
  WaitAnimNpc(OldMan)
  ResetNpcAnimation(OldMan)
  TurnNpc(OldMan, NPC_D_UP)
  CmdMessage("NPC_Talk_Baharata_Out_MAIN_0_ACTOR_0210_010_3")
  CmdEventClosingMessage("NPC_Talk_Baharata_Out_MAIN_0_ACTOR_0210_010_4")
  TurnNpc(OldMan, NPC_D_TO_PLAYER)
  Wait(0.2)
  SpawnMangaIcon(OldMan, "FIELD_EFX2D_THINK")
  Wait(1.5)
  CloseMangaIconAll(OldMan)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Baharata_Out_MAIN_0_ACTOR_0210_010_5")
  ChangeSpeaker()
  CmdSpawnMangaIcon(Gupta, "FIELD_EFX2D_SURPRISE")
  Wait(0.5)
  TurnNpc(Gupta, NPC_D_LOW)
  Wait(0.1)
  CmdMoveNpc(Gupta, {
    X = 8600,
    Y = 2720,
    Z = 0
  }, 400)
  TurnNpc(Gupta, NPC_D_LOW)
  SetNpcAnimation(Gupta, AnimationType.Act1, 1, EFlipbookPlayTypeAutoResetIdle, false)
  CmdMessage("NPC_Talk_Baharata_Out_MAIN_0_ACTOR_0210_010_6")
  TurnNpc(OldMan, NPC_D_UP)
  CmdMessage("NPC_Talk_Baharata_Out_MAIN_0_ACTOR_0210_010_7")
  WaitAnimNpc(Gupta)
  TurnNpc(Gupta, NPC_D_LEFT)
  CmdEventClosingMessage("NPC_Talk_Baharata_Out_MAIN_0_ACTOR_0210_010_8")
  MoveNpc(Gupta, {
    X = 8600,
    Y = 1500,
    Z = 0
  }, 900)
  Wait(0.5)
  MoveNpc(OldMan, {
    X = 8330,
    Y = 2550,
    Z = 0
  }, 400)
  CmdEventClosingMessage("NPC_Talk_Baharata_Out_MAIN_0_ACTOR_0210_010_9")
  WaitMoveNpc(Gupta)
  DestroyNpc(Gupta)
  CmdEventClosingMessage("NPC_Talk_Baharata_Out_MAIN_0_ACTOR_0210_010_10")
  SetNpcAnimation(OldMan, AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, true)
  SetFlag(Flag.FE137, true)
  SetFlag(Flag.FD13, true)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BAHARATA_TalkGupta, true)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  WaitAnimNpc(OldMan)
  SetDispMiniMap(true)
end

function Baharata_Out_MAIN_0_ACTOR_0210_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Baharata_Out_MAIN_0_ACTOR_0210_020_1")
  EventEnd(eventInfo, "")
end

function Baharata_Out_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0310_010_1")
  EventEnd(eventInfo, "", false)
end

function Baharata_Out_SUB_0_ACTOR_0410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0410_010_1")
  CmdEventClosingMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0410_010_2")
  EventEnd(eventInfo, "")
end

function Baharata_Out_SUB_0_ACTOR_0510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0510_010_1")
  CmdEventClosingMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0510_010_2")
  EventEnd(eventInfo, "")
end

function Baharata_Out_SUB_0_ACTOR_0610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_EQUIP_WEAPON_SOMATIC_STAFF")
  CmdMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0610_010_1")
  CmdEventClosingMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0610_010_2")
  EventEnd(eventInfo, "")
end

function Baharata_Out_SUB_0_ACTOR_0610_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local i, MemberPersonality
  SetTagItemId("ITEM_EQUIP_WEAPON_SOMATIC_STAFF")
  CmdMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0610_010_1")
  CmdMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0610_010_2")
  CmdMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0610_020_1")
  for i = 1, 4 do
    MemberPersonality = GetPartyMemberPersonality(i)
    if MemberPersonality == "PERSONALITY_CLOWN" then
      if i == 1 then
        CmdEventClosingMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0610_020_3")
        break
      else
        CmdEventClosingMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0610_020_4")
        break
      end
    elseif i == 4 then
      CmdEventClosingMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0610_020_2")
      break
    end
  end
  EventEnd(eventInfo, "")
end

function Baharata_Out_SUB_0_ACTOR_0710_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0710_010_1")
  CmdMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0710_010_2")
  CmdEventClosingMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0710_010_3")
  EventEnd(eventInfo, "")
end

function Baharata_Out_SUB_0_ACTOR_0810_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE223) == true then
  else
    SetTagItemId("ITEM_IMPORTANT_BLACK_PEPPER")
    CmdMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0810_010_1")
  end
  CmdCallShopUI("SHOP_BAHARATA_EQUIP_0001")
  EventEnd(eventInfo, "")
end

function Baharata_Out_SUB_0_ACTOR_0910_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdCallShopUI("SHOP_BAHARATA_ITEM_0001")
  EventEnd(eventInfo, "")
end

function Baharata_Out_SUB_0_ACTOR_0920_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_0920_010_1")
  EventEnd(eventInfo, "")
end

function Baharata_Out_SUB_0_ACTOR_1010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_1010_010_1")
  CmdEventClosingMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_1010_010_2")
  EventEnd(eventInfo, "")
end

function Baharata_Out_SUB_0_ACTOR_1110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_1110_010_1")
  CmdEventClosingMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_1110_010_2")
  EventEnd(eventInfo, "")
end

function Baharata_Out_SUB_0_ACTOR_1220_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_1220_010_1")
  CmdEventClosingMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_1220_010_2")
  EventEnd(eventInfo, "")
end

function Baharata_Out_River_00(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  TurnParty(1, 2)
  local result = CmdChoiceMessage("NPC_Talk_Baharata_Out_SearchObj_River_1")
  if result == true then
    PlaySEEvent("EVESE_BAHARATA_RIVER")
    CmdEventClosingMessage("NPC_Talk_Baharata_Out_SearchObj_River_2")
  end
  EventEnd(eventInfo, "")
end

function Baharata_Out_SUB_0_MBR_SCOUT_1310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local volumeTag = (...)
  if volumeTag == "SuccessCollision" then
  elseif volumeTag == "FailCollision" then
  elseif volumeTag == nil then
  end
  local TextTable = {
    Success1 = "NPC_Talk_Baharata_Out_SUB_0_VOLUME_1310_010_1",
    Success2 = "NPC_Talk_Baharata_Out_SUB_0_VOLUME_1310_010_2",
    Success3 = "NPC_Talk_Baharata_Out_SUB_0_VOLUME_1310_010_3"
  }
  local MonsterScoutId = "MBR_SCOUT_OVERTOAD_T05_Baharata_Out"
  local ActorId
  local mapTime = GetMapTimeFrame()
  if mapTime == MAPTIME_DAYTIME then
    ActorId = "Baharata_Out_OVERTOAD_00_L1"
  elseif mapTime == MAPTIME_EVENING then
    ActorId = "Baharata_Out_OVERTOAD_00_L2"
  elseif mapTime == MAPTIME_NIGHT then
    ActorId = "Baharata_Out_OVERTOAD_00_L3"
  end
  local MonsterLocation = {
    X = 3900,
    Y = 1350,
    Z = 380
  }
  local PlayerLocation = {
    X = MonsterLocation.X - 310,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z - 134
  }
  local PlayerLook = {Chara = 1, Turn = 0}
  local CameraParam = {
    X = MonsterLocation.X - 125,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z - 60,
    Distance = 1800
  }
  MonsterScoutScript(MonsterScoutId, TextTable, ActorId, PlayerLocation, CameraParam, PlayerLook, volumeTag, MonsterLocation)
  EventEnd(eventInfo, "")
end

function Baharata_Out_SUB_0_ACTOR_1410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_EQUIP_WEAPON_SOMATIC_STAFF")
  CmdEventClosingMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_1410_010_1")
  EventEnd(eventInfo, "", false)
end

function Baharata_Out_SUB_0_ACTOR_1510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_EQUIP_WEAPON_SOMATIC_STAFF")
  CmdMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_1510_010_1")
  CmdEventClosingMessage("NPC_Talk_Baharata_Out_SUB_0_ACTOR_1510_010_2")
  EventEnd(eventInfo, "", false)
end
