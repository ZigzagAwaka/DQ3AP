print("Load Script EventScript_D21_SecretTower_5F")

local AP = require("Src/DQ3AP") -- AP

function SecretTower_5F_MAIN_0_SCENE_0000_000(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  DisableEventFastForwardUI()
  print("\227\130\185\227\130\173\227\131\131\227\131\151\233\157\158\232\161\168\231\164\186")
  SetFlag(Flag.FF0, false)
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  EventEnd(eventInfo, "")
end

function SecretTower_5F_MAIN_0_VOLUME_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  RequestPreloadEventBattle("BATTLE_EVENT_BOSS_SECRET_XENLON_1")
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  ChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_EASE_IN_OUT, 1.5, 2, 3400, {
    Yaw = 0,
    Pitch = -16,
    Roll = 0
  })
  CmdMoveParty({
    X = 9100,
    Y = 3200,
    Z = 0
  })
  WaitStageCameraBlend()
  if GetFlag(Flag.FF0) == true then
    Cmd_XENLON_ReTalk()
  else
    SetFlag(Flag.FF0, true)
    SetFlag(Flag.FE231, true)
    SetFlag(Flag.FE235, false)
    SetFlag(Flag.FE236, false)
    SetFlag(Flag.FE237, false)
    SetFlag(Flag.FE342, false)
    SetFlag(Flag.FE343, false)
    SetFlag(Flag.FE344, false)
    SetFlag(Flag.FE345, false)
    StopBGM(0.5)
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    Wait(0.1)
    EndSkillInvisibleNoEffect()
    EndSkillTransformNoEffect()
    SetVisibleCoffin(false)
    FadeIn(EFadingPriorityTopMost, 0.5)
    CmdPlayEventSequence(0)
    CmdFadeOut(EFadingPriorityTopMost, 0)
    Wait(0.1)
    SetNicolaApertureRate(100, 0)
    SetDispMiniMap(false)
    CmdChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_LINEAR, 0, 2, 3400, {
      Yaw = 0,
      Pitch = -16,
      Roll = 0
    })
    local party1 = "Party1"
    local party2 = "Party2"
    local party3 = "Party3"
    local party4 = "Party4"
    SpawnPartyCloneDisableSkill(true, true, true, true)
    SetNpcLocation(party1, {
      X = 9100,
      Y = 3200,
      Z = 10150
    })
    SetNpcLocation(party2, {
      X = 8950,
      Y = 3050,
      Z = 10150
    })
    SetNpcLocation(party3, {
      X = 8950,
      Y = 3350,
      Z = 10150
    })
    SetNpcLocation(party4, {
      X = 8800,
      Y = 3200,
      Z = 10150
    })
    WaitFrame(1)
    TurnNpc(party1, NPC_D_UP)
    TurnNpc(party2, NPC_D_UP)
    TurnNpc(party3, NPC_D_UP)
    TurnNpc(party4, NPC_D_UP)
    SpawnNpc("SecretTower_5F_Xenlon_01_L1")
    CmdFadeIn(EFadingPriorityTopMost, 0.5)
    PlayBGM(GetCurrentMapBgmId(), 0.5)
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_010_1")
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_010_2")
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_010_3")
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_010_4")
    local result = CmdChoiceMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_010_5")
    if result then
      CloseMessage()
      SetNpcAnimation("SecretTower_5F_Xenlon_01_L1", AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, false)
      Wait(0.51)
      PlaySEEvent("EVESE_SECRETTOWER_SHENRON_CRY")
      Wait(0.25)
      ChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_LINEAR, 0.06, 2, 2000, {
        Yaw = 0,
        Pitch = -16,
        Roll = 0
      })
      PlayCameraShake("Event_Large", 1)
      Wait(0.8)
      WaitAnimNpc("SecretTower_5F_Xenlon_01_L1")
      SetFlag(Flag.FE232, true)
      CmdStartEventBattle("BATTLE_EVENT_BOSS_SECRET_XENLON_1")
      DestroyPartyClone()
    else
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_030_1")
      CmdEventClosingMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_030_2")
      DestroyPartyClone()
      ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
      MoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1", true, 600, 1.5, EEasingFuncEaseOut, 2)
      PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_DASH)
      Wait(0.3)
      MoveParty({
        X = 8150,
        Y = 3200,
        Z = 0
      })
      SetVisibleCoffin(true)
      SetDispMiniMap(true)
      WaitMoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1")
      DestroyNpc("SecretTower_5F_Xenlon_01_L1")
      WaitMoveParty()
      WaitStageCameraBlend()
      RequestAutoSaveFromEvent()
    end
  end
  EventEnd(eventInfo, "")
