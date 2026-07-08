print("Load Script EventScript_H21_WestPort_Out")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function WestPortOutStart()
  local arakure01 = "WestPort_Out_Arakure_01_L3"
  local partyNum = GetPartyMemberNum()
  local partyLivingNum = CheckLivingMemberNum()
  local groundZ = 300
  local pos1 = {
    X = 2300,
    Y = 900,
    Z = groundZ
  }
  local pos2 = {
    X = pos1.X + 150,
    Y = pos1.Y - 150,
    Z = groundZ
  }
  local pos3 = {
    X = pos1.X + 50,
    Y = pos1.Y + 130,
    Z = groundZ
  }
  local pos4 = {
    X = pos1.X - 250 + 20,
    Y = pos1.Y - 100,
    Z = groundZ
  }
  local cameraPos = {
    X = pos1.X,
    Y = pos1.Y,
    Z = groundZ + 100
  }
  local cameraDistance = 1500
  local cameraAngle = {
    Yaw = 0,
    Pitch = -10,
    Roll = 0
  }
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  SetPlayerLocation(pos1)
  Wait(0.1)
  TurnParty(1, 0)
  Wait(0.1)
  SpawnPartyCloneDisableSkill(true, true, true, true)
  SetNpcLocation("Party1", pos1)
  SetNpcLocation("Party2", pos2)
  SetNpcLocation("Party3", pos3)
  SetNpcLocation("Party4", pos4)
  Wait(0.1)
  CmdTurnNpc("Party2", NPC_D_UP)
  CmdTurnNpc("Party3", NPC_D_UP)
  CmdTurnNpc("Party4", NPC_D_UP)
  if partyLivingNum <= 2 then
    CmdTurnNpc("Party1", NPC_D_LOW)
  else
    CmdTurnNpc("Party1", NPC_D_RIGHT)
  end
  if 2 <= partyLivingNum then
    CmdTurnNpc("Party2", NPC_D_RIGHT)
  end
  if 3 <= partyLivingNum then
    CmdTurnNpc("Party3", NPC_D_LEFT)
  end
  if 4 <= partyLivingNum then
    CmdTurnNpc("Party4", NPC_D_LOW)
  end
  CmdChangeNpcOpacity(arakure01, 0, 0, false)
  CmdChangeStageCameraToGlobalPoint(cameraPos.X, cameraPos.Y, cameraPos.Z, 0, 0, 0, 2000, {
    Yaw = 0,
    Pitch = -15,
    Roll = 0
  })
  Wait(1)
  PlaySEEvent("EVESE_GIAGAPIT_LANDING_AFTER")
  SpawnEffectWorld("Ev_H21_LandingSmoke_01", pos1, {
    Yaw = 0,
    Pitch = 0,
    Roll = 0
  }, 1)
  SetSysInfo(SysInfo.TRANSITION_AMBIENT_CANCEL, 1)
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0, GetCurrentMapId())
  Wait(2)
  if 3 <= partyLivingNum then
    CmdMoveNpcRelativeDetail("Party3", {
      X = 20,
      Y = 0,
      Z = 0
    }, 1000, NPC_D_LEFT, AnimationType.Idle, 1)
    CmdMoveNpcRelativeDetail("Party3", {
      X = -30,
      Y = 0,
      Z = 0
    }, 1000, NPC_D_LEFT, AnimationType.Idle, 1)
    CmdMoveNpcRelativeDetail("Party3", {
      X = 30,
      Y = 0,
      Z = 0
    }, 1000, NPC_D_LEFT, AnimationType.Idle, 1)
    CmdMoveNpcRelativeDetail("Party3", {
      X = -30,
      Y = 0,
      Z = 0
    }, 1000, NPC_D_LEFT, AnimationType.Idle, 1)
    CmdMoveNpcRelativeDetail("Party3", {
      X = 30,
      Y = 0,
      Z = 0
    }, 1000, NPC_D_LEFT, AnimationType.Idle, 1)
    CmdMoveNpcRelativeDetail("Party3", {
      X = -20,
      Y = 0,
      Z = 0
    }, 1000, NPC_D_LEFT, AnimationType.Idle, 1)
    Wait(1)
  end
  if partyLivingNum == 2 then
    CmdTurnNpc("Party1", NPC_D_LEFT)
    Wait(0.6)
  end
  if 4 <= partyLivingNum then
    CmdTurnNpc("Party4", NPC_D_UP)
    Wait(0.6)
    MoveNpcRelative("Party4", {
      X = 100,
      Y = 0,
      Z = 0
    }, 100)
    Wait(0.4)
    CmdTurnNpc("Party2", NPC_D_LOW)
    WaitMoveNpc("Party4")
    Wait(0.4)
    CmdSpawnMangaIcon("Party4", "FIELD_EFX2D_MOYAMOYA")
    Wait(0.5)
  end
  if 3 <= partyLivingNum then
  elseif partyLivingNum == 2 then
    CmdSpawnMangaIcon("Party2", "FIELD_EFX2D_MOYAMOYA")
  else
    CmdSpawnMangaIcon("Party1", "FIELD_EFX2D_MOYAMOYA")
  end
  Wait(1)
  OpenDoor("BP_Door_Normal_01", true, "")
  Wait(0.5)
  SetNpcLocation(arakure01, {
    X = 4000,
    Y = 1040,
    Z = 350
  })
  Wait(0.1)
  CmdChangeNpcOpacity(arakure01, 1, 1, false)
  CmdTurnNpc("Party1", NPC_D_UP)
  if 2 <= partyLivingNum then
    Wait(0.2)
    CmdTurnNpc("Party2", NPC_D_UP)
  end
  if 3 <= partyLivingNum then
    CmdTurnNpc("Party3", NPC_D_UP)
    Wait(0.4)
  end
  if 4 <= partyLivingNum then
    CmdTurnNpc("Party4", NPC_D_UP)
  end
  Wait(0.5)
  CmdSpawnMangaIcon(arakure01, "FIELD_EFX2D_SURPRISE")
  Wait(0.5)
  local arakure01MoveX = 200
  MoveNpcRelative(arakure01, {
    X = -arakure01MoveX,
    Y = 0,
    Z = 0
  }, 100)
  CmdChangeStageCameraToGlobalPoint(cameraPos.X, cameraPos.Y, cameraPos.Z, CAMERA_BLEND_EASE_IN_OUT, 3, 2, cameraDistance, cameraAngle)
  WaitMoveNpc(arakure01)
  Wait(0.5)
  CmdMessage("NPC_Talk_WestPort_Out_MAIN_0_ACTOR_0120_010_1")
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_WestPort_Out_MAIN_0_ACTOR_0120_010_3")
  CloseMessage()
  Wait(0.5)
  CmdMoveNpcRelative(arakure01, {
    X = arakure01MoveX,
    Y = 0,
    Z = 0
  }, 100)
  CmdChangeNpcOpacity(arakure01, 0, 1, false)
  DestroyNpc(arakure01)
  if 2 <= partyLivingNum then
    CmdTurnNpc("Party2", NPC_D_RIGHT)
    Wait(0.4)
  end
  if 3 <= partyLivingNum then
    CmdTurnNpc("Party3", NPC_D_LEFT)
    Wait(0.5)
  end
  local partyMoveX = 300
  ChangeStageCameraToGlobalPoint(cameraPos.X + partyMoveX, cameraPos.Y, cameraPos.Z, CAMERA_BLEND_EASE_IN_OUT, 5, 2, cameraDistance, cameraAngle)
  MoveNpcRelative("Party1", {
    X = partyMoveX,
    Y = 20,
    Z = 0
  }, 100)
  Wait(0.2)
  if 2 <= partyNum then
    Wait(0.2)
    MoveNpcRelative("Party2", {
      X = partyMoveX,
      Y = 40,
      Z = 0
    }, 100)
  end
  if 3 <= partyNum then
    Wait(0.4)
    MoveNpcRelative("Party3", {
      X = partyMoveX,
      Y = 0,
      Z = 0
    }, 100)
  end
  if 4 <= partyNum then
    Wait(0.2)
    MoveNpcRelative("Party4", {
      X = partyMoveX,
      Y = 30,
      Z = 0
    }, 100)
  end
  Wait(0.5)
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  local playbackIdStairway = PlaySEEvent("EVESE_STAIRWAY")
  PlaySEEvent("EVESE_STAIRWAY")
  WaitPlaySound(playbackIdStairway)
  WaitStageCameraBlend()
  DestroyPartyClone()
  PartyMemberAlignment(ALIGNMENT_TOGETHER, ALIGNMENT_MOVE_WARP)
  CmdChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
  SetDispMiniMap(true)
  SetSysInfo(SysInfo.TRANSITION_AMBIENT_CANCEL, 0)
  ChangeMap("MAPLIST_H21R0101", "FromOutL", ORIENTATION_UP)
