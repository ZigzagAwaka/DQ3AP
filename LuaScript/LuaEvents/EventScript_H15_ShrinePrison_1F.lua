print("Load Script EventScript_H15_ShrinePrison_1F")

local AP = require("Src/DQ3AP") -- AP

local _ground1 = 480
local _ground2 = 100
local _event2DoorCenterPos = {
  X = 650,
  Y = 460,
  Z = _ground2
}
local _event2DoorCenterPos2 = {
  X = _event2DoorCenterPos.X + 200,
  Y = _event2DoorCenterPos.Y,
  Z = _ground2
}
local _event2Party1Pos = {
  X = 1100,
  Y = _event2DoorCenterPos.Y,
  Z = _ground2
}
local _event2Party2Pos = {
  X = _event2Party1Pos.X - 100,
  Y = _event2Party1Pos.Y - 100,
  Z = _ground2
}
local _event2Party3Pos = {
  X = _event2Party1Pos.X - 100,
  Y = _event2Party1Pos.Y + 100,
  Z = _ground2
}
local _event2Party4Pos = {
  X = _event2Party1Pos.X - 200,
  Y = _event2Party1Pos.Y,
  Z = _ground2
}
local _event3DoorCenterPos = {
  X = _event2DoorCenterPos.X,
  Y = 2550,
  Z = _ground2
}
local _event3DoorCenterPos2 = {
  X = _event3DoorCenterPos.X + 200,
  Y = _event3DoorCenterPos.Y,
  Z = _ground2
}
local _event3Party1Pos = {
  X = _event2Party1Pos.X,
  Y = _event3DoorCenterPos.Y,
  Z = _ground2
}
local _event3Party2Pos = {
  X = _event3Party1Pos.X - 100,
  Y = _event3Party1Pos.Y - 100,
  Z = _ground2
}
local _event3Party3Pos = {
  X = _event3Party1Pos.X - 100,
  Y = _event3Party1Pos.Y + 100,
  Z = _ground2
}
local _event3Party4Pos = {
  X = _event3Party1Pos.X - 200,
  Y = _event3Party1Pos.Y,
  Z = _ground2
}
local _ghostGreenPos = {
  X = 2900,
  Y = 1500,
  Z = _ground1
}
local _simon01Pos1 = {
  X = 1400,
  Y = 460,
  Z = _ground2
}
local _corpse02Pos = {
  X = 1660,
  Y = 2700,
  Z = 110
}
local _simon02MoveX = 100
local _simon02Pos1 = {
  X = _corpse02Pos.X,
  Y = 2600,
  Z = _ground2
}
local _simon02Pos2 = {
  X = _corpse02Pos.X - _simon02MoveX,
  Y = 2600,
  Z = _ground2
}
local _leaderMovePos = {
  X = _corpse02Pos.X - 150,
  Y = _corpse02Pos.Y - 20,
  Z = _corpse02Pos.Z
}
local _cameraOffsetZ = 100
local _cameraOffsetZ2 = 50
local _cameraPos = {
  X = _ghostGreenPos.X,
  Y = _ghostGreenPos.Y,
  Z = _ground1 + _cameraOffsetZ
}
local _camera1Pos = {
  X = _simon01Pos1.X,
  Y = _simon01Pos1.Y,
  Z = _ground2 + _cameraOffsetZ
}
local _camera2Pos = {
  X = _camera1Pos.X,
  Y = _simon02Pos1.Y,
  Z = _ground2 + _cameraOffsetZ
}
local _cameraDistance = 2000
local _cameraZoomDistance = -1000
local _cameraPitch = -25
local _cameraFocusMoveTime = 2
local _cameraFocusMoveTime2 = 3
local _cameraFadeFocusMoveTime = 1.5
local _opacityTime = 2
local _partyMoveSpeed = 200
local _simonMoveSpeed = 60
local _cameraEffectMemory1 = "Ev_H15_Screen_Memory_01"
local _cameraEffectMemory2 = "Ev_H15_Screen_Memory_02"

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function ShrinePrison_1F_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_ShrinePrison_1F_SUB_0_ACTOR_0110_010_1")
  EventEnd(eventInfo, "")