end

function SecretTower_5F_MAIN_0_VOLUME_0020_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  RequestPreloadEventBattle("BATTLE_EVENT_BOSS_SECRET_XENLON_1")
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  ChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_EASE_IN_OUT, 1.5, 2, 3400, {
    Yaw = 0,
    Pitch = -16,
    Roll = 0
  })
  local party1 = "Party1"
  local party2 = "Party2"
  local party3 = "Party3"
  local party4 = "Party4"
  SpawnPartyCloneDisableSkill(true, true, true, true)
  MoveNpc(party1, {
    X = 9100,
    Y = 3200,
    Z = 0
  }, 300)
  MoveNpc(party2, {
    X = 8950,
    Y = 3050,
    Z = 0
  }, 300)
  MoveNpc(party3, {
    X = 8950,
    Y = 3350,
    Z = 0
  }, 300)
  MoveNpc(party4, {
    X = 8800,
    Y = 3200,
    Z = 0
  }, 300)
  WaitMoveNpc(party1)
  TurnNpc(party1, NPC_D_UP)
  WaitMoveNpc(party2)
  TurnNpc(party2, NPC_D_UP)
  WaitMoveNpc(party3)
  TurnNpc(party3, NPC_D_UP)
  WaitMoveNpc(party4)
  TurnNpc(party4, NPC_D_UP)
  WaitStageCameraBlend()
  if GetFlag(Flag.FF0) == true then
    Cmd_XENLON_ReTalk()
  else
    SetFlag(Flag.FF0, true)
    SetNicolaApertureRate(100, 0)
    SetDispMiniMap(false)
    SpawnNpc("SecretTower_5F_Xenlon_01_L1")
    CmdMoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1", false, 800, 3, EEasingFuncEaseInOut, 2)
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0020_010_1")
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0020_010_2")
    local result = CmdChoiceMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0020_010_3")
    if result then
      CloseMessage()
      SetNpcAnimation("SecretTower_5F_Xenlon_01_L1", AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, false)
      Wait(0.51)
      PlaySEEvent("EVESE_SECRETTOWER_SHENRON_CRY")
      Wait(0.25)
      ChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_LINEAR, 0.02, 2, 2400, {
        Yaw = 0,
        Pitch = -16,
        Roll = 0
      })
      ChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_LINEAR, 0.06, 2, 2000, {
        Yaw = 0,
        Pitch = -16,
        Roll = 0
      })
      PlayCameraShake("Event_Large", 1)
      Wait(0.8)
      WaitAnimNpc("SecretTower_5F_Xenlon_01_L1")
      SetFlag(Flag.FE232, true)
      CmdStartEventBattle("BATTLE_EVENT_BOSS_SECRET_XENLON_1")
      DestroyPartyClone()
    else
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_030_1")
      CmdEventClosingMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_030_2")
      DestroyPartyClone()
      ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
      MoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1", true, 600, 1.5, EEasingFuncEaseOut, 2)
      PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_DASH)
      Wait(0.3)
      MoveParty({
        X = 8150,
        Y = 3200,
        Z = 0
      })
      SetVisibleCoffin(true)
      SetDispMiniMap(true)
      WaitMoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1")
      DestroyNpc("SecretTower_5F_Xenlon_01_L1")
      WaitMoveParty()
      WaitStageCameraBlend()
      RequestAutoSaveFromEvent()
    end
  end
  EventEnd(eventInfo, "")
