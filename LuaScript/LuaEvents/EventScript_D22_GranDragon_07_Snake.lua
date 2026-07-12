print("Load Script EventScript_D22_GranDragon_07_Snake")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function GranDragon_MBR_Xenlon_SUB_0_MBR_SCOUT_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local volumeTag = (...)
  if volumeTag == "SuccessCollision" then
  elseif volumeTag == "FailCollision" then
  elseif volumeTag == nil then
  end
  local MonsterScoutId = "MBR_SCOUT_XENLON_D22_GranDragon_07_Snake"
  local ActorId = "GranDragon_MBR_Xenlon_00_L1"
  local MonsterLocation = GetNpcLocation(ActorId)
  local PlayerLocation = {
    X = MonsterLocation.X - 320,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z - 3
  }
  local CameraParam = {
    X = MonsterLocation.X - 1000,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z + 600,
    Distance = 2500
  }
  local scoutResult = GetScoutMonsterVigilanceResult(MonsterScoutId)
  if scoutResult == EMBRScoutResultSuccess then
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    SetNicolaEnableDOF(false)
    ChangeStageCameraToGlobalPoint(CameraParam.X, CameraParam.Y, CameraParam.Z, CAMERA_BLEND_EASE_IN_OUT, 0, 0, CameraParam.Distance)
    SetPartyOpacity(2, 0)
    SetPartyOpacity(3, 0)
    SetPartyOpacity(4, 0)
    TurnParty(1, 0)
    SetPlayerLocation(PlayerLocation)
    Wait(0.5)
    CmdFadeIn(EFadingPriorityTopMost, 0.5)
    AddScoutMonster(MonsterScoutId)
    CmdMessage("NPC_Talk_GranDragon_MBR_Xenlon_SUB_0_VOLUME_0010_010_1")
    CmdMessage("NPC_Talk_GranDragon_MBR_Xenlon_SUB_0_VOLUME_0010_010_2")
    CloseMessage()
    CmdMessage("NPC_Talk_GranDragon_MBR_Xenlon_SUB_0_VOLUME_0010_010_3")
    CloseMessage()
    CmdMessage("NPC_Talk_GranDragon_MBR_Xenlon_SUB_0_VOLUME_0010_010_4")
    CmdMessage("NPC_Talk_GranDragon_MBR_Xenlon_SUB_0_VOLUME_0010_010_5")
    CloseMessage()
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    PlaySEEvent("EVESE_MBR_STAIRWAY")
    DestroyMBRMonster(ActorId)
    SetPartyOpacity(2, 1)
    SetPartyOpacity(3, 1)
    SetPartyOpacity(4, 1)
    PartyMemberAlignment(ALIGNMENT_TOGETHER, ALIGNMENT_MOVE_WARP)
    SetNicolaEnableDOF(true)
    ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
    Wait(1)
    CmdFadeIn(EFadingPriorityTopMost, 0.5)
    CmdCallMBRScoutSuccessUI(MonsterScoutId)
  end
  EventEnd(eventInfo, "")
end

