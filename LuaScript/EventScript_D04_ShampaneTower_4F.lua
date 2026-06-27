print("Load Script EventScript_D04_ShampaneTower_4F")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function ShampaneTower_4F_MAIN_0_VOLUME_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetDispMiniMap(false)
  SoundTransitionVolumeRateByCategory(ENicolaSoundCategoryAMBIENT, 0, 1)
  RequestPreloadEventBattle("BATTLE_EVENT_BOSS_SHAMPANETOWER_KANDATA_1")
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Kandar_Shampane = "ShampaneTower_4F_Kandar_01_L3"
    KandarMinion1_Shampane = "ShampaneTower_4F_KandarMinion_01_L3"
    KandarMinion2_Shampane = "ShampaneTower_4F_KandarMinion_02_L3"
    KandarMinion3_Shampane = "ShampaneTower_4F_KandarMinion_03_L3"
  else
    Kandar_Shampane = "ShampaneTower_4F_Kandar_01_L1"
    KandarMinion1_Shampane = "ShampaneTower_4F_KandarMinion_01_L1"
    KandarMinion2_Shampane = "ShampaneTower_4F_KandarMinion_02_L1"
    KandarMinion3_Shampane = "ShampaneTower_4F_KandarMinion_03_L1"
  end
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  local party1 = "Party1"
  local party2 = "Party2"
  local party3 = "Party3"
  local party4 = "Party4"
  SpawnPartyCloneDisableSkill(true, true, true, true)
  EndSkillTransformNoEffect()
  EndSkillInvisibleNoEffect()
  SetNpcLocation(party1, {
    X = 3810,
    Y = 5850,
    Z = 4370
  })
  SetNpcLocation(party2, {
    X = 3650,
    Y = 5750,
    Z = 4370
  })
  SetNpcLocation(party3, {
    X = 3630,
    Y = 5950,
    Z = 4370
  })
  SetNpcLocation(party4, {
    X = 3550,
    Y = 5860,
    Z = 4370
  })
  CmdChangeStageCameraToGlobalPoint(4000, 5850, 4400, CAMERA_BLEND_LINEAR, 0.1, 0, 2200, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  SetNpcLocation(KandarMinion1_Shampane, {
    X = 4350,
    Y = 5750,
    Z = 4300
  })
  SetNpcLocation(KandarMinion2_Shampane, {
    X = 4350,
    Y = 5950,
    Z = 4300
  })
  SetNpcLocation(KandarMinion3_Shampane, {
    X = 4500,
    Y = 5850,
    Z = 4300
  })
  CmdTurnNpc(KandarMinion1_Shampane, NPC_D_LOW)
  CmdTurnNpc(KandarMinion2_Shampane, NPC_D_LOW)
  CmdTurnNpc(KandarMinion3_Shampane, NPC_D_LOW)
  CmdTurnNpc(party1, NPC_D_UP)
  CmdTurnNpc(party2, NPC_D_UP)
  CmdTurnNpc(party3, NPC_D_UP)
  CmdTurnNpc(party4, NPC_D_UP)
  CmdFadeIn(EFadingPriorityTopMost, 1)
  Wait(0.5)
  CmdMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_VOLUME_0110_010_1")
  CmdMoveNpc(Kandar_Shampane, {
    X = 4240,
    Y = 5850,
    Z = 0
  }, 280)
  Wait(0.3)
  CmdEventClosingMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_VOLUME_0110_010_2")
  Wait(0.5)
  CloseMessage()
  PlaySEEvent("EVESE_BAHARATAEASTCAVE_AXE")
  SetNpcEnableNoDepthTestCharacterBasePass(Kandar_Shampane, true)
  CmdSetNpcAnimation(Kandar_Shampane, AnimationType.Act5, 1, EFlipbookPlayTypeStopEnd, true)
  Wait(1.2)
  CmdStartEventBattle("BATTLE_EVENT_BOSS_SHAMPANETOWER_KANDATA_1")
  SetNpcEnableNoDepthTestCharacterBasePass(Kandar_Shampane, false)
  DestroyPartyClone()
  SetDispMiniMap(true)
  SoundTransitionVolumeRateByCategory(ENicolaSoundCategoryAMBIENT, 1, 0.5)
  EventEnd(eventInfo, "")
end

function ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetDispMiniMap(false)
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Kandar_Shampane = "ShampaneTower_4F_Kandar_01_L3"
    Kandar2_Shampane = "ShampaneTower_4F_Kandar_02_L3"
    KandarMinion1_Shampane = "ShampaneTower_4F_KandarMinion_01_L3"
    KandarMinion2_Shampane = "ShampaneTower_4F_KandarMinion_02_L3"
    KandarMinion3_Shampane = "ShampaneTower_4F_KandarMinion_03_L3"
    Guard_General_Shampane = "ShampaneTower_4F_Guard_General_01_L3"
    Guard_01_Shampane = "ShampaneTower_4F_Guard_01_L3"
    Guard_02_Shampane = "ShampaneTower_4F_Guard_02_L3"
    Guard_03_Shampane = "ShampaneTower_4F_Guard_03_L3"
    Guard_04_Shampane = "ShampaneTower_4F_Guard_04_L3"
    Guard_05_Shampane = "ShampaneTower_4F_Guard_05_L3"
    Guard_06_Shampane = "ShampaneTower_4F_Guard_06_L3"
  else
    Kandar_Shampane = "ShampaneTower_4F_Kandar_01_L1"
    Kandar2_Shampane = "ShampaneTower_4F_Kandar_02_L1"
    KandarMinion1_Shampane = "ShampaneTower_4F_KandarMinion_01_L1"
    KandarMinion2_Shampane = "ShampaneTower_4F_KandarMinion_02_L1"
    KandarMinion3_Shampane = "ShampaneTower_4F_KandarMinion_03_L1"
    Guard_General_Shampane = "ShampaneTower_4F_Guard_General_01_L1"
    Guard_01_Shampane = "ShampaneTower_4F_Guard_01_L1"
    Guard_02_Shampane = "ShampaneTower_4F_Guard_02_L1"
    Guard_03_Shampane = "ShampaneTower_4F_Guard_03_L1"
    Guard_04_Shampane = "ShampaneTower_4F_Guard_04_L1"
    Guard_05_Shampane = "ShampaneTower_4F_Guard_05_L1"
    Guard_06_Shampane = "ShampaneTower_4F_Guard_06_L1"
  end
  SetNpcLocation(KandarMinion1_Shampane, {
    X = 4600,
    Y = 5730,
    Z = 4300
  })
  SetNpcLocation(KandarMinion2_Shampane, {
    X = 4630,
    Y = 5970,
    Z = 4300
  })
  SetNpcLocation(KandarMinion3_Shampane, {
    X = 4780,
    Y = 5850,
    Z = 4300
  })
  CmdTurnNpc(KandarMinion1_Shampane, NPC_D_LOW)
  CmdTurnNpc(KandarMinion2_Shampane, NPC_D_LOW)
  CmdTurnNpc(KandarMinion3_Shampane, NPC_D_LOW)
  SpawnNpc(Guard_General_Shampane)
  SpawnNpc(Guard_01_Shampane)
  SpawnNpc(Guard_02_Shampane)
  SpawnNpc(Guard_03_Shampane)
  SpawnNpc(Guard_04_Shampane)
  SpawnNpc(Guard_05_Shampane)
  SpawnNpc(Guard_06_Shampane)
  local party1 = "Party1"
  local party2 = "Party2"
  local party3 = "Party3"
  local party4 = "Party4"
  SpawnPartyClone(true, true, true, true)
  SetNpcLocation(party1, {
    X = 3810,
    Y = 5850,
    Z = 4370
  })
  SetNpcLocation(party2, {
    X = 3650,
    Y = 5750,
    Z = 4370
  })
  SetNpcLocation(party3, {
    X = 3630,
    Y = 5950,
    Z = 4370
  })
  SetNpcLocation(party4, {
    X = 3550,
    Y = 5860,
    Z = 4370
  })
  CmdTurnNpc(party1, NPC_D_UP)
  CmdTurnNpc(party2, NPC_D_UP)
  CmdTurnNpc(party3, NPC_D_UP)
  CmdTurnNpc(party4, NPC_D_UP)
  SetTagItemId("ITEM_EQUIP_HELMET_KINGS_CROWN")
  SetTagItemId2("ITEM_IMPORTANT_MAGIC_KEY")
  CmdChangeStageCameraToGlobalPoint(4000, 5850, 4400, CAMERA_BLEND_LINEAR, 0.1, 0, 2200, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  SetFlag(Flag.FE229, true)
  SetNpcEnableNoDepthTestCharacterBasePass(Kandar_Shampane, true)
  SetNpcLocation(Kandar_Shampane, {
    X = 4370,
    Y = 5860,
    Z = 4300
  })
  CmdSetNpcAnimation(Kandar_Shampane, AnimationType.Act8, 1, EFlipbookPlayTypeStopEnd, true)
  SoundTransitionVolumeRateByCategory(ENicolaSoundCategoryAMBIENT, 0, 1)
  Wait(0.2)
  SetSysInfo(SysInfo.TRANSITION_AMBIENT_CANCEL, 1)
  CmdFadeInAfterEventBattle()
  Wait(0.5)
  SetSysInfo(SysInfo.TRANSITION_AMBIENT_CANCEL, 0)
  SetNpcAnimation(Kandar_Shampane, AnimationType.Act9, 2, EFlipbookPlayTypeAutoResetIdle, false)
  Wait(0.9)
  CmdMoveNpcDetail(Kandar_Shampane, {
    X = 4420,
    Y = 5850,
    Z = 4300
  }, 23, NPC_D_LOW, AnimationType.Walk, 0.5)
  WaitCommandNpc(Kandar_Shampane)
  CmdMoveNpc(party1, {
    X = 3910,
    Y = 5850,
    Z = 4370
  }, 100)
  CmdSetNpcAnimation(Kandar_Shampane, AnimationType.Act10, 1, EFlipbookPlayTypeStopEnd, true)
  SetNpcEnableNoDepthTestCharacterBasePass(Kandar_Shampane, false)
  result = CmdChoiceMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_1")
  if result == true then
    CmdEventClosingMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_2")
  else
    ref = 0
    while 1 > ref do
      CmdSetNpcAnimation(Kandar_Shampane, AnimationType.Act11, 1, EFlipbookPlayTypeLoop, true)
      Wait(0.5)
      result = CmdChoiceMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_4")
      if result == true then
        CmdEventClosingMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_2")
        CmdSetNpcAnimation(Kandar_Shampane, AnimationType.Act11, 1, EFlipbookPlayTypeLoop, true)
        Wait(1)
        ref = 1
      else
        CmdSetNpcAnimation(Kandar_Shampane, AnimationType.Act11, 1, EFlipbookPlayTypeLoop, true)
      end
    end
  end
  CloseMessage()
  CmdSetNpcAnimation(Kandar_Shampane, AnimationType.Act12, 1, EFlipbookPlayTypeStopEnd, true)
  Wait(0.5)
  CmdSetNpcAnimation(Kandar_Shampane, AnimationType.Act13, 1, EFlipbookPlayTypeStopEnd, true)
  Wait(0.5)
  SetVisibleActor("BP_SearchEvent_D04_Kings_Crown_00", true)
  PlaySEEvent("EVESE_REIAMULAND_ORB_PUT")
  Wait(1)
  CmdSetNpcAnimation(Kandar_Shampane, AnimationType.Act14, 1, EFlipbookPlayTypeStopEnd, true)
  Wait(0.5)
  DestroyNpc(Kandar_Shampane)
  WaitCommandNpc(Kandar_Shampane)
  SpawnNpc(Kandar2_Shampane)
  CmdMoveNpc(KandarMinion2_Shampane, {
    X = 4580,
    Y = 5970,
    Z = 4300
  }, 100)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_5")
  ChangeSpeaker()
  CmdSetNpcAnimation(KandarMinion3_Shampane, AnimationType.Walk, 2, EFlipbookPlayTypeLoop, true)
  CmdEventClosingMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_6")
  ResetNpcAnimation(KandarMinion3_Shampane)
  CloseMessage()
  CmdMoveNpc(Guard_General_Shampane, {
    X = 5910,
    Y = 4700,
    Z = 4300
  }, 1000)
  CmdMoveNpc(Guard_General_Shampane, {
    X = 4430,
    Y = 5400,
    Z = 4300
  }, 1000)
  CmdTurnNpc(Guard_General_Shampane, NPC_D_RIGHT)
  ChangeStageCameraToGlobalPoint(4430, 5420, 4300, CAMERA_BLEND_LINEAR, 0.5, 0.5, 2100, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  TurnNpc(KandarMinion1_Shampane, NPC_D_LEFT)
  TurnNpc(KandarMinion2_Shampane, NPC_D_LEFT)
  TurnNpc(KandarMinion3_Shampane, NPC_D_LEFT)
  TurnNpc(Kandar2_Shampane, NPC_D_LEFT)
  TurnNpc(party1, NPC_D_LEFT)
  TurnNpc(party2, NPC_D_LEFT)
  TurnNpc(party3, NPC_D_LEFT)
  TurnNpc(party4, NPC_D_LEFT)
  SpawnMangaIcon(KandarMinion1_Shampane, "FIELD_EFX2D_SURPRISE")
  SpawnMangaIcon(KandarMinion3_Shampane, "FIELD_EFX2D_SURPRISE")
  SpawnMangaIcon(KandarMinion2_Shampane, "FIELD_EFX2D_SURPRISE")
  CmdSpawnMangaIcon(Kandar2_Shampane, "FIELD_EFX2D_SURPRISE")
  CmdEventClosingMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_7")
  CloseMessage()
  CmdJumpNpc(KandarMinion3_Shampane, 50, 0.5, false)
  CmdEventClosingMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_8")
  CloseMessage()
  MoveNpc(Guard_01_Shampane, {
    X = 4900,
    Y = 5350,
    Z = 4300
  }, 1000)
  MoveNpc(Guard_02_Shampane, {
    X = 4700,
    Y = 5350,
    Z = 4300
  }, 1000)
  MoveNpc(Guard_03_Shampane, {
    X = 4800,
    Y = 5250,
    Z = 4300
  }, 800)
  MoveNpc(Guard_04_Shampane, {
    X = 4330,
    Y = 5350,
    Z = 4300
  }, 1000)
  MoveNpc(Guard_05_Shampane, {
    X = 4450,
    Y = 5350,
    Z = 4300
  }, 1000)
  MoveNpc(Guard_06_Shampane, {
    X = 4430,
    Y = 5300,
    Z = 4300
  }, 1000)
  TurnNpc(Guard_01_Shampane, NPC_D_RIGHT)
  TurnNpc(Guard_02_Shampane, NPC_D_RIGHT)
  TurnNpc(Guard_03_Shampane, NPC_D_RIGHT)
  TurnNpc(Guard_04_Shampane, NPC_D_RIGHT)
  TurnNpc(Guard_05_Shampane, NPC_D_RIGHT)
  CmdTurnNpc(Guard_06_Shampane, NPC_D_RIGHT)
  CmdMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_9")
  CmdTurnNpc(Kandar2_Shampane, NPC_D_LOW)
  Wait(0.6)
  TurnNpc(party1, NPC_D_UP)
  CmdEventClosingMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_3")
  CloseMessage()
  Wait(1)
  MoveNpc(Kandar2_Shampane, {
    X = 4710,
    Y = 7800,
    Z = 0
  }, 3000)
  PlaySEEvent("EVESE_SHAMPANE_ESCAPE")
  Wait(0.7)
  TurnNpc(Guard_General_Shampane, NPC_D_RIGHT)
  TurnNpc(KandarMinion1_Shampane, NPC_D_RIGHT)
  TurnNpc(KandarMinion3_Shampane, NPC_D_RIGHT)
  TurnNpc(KandarMinion2_Shampane, NPC_D_RIGHT)
  TurnNpc(party1, NPC_D_RIGHT)
  TurnNpc(party2, NPC_D_RIGHT)
  TurnNpc(party3, NPC_D_RIGHT)
  CmdTurnNpc(party4, NPC_D_RIGHT)
  SpawnMangaIcon(Guard_01_Shampane, "FIELD_EFX2D_SURPRISE")
  SpawnMangaIcon(Guard_02_Shampane, "FIELD_EFX2D_SURPRISE")
  SpawnMangaIcon(Guard_03_Shampane, "FIELD_EFX2D_SURPRISE")
  SpawnMangaIcon(Guard_04_Shampane, "FIELD_EFX2D_SURPRISE")
  SpawnMangaIcon(Guard_05_Shampane, "FIELD_EFX2D_SURPRISE")
  SpawnMangaIcon(Guard_06_Shampane, "FIELD_EFX2D_SURPRISE")
  SpawnMangaIcon(KandarMinion1_Shampane, "FIELD_EFX2D_SURPRISE")
  SpawnMangaIcon(KandarMinion3_Shampane, "FIELD_EFX2D_SURPRISE")
  SpawnMangaIcon(KandarMinion2_Shampane, "FIELD_EFX2D_SURPRISE")
  SpawnMangaIcon(party1, "FIELD_EFX2D_SURPRISE")
  SpawnMangaIcon(party2, "FIELD_EFX2D_SURPRISE")
  SpawnMangaIcon(party3, "FIELD_EFX2D_SURPRISE")
  CmdSpawnMangaIcon(party4, "FIELD_EFX2D_SURPRISE")
  JumpNpc(KandarMinion1_Shampane, 50, 0.2, false)
  JumpNpc(KandarMinion3_Shampane, 50, 0.2, false)
  JumpNpc(KandarMinion2_Shampane, 50, 0.2, false)
  Wait(1)
  MoveNpc(KandarMinion1_Shampane, {
    X = 4920,
    Y = 7750,
    Z = 0
  }, 1000)
  MoveNpc(KandarMinion3_Shampane, {
    X = 5280,
    Y = 7800,
    Z = 0
  }, 1000)
  MoveNpc(KandarMinion2_Shampane, {
    X = 4920,
    Y = 7850,
    Z = 0
  }, 1000)
  Wait(0.8)
  MoveNpc(Guard_01_Shampane, {
    X = 5100,
    Y = 7760,
    Z = 0
  }, 800)
  MoveNpc(Guard_02_Shampane, {
    X = 4700,
    Y = 7760,
    Z = 0
  }, 800)
  Wait(0.8)
  MoveNpc(Guard_03_Shampane, {
    X = 4900,
    Y = 7660,
    Z = 0
  }, 800)
  CmdFadeOut(EFadingPriorityTopMost, 0.1)
  Wait(0.1)
  ChangeStageCameraToGlobalPoint(4810, 7810, 4400, CAMERA_BLEND_LINEAR, 0, 0, 2300, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  Wait(0.1)
  CmdFadeIn(EFadingPriorityTopMost, 0.1)
  WaitStageCameraBlend()
  Wait(0.2)
  MovePhysicsJumpNpc(Kandar2_Shampane, {
    X = 0,
    Y = 400,
    Z = 0
  }, 300, 600, AnimationType.Walk)
  WaitMoveNpc(Kandar2_Shampane)
  Wait(0.2)
  PlaySEUI("SYSSE_TD_FALL")
  Wait(0.2)
  WaitMoveNpc(KandarMinion3_Shampane)
  MovePhysicsJumpNpc(KandarMinion1_Shampane, {
    X = 0,
    Y = 450,
    Z = 0
  }, 200, 600, AnimationType.Walk)
  Wait(0.1)
  MovePhysicsJumpNpc(KandarMinion2_Shampane, {
    X = 0,
    Y = 450,
    Z = 0
  }, 200, 600, AnimationType.Walk)
  Wait(0.1)
  MovePhysicsJumpNpc(KandarMinion3_Shampane, {
    X = 0,
    Y = 450,
    Z = 0
  }, 200, 500, AnimationType.Walk)
  PlaySEUI("SYSSE_TD_FALL")
  Wait(1.5)
  SpawnMangaIcon(Guard_01_Shampane, "FIELD_EFX2D_IMPATIENCE")
  SpawnMangaIcon(Guard_02_Shampane, "FIELD_EFX2D_IMPATIENCE")
  CmdSpawnMangaIcon(Guard_03_Shampane, "FIELD_EFX2D_IMPATIENCE")
  CmdSpawnMangaIcon(Guard_03_Shampane, "FIELD_EFX2D_IMPATIENCE")
  SpawnMangaIcon(Guard_03_Shampane, "FIELD_EFX2D_IMPATIENCE_NO_SE")
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  DestroyNpc(Kandar2_Shampane)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_SHAMPANETOWER_DefeatKandata, true)
  DestroyNpc(KandarMinion1_Shampane)
  DestroyNpc(KandarMinion2_Shampane)
  DestroyNpc(KandarMinion3_Shampane)
  ChangeStageCameraToGlobalPoint(4430, 5850, 4300, CAMERA_BLEND_LINEAR, 0, 0, 1900, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  DestroyPartyClone()
  SetPlayerLocation({
    X = 3810,
    Y = 5850,
    Z = 4370
  })
  TurnParty(1, 0)
  PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WARP)
  SetNpcLocation(Guard_01_Shampane, {
    X = 4600,
    Y = 6700,
    Z = 4370
  })
  SetNpcLocation(Guard_02_Shampane, {
    X = 4500,
    Y = 6750,
    Z = 4370
  })
  SetNpcLocation(Guard_03_Shampane, {
    X = 4700,
    Y = 6750,
    Z = 4370
  })
  SetNpcLocation(Guard_04_Shampane, {
    X = 4670,
    Y = 5750,
    Z = 4370
  })
  SetNpcLocation(Guard_05_Shampane, {
    X = 4670,
    Y = 5950,
    Z = 4370
  })
  SetNpcLocation(Guard_06_Shampane, {
    X = 4820,
    Y = 5850,
    Z = 4370
  })
  SetNpcLocation(Guard_General_Shampane, {
    X = 4590,
    Y = 5850,
    Z = 4370
  })
  CmdTurnNpc(Guard_General_Shampane, NPC_D_RIGHT)
  CmdFadeIn(EFadingPriorityTopMost, 0.5)
  RequestUnlockAchievementByDefeatKandata1()
  MoveNpc(Guard_01_Shampane, {
    X = 4600,
    Y = 6100,
    Z = 0
  }, 500)
  MoveNpc(Guard_02_Shampane, {
    X = 4500,
    Y = 6200,
    Z = 0
  }, 500)
  Wait(0.5)
  CmdEventClosingMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_10")
  CloseMessage()
  CmdMoveNpc(Guard_03_Shampane, {
    X = 4700,
    Y = 6200,
    Z = 0
  }, 500)
  CmdSpawnMangaIcon(Guard_General_Shampane, "FIELD_EFX2D_MOYAMOYA")
  Wait(0.1)
  CmdMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_11")
  Wait(0.8)
  TurnNpc(Guard_General_Shampane, NPC_D_LOW)
  Wait(0.2)
  TurnNpc(Guard_04_Shampane, NPC_D_LOW)
  TurnNpc(Guard_05_Shampane, NPC_D_LOW)
  TurnNpc(Guard_06_Shampane, NPC_D_LOW)
  CmdMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_12")
  CmdEventClosingMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_13")
  CloseMessage()
  CmdSetNpcAnimation(Guard_01_Shampane, AnimationType.Walk, 3, EFlipbookPlayTypeLoop, true)
  Wait(1)
  ResetNpcAnimation(Guard_01_Shampane)
  CmdEventClosingMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_14")
  CloseMessage()
  CmdTurnNpc(Guard_General_Shampane, NPC_D_RIGHT)
  CmdSpawnMangaIcon(Guard_General_Shampane, "FIELD_EFX2D_SURPRISE")
  Wait(0.1)
  CmdMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_15")
  CmdTurnNpc(Guard_General_Shampane, NPC_D_LOW)
  CmdMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_16")
  CmdMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_17")
  CmdEventClosingMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_18")
  CloseMessage()
  SpawnMangaIcon(Guard_General_Shampane, "FIELD_EFX2D_THINK")
  Wait(1)
  CloseMangaIconAll(Guard_General_Shampane)
  Wait(0.5)
  CmdMoveNpc(Guard_02_Shampane, {
    X = 4500,
    Y = 6050,
    Z = 0
  }, 200)
  CmdTurnNpc(Guard_02_Shampane, NPC_D_LEFT)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_19")
  ChangeSpeaker()
  CmdTurnNpc(Guard_General_Shampane, NPC_D_RIGHT)
  CmdEventClosingMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_20")
  CloseMessage()
  TurnNpc(Guard_01_Shampane, NPC_D_LOW)
  TurnNpc(Guard_02_Shampane, NPC_D_LOW)
  TurnNpc(Guard_03_Shampane, NPC_D_LOW)
  CmdTurnNpc(Guard_General_Shampane, NPC_D_LOW)
  CmdMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_21")
  CmdEventClosingMessage("NPC_Talk_ShampaneTower_4F_MAIN_0_BATTLE_END_0110_020_22")
  MoveNpc(Guard_01_Shampane, {
    X = 6100,
    Y = 4520,
    Z = 0
  }, 600)
  MoveNpc(Guard_02_Shampane, {
    X = 6100,
    Y = 4520,
    Z = 0
  }, 600)
  MoveNpc(Guard_04_Shampane, {
    X = 5900,
    Y = 4420,
    Z = 0
  }, 600)
  MoveNpc(Guard_05_Shampane, {
    X = 6000,
    Y = 4520,
    Z = 0
  }, 600)
  MoveNpc(Guard_06_Shampane, {
    X = 6000,
    Y = 4520,
    Z = 0
  }, 600)
  MoveNpc(Guard_General_Shampane, {
    X = 5900,
    Y = 4520,
    Z = 0
  }, 600)
  Wait(1.3)
  CmdTurnNpc(Guard_03_Shampane, NPC_D_LEFT)
  CmdSpawnMangaIcon(Guard_03_Shampane, "FIELD_EFX2D_SURPRISE")
  MoveNpc(Guard_03_Shampane, {
    X = 6000,
    Y = 4520,
    Z = 0
  }, 1000)
  CmdSpawnMangaIcon(Guard_03_Shampane, "FIELD_EFX2D_IMPATIENCE")
  WaitMoveNpc(Guard_03_Shampane)
  DestroyNpc(Guard_01_Shampane)
  DestroyNpc(Guard_02_Shampane)
  DestroyNpc(Guard_03_Shampane)
  DestroyNpc(Guard_04_Shampane)
  DestroyNpc(Guard_05_Shampane)
  DestroyNpc(Guard_06_Shampane)
  DestroyNpc(Guard_General_Shampane)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  ChangeCameraTraceTarget("PLAYER")
  SetDispMiniMap(true)
  SoundTransitionVolumeRateByCategory(ENicolaSoundCategoryAMBIENT, 1, 0.5)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function ShampaneTower_4F_SearchEvent_Kings_Crown_00(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetVisibleActor("BP_SearchEvent_D04_Kings_Crown_00", false)
  SearchObject_Important(eventInfo, TreasureId, ItemId)
  -- AP
  local ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
  else
    SetFlag(Flag.FE59, true)
  end
  -- AP end
  EventEnd(eventInfo, "")
end