end

function SecretTower_5F_MAIN_0_VOLUME_0030_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  RequestPreloadEventBattle("BATTLE_EVENT_BOSS_SECRET_XENLON_1")
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  ChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_EASE_IN_OUT, 1.5, 2, 3400, {
    Yaw = 0,
    Pitch = -16,
    Roll = 0
  })
  local party1 = "Party1"
  local party2 = "Party2"
  local party3 = "Party3"
  local party4 = "Party4"
  SpawnPartyCloneDisableSkill(true, true, true, true)
  MoveNpc(party1, {
    X = 9100,
    Y = 3200,
    Z = 0
  }, 300)
  MoveNpc(party2, {
    X = 8950,
    Y = 3050,
    Z = 0
  }, 300)
  MoveNpc(party3, {
    X = 8950,
    Y = 3350,
    Z = 0
  }, 300)
  MoveNpc(party4, {
    X = 8800,
    Y = 3200,
    Z = 0
  }, 300)
  WaitMoveNpc(party1)
  TurnNpc(party1, NPC_D_UP)
  WaitMoveNpc(party2)
  TurnNpc(party2, NPC_D_UP)
  WaitMoveNpc(party3)
  TurnNpc(party3, NPC_D_UP)
  WaitMoveNpc(party4)
  TurnNpc(party4, NPC_D_UP)
  WaitStageCameraBlend()
  if GetFlag(Flag.FF0) == true then
    Cmd_XENLON_ReTalk()
  else
    SetFlag(Flag.FF0, true)
    SetNicolaApertureRate(100, 0)
    SetDispMiniMap(false)
    SpawnNpc("SecretTower_5F_Xenlon_01_L1")
    CmdMoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1", false, 800, 3, EEasingFuncEaseInOut, 2)
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0030_010_1")
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0030_010_2")
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0030_010_3")
    local result = CmdChoiceMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0030_010_4")
    if result then
      CloseMessage()
      SetNpcAnimation("SecretTower_5F_Xenlon_01_L1", AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, false)
      Wait(0.51)
      PlaySEEvent("EVESE_SECRETTOWER_SHENRON_CRY")
      Wait(0.25)
      ChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_LINEAR, 0.02, 2, 2400, {
        Yaw = 0,
        Pitch = -16,
        Roll = 0
      })
      ChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_LINEAR, 0.06, 2, 2000, {
        Yaw = 0,
        Pitch = -16,
        Roll = 0
      })
      PlayCameraShake("Event_Large", 1)
      Wait(0.8)
      WaitAnimNpc("SecretTower_5F_Xenlon_01_L1")
      CmdStartEventBattle("BATTLE_EVENT_BOSS_SECRET_XENLON_1")
      DestroyPartyClone()
    else
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_030_1")
      CmdEventClosingMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_030_2")
      DestroyPartyClone()
      ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
      MoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1", true, 600, 1.5, EEasingFuncEaseOut, 2)
      PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_DASH)
      Wait(0.3)
      MoveParty({
        X = 8150,
        Y = 3200,
        Z = 0
      })
      SetVisibleCoffin(true)
      SetDispMiniMap(true)
      WaitMoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1")
      DestroyNpc("SecretTower_5F_Xenlon_01_L1")
      WaitMoveParty()
      WaitStageCameraBlend()
      RequestAutoSaveFromEvent()
    end
  end
  EventEnd(eventInfo, "")
end