function GranDragon_07_Snake_SUB_0_VOLUME_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  RequestPreloadEventBattle("BATTLE_EVENT_BOSS_SECRET_GRANDRA_1")
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  if GetFlag(Flag.FE700) == true then
    ChangeStageCameraToGlobalPoint(18000, 6000, 1900, CAMERA_BLEND_EASE_IN_OUT, 2, 2, 3300, {
      Yaw = 0,
      Pitch = -14,
      Roll = 0
    })
    CmdMoveParty({
      X = 17500,
      Y = 6000,
      Z = 0
    })
    TurnParty(1, 0)
    Wait(0.5)
    WaitStageCameraBlend()
    if GetFlag(Flag.FE705) == true then
      CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_28")
      ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 2, 2)
      CmdMoveParty({
        X = 17000,
        Y = 6000,
        Z = 0
      })
      SetDispMiniMap(true)
      WaitStageCameraBlend()
    elseif GetFlag(Flag.FS0) == true then
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_16")
      local result = CmdChoiceMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_17")
      if result == true then
        CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_14")
        Wait(0.5)
        PlaySEEvent("EVESE_GRANDRAGON_ROAR")
        SetNpcAnimation("GranDragon_07_Snake_GranDragon_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
        Wait(0.94)
        ChangeStageCameraToGlobalPoint(18000, 6000, 2300, CAMERA_BLEND_EASE_IN_OUT, 0.06, 2, 1600, {
          Yaw = 0,
          Pitch = -14,
          Roll = 0
        })
        PlayCameraShake("Event_Large", 1)
        WaitAnimNpc("GranDragon_07_Snake_GranDragon_01_L1")
        CmdStartEventBattle("BATTLE_EVENT_BOSS_SECRET_GRANDRA_1")
      else
        CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_15")
        ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 2, 2)
        CmdMoveParty({
          X = 17000,
          Y = 6000,
          Z = 0
        })
        SetDispMiniMap(true)
        WaitStageCameraBlend()
        RequestAutoSaveFromEvent()
      end
    elseif GetFlag(Flag.FE703) == true then
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_12")
      local result = CmdChoiceMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_13")
      if result == true then
        CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_14")
        Wait(0.5)
        PlaySEEvent("EVESE_GRANDRAGON_ROAR")
        SetNpcAnimation("GranDragon_07_Snake_GranDragon_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
        Wait(0.94)
        ChangeStageCameraToGlobalPoint(18000, 6000, 2300, CAMERA_BLEND_EASE_IN_OUT, 0.06, 2, 1600, {
          Yaw = 0,
          Pitch = -14,
          Roll = 0
        })
        PlayCameraShake("Event_Large", 1)
        WaitAnimNpc("GranDragon_07_Snake_GranDragon_01_L1")
        CmdStartEventBattle("BATTLE_EVENT_BOSS_SECRET_GRANDRA_1")
      else
        CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_15")
        SetFlag(Flag.FS0, true)
        ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 2, 2)
        CmdMoveParty({
          X = 17000,
          Y = 6000,
          Z = 0
        })
        SetDispMiniMap(true)
        WaitStageCameraBlend()
        RequestAutoSaveFromEvent()
      end
    else
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_9")
      local result = CmdChoiceMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_10")
      if result == true then
        CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_7")
        Wait(0.5)
        PlaySEEvent("EVESE_GRANDRAGON_ROAR")
        SetNpcAnimation("GranDragon_07_Snake_GranDragon_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
        Wait(0.94)
        ChangeStageCameraToGlobalPoint(18000, 6000, 2300, CAMERA_BLEND_EASE_IN_OUT, 0.06, 2, 1600, {
          Yaw = 0,
          Pitch = -14,
          Roll = 0
        })
        PlayCameraShake("Event_Large", 1)
        WaitAnimNpc("GranDragon_07_Snake_GranDragon_01_L1")
        SetFlag(Flag.FE703, true)
        CmdStartEventBattle("BATTLE_EVENT_BOSS_SECRET_GRANDRA_1")
      else
        CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_8")
        ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 2, 2)
        CmdMoveParty({
          X = 17000,
          Y = 6000,
          Z = 0
        })
        SetDispMiniMap(true)
        WaitStageCameraBlend()
        RequestAutoSaveFromEvent()
      end
    end
  else
    SetFlag(Flag.FE700, true)
    local party1 = "Party1"
    local party2 = "Party2"
    local party3 = "Party3"
    local party4 = "Party4"
    PauseMainBGM(true, 0.5)
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    EndSkillInvisibleNoEffect()
    EndSkillTransformNoEffect()
    Wait(0.1)
    FadeIn(EFadingPriorityTopMost, 0.5)
    CmdPlayEventSequence(0)
    CmdFadeOut(EFadingPriorityTopMost, 0)
    SetDispMiniMap(false)
    ChangeStageCameraToGlobalPoint(18000, 6000, 1900, CAMERA_BLEND_EASE_IN_OUT, 0, 2, 3300, {
      Yaw = 0,
      Pitch = -14,
      Roll = 0
    })
    SpawnNpc("GranDragon_07_Snake_GranDragon_01_L1")
    SpawnPartyCloneDisableSkill(true, true, true, true)
    SetNpcLocation(party1, {
      X = 17500,
      Y = 6000,
      Z = 1800
    })
    SetNpcLocation(party2, {
      X = 17350,
      Y = 5870,
      Z = 1800
    })
    SetNpcLocation(party3, {
      X = 17350,
      Y = 6130,
      Z = 1800
    })
    SetNpcLocation(party4, {
      X = 17200,
      Y = 6000,
      Z = 1800
    })
    WaitFrame(1)
    TurnNpc(party1, NPC_D_UP)
    TurnNpc(party2, NPC_D_UP)
    TurnNpc(party3, NPC_D_UP)
    TurnNpc(party4, NPC_D_UP)
    Wait(0.1)
    FadeIn(EFadingPriorityTopMost, 0.5)
    PauseMainBGM(false, 0)
    CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_1")
    CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_2")
    CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_3")
    CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_4")
    CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_5")
    local result = CmdChoiceMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_6")
    if result == true then
      CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_7")
      Wait(0.5)
      PlaySEEvent("EVESE_GRANDRAGON_ROAR")
      SetNpcAnimation("GranDragon_07_Snake_GranDragon_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
      Wait(0.94)
      ChangeStageCameraToGlobalPoint(18000, 6000, 2300, CAMERA_BLEND_EASE_IN_OUT, 0.06, 2, 1600, {
        Yaw = 0,
        Pitch = -14,
        Roll = 0
      })
      PlayCameraShake("Event_Large", 1)
      WaitAnimNpc("GranDragon_07_Snake_GranDragon_01_L1")
      SetFlag(Flag.FE703, true)
      SetFlag(Flag.FF1, true)
      CmdStartEventBattle("BATTLE_EVENT_BOSS_SECRET_GRANDRA_1")
      DestroyPartyClone()
    else
      CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_VOLUME_0010_010_8")
      ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 2, 2)
      DestroyPartyClone()
      SetActorRotation("PLAYER", {
        Yaw = 180,
        Pitch = 0,
        Roll = 0
      })
      PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WALK)
      CmdMoveParty({
        X = 17000,
        Y = 6000,
        Z = 0
      })
      SetDispMiniMap(true)
      WaitStageCameraBlend()
      RequestAutoSaveFromEvent()
    end
  end
  EventEnd(eventInfo, "")
