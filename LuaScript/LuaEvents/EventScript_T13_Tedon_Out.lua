print("Load Script EventScript_T13_Tedon_Out")
local _movePartySpeed = 200

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Tedon_Out_MAIN_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    if GetFlag(Flag.FE936) == false then
      PlayLocationCamera(table)
      SetFlag(Flag.FE936, true)
    else
      DisableEventFastForwardUI()
      print("\227\130\185\227\130\173\227\131\131\227\131\151\233\157\158\232\161\168\231\164\186")
      CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
    end
  elseif GetFlag(Flag.FE908) == false then
    PlayLocationCamera(table)
    SetFlag(Flag.FE908, true)
  else
    DisableEventFastForwardUI()
    print("\227\130\185\227\130\173\227\131\131\227\131\151\233\157\158\232\161\168\231\164\186")
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  end
  if GetMapTimeFrame() == MAPTIME_NIGHT or GetFlag(Flag.FE146) == true then
  else
    SetFlag(Flag.FE146, true)
  end
  if GetFlag(Flag.FE128) == false then
    CheckBurg()
  end
  EventEnd(eventInfo, "")
end

function Tedon_Out_MAIN_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Common_Corpse_1")
  CmdMessage("NPC_Talk_Tedon_Out_MAIN_0_ACTOR_0110_010_1")
  CmdEventClosingMessage("NPC_Talk_Tedon_Out_MAIN_0_ACTOR_0110_010_2")
  EventEnd(eventInfo, "")
end

function Tedon_Out_MAIN_0_ACTOR_0110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Common_Corpse_1")
  CmdMessage("NPC_Talk_Tedon_Out_MAIN_0_ACTOR_0110_010_1")
  CmdEventClosingMessage("NPC_Talk_Tedon_Out_MAIN_0_ACTOR_0110_010_3")
  EventEnd(eventInfo, "")
end

function Tedon_Out_MAIN_0_VOLUME_0120_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  RequestPreloadEventBattle("BATTLE_EVENT_NEWBOSS_TEDON_1")
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  EndSkillTransformNoEffect()
  EndSkillInvisibleNoEffect()
  CmdPlayEventSequenceNextEventBattle(3)
  CmdStartEventBattle("BATTLE_EVENT_NEWBOSS_TEDON_1")
  EventEnd(eventInfo, "")
end