end

function WestPort_Out_SUB_0_ACTOR_0220_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_WestPort_Out_SUB_0_ACTOR_0220_010_1")
  CmdEventClosingMessage("NPC_Talk_WestPort_Out_SUB_0_ACTOR_0220_010_2")
  EventEnd(eventInfo, "", false)
end

function WestPort_Out_SUB_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_LAUGH")
  CmdEventClosingMessage("NPC_Talk_WestPort_Out_SUB_0_ACTOR_0210_010_1")
  EventEnd(eventInfo, "", false)
end

function WestPort_Out_SUB_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE832) == true and GetFlag(Flag.FE80) == false then
    WestPortOutStart()
  else
    DisableEventFastForwardUI()
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  end
  EventEnd(eventInfo, "", false)
end

function WestPort_Out_SearchEvent_ShipRamp(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE801) and GetFlag(Flag.FE34) and GetFlag(Flag.FE107) and GetFlag(Flag.FE106) and GetFlag(Flag.FE734) then -- AP: only access to the ship if the ship is unlocked
    SetVisibleActor("BP_SearchEvent_ShipTrap", false)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_WESTPORT_RideShip, true)
    local SE_Stairway = PlaySEEvent("EVESE_STAIRWAY")
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    WaitPlaySound(SE_Stairway)
    ChangeFieldShip("F_FromWestPort", ORIENTATION_PLAYER_START, true)
  end
  EventEnd(eventInfo, "")
end