end

function ShrinePrison_1F_SUB_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_ShrinePrison_1F_SUB_0_ACTOR_0210_010_1")
  EventEnd(eventInfo, "")
end

function ShrinePrison_1F_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_ShrinePrison_1F_SUB_0_ACTOR_0310_010_1")
  EventEnd(eventInfo, "")
end

function ShrinePrison_1F_SUB_0_ACTOR_0410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_ShrinePrison_1F_SUB_0_ACTOR_0410_010_1")
  EventEnd(eventInfo, "")
end

function ShrinePrison_1F_MAIN_0_VOLUME_0510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  SetVisibleCoffin(false)
  local ghostGreen01 = ""
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    ghostGreen01 = "ShrinePrison_1F_Ghost_Green_01_L3"
  else
    ghostGreen01 = "ShrinePrison_1F_Ghost_Green_01_L1"
  end
  TurnParty(1, 2)
  Wait(0.1)
  CmdChangeStageCameraToGlobalPoint(_cameraPos.X, _cameraPos.Y, _cameraPos.Z, CAMERA_BLEND_EASE_IN_OUT, _cameraFocusMoveTime, 2, _cameraDistance, {
    Yaw = 0,
    Pitch = _cameraPitch,
    Roll = 0
  })
  CmdEventClosingMessage("NPC_Talk_ShrinePrison_1F_MAIN_0_VOLUME_0510_010_1")
  CmdChangeNpcOpacity(ghostGreen01, 0, _opacityTime, false)
  DestroyNpc(ghostGreen01)
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    ghostGreen01 = "ShrinePrison_1F_Ghost_Green_02_L3"
  else
    ghostGreen01 = "ShrinePrison_1F_Ghost_Green_02_L1"
  end
  SpawnNpc(ghostGreen01)
  SetFlag(Flag.FE846, true)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
  SetDispMiniMap(true)
  SetVisibleCoffin(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function ShrinePrison_1F_MAIN_0_VOLUME_0610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  SpawnPartyClone(true, true, true, true)
  local ghostGreen02 = ""
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    ghostGreen02 = "ShrinePrison_1F_Ghost_Green_02_L3"
  else
    ghostGreen02 = "ShrinePrison_1F_Ghost_Green_02_L1"
  end
  ChangeStageCameraToGlobalPoint(_camera1Pos.X, _camera1Pos.Y, _camera1Pos.Z, CAMERA_BLEND_EASE_IN_OUT, _cameraFocusMoveTime2, 2, _cameraDistance, {
    Yaw = 0,
    Pitch = _cameraPitch,
    Roll = 0
  })
  Wait(0.5)
  MoveNpc("Party1", {
    X = _event2Party1Pos.X,
    Y = _event2Party1Pos.Y,
    Z = 0
  }, _partyMoveSpeed)
  MoveNpc("Party2", {
    X = _event2DoorCenterPos.X,
    Y = _event2DoorCenterPos.Y,
    Z = 0
  }, _partyMoveSpeed)
  MoveNpc("Party3", {
    X = _event2DoorCenterPos.X,
    Y = _event2DoorCenterPos.Y,
    Z = 0
  }, _partyMoveSpeed)
  MoveNpc("Party4", {
    X = _event2DoorCenterPos.X,
    Y = _event2DoorCenterPos.Y,
    Z = 0
  }, _partyMoveSpeed)
  WaitMoveNpc("Party2")
  MoveNpc("Party2", {
    X = _event2DoorCenterPos2.X,
    Y = _event2DoorCenterPos2.Y,
    Z = 0
  }, _partyMoveSpeed)
  WaitMoveNpc("Party3")
  MoveNpc("Party3", {
    X = _event2DoorCenterPos2.X,
    Y = _event2DoorCenterPos2.Y,
    Z = 0
  }, _partyMoveSpeed)
  WaitMoveNpc("Party4")
  MoveNpc("Party4", {
    X = _event2DoorCenterPos2.X,
    Y = _event2DoorCenterPos2.Y,
    Z = 0
  }, _partyMoveSpeed)
  WaitMoveNpc("Party2")
  MoveNpc("Party2", {
    X = _event2Party2Pos.X,
    Y = _event2Party2Pos.Y,
    Z = 0
  }, _partyMoveSpeed)
  WaitMoveNpc("Party3")
  MoveNpc("Party3", {
    X = _event2Party3Pos.X,
    Y = _event2Party3Pos.Y,
    Z = 0
  }, _partyMoveSpeed)
  WaitMoveNpc("Party4")
  MoveNpc("Party4", {
    X = _event2Party4Pos.X,
    Y = _event2Party4Pos.Y,
    Z = 0
  }, _partyMoveSpeed)
  WaitMoveNpc("Party1")
  CmdTurnNpc("Party1", NPC_D_UP)
  WaitMoveNpc("Party2")
  CmdTurnNpc("Party2", NPC_D_UP)
  WaitMoveNpc("Party3")
  CmdTurnNpc("Party3", NPC_D_UP)
  WaitMoveNpc("Party4")
  CmdTurnNpc("Party4", NPC_D_UP)
  WaitStageCameraBlend()
  Wait(0.5)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_ShrinePrison_1F_MAIN_0_VOLUME_0610_010_1")
  CloseMessage()
  Wait(0.5)
  CmdSpawnMangaIcon(ghostGreen02, "FIELD_EFX2D_SURPRISE")
  CmdEventClosingMessage("NPC_Talk_ShrinePrison_1F_MAIN_0_VOLUME_0610_010_2")
  CloseMessage()
  SetFlag(Flag.FD8, true)
  Wait(1)
  local cameraEffectTime = 1.5
  PlaySEEvent("EVESE_HOBBITPRISON_MEMORY_POSI")
  ShowCameraEffect(_cameraEffectMemory1, cameraEffectTime)
  Wait(0.5)
  ChangeStageCameraToGlobalPoint(_camera1Pos.X, _camera1Pos.Y, _camera1Pos.Z, CAMERA_BLEND_EASE_IN_OUT, _cameraFadeFocusMoveTime, 2, _cameraDistance + _cameraZoomDistance, {
    Yaw = 0,
    Pitch = _cameraPitch,
    Roll = 0
  })
  Wait(cameraEffectTime)
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  WaitStageCameraBlend()
  HideCameraEffect(_cameraEffectMemory1, 0)
  DestroyPartyClone()
  ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
  if GetMapTimeFrame() == MAPTIME_DAYTIME then
    SetSysGlobal(SysGlobal.VD0, 8)
  elseif GetMapTimeFrame() == MAPTIME_EVENING then
    SetSysGlobal(SysGlobal.VD0, 18)
  elseif GetMapTimeFrame() == MAPTIME_NIGHT then
    SetSysGlobal(SysGlobal.VD0, 0)
  end
  ChangeMap("MAPLIST_H15R0102", "FromB1F", ORIENTATION_UP)
  EventEnd(eventInfo, "")
end

function ShrinePrison_1F_MAIN_2_After_Reminiscence()
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  SpawnPartyClone(true, true, true, true)
  SetNpcLocation("Party1", _event2Party1Pos)
  SetNpcLocation("Party2", _event2Party2Pos)
  SetNpcLocation("Party3", _event2Party3Pos)
  SetNpcLocation("Party4", _event2Party4Pos)
  Wait(0.1)
  CmdTurnNpc("Party1", NPC_D_UP)
  CmdTurnNpc("Party2", NPC_D_UP)
  CmdTurnNpc("Party3", NPC_D_UP)
  CmdTurnNpc("Party4", NPC_D_UP)
  local ghostGreen02 = ""
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    ghostGreen02 = "ShrinePrison_1F_Ghost_Green_02_L3"
  else
    ghostGreen02 = "ShrinePrison_1F_Ghost_Green_02_L1"
  end
  DestroyNpc(ghostGreen02)
  local simon01 = ""
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    simon01 = "ShrinePrison_1F_Simon_01_L3"
  else
    simon01 = "ShrinePrison_1F_Simon_01_L1"
  end
  SpawnNpc(simon01)
  CmdChangeStageCameraToGlobalPoint(_camera1Pos.X, _camera1Pos.Y, _camera1Pos.Z, CAMERA_BLEND_LINEAR, 0, 0, _cameraDistance, {
    Yaw = 0,
    Pitch = _cameraPitch,
    Roll = 0
  })
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 1.5, GetCurrentMapId())
  Wait(1.5)
  CmdChangeNpcOpacity(simon01, 0, _opacityTime, false)
  DestroyNpc(simon01)
  SetVisibleActor("BP_SearchEvent_H15_EF_Simon_Corpse_01", true)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_SHRINEPRISON_EnccountGhost, true)
  SetFlag(Flag.FD8, false)
  SetFlag(Flag.FE847, true)
  DestroyPartyClone()
  PartyMemberAlignment(ALIGNMENT_TOGETHER, ALIGNMENT_MOVE_WALK)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