function Tedon_Out_MAIN_0_BATTLE_END_0120_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local prisoner01 = "Tedon_Out_Prisoner_01_L3"
  local prisoner01GhostRed = "Tedon_Out_Prisoner_01_L3_Ghost_Red"
  local groundZ = -400
  local pos1 = {
    X = 7500,
    Y = 3400,
    Z = groundZ
  }
  local pos2 = {
    X = pos1.X - 60,
    Y = pos1.Y - 100,
    Z = groundZ
  }
  local pos3 = {
    X = pos1.X - 80,
    Y = pos1.Y + 100,
    Z = groundZ
  }
  local pos4 = {
    X = pos1.X - 150,
    Y = pos1.Y - 5,
    Z = groundZ
  }
  local prisoner01Pos = GetNpcLocation(prisoner01)
  local playerMovePos1 = {
    X = 7800,
    Y = pos1.Y,
    Z = groundZ
  }
  local playerMovePos2 = {
    X = prisoner01Pos.X,
    Y = prisoner01Pos.Y + 100,
    Z = groundZ
  }
  local moveSpeed = 200
  local camera1Pos = {
    X = pos1.X,
    Y = pos1.Y,
    Z = groundZ + 100
  }
  local camera2Pos = {
    X = playerMovePos2.X,
    Y = playerMovePos2.Y,
    Z = groundZ + 100
  }
  local cameraDistance = 2000
  local cameraAngle = {
    Yaw = 0,
    Pitch = -30,
    Roll = 0
  }
  local tagItemId = "ITEM_IMPORTANT_GREEN_ORB"
  SetTagItemId(tagItemId)
  CmdPlayEventSequencePrevEventBattle(4)
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  SetPlayerLocation(playerMovePos2)
  Wait(0.1)
  TurnParty(1, 3)
  Wait(0.1)
  SpawnPartyCloneDisableSkill(true, true, true, true)
  SetNpcLocation("Party1", pos1)
  SetNpcLocation("Party2", pos2)
  SetNpcLocation("Party3", pos3)
  SetNpcLocation("Party4", pos4)
  CmdTurnNpc("Party1", NPC_D_UP)
  CmdTurnNpc("Party2", NPC_D_UP)
  CmdTurnNpc("Party3", NPC_D_UP)
  CmdTurnNpc("Party4", NPC_D_UP)
  CmdChangeNpcOpacity(prisoner01, 1, 0, false)
  CmdTurnNpc(prisoner01, NPC_D_LOW)
  CmdChangeStageCameraToGlobalPoint(camera1Pos.X, camera1Pos.Y, camera1Pos.Z, CAMERA_BLEND_LINEAR, 0, 0, cameraDistance, cameraAngle)
  local bgmFadeTime = 0.5
  PlayBGM(GetCurrentMapBgmId(), 0.5)
  CmdFadeIn(EFadingPriorityTopMost, bgmFadeTime)
  ChangeStageCameraToGlobalPoint(camera2Pos.X, camera2Pos.Y, camera2Pos.Z, CAMERA_BLEND_EASE_IN_OUT, 3.5, 2, cameraDistance, cameraAngle)
  CmdMoveNpc("Party1", playerMovePos1, _movePartySpeed)
  CmdMoveNpc("Party1", playerMovePos2, _movePartySpeed)
  CmdTurnNpc("Party1", NPC_D_LEFT)
  CmdTurnNpc(prisoner01, NPC_D_RIGHT)
  WaitStageCameraBlend()
  Wait(0.5)
  CmdMessage("NPC_Talk_Tedon_Out_MAIN_0_VOLUME_0120_010_11")
  CmdEventClosingMessage("NPC_Talk_Tedon_Out_MAIN_0_VOLUME_0120_010_12")
  CmdChangeNpcOpacity(prisoner01, 0, 1, false)
  DestroyNpc(prisoner01)
  PlaySEEvent("EVESE_SOUL")
  SpawnNpc(prisoner01GhostRed)
  CmdChangeNpcOpacity(prisoner01GhostRed, 0, 0, false)
  CmdChangeNpcOpacityEmissive(prisoner01GhostRed, 1, 2)
  CmdChangeNpcOpacity(prisoner01GhostRed, 1, 1, false)
  -- AP
  AP.Log("Tedon_Out_MAIN_0_BATTLE_END_0120_010 called (Get Green orb boss event)")
  AP.CheckLocation("Tedon_Out_MAIN_0_BATTLE_END_0120_010")
  local ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
    AddItem(ItemId)
    SetFlag(Flag.FE73, true) -- green orb flag is not possible to skip or else it will softlock the player into an infinite boss battle
  else
    AddItem("ITEM_IMPORTANT_GREEN_ORB")
    SetFlag(Flag.FE73, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_TEDON_GetGreenOrb, true)
    CheckGopEnum_MAIN_MULTI_GetAllOrb()
  end
  -- AP end
  SetEventVolumeEnabled("Tedon_Out_Prisoner_01_L3_Volume", false)
  DestroyPartyClone()
  PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WALK)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function Tedon_Out_MAIN_0_ACTOR_0120_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Tedon_Out_MAIN_0_ACTOR_0120_010_1")
  EventEnd(eventInfo, "")
end

function Tedon_Out_SUB_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Corpse_1")
  EventEnd(eventInfo, "")
end

function Tedon_Out_SUB_0_ACTOR_0320_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Tedon_Out_SUB_0_ACTOR_0320_010_1")
  EventEnd(eventInfo, "")
end

function Tedon_Out_SUB_0_ACTOR_0420_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Tedon_Out_SUB_0_ACTOR_0420_010_1")
  CmdEventClosingMessage("NPC_Talk_Tedon_Out_SUB_0_ACTOR_0420_010_2")
  EventEnd(eventInfo, "", false)
end

function Tedon_Out_SUB_0_ACTOR_0520_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Tedon_Out_SUB_0_ACTOR_0520_010_1")
  CmdMessage("NPC_Talk_Tedon_Out_SUB_0_ACTOR_0520_010_2")
  CmdEventClosingMessage("NPC_Talk_Tedon_Out_SUB_0_ACTOR_0520_010_3")
  EventEnd(eventInfo, "", false)