function SecretTower_5F_MAIN_0_VOLUME_0040_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  RequestPreloadEventBattle("BATTLE_EVENT_BOSS_SECRET_XENLON_1")
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  ChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_EASE_IN_OUT, 1.5, 2, 3400, {
    Yaw = 0,
    Pitch = -16,
    Roll = 0
  })
  local party1 = "Party1"
  local party2 = "Party2"
  local party3 = "Party3"
  local party4 = "Party4"
  SpawnPartyCloneDisableSkill(true, true, true, true)
  MoveNpc(party1, {
    X = 9100,
    Y = 3200,
    Z = 0
  }, 300)
  MoveNpc(party2, {
    X = 8950,
    Y = 3050,
    Z = 0
  }, 300)
  MoveNpc(party3, {
    X = 8950,
    Y = 3350,
    Z = 0
  }, 300)
  MoveNpc(party4, {
    X = 8800,
    Y = 3200,
    Z = 0
  }, 300)
  WaitMoveNpc(party1)
  TurnNpc(party1, NPC_D_UP)
  WaitMoveNpc(party2)
  TurnNpc(party2, NPC_D_UP)
  WaitMoveNpc(party3)
  TurnNpc(party3, NPC_D_UP)
  WaitMoveNpc(party4)
  TurnNpc(party4, NPC_D_UP)
  WaitStageCameraBlend()
  if GetFlag(Flag.FF0) == true then
    Cmd_XENLON_ReTalk()
  else
    SetFlag(Flag.FF0, true)
    SetNicolaApertureRate(100, 0)
    SetDispMiniMap(false)
    SpawnNpc("SecretTower_5F_Xenlon_01_L1")
    CmdMoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1", false, 800, 3, EEasingFuncEaseInOut, 2)
    Cmd_Set_XENLON_TurnLimit(...)
    SetTagValue(GetSysInfo(SysInfo.VE0))
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0040_010_1")
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0040_010_2")
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0040_010_3")
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0040_010_4")
    local result = CmdChoiceMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0040_010_5")
    if result then
      CloseMessage()
      SetNpcAnimation("SecretTower_5F_Xenlon_01_L1", AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, false)
      Wait(0.51)
      PlaySEEvent("EVESE_SECRETTOWER_SHENRON_CRY")
      Wait(0.25)
      ChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_LINEAR, 0.02, 2, 2400, {
        Yaw = 0,
        Pitch = -16,
        Roll = 0
      })
      ChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_LINEAR, 0.06, 2, 2000, {
        Yaw = 0,
        Pitch = -16,
        Roll = 0
      })
      PlayCameraShake("Event_Large", 1)
      Wait(0.8)
      WaitAnimNpc("SecretTower_5F_Xenlon_01_L1")
      CmdStartEventBattle("BATTLE_EVENT_BOSS_SECRET_XENLON_1")
      DestroyPartyClone()
    else
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_030_1")
      CmdEventClosingMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_030_2")
      DestroyPartyClone()
      ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
      MoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1", true, 600, 1.5, EEasingFuncEaseOut, 2)
      PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_DASH)
      Wait(0.3)
      MoveParty({
        X = 8150,
        Y = 3200,
        Z = 0
      })
      SetVisibleCoffin(true)
      SetDispMiniMap(true)
      WaitMoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1")
      DestroyNpc("SecretTower_5F_Xenlon_01_L1")
      WaitMoveParty()
      WaitStageCameraBlend()
      RequestAutoSaveFromEvent()
    end
  end
  EventEnd(eventInfo, "")
end