end

function GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local LastBattleTurn = GetLastBattleTurn()
  print("hoge")
  print(LastBattleTurn)
  print("hage")
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  ChangeStageCameraToGlobalPoint(18000, 6000, 1900, CAMERA_BLEND_EASE_IN_OUT, 0, 2, 3300, {
    Yaw = 0,
    Pitch = -14,
    Roll = 0
  })
  local party1 = "Party1"
  local party2 = "Party2"
  local party3 = "Party3"
  local party4 = "Party4"
  if GetFlag(Flag.FF1) == true then
    SpawnPartyCloneDisableSkill(true, true, true, true)
  else
    SpawnPartyClone(true, true, true, true)
  end
  SetNpcLocation(party1, {
    X = 17500,
    Y = 6000,
    Z = 1800
  })
  SetNpcLocation(party2, {
    X = 17350,
    Y = 5870,
    Z = 1800
  })
  SetNpcLocation(party3, {
    X = 17350,
    Y = 6130,
    Z = 1800
  })
  SetNpcLocation(party4, {
    X = 17200,
    Y = 6000,
    Z = 1800
  })
  WaitFrame(1)
  TurnNpc(party1, NPC_D_UP)
  TurnNpc(party2, NPC_D_UP)
  TurnNpc(party3, NPC_D_UP)
  TurnNpc(party4, NPC_D_UP)
  Wait(0.1)
  CmdFadeInAfterEventBattle()
  SetTagValue(LastBattleTurn + 1)
  if 20 <= LastBattleTurn then
    print("21\227\130\191\227\131\188\227\131\179\228\187\165\228\184\138")
    CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_1")
    CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_2")
    CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_3")
    CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_4")
    CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_5")
  elseif 10 <= LastBattleTurn then
    print("11\239\189\15820\227\130\191\227\131\188\227\131\179")
    if GetFlag(Flag.FE704) == true then
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_1")
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_2")
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_3")
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_4")
      CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_5")
    else
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_6")
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_7")
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_8")
      CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_9")
      RequestUnlockAchievementByGetGoldenMedal()
      ItemGetMessageToActor("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_10", "ITEM_ARCHIPELAGO"--[["ITEM_IMPORTANT_GOLDEN_MEDAL"]], "GranDragon_07_Snake_GranDragon_01_L1", false, false, true) -- AP
      -- AP
      AP.Log("GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020 called (Temple of Trials - Grand Dragon defeated)")
      AP.CheckLocation("GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_MEDAL\nGranDragon_07_Snake_SUB_0_BATTLE_END_0010_020")
      local ItemId = "ITEM_ARCHIPELAGO"
      if ItemId == "ITEM_ARCHIPELAGO" then
        AddItem(ItemId)
      else
        AddItem("ITEM_IMPORTANT_GOLDEN_MEDAL")
      end
      -- AP end
      CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_11")
      SetFlag(Flag.FE704, true)
    end
  else
    print("10\227\130\191\227\131\188\227\131\179\228\187\165\228\184\139")
    if GetFlag(Flag.FE704) == true then
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_12")
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_13")
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_14")
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_15")
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_16")
      CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_17")
      Wait(0.1)
      SpawnMangaIcon("GranDragon_07_Snake_GranDragon_01_L1", "Ev_Cmn_Zzz_01")
      CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_18")
      Wait(0.1)
      CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_19")
    else
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_20")
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_21")
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_22")
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_23")
      CmdMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_24")
      CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_25")
      RequestUnlockAchievementByGetGoldenMedal()
      ItemGetMessageToActor("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_26", "ITEM_ARCHIPELAGO"--[["ITEM_IMPORTANT_GOLDEN_MEDAL"]], "GranDragon_07_Snake_GranDragon_01_L1", false, false, true) -- AP
      -- AP
      AP.Log("GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020 called (Temple of Trials - Grand Dragon defeated)")
      AP.CheckLocation("GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_MEDAL\nGranDragon_07_Snake_SUB_0_BATTLE_END_0010_020")
      local ItemId = "ITEM_ARCHIPELAGO"
      if ItemId == "ITEM_ARCHIPELAGO" then
        AddItem(ItemId)
      else
        AddItem("ITEM_IMPORTANT_GOLDEN_MEDAL")
      end
      -- AP end
      CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_27")
      Wait(0.1)
      SpawnMangaIcon("GranDragon_07_Snake_GranDragon_01_L1", "Ev_Cmn_Zzz_01")
      CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_28")
      Wait(0.1)
      CmdEventClosingMessage("NPC_Talk_GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_29")
      SetFlag(Flag.FE704, true)
    end
    SetFlag(Flag.FE705, true)
  end
  CmdStartTravelDoor()
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  DestroyPartyClone()
  SetDispMiniMap(true)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 0, 0)
  ChangeMap("MAPLIST_D22R0101", "FromSnake", ORIENTATION_DOWN, true)
  EventEnd(eventInfo, "")
end
