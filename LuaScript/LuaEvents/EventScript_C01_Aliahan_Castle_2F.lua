print("Load Script EventScript_C01_Aliahan_Castle_2F")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_MAIN_0_SCENE_0000_000(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  DisableEventFastForwardUI()
  print("\227\130\185\227\130\173\227\131\131\227\131\151\233\157\158\232\161\168\231\164\186")
  if GetFlag(Flag.FE90) == true then
    ChangeNpcOpacity("Aliahan_Castle_2F_HerosMother_02_L1", 0, 0, false)
    ChangeNpcOpacity("Aliahan_Castle_2F_HerosGrandfather_01_L1", 0, 0, false)
  end
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  local pos_x = 3600
  local pos_y = 2245
  local pos_z = 0
  local offset = 0
  local party1 = "Party1"
  local party2 = "Party2"
  local party3 = "Party3"
  local party4 = "Party4"
  ChangeStageCameraToGlobalPoint(3250, 2245, 300, CAMERA_BLEND_EASE_IN_OUT, 4, 2, 1200, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  Audience(pos_x, pos_y, pos_z)
  Wait(0.5)
  if GetFlag(Flag.FE159) == true then
    if GetFlag(Flag.FE211) == true then
      CmdSpawnMangaIcon("Aliahan_Castle_2F_King_Aliahan_01_L1", "FIELD_EFX2D_SURPRISE")
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_33")
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_34")
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_35")
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_36")
      CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_37")
      Recollection(party1)
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_7")
      SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act4, 1, EFlipbookPlayTypeStopEnd, false)
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_8")
      WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
    else
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_27")
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_28")
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_29")
      CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_30")
      Recollection(party1)
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_31")
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_32")
    end
  else
    PlaySEEvent("EVESE_METAL_SWAY")
    SetNpcAnimation(party1, AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
    Wait(2)
    PlaySEEvent("EVESE_CLOTH_3")
    WaitAnimNpc(party1)
    SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act2, 1, EFlipbookPlayTypeStopEnd, true)
    CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_1")
    WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
    SetFlag(Flag.FE158, true)
    SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, false)
    WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
    Recollection(party1)
    CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_7")
    SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act4, 1, EFlipbookPlayTypeStopEnd, false)
    CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_8")
    WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
  end
  Gift()
  Wait(0.5)
  CmdMoveNpc("Aliahan_Castle_2F_Minister_01_L1", {
    X = 4250,
    Y = 2450,
    Z = 0
  }, 100)
  TurnNpc("Aliahan_Castle_2F_Minister_01_L1", NPC_D_TO_PLAYER)
  SetTagItemId("ITEM_IMPORTANT_THIEFS_KEY")
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_20")
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_21")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_22")
  MoveNpc("Aliahan_Castle_2F_Guard_03_L1", {
    X = 3600,
    Y = 2395,
    Z = 0
  }, 300)
  if GetFlag(Flag.FE159) == true then
  else
    CmdSetNpcAnimation(party1, AnimationType.Act2, 1, EFlipbookPlayTypeAutoResetIdle, false)
  end
  WaitMoveNpc("Aliahan_Castle_2F_Guard_03_L1")
  Wait(0.2)
  TurnNpc(party1, NPC_D_RIGHT)
  CmdMoveNpc("Aliahan_Castle_2F_Guard_03_L1", {
    X = 3600,
    Y = 2345,
    Z = 0
  }, 150)
  Wait(0.5)
  PlaySEEvent("EVESE_WRITE")
  Wait(1)
  CmdMoveNpcDetail("Aliahan_Castle_2F_Guard_03_L1", {
    X = 3600,
    Y = 2395,
    Z = 0
  }, 100, NPC_D_LEFT, 0, 1)
  Wait(0.2)
  MoveNpc("Aliahan_Castle_2F_Guard_03_L1", {
    X = 3400,
    Y = 2550,
    Z = 0
  }, 300)
  WaitMoveNpc("Aliahan_Castle_2F_Guard_03_L1")
  TurnNpc("Aliahan_Castle_2F_Guard_03_L1", NPC_D_LEFT)
  Wait(0.2)
  TurnNpc(party1, NPC_D_UP)
  Wait(0.2)
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_23")
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_24")
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_25")
  ChangeSpeaker()
  CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_26")
  AudienceFinish(pos_x, pos_y, pos_z, offset)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_ALIAHAN_MeetKing, true)
  AddPassedRuraPoint("RURA_RIREMITO_RURA_REEVE")
  if GetFlag(Flag.FE958) == false then
    CmdCallTutorialUI("INFORMATION_MEMORY")
    SetFlag(Flag.FE958, true)
  end
  if GetFlag(Flag.FE959) == false then
    CmdCallTutorialUI("INFORMATION_INFORMATION")
    SetFlag(Flag.FE959, true)
  end
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function Recollection(party1)
  local StartRecollectionFadeTime = 3
  PlaySEEvent("EVESE_BLACKOUT_PAST_VIEW_OUT")
  StartSettingPostProcessVignette(1, StartRecollectionFadeTime)
  StartRecollectionEffect(StartRecollectionFadeTime)
  _retry(SYS_WaitRecollectionEffect)
  FadeOut(EFadingPriorityTopMost, 0)
  _retry(SYS_WaitFadeOut, EFadingPriorityTopMost)
  StartSepiaEffect(0)
  _retry(SYS_WaitSepiaEffect)
  ChangeNpcOpacity("Aliahan_Castle_2F_Guard_02_L1", 0, 0, false)
  ChangeNpcOpacity("Aliahan_Castle_2F_Guard_03_L1", 0, 0, false)
  ChangeNpcOpacity(party1, 0, 0, false)
  SpawnNpc("Aliahan_Castle_2F_Hero_Child_01_L1")
  SpawnNpc("Aliahan_Castle_2F_HerosMother_01_L1")
  SpawnNpc("Aliahan_Castle_2F_Guard_04_L1")
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
  SetNpcAnimation("Aliahan_Castle_2F_HerosMother_01_L1", AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, false)
  FadeIn(EFadingPriorityTopMost, 0)
  _retry(SYS_WaitFadeIn, EFadingPriorityTopMost)
  PlaySEEvent("EVESE_BLACKOUT_PAST_VIEW")
  EndRecollectionEffect(StartRecollectionFadeTime)
  _retry(SYS_WaitRecollectionEffect)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_4")
  ChangeSpeaker()
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act4, 1, EFlipbookPlayTypeStopEnd, false)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_5")
  WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
  ChangeSpeaker()
  Wait(0.5)
  CmdMoveNpc("Aliahan_Castle_2F_HerosMother_01_L1", {
    X = 4170,
    Y = 2100,
    Z = 0
  }, 100)
  Wait(0.2)
  TurnNpc("Aliahan_Castle_2F_HerosMother_01_L1", NPC_D_UP)
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
  CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_6")
  WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
  local EndRecollectionFadeTime = 3
  PlaySEEvent("EVESE_BLACKOUT_PAST_VIEW_OUT")
  StartRecollectionEffect(EndRecollectionFadeTime)
  _retry(SYS_WaitRecollectionEffect)
  FadeOut(EFadingPriorityTopMost, 0)
  _retry(SYS_WaitFadeOut, EFadingPriorityTopMost)
  ChangeNpcOpacity("Aliahan_Castle_2F_Guard_02_L1", 1, 0, false)
  ChangeNpcOpacity("Aliahan_Castle_2F_Guard_03_L1", 1, 0, false)
  ChangeNpcOpacity(party1, 1, 0, false)
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
  DestroyNpc("Aliahan_Castle_2F_Hero_Child_01_L1")
  DestroyNpc("Aliahan_Castle_2F_HerosMother_01_L1")
  DestroyNpc("Aliahan_Castle_2F_Guard_04_L1")
  EndSepiaEffect(0)
  _retry(SYS_WaitSepiaEffect)
  FadeIn(EFadingPriorityTopMost, 0)
  _retry(SYS_WaitFadeIn, EFadingPriorityTopMost)
  PlaySEEvent("EVESE_BLACKOUT_PAST_VIEW")
  EndSettingPostProcessVignette(EndRecollectionFadeTime)
  EndRecollectionEffect(EndRecollectionFadeTime)
  _retry(SYS_WaitRecollectionEffect)