function SecretTower_5F_MAIN_0_VOLUME_0050_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  RequestPreloadEventBattle("BATTLE_EVENT_BOSS_SECRET_XENLON_1")
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  ChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_EASE_IN_OUT, 1.5, 2, 3400, {
    Yaw = 0,
    Pitch = -16,
    Roll = 0
  })
  local party1 = "Party1"
  local party2 = "Party2"
  local party3 = "Party3"
  local party4 = "Party4"
  SpawnPartyCloneDisableSkill(true, true, true, true)
  MoveNpc(party1, {
    X = 9100,
    Y = 3200,
    Z = 0
  }, 300)
  MoveNpc(party2, {
    X = 8950,
    Y = 3050,
    Z = 0
  }, 300)
  MoveNpc(party3, {
    X = 8950,
    Y = 3350,
    Z = 0
  }, 300)
  MoveNpc(party4, {
    X = 8800,
    Y = 3200,
    Z = 0
  }, 300)
  WaitMoveNpc(party1)
  TurnNpc(party1, NPC_D_UP)
  WaitMoveNpc(party2)
  TurnNpc(party2, NPC_D_UP)
  WaitMoveNpc(party3)
  TurnNpc(party3, NPC_D_UP)
  WaitMoveNpc(party4)
  TurnNpc(party4, NPC_D_UP)
  WaitStageCameraBlend()
  if GetFlag(Flag.FF0) == true then
    Cmd_XENLON_ReTalk()
  else
    SetFlag(Flag.FF0, true)
    SetNicolaApertureRate(100, 0)
    SetDispMiniMap(false)
    SpawnNpc("SecretTower_5F_Xenlon_01_L1")
    CmdMoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1", false, 800, 3, EEasingFuncEaseInOut, 2)
    Cmd_Set_XENLON_TurnLimit(...)
    SetTagValue(GetSysInfo(SysInfo.VE0))
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0050_010_1")
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0050_010_2")
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0050_010_3")
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0050_010_4")
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0050_010_5")
    local result = CmdChoiceMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0050_010_6")
    if result then
      CloseMessage()
      SetNpcAnimation("SecretTower_5F_Xenlon_01_L1", AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, false)
      Wait(0.51)
      PlaySEEvent("EVESE_SECRETTOWER_SHENRON_CRY")
      Wait(0.25)
      ChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_LINEAR, 0.02, 2, 2400, {
        Yaw = 0,
        Pitch = -16,
        Roll = 0
      })
      ChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_LINEAR, 0.06, 2, 2000, {
        Yaw = 0,
        Pitch = -16,
        Roll = 0
      })
      PlayCameraShake("Event_Large", 1)
      Wait(0.8)
      WaitAnimNpc("SecretTower_5F_Xenlon_01_L1")
      CmdStartEventBattle("BATTLE_EVENT_BOSS_SECRET_XENLON_1")
      DestroyPartyClone()
    else
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_030_1")
      CmdEventClosingMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_030_2")
      DestroyPartyClone()
      ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
      MoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1", true, 600, 1.5, EEasingFuncEaseOut, 2)
      PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_DASH)
      Wait(0.3)
      MoveParty({
        X = 8150,
        Y = 3200,
        Z = 0
      })
      SetVisibleCoffin(true)
      SetDispMiniMap(true)
      WaitMoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1")
      DestroyNpc("SecretTower_5F_Xenlon_01_L1")
      WaitMoveParty()
      WaitStageCameraBlend()
      RequestAutoSaveFromEvent()
    end
  end
  EventEnd(eventInfo, "")
end

function Cmd_XENLON_ReTalk(...)
  SpawnNpc("SecretTower_5F_Xenlon_01_L1")
  CmdMoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1", false, 800, 3, EEasingFuncEaseInOut, 2)
  CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_020_1")
  CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_020_2")
  local result = CmdChoiceMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_020_3")
  if result then
    CloseMessage()
    SetNpcAnimation("SecretTower_5F_Xenlon_01_L1", AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, false)
    Wait(0.51)
    PlaySEEvent("EVESE_SECRETTOWER_SHENRON_CRY")
    Wait(0.25)
    ChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_LINEAR, 0.02, 2, 2400, {
      Yaw = 0,
      Pitch = -16,
      Roll = 0
    })
    ChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_LINEAR, 0.06, 2, 2000, {
      Yaw = 0,
      Pitch = -16,
      Roll = 0
    })
    PlayCameraShake("Event_Large", 1)
    Wait(0.8)
    WaitAnimNpc("SecretTower_5F_Xenlon_01_L1")
    SetFlag(Flag.FE232, true)
    CmdStartEventBattle("BATTLE_EVENT_BOSS_SECRET_XENLON_1")
    DestroyPartyClone()
  else
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_030_1")
    CmdEventClosingMessage("NPC_Talk_SecretTower_5F_MAIN_0_VOLUME_0010_030_2")
    DestroyPartyClone()
    ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
    MoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1", true, 600, 1.5, EEasingFuncEaseOut, 2)
    PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_DASH)
    Wait(0.3)
    MoveParty({
      X = 8150,
      Y = 3200,
      Z = 0
    })
    SetVisibleCoffin(true)
    SetDispMiniMap(true)
    WaitMoveUpOrDownInterpolateNpc("SecretTower_5F_Xenlon_01_L1")
    DestroyNpc("SecretTower_5F_Xenlon_01_L1")
    WaitMoveParty()
    WaitStageCameraBlend()
    RequestAutoSaveFromEvent()
  end
