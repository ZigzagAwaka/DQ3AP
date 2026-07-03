print("Load Script EventScript_T12_Muor_Market_1F")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Muor_Market_1F_SUB_0_SCENE_0000_000(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  DisableEventFastForwardUI()
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    SetFlag(Flag.FD40, true)
    SetEventVolumeEnabled("Muor_Market_1F_OldMan_pokapamazu", false)
    SetEventVolumeEnabled("Muor_Market_2F_Popota_pokapamazu", false)
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  else
    SetFlag(Flag.FD40, false)
    if GetFlag(Flag.FE896) == true then
    elseif GetFlag(Flag.FE871) == true then
      if CheckHeroLiving() == true then
        SetEventVolumeEnabled("Muor_Market_1F_OldMan_pokapamazu", true)
      else
        SetEventVolumeEnabled("Muor_Market_1F_OldMan_pokapamazu", false)
      end
    end
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  end
  EventEnd(eventInfo, "")
end

function Muor_Market_1F_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0110_010_1")
  if GetFlag(Flag.FE871) == true and CheckHeroLiving() == true then
    CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0110_010_2")
    CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0110_010_3")
    CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0110_010_4")
  end
  EventEnd(eventInfo, "")
end

function Muor_Market_1F_SUB_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE871) == true then
    CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0210_010_2")
  else
    CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0210_010_3")
  end
  EventEnd(eventInfo, "")
end

function Muor_Market_1F_SUB_0_ACTOR_0220_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE871) == true then
    CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0210_010_2")
  else
    CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0220_010_1")
  end
  EventEnd(eventInfo, "")
end

function Muor_Market_1F_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckHeroLiving() == true then
    if GetFlag(Flag.FE871) == true then
      CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0310_010_5")
      CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0310_010_6")
      CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0310_010_7")
      CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0310_010_8")
      CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0310_010_9")
    else
      CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0310_010_10")
    end
  else
    CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0310_010_10")
  end
  EventEnd(eventInfo, "")
end

function Muor_Market_1F_SUB_0_ACTOR_0320_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE871) == true then
    CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0320_010_1")
  else
    CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0320_010_2")
  end
  EventEnd(eventInfo, "")
end

function Muor_Market_1F_SUB_0_ACTOR_0310_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SUB_0_ACTOR_0310_030_1")
  EventEnd(eventInfo, "")
end