end

function Gift()
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_9")
  WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act12, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_10")
  WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
  CmdSetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_11")
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_12")
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act4, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_13")
  WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_14")
  WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act13, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_15")
  WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act4, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_16")
  WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
  CmdSetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeLoop, true)
  CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_17")
  ItemGetMessage("NPC_TALK_Aliahan_Castle_2F_MAIN_0_VOLUME_0110_010_18")
  AddItem("ITEM_EQUIP_WEAPON_OAKEN_CLUB")
  AddItem("ITEM_EQUIP_WEAPON_OAKEN_CLUB")
  AddItem("ITEM_EQUIP_WEAPON_CYPRESS_STICK")
  AddItem("ITEM_EQUIP_ARMOR_WAYFARERS_CLOTHES")
  AddGold(50)
  -- AP
  AddItem("ITEM_USE_ITEM_CHIMERA_WING")
  AddItem("ITEM_USE_ITEM_CHIMERA_WING")
  AddItem("ITEM_USE_ITEM_CHIMERA_WING")
  AddItem("ITEM_USE_ITEM_CHIMERA_WING")
  AddItem("ITEM_USE_ITEM_CHIMERA_WING")
  AddItem("ITEM_USE_ITEM_CHIMERA_WING")
  AddItem("ITEM_USE_ITEM_CHIMERA_WING")
  AddItem("ITEM_USE_ITEM_CHIMERA_WING")
  AddItem("ITEM_USE_ITEM_CHIMERA_WING")
  AddItem("ITEM_USE_ITEM_CHIMERA_WING")
  SetFlag(Flag.FE342, true) -- flag that lets you change the hero hair color in alltrades abbey (no need to get this from xenlon in postgame)
  -- AP end
  SetFlag(Flag.FE160, true)
  SetFlag(Flag.FD31, true)
  print("\227\130\162\227\130\164\227\131\134\227\131\160\227\130\130\227\130\137\227\129\163\227\129\159")