end

function Cmd_Set_XENLON_TurnLimit(...)
  if GetFlag(Flag.FE864) == true then
    SetSysInfo(SysInfo.VE0, 15)
  elseif GetFlag(Flag.FE863) == true then
    SetSysInfo(SysInfo.VE0, 15)
  elseif GetFlag(Flag.FE234) == true then
    SetSysInfo(SysInfo.VE0, 25)
  else
    SetSysInfo(SysInfo.VE0, 35)
  end
end

function SecretTower_5F_MAIN_0_BATTLE_END_0100_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  local Xenlon = "SecretTower_5F_Xenlon_01_L1"
  SpawnNpc(Xenlon)
  local party1 = "Party1"
  local party2 = "Party2"
  local party3 = "Party3"
  local party4 = "Party4"
  SpawnPartyCloneDisableSkill(true, true, true, true)
  SetNpcLocation(party1, {
    X = 9100,
    Y = 3200,
    Z = 10150
  })
  SetNpcLocation(party2, {
    X = 8950,
    Y = 3050,
    Z = 10150
  })
  SetNpcLocation(party3, {
    X = 8950,
    Y = 3350,
    Z = 10150
  })
  SetNpcLocation(party4, {
    X = 8800,
    Y = 3200,
    Z = 10150
  })
  WaitFrame(1)
  TurnNpc(party1, NPC_D_UP)
  TurnNpc(party2, NPC_D_UP)
  TurnNpc(party3, NPC_D_UP)
  TurnNpc(party4, NPC_D_UP)
  CmdChangeStageCameraToGlobalPoint(9600, 3200, 10350, CAMERA_BLEND_LINEAR, 0, 2, 3400, {
    Yaw = 0,
    Pitch = -16,
    Roll = 0
  })
  CmdFadeInAfterEventBattle()
  SetFlag(Flag.FE233, true)
  Cmd_Set_XENLON_TurnLimit(...)
  SetTagValue(GetSysInfo(SysInfo.VE0))
  local LastBattleTurn = GetLastBattleTurn()
  SetTagValue(LastBattleTurn + 1)
  if LastBattleTurn >= GetSysInfo(SysInfo.VE0) then
    if LastBattleTurn >= GetSysInfo(SysInfo.VE0) + 5 then
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0100_010_1")
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0100_010_2")
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0100_010_3")
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0100_010_4")
      CmdEventClosingMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0100_010_5")
    else
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0100_020_1")
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0100_020_2")
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0100_020_3")
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0100_020_4")
      CmdEventClosingMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0100_020_5")
    end
  else
    if GetFlag(Flag.FE234) == false then
      SetFlag(Flag.FE234, true)
    elseif GetFlag(Flag.FE863) == false then
      SetFlag(Flag.FE863, true)
    elseif GetFlag(Flag.FE864) == false then
      SetFlag(Flag.FE864, true)
    end
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0100_030_1")
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0100_030_2")
    CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0100_030_3")
    local result = false
    local XenlonWishItem
    while result == false do
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0100_030_4")
      CmdCallXenlonWishUI()
      XenlonWishItem = GetXenlonWishItem()
      if XenlonWishItem == XENLONWISHITEM_ORTEGA then
        result = CmdChoiceMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0110_010_1")
      elseif XenlonWishItem == XENLONWISHITEM_NAUGHTY_BOOK then
        SetTagItemId("ITEM_USE_ITEM_NAUGHTY_BOOK")
        if GetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_Xenlon_Hbook_1) ~= true then
          result = CmdChoiceMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0120_010_1")
        else
          result = CmdChoiceMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0120_020_1")
        end
      elseif XenlonWishItem == XENLONWISHITEM_VERYNAUGHTY_BOOK then
        SetTagItemId("ITEM_IMPORTANT_VERY_NAUGHTY_BOOK")
        result = CmdChoiceMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0130_010_1")
      elseif XenlonWishItem == XENLONWISHITEM_BATTLEROAD then
        result = CmdChoiceMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0140_010_1")
      elseif XenlonWishItem == XENLONWISHITEM_LOOKS_CHANGE then
        result = CmdChoiceMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0150_010_1")
      elseif XenlonWishItem == XENLONWISHITEM_RUBISSS then
        result = CmdChoiceMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0160_010_1")
      elseif XenlonWishItem == XENLONWISHITEM_EXDUNGEON then
        result = CmdChoiceMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0170_010_1")
        if result then
          result = CmdChoiceMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0170_010_2")
        end
      end
    end
    if XenlonWishItem == XENLONWISHITEM_ORTEGA then
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_Xenlon_Ortega, true)
      CheckAllGrant()
      SetFlag(Flag.FE236, true)
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0110_010_2")
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0110_010_3")
      CmdEventClosingMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0110_010_4")
    elseif XenlonWishItem == XENLONWISHITEM_NAUGHTY_BOOK then
      if GetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_Xenlon_Hbook_1) ~= true then
        SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_Xenlon_Hbook_1, true)
        CheckAllGrant()
        SetFlag(Flag.FE237, true)
        -- AP
        AP.Log("SecretTower_5F_MAIN_0_BATTLE_END_0100_010 called (Citadel Tower - Xenion wish: Guns N' Buns)")
        AP.CheckLocation("SecretTower_5F_MAIN_0_BATTLE_END_0100_010_WISH_BOOK_1")
        local ItemId = "ITEM_ARCHIPELAGO"
        if ItemId == "ITEM_ARCHIPELAGO" then
          AddItem(ItemId)
        else
          AddItem("ITEM_USE_ITEM_NAUGHTY_BOOK")
        end
        -- AP end
        CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0120_010_2")
        CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0120_010_3")
        ItemGetMessageToActor("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0120_010_4", "ITEM_ARCHIPELAGO"--[["ITEM_USE_ITEM_NAUGHTY_BOOK"]], Xenlon) -- AP
        CmdEventClosingMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0120_010_5")
      else
        local receptor = AddItem("ITEM_USE_ITEM_NAUGHTY_BOOK")
        CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0120_020_2")
        CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0120_020_3")
        ItemGetMessageToActor("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0120_020_4", "ITEM_USE_ITEM_NAUGHTY_BOOK", Xenlon)
        CmdEventClosingMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0120_020_5")
      end
    elseif XenlonWishItem == XENLONWISHITEM_VERYNAUGHTY_BOOK then
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_Xenlon_Hbook_2, true)
      CheckAllGrant()
      -- AP
      AP.Log("SecretTower_5F_MAIN_0_BATTLE_END_0100_010 called (Citadel Tower - Xenion wish: More Buns N' Guns)")
      AP.CheckLocation("SecretTower_5F_MAIN_0_BATTLE_END_0100_010_WISH_BOOK_2")
      local ItemId = "ITEM_ARCHIPELAGO"
      if ItemId == "ITEM_ARCHIPELAGO" then
        AddItem(ItemId)
      else
        SetFlag(Flag.FE344, true)
        AddItem("ITEM_IMPORTANT_VERY_NAUGHTY_BOOK")
      end
      -- AP end
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0130_010_2")
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0130_010_3")
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0130_010_4")
      ShowCameraEffect("Ev_D21_Screen_PuffPuff_01", 0)
      ItemGetMessageToActor("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0130_010_5", "ITEM_ARCHIPELAGO"--[["ITEM_IMPORTANT_VERY_NAUGHTY_BOOK"]], Xenlon) -- AP
      HideCameraEffect("Ev_D21_Screen_PuffPuff_01", 0.5)
      CmdEventClosingMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0130_010_6")
    elseif XenlonWishItem == XENLONWISHITEM_BATTLEROAD then
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_Xenlon_NewMBR, true)
      CheckAllGrant()
      SetFlag(Flag.FE235, true)
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0140_010_2")
      CmdEventClosingMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0140_010_3")
    elseif XenlonWishItem == XENLONWISHITEM_LOOKS_CHANGE then
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_Xenlon_Looks, true)
      CheckAllGrant()
      SetFlag(Flag.FE342, true)
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0150_010_2")
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0150_010_3")
      CmdEventClosingMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0150_010_4")
    elseif XenlonWishItem == XENLONWISHITEM_RUBISSS then
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_Xenlon_RubissSword, true)
      CheckAllGrant()
      SetFlag(Flag.FE343, true)
      -- AP
      AP.Log("SecretTower_5F_MAIN_0_BATTLE_END_0100_010 called (Citadel Tower - Xenion wish: Powerful Weapon)")
      AP.CheckLocation("SecretTower_5F_MAIN_0_BATTLE_END_0100_010_WISH_SWORD")
      local ItemId = "ITEM_ARCHIPELAGO"
      if ItemId == "ITEM_ARCHIPELAGO" then
        AddItem(ItemId)
      else
        AddItem("ITEM_EQUIP_WEAPON_RUBISSS_SWORD")
      end
      -- AP end
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0160_010_2")
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0160_010_3")
      ItemGetMessageToActor("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0160_010_4", "ITEM_ARCHIPELAGO"--[["ITEM_EQUIP_WEAPON_RUBISSS_SWORD"]], Xenlon) -- AP
      CmdEventClosingMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0160_010_5")
    elseif XenlonWishItem == XENLONWISHITEM_EXDUNGEON then
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_Xenlon_NewDungeon, true)
      CheckAllGrant()
      SetFlag(Flag.FE345, true)
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0170_010_3")
      CmdMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0170_010_4")
      CmdEventClosingMessage("NPC_Talk_SecretTower_5F_MAIN_0_BATTLE_END_0170_010_5")
    end
  end
  SpawnEffectWorld("Ev_D21_Light_01", {
    X = 9600,
    Y = 3200,
    Z = 10300
  }, {
    Yaw = 0,
    Pitch = 0,
    Roll = 0
  }, 1)
  ChangeNpcOpacity("SecretTower_5F_Xenlon_01_L1", 0, 3, false)
  Wait(0.75)
  CmdStartTravelDoor()
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  DestroyPartyClone()
  SetVisibleCoffin(true)
  SetDispMiniMap(true)
  ChangeMap("MAPLIST_C09R0103", "FromXenlon", ORIENTATION_DOWN, true)
  EventEnd(eventInfo, "")
end

function CheckAllGrant()
  if GetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_Xenlon_NewMBR) == true and GetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_Xenlon_Ortega) == true and GetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_Xenlon_Looks) == true and GetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_Xenlon_RubissSword) == true and GetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_Xenlon_Hbook_1) == true and GetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_Xenlon_Hbook_2) == true and GetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_Xenlon_NewDungeon) == true then
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_SECRETTOWER_AllGrant, true)
    RequestUnlockAchievementByXenlon()
  end
end