end

function ShrinePrison_1F_MAIN_0_VOLUME_0710_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  SpawnPartyClone(true, true, true, true)
  ChangeStageCameraToGlobalPoint(_simon02Pos2.X, _simon02Pos2.Y, _simon02Pos2.Z + _cameraOffsetZ, CAMERA_BLEND_EASE_IN_OUT, _cameraFocusMoveTime2, 2, _cameraDistance, {
    Yaw = 0,
    Pitch = _cameraPitch,
    Roll = 0
  })
  Wait(0.5)
  MoveNpc("Party1", {
    X = _event3Party1Pos.X,
    Y = _event3Party1Pos.Y,
    Z = 0
  }, _partyMoveSpeed)
  MoveNpc("Party2", {
    X = _event3DoorCenterPos.X,
    Y = _event3DoorCenterPos.Y,
    Z = 0
  }, _partyMoveSpeed)
  MoveNpc("Party3", {
    X = _event3DoorCenterPos.X,
    Y = _event3DoorCenterPos.Y,
    Z = 0
  }, _partyMoveSpeed)
  MoveNpc("Party4", {
    X = _event3DoorCenterPos.X,
    Y = _event3DoorCenterPos.Y,
    Z = 0
  }, _partyMoveSpeed)
  WaitMoveNpc("Party2")
  MoveNpc("Party2", {
    X = _event3DoorCenterPos2.X,
    Y = _event3DoorCenterPos2.Y,
    Z = 0
  }, _partyMoveSpeed)
  WaitMoveNpc("Party3")
  MoveNpc("Party3", {
    X = _event3DoorCenterPos2.X,
    Y = _event3DoorCenterPos2.Y,
    Z = 0
  }, _partyMoveSpeed)
  WaitMoveNpc("Party4")
  MoveNpc("Party4", {
    X = _event3DoorCenterPos2.X,
    Y = _event3DoorCenterPos2.Y,
    Z = 0
  }, _partyMoveSpeed)
  WaitMoveNpc("Party2")
  MoveNpc("Party2", {
    X = _event3Party2Pos.X,
    Y = _event3Party2Pos.Y,
    Z = 0
  }, _partyMoveSpeed)
  WaitMoveNpc("Party3")
  MoveNpc("Party3", {
    X = _event3Party3Pos.X,
    Y = _event3Party3Pos.Y,
    Z = 0
  }, _partyMoveSpeed)
  WaitMoveNpc("Party4")
  MoveNpc("Party4", {
    X = _event3Party4Pos.X,
    Y = _event3Party4Pos.Y,
    Z = 0
  }, _partyMoveSpeed)
  WaitMoveNpc("Party1")
  CmdTurnNpc("Party1", NPC_D_UP)
  WaitMoveNpc("Party2")
  CmdTurnNpc("Party2", NPC_D_UP)
  WaitMoveNpc("Party3")
  CmdTurnNpc("Party3", NPC_D_UP)
  WaitMoveNpc("Party4")
  CmdTurnNpc("Party4", NPC_D_UP)
  WaitStageCameraBlend()
  local simon02 = ""
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    simon02 = "ShrinePrison_1F_Simon_02_L3"
  else
    simon02 = "ShrinePrison_1F_Simon_02_L1"
  end
  SpawnNpc(simon02)
  CmdChangeNpcOpacity(simon02, 0, 0, false)
  CmdChangeNpcOpacity(simon02, 1, _opacityTime, false)
  Wait(0.5)
  CmdMoveNpcRelative(simon02, {
    X = -_simon02MoveX,
    Y = 0,
    Z = 0
  }, _simonMoveSpeed)
  Wait(1)
  CmdSetNpcAnimation(simon02, AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, true)
  Wait(0.5)
  HideMessageWindowPageFeedIcon()
  CmdEventClosingMessage("NPC_Talk_ShrinePrison_1F_MAIN_0_VOLUME_0710_010_1")
  CloseMessage()
  Wait(1)
  SetFlag(Flag.FD9, true)
  local cameraEffectTime = 1.5
  PlaySEEvent("EVESE_HOBBITPRISON_MEMORY_NEGA")
  ShowCameraEffect(_cameraEffectMemory2, cameraEffectTime)
  Wait(0.5)
  ChangeStageCameraToGlobalPoint(_camera2Pos.X, _camera2Pos.Y, _camera2Pos.Z + _cameraOffsetZ2, CAMERA_BLEND_EASE_IN_OUT, _cameraFadeFocusMoveTime, 2, _cameraDistance + _cameraZoomDistance, {
    Yaw = 0,
    Pitch = _cameraPitch,
    Roll = 0
  })
  Wait(cameraEffectTime)
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  WaitStageCameraBlend()
  HideCameraEffect(_cameraEffectMemory2, 0)
  DestroyPartyClone()
  ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
  if GetMapTimeFrame() == MAPTIME_DAYTIME then
    SetSysGlobal(SysGlobal.VD0, 8)
  elseif GetMapTimeFrame() == MAPTIME_EVENING then
    SetSysGlobal(SysGlobal.VD0, 18)
  elseif GetMapTimeFrame() == MAPTIME_NIGHT then
    SetSysGlobal(SysGlobal.VD0, 0)
  end
  ChangeMap("MAPLIST_H15R0103", "FromFieldNorth", ORIENTATION_UP)
  EventEnd(eventInfo, "")