end

function Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  local party1 = "Party1"
  local party2 = "Party2"
  local party3 = "Party3"
  local party4 = "Party4"
  local Hero = CheckHeroClone()
  local HeroNumber = CheckHero()
  local ResultHeroSolo = CheckHeroSolo()
  if ResultHeroSolo == true then
    SpawnPartyCloneDisableAll(true, true, true, true)
  else
    SpawnPartyCloneDisableSkill(true, true, true, true)
  end
  ChangeStageCameraToGlobalPoint(2700, 2245, 0, CAMERA_BLEND_EASE_IN_OUT, 2, 2, 1200, {
    Yaw = 0,
    Pitch = -10,
    Roll = 0
  })
  MoveNpc(Hero, {
    X = 2500,
    Y = 2245,
    Z = 0
  }, 300)
  if HeroNumber ~= 1 then
    ChangeNpcOpacity(party1, 0, 1.6, false)
  end
  if HeroNumber ~= 2 then
    ChangeNpcOpacity(party2, 0, 1.6, false)
  end
  if HeroNumber ~= 3 then
    ChangeNpcOpacity(party3, 0, 1.6, false)
  end
  if HeroNumber ~= 4 then
    ChangeNpcOpacity(party4, 0, 1.6, false)
  end
  MoveNpc("Aliahan_Castle_2F_HerosMother_02_L1", {
    X = 2900,
    Y = 2145,
    Z = 0
  }, 250)
  MoveNpc("Aliahan_Castle_2F_HerosGrandfather_01_L1", {
    X = 2800,
    Y = 2095,
    Z = 0
  }, 250)
  Wait(0.5)
  ChangeNpcOpacity("Aliahan_Castle_2F_HerosMother_02_L1", 1, 0, false)
  ChangeNpcOpacity("Aliahan_Castle_2F_HerosGrandfather_01_L1", 1, 0, false)
  WaitMoveNpc(Hero)
  TurnNpc(Hero, NPC_D_UP)
  WaitMoveNpc("Aliahan_Castle_2F_HerosMother_02_L1")
  TurnNpc("Aliahan_Castle_2F_HerosMother_02_L1", NPC_D_LOW)
  WaitMoveNpc("Aliahan_Castle_2F_HerosGrandfather_01_L1")
  TurnNpc("Aliahan_Castle_2F_HerosGrandfather_01_L1", NPC_D_LOW)
  Wait(0.5)
  ShowMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_1")
  Wait(3)
  SpawnEffectWorld("Ev_C01_MothersTear_01", {
    X = 2900,
    Y = 2145,
    Z = 0
  }, {
    Yaw = 0,
    Pitch = 0,
    Roll = 0
  }, 1)
  CmdSetNpcAnimation("Aliahan_Castle_2F_HerosMother_02_L1", AnimationType.Act19, 1, EFlipbookPlayTypeStopEnd, false)
  WaitShowMessage()
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_2")
  SetNpcAnimation("Aliahan_Castle_2F_HerosMother_02_L1", AnimationType.Act36, 1, EFlipbookPlayTypeAutoResetIdle, false)
  Wait(0.5)
  ChangeSpeaker()
  CmdMoveNpc("Aliahan_Castle_2F_HerosGrandfather_01_L1", {
    X = 2750,
    Y = 2095,
    Z = 0
  }, 250)
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_3")
  SetNpcAnimation("Aliahan_Castle_2F_HerosGrandfather_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
  CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_4")
  Wait(0.5)
  if 1 <= GetPartyMemberStatus(1, UNIT_STATUS_HP) and HeroNumber ~= 1 then
    ChangeNpcOpacity(party1, 1, 2, false)
  end
  if 1 <= GetPartyMemberStatus(2, UNIT_STATUS_HP) and HeroNumber ~= 2 then
    ChangeNpcOpacity(party2, 1, 2, false)
  end
  if 1 <= GetPartyMemberStatus(3, UNIT_STATUS_HP) and HeroNumber ~= 3 then
    ChangeNpcOpacity(party3, 1, 2, false)
  end
  if 1 <= GetPartyMemberStatus(4, UNIT_STATUS_HP) and HeroNumber ~= 4 then
    ChangeNpcOpacity(party4, 1, 2, false)
  end
  if HeroNumber == 1 then
    MoveNpc(party1, {
      X = 3800,
      Y = 2245,
      Z = 0
    }, 300)
    MoveNpc(party2, {
      X = 3450,
      Y = 2245,
      Z = 0
    }, 300)
    MoveNpc(party3, {
      X = 3300,
      Y = 2245,
      Z = 0
    }, 300)
    MoveNpc(party4, {
      X = 3150,
      Y = 2245,
      Z = 0
    }, 300)
  elseif HeroNumber == 2 then
    MoveNpc(party2, {
      X = 3800,
      Y = 2245,
      Z = 0
    }, 300)
    MoveNpc(party1, {
      X = 3450,
      Y = 2245,
      Z = 0
    }, 300)
    MoveNpc(party3, {
      X = 3300,
      Y = 2245,
      Z = 0
    }, 300)
    MoveNpc(party4, {
      X = 3150,
      Y = 2245,
      Z = 0
    }, 300)
  elseif HeroNumber == 3 then
    MoveNpc(party3, {
      X = 3800,
      Y = 2245,
      Z = 0
    }, 300)
    MoveNpc(party1, {
      X = 3450,
      Y = 2245,
      Z = 0
    }, 300)
    MoveNpc(party2, {
      X = 3300,
      Y = 2245,
      Z = 0
    }, 300)
    MoveNpc(party4, {
      X = 3150,
      Y = 2245,
      Z = 0
    }, 300)
  elseif HeroNumber == 4 then
    MoveNpc(party4, {
      X = 3800,
      Y = 2245,
      Z = 0
    }, 300)
    MoveNpc(party1, {
      X = 3450,
      Y = 2245,
      Z = 0
    }, 300)
    MoveNpc(party2, {
      X = 3300,
      Y = 2245,
      Z = 0
    }, 300)
    MoveNpc(party3, {
      X = 3150,
      Y = 2245,
      Z = 0
    }, 300)
  end
  ChangeStageCameraToGlobalPoint(3250, 2245, 300, CAMERA_BLEND_EASE_IN_OUT, 4, 2, 1200, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  Wait(0.7)
  ResetNpcAnimation("Aliahan_Castle_2F_HerosGrandfather_01_L1")
  Wait(0.3)
  TurnNpc("Aliahan_Castle_2F_HerosMother_02_L1", NPC_D_RIGHT)
  TurnNpc("Aliahan_Castle_2F_HerosGrandfather_01_L1", NPC_D_RIGHT)
  Wait(0.3)
  TurnNpc("Aliahan_Castle_2F_HerosMother_02_L1", NPC_D_UP)
  TurnNpc("Aliahan_Castle_2F_HerosGrandfather_01_L1", NPC_D_UP)
  WaitStageCameraBlend()
  SetNpcLocation("Aliahan_Castle_2F_HerosMother_02_L1", {
    X = 3270,
    Y = 1700,
    Z = 0
  })
  SetNpcLocation("Aliahan_Castle_2F_HerosGrandfather_01_L1", {
    X = 3270,
    Y = 1600,
    Z = 0
  })
  MoveNpc("Aliahan_Castle_2F_HerosMother_02_L1", {
    X = 3800,
    Y = 1750,
    Z = 0
  }, 250)
  MoveNpc("Aliahan_Castle_2F_HerosGrandfather_01_L1", {
    X = 3800,
    Y = 1650,
    Z = 0
  }, 250)
  WaitMoveNpc("Aliahan_Castle_2F_HerosMother_02_L1")
  TurnNpc("Aliahan_Castle_2F_HerosMother_02_L1", NPC_D_RIGHT)
  WaitMoveNpc("Aliahan_Castle_2F_HerosGrandfather_01_L1")
  TurnNpc("Aliahan_Castle_2F_HerosGrandfather_01_L1", NPC_D_RIGHT)
  WaitMoveNpc(party1)
  WaitMoveNpc(party2)
  WaitMoveNpc(party3)
  WaitMoveNpc(party4)
  if ResultHeroSolo == true then
    PlaySEEvent("EVESE_METAL_SWAY")
    SetNpcAnimation(party1, AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
    Wait(2)
    WaitAnimNpc(party1)
  end
  PlaySEEvent("EVESE_CLOTH_3")
  CmdSetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act2, 1, EFlipbookPlayTypeStopEnd, false)
  if GetFlag(Flag.FE183) == true then
    CmdMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_8")
    CmdMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_9")
    CmdMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_10")
    CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_12")
    ItemGetMessageToActor("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_13", "ITEM_EQUIP_WEAPON_BASTARD_SWORD", "Aliahan_Castle_2F_King_Aliahan_01_L1")
    AddItem("ITEM_EQUIP_WEAPON_BASTARD_SWORD")
  elseif CheckHeroAbsent() == true then
    CmdMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_14")
    CmdMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_15")
  else
    CmdMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_5")
    CmdMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_6")
  end
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, true)
  CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_17")
  Wait(0.5)
  WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
  if ResultHeroSolo == true then
    CmdSetNpcAnimation(party1, AnimationType.Act2, 1, EFlipbookPlayTypeAutoResetIdle, false)
    Wait(0.5)
  end
  if HeroNumber == 1 then
    MoveNpc(party1, {
      X = 4200,
      Y = 2245,
      Z = 0
    }, 300)
    MoveNpc(party2, {
      X = 4200,
      Y = 2095,
      Z = 0
    }, 300)
    MoveNpc(party3, {
      X = 4200,
      Y = 2395,
      Z = 0
    }, 300)
    MoveNpc(party4, {
      X = 4200,
      Y = 2545,
      Z = 0
    }, 300)
  elseif HeroNumber == 2 then
    MoveNpc(party2, {
      X = 4200,
      Y = 2245,
      Z = 0
    }, 300)
    MoveNpc(party1, {
      X = 4200,
      Y = 2095,
      Z = 0
    }, 300)
    MoveNpc(party3, {
      X = 4200,
      Y = 2395,
      Z = 0
    }, 300)
    MoveNpc(party4, {
      X = 4200,
      Y = 2545,
      Z = 0
    }, 300)
  elseif HeroNumber == 3 then
    MoveNpc(party3, {
      X = 4200,
      Y = 2245,
      Z = 0
    }, 300)
    MoveNpc(party1, {
      X = 4200,
      Y = 2095,
      Z = 0
    }, 300)
    MoveNpc(party2, {
      X = 4200,
      Y = 2395,
      Z = 0
    }, 300)
    MoveNpc(party4, {
      X = 4200,
      Y = 2545,
      Z = 0
    }, 300)
  elseif HeroNumber == 4 then
    MoveNpc(party4, {
      X = 4200,
      Y = 2245,
      Z = 0
    }, 300)
    MoveNpc(party1, {
      X = 4200,
      Y = 2095,
      Z = 0
    }, 300)
    MoveNpc(party2, {
      X = 4200,
      Y = 2395,
      Z = 0
    }, 300)
    MoveNpc(party3, {
      X = 4200,
      Y = 2545,
      Z = 0
    }, 300)
  end
  Wait(1)
  MoveNpc("Aliahan_Castle_2F_HerosMother_02_L1", {
    X = 4150,
    Y = 1750,
    Z = 0
  }, 250)
  Wait(0.2)
  MoveNpc("Aliahan_Castle_2F_HerosGrandfather_01_L1", {
    X = 4150,
    Y = 1650,
    Z = 0
  }, 250)
  WaitMoveNpc(party1)
  TurnNpc(party1, NPC_D_LOW)
  WaitMoveNpc(party2)
  TurnNpc(party2, NPC_D_LOW)
  WaitMoveNpc("Aliahan_Castle_2F_HerosMother_02_L1")
  TurnNpc("Aliahan_Castle_2F_HerosMother_02_L1", NPC_D_RIGHT)
  WaitMoveNpc("Aliahan_Castle_2F_HerosGrandfather_01_L1")
  TurnNpc("Aliahan_Castle_2F_HerosGrandfather_01_L1", NPC_D_RIGHT)
  WaitMoveNpc(party3)
  TurnNpc(party3, NPC_D_LOW)
  WaitMoveNpc(party4)
  TurnNpc(party4, NPC_D_LOW)
  Wait(1)
  StopBGM(0.5)
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  ChangeNpcOpacity("Aliahan_Castle_2F_King_Aliahan_01_L1", 0, 0, false)
  ChangeNpcOpacity("Aliahan_Castle_2F_Minister_01_L1", 0, 0, false)
  ChangeNpcOpacity("Aliahan_Castle_2F_Bard_02_L1", 0, 0, false)
  ChangeNpcOpacity("Aliahan_Castle_2F_HerosMother_02_L1", 0, 0, false)
  ChangeNpcOpacity("Aliahan_Castle_2F_HerosGrandfather_01_L1", 0, 0, false)
  DestroyNpc("Aliahan_Castle_2F_Guard_NoWeapon_01_L1")
  DestroyNpc("Aliahan_Castle_2F_Guard_NoWeapon_02_L1")
  DestroyNpc("Aliahan_Castle_2F_Guard_NoWeapon_03_L1")
  DestroyNpc("Aliahan_Castle_2F_Guard_NoWeapon_04_L1")
  DestroyNpc("Aliahan_Castle_2F_Guard_NoWeapon_05_L1")
  DestroyNpc("Aliahan_Castle_2F_Guard_NoWeapon_06_L1")
  DestroyPartyClone()
  Wait(0.1)
  FadeIn(EFadingPriorityTopMost, 0.5)
  CmdPlayEventSequence(0)
  CmdFadeOut(EFadingPriorityTopMost, 0)
  SetDispMiniMap(false)
  ChangeStageCameraToGlobalPoint(3500, 2245, 300, CAMERA_BLEND_EASE_IN_OUT, 0, 2, 1200, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  Wait(0.2)
  SpawnPartyCloneDisableSkill(true, true, true, true)
  if HeroNumber == 1 then
    SetNpcLocation(party1, {
      X = 4200,
      Y = 2245,
      Z = 75
    })
    SetNpcLocation(party2, {
      X = 4200,
      Y = 2095,
      Z = 75
    })
    SetNpcLocation(party3, {
      X = 4200,
      Y = 2395,
      Z = 75
    })
    SetNpcLocation(party4, {
      X = 4200,
      Y = 2545,
      Z = 75
    })
  elseif HeroNumber == 2 then
    SetNpcLocation(party2, {
      X = 4200,
      Y = 2245,
      Z = 75
    })
    SetNpcLocation(party1, {
      X = 4200,
      Y = 2095,
      Z = 75
    })
    SetNpcLocation(party3, {
      X = 4200,
      Y = 2395,
      Z = 75
    })
    SetNpcLocation(party4, {
      X = 4200,
      Y = 2545,
      Z = 75
    })
  elseif HeroNumber == 3 then
    SetNpcLocation(party3, {
      X = 4200,
      Y = 2245,
      Z = 75
    })
    SetNpcLocation(party1, {
      X = 4200,
      Y = 2095,
      Z = 75
    })
    SetNpcLocation(party2, {
      X = 4200,
      Y = 2395,
      Z = 75
    })
    SetNpcLocation(party4, {
      X = 4200,
      Y = 2545,
      Z = 75
    })
  elseif HeroNumber == 4 then
    SetNpcLocation(party4, {
      X = 4200,
      Y = 2245,
      Z = 75
    })
    SetNpcLocation(party1, {
      X = 4200,
      Y = 2095,
      Z = 75
    })
    SetNpcLocation(party2, {
      X = 4200,
      Y = 2395,
      Z = 75
    })
    SetNpcLocation(party3, {
      X = 4200,
      Y = 2545,
      Z = 75
    })
  end
  ChangeNpcOpacity("Aliahan_Castle_2F_King_Aliahan_01_L1", 1, 0, false)
  ChangeNpcOpacity("Aliahan_Castle_2F_Minister_01_L1", 1, 0, false)
  ChangeNpcOpacity("Aliahan_Castle_2F_Bard_02_L1", 1, 0, false)
  ChangeNpcOpacity("Aliahan_Castle_2F_HerosMother_02_L1", 1, 0, false)
  ChangeNpcOpacity("Aliahan_Castle_2F_HerosGrandfather_01_L1", 1, 0, false)
  SetNpcLocation("Aliahan_Castle_2F_King_Aliahan_01_L1", {
    X = 4650,
    Y = 2245,
    Z = 125
  })
  SetNpcLocation("Aliahan_Castle_2F_HerosMother_02_L1", {
    X = 4100,
    Y = 2195,
    Z = 125
  })
  SetNpcLocation("Aliahan_Castle_2F_HerosGrandfather_01_L1", {
    X = 4100,
    Y = 2345,
    Z = 125
  })
  TurnNpc(party1, NPC_D_UP)
  TurnNpc(party2, NPC_D_UP)
  TurnNpc(party3, NPC_D_UP)
  TurnNpc(party4, NPC_D_UP)
  TurnNpc("Aliahan_Castle_2F_HerosMother_02_L1", NPC_D_UP)
  TurnNpc("Aliahan_Castle_2F_HerosGrandfather_01_L1", NPC_D_UP)
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act9, 1, EFlipbookPlayTypeStopEnd, false)
  SetNpcAnimation("Aliahan_Castle_2F_Minister_01_L1", AnimationType.Act6, 1, EFlipbookPlayTypeStopEnd, false)
  SetNpcAnimation("Aliahan_Castle_2F_Bard_02_L1", AnimationType.Act4, 1, EFlipbookPlayTypeStopEnd, false)
  SetNpcAnimation("Aliahan_Castle_2F_HerosMother_02_L1", AnimationType.Act35, 1, EFlipbookPlayTypeStopEnd, false)
  SetNpcAnimation("Aliahan_Castle_2F_HerosGrandfather_01_L1", AnimationType.Act7, 1, EFlipbookPlayTypeStopEnd, false)
  SpawnNpc("Aliahan_Castle_2F_Guard_08_L1")
  SpawnNpc("Aliahan_Castle_2F_Guard_07_L1")
  SpawnNpc("Aliahan_Castle_2F_Guard_06_L1")
  SpawnNpc("Aliahan_Castle_2F_Guard_05_L1")
  Wait(0.3)
  CmdFadeIn(EFadingPriorityTopMost, 0.5)
  PlayBGM("BGM_24_Requiem", 0.5)
  Wait(0.5)
  MoveNpc("Aliahan_Castle_2F_Guard_08_L1", {
    X = 3650,
    Y = 2425,
    Z = 0
  }, 800)
  MoveNpc("Aliahan_Castle_2F_Guard_07_L1", {
    X = 3600,
    Y = 2055,
    Z = 0
  }, 800)
  MoveNpc("Aliahan_Castle_2F_Guard_06_L1", {
    X = 3800,
    Y = 2350,
    Z = 0
  }, 800)
  CmdMoveNpc("Aliahan_Castle_2F_Guard_05_L1", {
    X = 3800,
    Y = 2150,
    Z = 0
  }, 800)
  CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_28")
  TurnNpc("Aliahan_Castle_2F_Guard_05_L1", NPC_D_LOW)
  Wait(0.5)
  CmdMoveNpc("Aliahan_Castle_2F_Guard_05_L1", {
    X = 3750,
    Y = 2150,
    Z = 0
  }, 400)
  Wait(0.3)
  TurnNpc("Aliahan_Castle_2F_Guard_05_L1", NPC_D_LEFT)
  Wait(0.5)
  TurnNpc("Aliahan_Castle_2F_Guard_05_L1", NPC_D_RIGHT)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_29")
  ChangeSpeaker()
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act6, 1, EFlipbookPlayTypeAutoResetIdle, false)
  SetNpcAnimation("Aliahan_Castle_2F_Bard_02_L1", AnimationType.Act2, 1, EFlipbookPlayTypeAutoResetIdle, false)
  SetNpcAnimation("Aliahan_Castle_2F_Minister_01_L1", AnimationType.Act4, 1, EFlipbookPlayTypeAutoResetIdle, false)
  SetNpcAnimation("Aliahan_Castle_2F_HerosMother_02_L1", AnimationType.Act21, 1, EFlipbookPlayTypeAutoResetIdle, false)
  SetNpcAnimation("Aliahan_Castle_2F_HerosGrandfather_01_L1", AnimationType.Act6, 1, EFlipbookPlayTypeAutoResetIdle, false)
  WaitAnimNpc("Aliahan_Castle_2F_Minister_01_L1")
  TurnNpc("Aliahan_Castle_2F_Minister_01_L1", NPC_D_LEFT)
  WaitAnimNpc("Aliahan_Castle_2F_Bard_02_L1")
  TurnNpc("Aliahan_Castle_2F_Bard_02_L1", NPC_D_UP)
  TurnNpc("Aliahan_Castle_2F_Guard_05_L1", NPC_D_UP)
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act7, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_30")
  WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
  MoveNpc("Aliahan_Castle_2F_Minister_01_L1", {
    X = 4600,
    Y = 2400,
    Z = 0
  }, 400)
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act8, 1, EFlipbookPlayTypeStopEnd, false)
  WaitMoveNpc("Aliahan_Castle_2F_Minister_01_L1")
  TurnNpc("Aliahan_Castle_2F_Minister_01_L1", NPC_D_LEFT)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_31")
  WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
  CloseMessage()
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act10, 1, EFlipbookPlayTypeStopEnd, false)
  SpawnMangaIcon("Aliahan_Castle_2F_King_Aliahan_01_L1", "FIELD_EFX2D_THINK")
  Wait(1.5)
  CloseMangaIconAll("Aliahan_Castle_2F_King_Aliahan_01_L1")
  Wait(0.5)
  ResetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1")
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_32")
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_33")
  CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_34")
  CmdSetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
  Wait(1)
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act11, 1, EFlipbookPlayTypeStopEnd, false)
  CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_35")
  WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
  StopBGM(0.5)
  CmdFadeOut(EFadingPriorityUIBackGround, 0.5)
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_36")
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_37")
  CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_MAIN_0_VOLUME_0010_030_39")
  Wait(0.5)
  DestroyPartyClone()
  if HeroNumber == 1 then
    SpawnPartyClone(false, true, true, true)
  elseif HeroNumber == 2 then
    SpawnPartyClone(true, false, true, true)
  elseif HeroNumber == 3 then
    SpawnPartyClone(true, true, false, true)
  elseif HeroNumber == 4 then
    SpawnPartyClone(true, true, true, false)
  end
  SetFlag(Flag.FE164, true)
  SetFlag(Flag.FE94, false)
  SetHourMapTime(0)
  ChangeMap("MAPLIST_C01R0302", "FromDream", ORIENTATION_DOWN)
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0110_020_1")
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act4, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0110_020_2")
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0110_020_3")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0110_020_4")
  WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
  CmdSetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeLoop, true)
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0110_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0110_030_1")
  SetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act4, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0110_030_2")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0110_030_3")
  WaitAnimNpc("Aliahan_Castle_2F_King_Aliahan_01_L1")
  CmdSetNpcAnimation("Aliahan_Castle_2F_King_Aliahan_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeLoop, true)
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0110_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0110_040_1")
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0110_040_2")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0110_040_3")
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0110_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FD31) == true then
    CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_050_1")
    CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_050_2")
    CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_050_3")
    CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_050_4")
    CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_050_5")
    SetFlag(Flag.FD31, false)
  else
    local result = CmdChoiceMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_050_1")
    if result == true then
      CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_050_2")
      CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_050_3")
      CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_050_4")
      CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_050_5")
    else
      CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_050_6")
    end
  end
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0110_060(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_060_1")
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_060_2")
  CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_060_3")
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0110_070(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_070_1")
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_070_2")
  CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_070_3")
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0110_080(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_IMPORTANT_WRECKING_BALL")
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_080_1")
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_080_2")
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_080_3")
  CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_080_4")
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0110_090(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_090_1")
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_090_2")
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_090_3")
  CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_090_4")
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0110_100(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_100_1")
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_100_2")
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_100_3")
  CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_100_4")
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0110_110(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_110_1")
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_110_2")
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_110_3")
  CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0110_110_4")
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0210_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0210_030_1")
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0210_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0210_040_1")
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0210_040_2")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0210_040_3")
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0210_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0210_050_1")
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0210_050_2")
  CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0210_050_3")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0210_050_4")
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0210_060(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local ResultHeroSolo = CheckHeroSolo()
  if ResultHeroSolo == true then
    CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0210_060_1")
    CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0210_060_2")
  else
    SetTagItemId("ITEM_IMPORTANT_THIEFS_KEY")
    CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0210_070_1")
    CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0210_070_2")
    CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0210_070_3")
  end
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0210_080(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0210_080_1")
  CmdMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0210_080_2")
  CmdEventClosingMessage("NPC_Talk_Aliahan_Castle_2F_SUB_0_ACTOR_0210_080_3")
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckHeroLiving() == true then
    local HeroNumber = CheckHero()
    HeroPersonality = GetPartyMemberPersonality(HeroNumber)
    if HeroPersonality == "PERSONALITY_SLIPPERY_DEVIL" or HeroPersonality == "PERSONALITY_WIT" or HeroPersonality == "PERSONALITY_GENIUS" then
      SetTagWordPersonalityId(HeroPersonality)
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0310_010_1")
      CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0310_010_2")
    elseif HeroPersonality == "PERSONALITY_KLUTZ" or HeroPersonality == "PERSONALITY_LAZYBONES" or HeroPersonality == "PERSONALITY_FREE_SPIRIT" or HeroPersonality == "PERSONALITY_SCATTERBRAIN" or HeroPersonality == "PERSONALITY_LOUT" then
      SetTagWordPersonalityId(HeroPersonality)
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0310_010_1")
      CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0310_010_3")
    elseif HeroPersonality == "PERSONALITY_CRYBABY" or HeroPersonality == "PERSONALITY_SPOILT_BRAT" or HeroPersonality == "PERSONALITY_SOCIALITE" or HeroPersonality == "PERSONALITY_SHRINKING_VIOLET" or HeroPersonality == "PERSONALITY_WIMP" or HeroPersonality == "PERSONALITY_DAREDEVIL" or HeroPersonality == "PERSONALITY_SHOW-OFF" or HeroPersonality == "PERSONALITY_TOMBOY" then
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0310_010_1")
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0310_010_4")
      SetTagWordPersonalityId(HeroPersonality)
      CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0310_010_5")
    else
      CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0310_010_1")
    end
  else
    CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0310_010_1")
  end
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckHeroLiving() == true then
    local HeroNumber = CheckHero()
    local HeroPersonality = GetPartyMemberPersonality(HeroNumber)
    if HeroPersonality == "PERSONALITY_PLUGGER" or HeroPersonality == "PERSONALITY_DRUDGE" or HeroPersonality == "PERSONALITY_TOUGH_COOKIE" or HeroPersonality == "PERSONALITY_SORE_LOSER" or HeroPersonality == "PERSONALITY_PARAGON" or HeroPersonality == "PERSONALITY_MEATHEAD" or HeroPersonality == "PERSONALITY_IDEALIST" or HeroPersonality == "PERSONALITY_AMAZON" or HeroPersonality == "PERSONALITY_LONE_WOLF" then
      SetTagWordPersonalityId(HeroPersonality)
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_1")
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_2")
      CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_3")
    elseif HeroPersonality == "PERSONALITY_DAYDREAMER" or HeroPersonality == "PERSONALITY_GOOD_EGG" or HeroPersonality == "PERSONALITY_STAIGHT_ARROW" then
      SetTagWordPersonalityId(HeroPersonality)
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_1")
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_2")
      CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_4")
    elseif HeroPersonality == "PERSONALITY_MULT" or HeroPersonality == "PERSONALITY_CONTRARIAN" or HeroPersonality == "PERSONALITY_NARCISSIST" or HeroPersonality == "PERSONALITY_THUG" or HeroPersonality == "PERSONALITY_EGGHEAD" then
      SetTagWordPersonalityId(HeroPersonality)
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_1")
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_2")
      CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_5")
    elseif HeroPersonality == "PERSONALITY_CLOWN" or HeroPersonality == "PERSONALITY_HAPPY_CAMPER" then
      SetTagWordPersonalityId(HeroPersonality)
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_1")
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_2")
      CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_6")
    elseif HeroPersonality == "PERSONALITY_LOTHARIO" or HeroPersonality == "PERSONALITY_VAMP" then
      SetTagWordPersonalityId(HeroPersonality)
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_1")
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_2")
      CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_7")
    else
      CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_1")
      CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_2")
    end
  else
    CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_1")
    CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0410_010_2")
  end
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0510_010_1")
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0510_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0510_020_1")
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0510_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0510_030_1")
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0610_010_1")
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0610_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0610_020_1")
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0710_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckHeroLiving() == true then
    CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0710_010_1")
  else
    CmdMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0710_010_2")
    CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0710_010_3")
  end
  EventEnd(eventInfo, "")
end

function Aliahan_Castle_2F_SUB_0_ACTOR_0810_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Castle_2F_SUB_0_ACTOR_0810_010_1")
  EventEnd(eventInfo, "")
end