end

function Tedon_Out_SUB_0_ACTOR_0620_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Tedon_Out_SUB_0_ACTOR_0620_010_1")
  EventEnd(eventInfo, "")
end

function Tedon_Out_SUB_0_ACTOR_0720_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Tedon_Out_SUB_0_ACTOR_0720_010_1")
  EventEnd(eventInfo, "")
end

function Tedon_Out_SUB_0_ACTOR_0720_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Tedon_Out_SUB_0_ACTOR_0720_010_1")
  local result = CmdChoiceMessage("NPC_Talk_Tedon_Out_SUB_0_ACTOR_0720_010_2")
  if result == true then
    CmdEventClosingMessage("NPC_Talk_Tedon_Out_SUB_0_ACTOR_0720_010_3")
  else
    CmdEventClosingMessage("NPC_Talk_Tedon_Out_SUB_0_ACTOR_0720_010_4")
  end
  EventEnd(eventInfo, "")
end

function Tedon_Out_SUB_0_ACTOR_0820_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local tagItemId = "ITEM_IMPORTANT_ULTIMATE_KEY"
  SetTagItemId(tagItemId)
  CmdMessage("NPC_Talk_Tedon_Out_SUB_0_ACTOR_0820_010_1")
  CmdEventClosingMessage("NPC_Talk_Tedon_Out_SUB_0_ACTOR_0820_010_2")
  EventEnd(eventInfo, "")
end

function Tedon_Out_SUB_0_ACTOR_0920_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Tedon_Out_SUB_0_ACTOR_0920_010_1")
  CmdEventClosingMessage("NPC_Talk_Tedon_Out_SUB_0_ACTOR_0920_010_2")
  EventEnd(eventInfo, "", false)
end

function Tedon_Out_SUB_0_ACTOR_1020_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdCallInnUI("INN_TEDON_0001")
  EventEnd(eventInfo, "")
end

function Tedon_Out_SUB_0_ACTOR_1120_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdCallChurchUI("CHURCH_TEDON_0001")
  EventEnd(eventInfo, "")
end

function Tedon_Out_Ground_1(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, "")
  targetActorId = eventInfo[1]
  SetVisibleActor(targetActorId, false)
  CmdMessage("NPC_Talk_Common_SEARCHOBJECT_GROUND_1")
  SearchObject_Important(eventInfo, TreasureId, ItemId)
  ChangeSpeaker()
  CmdEventClosingMessage("NPC_Talk_Tedon_Out_Ground_1_1")
  SetFlag(Flag.FE341, true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function Tedon_Out_SUB_0_MBR_SCOUT_1310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local volumeTag = (...)
  if volumeTag == "SuccessCollision" then
  elseif volumeTag == "FailCollision" then
  elseif volumeTag == nil then
  end
  local TextTable = {
    Success1 = "NPC_Talk_Tedon_Out_SUB_0_VOLUME_1310_010_1",
    Success2 = "NPC_Talk_Tedon_Out_SUB_0_VOLUME_1310_010_2",
    Success3 = "NPC_Talk_Tedon_Out_SUB_0_VOLUME_1310_010_3"
  }
  local MonsterScoutId = "MBR_SCOUT_BAGOLAUGHS_T13_Tedon_Out"
  local ActorId
  local mapTime = GetMapTimeFrame()
  if mapTime == MAPTIME_DAYTIME then
    ActorId = "Tedon_Out_BAGOLAUGHS_00_L1"
  elseif mapTime == MAPTIME_EVENING then
    ActorId = "Tedon_Out_BAGOLAUGHS_00_L2"
  elseif mapTime == MAPTIME_NIGHT then
    ActorId = "Tedon_Out_BAGOLAUGHS_00_L3"
  end
  local MonsterLocation = GetNpcLocation(ActorId)
  local PlayerLocation = {
    X = MonsterLocation.X - 340,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z + 3
  }
  local PlayerLook = {Chara = 1, Turn = 0}
  local CameraParam = {
    X = MonsterLocation.X - 140,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z + 50,
    Distance = 1800
  }
  MonsterScoutScript(MonsterScoutId, TextTable, ActorId, PlayerLocation, CameraParam, PlayerLook, volumeTag)
  EventEnd(eventInfo, "")
end