end

function ShrinePrison_1F_MAIN_3_After_Reminiscence()
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  SpawnPartyClone(true, true, true, true)
  SetNpcLocation("Party1", _event3Party1Pos)
  SetNpcLocation("Party2", _event3Party2Pos)
  SetNpcLocation("Party3", _event3Party3Pos)
  SetNpcLocation("Party4", _event3Party4Pos)
  Wait(0.1)
  CmdTurnNpc("Party1", NPC_D_UP)
  CmdTurnNpc("Party2", NPC_D_UP)
  CmdTurnNpc("Party3", NPC_D_UP)
  CmdTurnNpc("Party4", NPC_D_UP)
  local simon02 = ""
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    simon02 = "ShrinePrison_1F_Simon_02_L3"
  else
    simon02 = "ShrinePrison_1F_Simon_02_L1"
  end
  SpawnNpc(simon02)
  SetNpcLocation(simon02, _simon02Pos2)
  Wait(0.1)
  CmdSetNpcAnimation(simon02, AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, true)
  CmdChangeStageCameraToGlobalPoint(_camera2Pos.X, _camera2Pos.Y, _camera2Pos.Z + _cameraOffsetZ2, CAMERA_BLEND_LINEAR, 0, 0, _cameraDistance, {
    Yaw = 0,
    Pitch = _cameraPitch,
    Roll = 0
  })
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 1.5, GetCurrentMapId())
  Wait(1.5)
  CmdMessage("NPC_Talk_ShrinePrison_1F_MAIN_0_VOLUME_0710_010_13")
  ResetNpcAnimation(simon02)
  CmdTurnNpc(simon02, NPC_D_RIGHT)
  local tagItemId = "ITEM_EQUIP_WEAPON_MOUNTAINCLEAVER"
  SetTagItemId(tagItemId)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_ShrinePrison_1F_MAIN_0_VOLUME_0710_010_14")
  CloseMessage()
  CmdChangeNpcOpacity(simon02, 0, _opacityTime, false)
  DestroyNpc(simon02)
  Wait(1)
  ChangeStageCameraToGlobalPoint(_leaderMovePos.X, _leaderMovePos.Y, _camera2Pos.Z, CAMERA_BLEND_EASE_IN_OUT, 3, 2, _cameraDistance, {
    Yaw = 0,
    Pitch = _cameraPitch,
    Roll = 0
  })
  CmdMoveNpc("Party1", _leaderMovePos, _partyMoveSpeed)
  WaitStageCameraBlend()
  Wait(0.5)
  CmdMessage("NPC_Talk_ShrinePrison_1F_MAIN_0_VOLUME_0710_010_15")
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_ShrinePrison_1F_MAIN_0_VOLUME_0710_010_16")
  CloseMessage()
  SetVisibleActor("BP_SearchEvent_H15_EF_Simon_Corpse_01", false)
  tagItemId = "ITEM_EQUIP_WEAPON_MOUNTAINCLEAVER"
  SetTagItemId(tagItemId)
  ItemGetMessageToLocation("NPC_Talk_ShrinePrison_1F_MAIN_0_VOLUME_0710_010_17", "ITEM_ARCHIPELAGO"--[[tagItemId]], _corpse02Pos, false) -- AP
  -- AP
  AP.Log("ShrinePrison_1F_MAIN_3_After_Reminiscence called (Shrine of Shackles - Getting the Mountaincleaver)")
  AP.CheckLocation("ShrinePrison_1F_MAIN_3_After_Reminiscence")
  local ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
    AddItem(ItemId)
  else
    AddItem("ITEM_EQUIP_WEAPON_MOUNTAINCLEAVER")
  end
  -- AP end
  local GhostRed02 = ""
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    GhostRed02 = "ShrinePrison_1F_Ghost_Red_02_L3"
  else
    GhostRed02 = "ShrinePrison_1F_Ghost_Red_02_L1"
  end
  PlaySEEvent("EVESE_SOUL")
  SpawnNpc(GhostRed02)
  CmdChangeNpcOpacity(GhostRed02, 0, 0, false)
  CmdChangeNpcOpacityEmissive(GhostRed02, 1, _opacityTime)
  CmdChangeNpcOpacity(GhostRed02, 1, 0, false)
  CmdTurnNpc("Party1", NPC_D_UP)
  DestroyPartyClone()
  PartyMemberAlignment(ALIGNMENT_TOGETHER, ALIGNMENT_MOVE_WALK)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
  SetDispMiniMap(true)
  -- AP
  if ItemId == "ITEM_ARCHIPELAGO" then
  else
    SetFlag(Flag.FE72, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_SHRINEPRISON_GetGaiaSword, true)
  end
  -- AP end
  SetFlag(Flag.FD9, false)
  SetFlag(Flag.FE848, true)
  RequestAutoSaveFromEvent()
end

function ShrinePrison_1F_MAIN_0_ACTOR_0810_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local tagItemId = "ITEM_EQUIP_WEAPON_MOUNTAINCLEAVER"
  SetTagItemId(tagItemId)
  CmdEventClosingMessage("NPC_Talk_ShrinePrison_1F_MAIN_0_ACTOR_0810_010_1")
  EventEnd(eventInfo, "")
end

function ShrinePrison_1F_MAIN_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FD8) == true then
    ShrinePrison_1F_MAIN_2_After_Reminiscence()
  elseif GetFlag(Flag.FD9) == true then
    ShrinePrison_1F_MAIN_3_After_Reminiscence()
  else
    DisableEventFastForwardUI()
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  end
  EventEnd(eventInfo, "")
end