function Muor_Market_1F_SUB_0_SCENE_0610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_EQUIP_HELMET_ORTEGAS_HELM")
  SetPlayerLocation({
    X = 980,
    Y = 3000,
    Z = 100
  })
  SpawnPartyCloneDisableSkill(true, true, true, true)
  EndSkillTransformNoEffect()
  EndSkillInvisibleNoEffect()
  local Hero, member2, member3, member4
  local HeroNumber = CheckHero()
  if HeroNumber == 1 then
    Hero = "Party1"
    member2 = "Party2"
    member3 = "Party3"
    member4 = "Party4"
  elseif HeroNumber == 2 then
    Hero = "Party2"
    member2 = "Party1"
    member3 = "Party3"
    member4 = "Party4"
  elseif HeroNumber == 3 then
    Hero = "Party3"
    member2 = "Party1"
    member3 = "Party2"
    member4 = "Party4"
  elseif HeroNumber == 4 then
    Hero = "Party4"
    member2 = "Party1"
    member3 = "Party2"
    member4 = "Party3"
  end
  SetNpcLocation(Hero, {
    X = 1380,
    Y = 3260,
    Z = 300
  })
  SetNpcLocation(member2, {
    X = 1480,
    Y = 3260,
    Z = 300
  })
  SetNpcLocation(member3, {
    X = 1530,
    Y = 3260,
    Z = 300
  })
  SetNpcLocation(member4, {
    X = 1580,
    Y = 3260,
    Z = 300
  })
  SetNpcLocation("Muor_Market_1F_Merchant_02_L1", {
    X = 925,
    Y = 2850,
    Z = 200
  })
  TurnNpc("Muor_Market_1F_Merchant_02_L1", NPC_D_LOW)
  TurnNpc(Hero, NPC_D_LOW)
  CmdChangeStageCameraToGlobalPoint(1035, 2850, 100, CAMERA_BLEND_LINEAR, 0, 0, 2000, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  CmdSetNpcAnimation("Muor_Market_1F_Merchant_02_L1", AnimationType.Act11, 1, EFlipbookPlayTypeLoop, false)
  Wait(1)
  CmdSetNpcAnimation("Muor_Market_1F_Merchant_02_L1", AnimationType.Act12, 1, EFlipbookPlayTypeAutoResetIdle, false)
  MoveNpc(Hero, {
    X = 1180,
    Y = 3260,
    Z = 190
  }, 200)
  Wait(0.2)
  MoveNpc(member2, {
    X = 1280,
    Y = 3260,
    Z = 250
  }, 200)
  Wait(0.1)
  MoveNpc(member3, {
    X = 1330,
    Y = 3260,
    Z = 250
  }, 200)
  Wait(0.1)
  CmdMoveNpc(member4, {
    X = 1380,
    Y = 3260,
    Z = 300
  }, 200)
  CmdTurnNpc("Muor_Market_1F_Merchant_02_L1", NPC_D_TO_PLAYER)
  CmdSpawnMangaIcon("Muor_Market_1F_Merchant_02_L1", "FIELD_EFX2D_SURPRISE")
  Wait(0.5)
  ChangeStageCameraToGlobalPoint(1135, 2950, 100, CAMERA_BLEND_LINEAR, 2, 0, 2000, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  CmdMoveNpc("Muor_Market_1F_Merchant_02_L1", {
    X = 1130,
    Y = 2850,
    Z = 200
  }, 200)
  MoveNpc("Muor_Market_1F_Merchant_02_L1", {
    X = 1130,
    Y = 2950,
    Z = 200
  }, 200)
  TurnNpc("Muor_Market_1F_Merchant_02_L1", NPC_D_RIGHT)
  MoveNpc(Hero, {
    X = 1130,
    Y = 3060,
    Z = 0
  }, 200)
  MoveNpc(member2, {
    X = 1037,
    Y = 3224,
    Z = 0
  }, 200)
  MoveNpc(member3, {
    X = 1237,
    Y = 3224,
    Z = 0
  }, 200)
  MoveNpc(member4, {
    X = 1137,
    Y = 3324,
    Z = 0
  }, 200)
  TurnNpc(Hero, NPC_D_LEFT)
  TurnNpc(member2, NPC_D_LEFT)
  TurnNpc(member3, NPC_D_LEFT)
  CmdTurnNpc(member4, NPC_D_LEFT)
  CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_SCENE_0610_010_1")
  SpawnMangaIcon("Muor_Market_1F_Merchant_02_L1", "FIELD_EFX2D_IMPATIENCE")
  CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_SCENE_0610_010_2")
  ChangeStageCameraToGlobalPoint(935, 2850, 100, CAMERA_BLEND_LINEAR, 4, 0, 1500, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  MoveNpc("Muor_Market_1F_Merchant_02_L1", {
    X = 1030,
    Y = 2850,
    Z = 200
  }, 200)
  CmdMoveNpc("Muor_Market_1F_Merchant_02_L1", {
    X = 980,
    Y = 2850,
    Z = 0
  }, 200)
  TurnNpc("Muor_Market_1F_Merchant_02_L1", NPC_D_LOW)
  CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_SCENE_0610_010_3")
  TurnNpc("Muor_Market_1F_Merchant_02_L1", NPC_D_RIGHT)
  CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_SCENE_0610_010_4")
  CmdMoveNpc(Hero, {
    X = 980,
    Y = 3000,
    Z = 0
  }, 200)
  TurnNpc(Hero, NPC_D_LEFT)
  result = CmdChoiceMessage("NPC_Talk_Muor_Market_1F_SUB_0_SCENE_0610_010_5")
  if result == true then
    CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_SCENE_0610_010_7")
    SpawnMangaIcon("Muor_Market_2F_Popota_01_L1", "FIELD_EFX2D_LAUGH")
  else
    ref = 0
    while 1 > ref do
      result = CmdChoiceMessage("NPC_Talk_Muor_Market_1F_SUB_0_SCENE_0610_010_6")
      if result == true then
        CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_SCENE_0610_010_7")
        ref = 1
        SpawnMangaIcon("Muor_Market_2F_Popota_01_L1", "FIELD_EFX2D_LAUGH")
      end
    end
  end
  CmdMoveNpc("Muor_Market_1F_Merchant_02_L1", {
    X = 925,
    Y = 2850,
    Z = 0
  }, 200)
  CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_SCENE_0610_010_8")
  CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_SCENE_0610_010_9")
  SetVisibleActor("BP_SearchEvent_T12_OrtegaHelm_01", false)
  SetVisibleActorsTag("Shadow", false)
  ChangeStageCameraToGlobalPoint(980, 3000, 100, CAMERA_BLEND_LINEAR, 3, 0, 1500, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  CmdMoveNpc("Muor_Market_1F_Merchant_02_L1", {
    X = 980,
    Y = 2850,
    Z = 0
  }, 200)
  TurnNpc("Muor_Market_1F_Merchant_02_L1", NPC_D_RIGHT)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_SCENE_0610_010_10")
  ChangeSpeaker()
  CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SUB_0_SCENE_0610_010_11")
  CloseMessage()
  ChangeStageCameraToGlobalPoint(980, 3000, 100, CAMERA_BLEND_LINEAR, 2, 0, 1300, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  CmdMoveNpc("Muor_Market_1F_Merchant_02_L1", {
    X = 925,
    Y = 2700,
    Z = 200
  }, 200)
  CmdTurnNpc("Muor_Market_1F_Merchant_02_L1", NPC_D_LOW)
  CmdTurnNpc(Hero, NPC_D_LOW)
  CmdSpawnMangaIcon(Hero, "FIELD_EFX2D_QUESTION")
  CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SUB_0_SCENE_0610_010_12")
  CloseMessage()
  FadeOut(EFadingPriorityUIBackGround, 1)
  Wait(1)
  CmdEventClosingMessageDetail("NPC_Talk_Muor_Market_1F_SUB_0_SCENE_0610_010_13", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
  CloseMessage()
  CmdFadeIn(EFadingPriorityUIBackGround, 0.5)
  CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SUB_0_SCENE_0610_010_14")
  ItemGetMessageToActor("NPC_Talk_Muor_Market_1F_SUB_0_SCENE_0610_010_15", "ITEM_ARCHIPELAGO"--[["ITEM_EQUIP_HELMET_ORTEGAS_HELM"]], Hero, false, true) -- AP
  -- AP
  AP.Log("Muor_Market_1F_SUB_0_SCENE_0610_010 called (NPC giving Ortega's Helm)")
  AP.CheckLocation("Muor_Market_1F_SUB_0_SCENE_0610_010")
  local ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
    AddItem(ItemId)
  else
    AddItem("ITEM_EQUIP_HELMET_ORTEGAS_HELM")
    SetFlag(Flag.FE67, true)
    CheckCreateLightHelm()
  end
  -- AP end
  SetFlag(Flag.FD10, false)
  DestroyPartyClone()
  PartyMemberAlignment(ALIGNMENT_TOGETHER, ALIGNMENT_MOVE_WALK)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetDisableRula(false)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function Muor_Market_1F_SUB_0_ACTOR_0410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdCallShopUI("SHOP_MUOR_ITEM_0001")
  EventEnd(eventInfo, "")
end

function Muor_Market_1F_SUB_0_ACTOR_0510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdCallShopUI("SHOP_MUOR_EQUIP_0001")
  EventEnd(eventInfo, "")
end

function Muor_Market_1F_SUB_0_VOLUME_0710_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  RequestLoading("MAPLIST_T12R0501")
  if GetFlag(Flag.FE871) == true and CheckHeroLiving() == true then
    SetDispMiniMap(false)
    MapTime = GetMapTimeFrame()
    if MapTime == MAPTIME_NIGHT then
      OldMan_Muor = "Muor_Market_1F_OldMan_01_L3"
    else
      OldMan_Muor = "Muor_Market_1F_OldMan_01_L1"
    end
    SpawnPartyCloneDisableSkill(true, true, true, true)
    EndSkillTransformNoEffect()
    EndSkillInvisibleNoEffect()
    local Hero, member2, member3, member4
    local HeroNumber = CheckHero()
    if HeroNumber == 1 then
      Hero = "Party1"
      member2 = "Party2"
      member3 = "Party3"
      member4 = "Party4"
    elseif HeroNumber == 2 then
      Hero = "Party2"
      member2 = "Party1"
      member3 = "Party3"
      member4 = "Party4"
    elseif HeroNumber == 3 then
      Hero = "Party3"
      member2 = "Party1"
      member3 = "Party2"
      member4 = "Party4"
    elseif HeroNumber == 4 then
      Hero = "Party4"
      member2 = "Party1"
      member3 = "Party2"
      member4 = "Party3"
    end
    CmdSpawnMangaIcon(OldMan_Muor, "FIELD_EFX2D_SURPRISE")
    CmdTurnNpc(OldMan_Muor, NPC_D_TO_PLAYER)
    CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_VOLUME_0710_010_1")
    ChangeStageCameraToGlobalPoint(2950, 2850, 180, CAMERA_BLEND_LINEAR, 2, 0, 1800, {
      Yaw = 0,
      Pitch = -25,
      Roll = 0
    })
    MoveNpc(Hero, {
      X = 2950,
      Y = 2950,
      Z = 100
    }, 300)
    MoveNpc(member2, {
      X = 2950,
      Y = 3100,
      Z = 200
    }, 300)
    MoveNpc(member3, {
      X = 2900,
      Y = 3200,
      Z = 200
    }, 300)
    MoveNpc(member4, {
      X = 2850,
      Y = 3100,
      Z = 200
    }, 300)
    TurnNpc(OldMan_Muor, NPC_D_RIGHT)
    TurnNpc(Hero, NPC_D_LEFT)
    TurnNpc(member2, NPC_D_LEFT)
    TurnNpc(member3, NPC_D_LEFT)
    TurnNpc(member4, NPC_D_LEFT)
    WaitMoveNpc(Hero)
    WaitMoveNpc(member2)
    WaitMoveNpc(member3)
    WaitMoveNpc(member4)
    CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_VOLUME_0710_010_2")
    CmdSpawnMangaIcon(OldMan_Muor, "FIELD_EFX2D_LAUGH")
    CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_VOLUME_0710_010_3")
    ChangeStageCameraToGlobalPoint(2950, 2850, 180, CAMERA_BLEND_LINEAR, 4, 0, 1200, {
      Yaw = 0,
      Pitch = -20,
      Roll = 0
    })
    CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SUB_0_VOLUME_0710_010_4")
    CloseMangaIconAll(OldMan_Muor)
    SetFlag(Flag.FD11, true)
    CloseMessage()
    CmdFadeOut(EFadingPriorityWhiteTopMost, 1)
    SetDispMiniMap(true)
    DestroyPartyClone()
    ChangeMap("MAPLIST_T12R0501", "FromFieldSouth", ORIENTATION_CURRENT)
  end
  EventEnd(eventInfo, "")
end

function Muor_Market_1F_SUB_0_SCENE_0610_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetDispMiniMap(false)
  SetPlayerLocation({
    X = 2950,
    Y = 2950,
    Z = 200
  })
  TurnParty(1, 3)
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    OldMan_Muor = "Muor_Market_1F_OldMan_01_L3"
  else
    OldMan_Muor = "Muor_Market_1F_OldMan_01_L1"
  end
  SpawnPartyClone(true, true, true, true)
  local Hero, member2, member3, member4
  local HeroNumber = CheckHero()
  if HeroNumber == 1 then
    Hero = "Party1"
    member2 = "Party2"
    member3 = "Party3"
    member4 = "Party4"
  elseif HeroNumber == 2 then
    Hero = "Party2"
    member2 = "Party1"
    member3 = "Party3"
    member4 = "Party4"
  elseif HeroNumber == 3 then
    Hero = "Party3"
    member2 = "Party1"
    member3 = "Party2"
    member4 = "Party4"
  elseif HeroNumber == 4 then
    Hero = "Party4"
    member2 = "Party1"
    member3 = "Party2"
    member4 = "Party3"
  end
  SetNpcLocation(OldMan_Muor, {
    X = 3250,
    Y = 2750,
    Z = 200
  })
  SetNpcLocation(Hero, {
    X = 2950,
    Y = 2950,
    Z = 200
  })
  TurnNpc(OldMan_Muor, NPC_D_UP)
  TurnNpc(Hero, NPC_D_UP)
  SetNpcLocation(member2, {
    X = 2950,
    Y = 3100,
    Z = 200
  })
  SetNpcLocation(member3, {
    X = 2900,
    Y = 3200,
    Z = 200
  })
  SetNpcLocation(member4, {
    X = 2850,
    Y = 3100,
    Z = 200
  })
  TurnNpc(member2, NPC_D_LEFT)
  TurnNpc(member3, NPC_D_LEFT)
  TurnNpc(member4, NPC_D_LEFT)
  CmdFadeInOnInitialFadeInPostMapTransitionNoWait(EFadingPriorityWhiteTopMost, 1, GetCurrentMapId())
  Wait(1.5)
  CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_VOLUME_0710_010_14")
  MoveNpc(OldMan_Muor, {
    X = 2950,
    Y = 2750,
    Z = 0
  }, 100)
  Wait(1)
  TurnNpc(Hero, NPC_D_LEFT)
  CmdMessage("NPC_Talk_Muor_Market_1F_SUB_0_VOLUME_0710_010_15")
  TurnNpc(OldMan_Muor, NPC_D_RIGHT)
  CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SUB_0_VOLUME_0710_010_16")
  DestroyPartyClone()
  PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WALK)
  SetDispMiniMap(true)
  SetEventVolumeEnabled("Muor_Market_1F_OldMan_pokapamazu", false)
  SetFlag(Flag.FD11, false)
  SetFlag(Flag.FE896, true)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
  Wait(0.1)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MUOR_TalkPopotaGranpa, true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "", false)
end

function Muor_Market_1F_SearchObj_OrtegaHelm_00(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Muor_Market_1F_SearchObj_OrtegaHelm_1")
  CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SearchObj_OrtegaHelm_2")
  if GetFlag(Flag.FE871) == true then
  elseif GetFlag(Flag.FD40) == false then
    CloseMessage()
    CmdTurnNpc("Muor_Market_1F_Merchant_02_L1", NPC_D_TO_PLAYER)
    CmdMessage("NPC_Talk_Muor_Market_1F_SearchObj_OrtegaHelm_3")
    CmdEventClosingMessage("NPC_Talk_Muor_Market_1F_SearchObj_OrtegaHelm_4")
  end
  EventEnd(eventInfo, "", false)
end
