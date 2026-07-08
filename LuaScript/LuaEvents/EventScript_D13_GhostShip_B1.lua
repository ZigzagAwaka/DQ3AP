print("Load Script EventScript_D13_GhostShip_B1")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function GhostShip_B1_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_GhostShip_B1_SUB_0_ACTOR_0110_010_1")
  EventEnd(eventInfo, "", false)
end

function GhostShip_B1_SUB_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_LAUGH")
  CmdEventClosingMessage("NPC_Talk_GhostShip_B1_SUB_0_ACTOR_0210_010_1")
  EventEnd(eventInfo, "")
end

function GhostShip_B1_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_IMPATIENCE")
  CmdEventClosingMessage("NPC_Talk_GhostShip_B1_SUB_0_ACTOR_0310_010_1")
  EventEnd(eventInfo, "")
end

function GhostShip_B1_SUB_0_ACTOR_0410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_MOYAMOYA")
  CmdEventClosingMessage("NPC_Talk_GhostShip_B1_SUB_0_ACTOR_0410_010_1")
  EventEnd(eventInfo, "")
end

function GhostShip_B1_SUB_0_ACTOR_0510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_GhostShip_B1_SUB_0_ACTOR_0510_010_1")
  EventEnd(eventInfo, "")
end

function GhostShip_B1_SUB_0_ACTOR_0610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_GhostShip_B1_SUB_0_ACTOR_0610_010_1")
  CloseMessage()
  CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_SURPRISE")
  EventClosingMessage("NPC_Talk_GhostShip_B1_SUB_0_ACTOR_0610_010_2")
  CmdMoveNpcRelativeDetail(targetActorId, {
    X = 0,
    Y = 5,
    Z = 0
  }, 1000, NPC_D_INITIAL_ROT, AnimationType.Idle, 1)
  CmdMoveNpcRelativeDetail(targetActorId, {
    X = 0,
    Y = -10,
    Z = 0
  }, 1000, NPC_D_INITIAL_ROT, AnimationType.Idle, 1)
  CmdMoveNpcRelativeDetail(targetActorId, {
    X = 0,
    Y = 10,
    Z = 0
  }, 1000, NPC_D_INITIAL_ROT, AnimationType.Idle, 1)
  CmdMoveNpcRelativeDetail(targetActorId, {
    X = 0,
    Y = -5,
    Z = 0
  }, 1000, NPC_D_INITIAL_ROT, AnimationType.Idle, 1)
  WaitShowMessage()
  EventEnd(eventInfo, "", false)
end

function GhostShip_B1_SUB_0_ACTOR_0710_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_GhostShip_B1_SUB_0_ACTOR_0710_010_1")
  CmdEventClosingMessage("NPC_Talk_GhostShip_B1_SUB_0_ACTOR_0710_010_2")
  EventEnd(eventInfo, "")
end

function GhostShip_B1_SUB_0_ACTOR_0810_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_GhostShip_B1_SUB_0_ACTOR_0810_010_1")
  CmdMessage("NPC_Talk_GhostShip_B1_SUB_0_ACTOR_0810_010_2")
  CmdEventClosingMessage("NPC_Talk_GhostShip_B1_SUB_0_ACTOR_0810_010_3")
  EventEnd(eventInfo, "")
end

function GhostShip_B1_SUB_0_ACTOR_0810_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Common_Corpse_1")
  CmdEventClosingMessage("NPC_Talk_GhostShip_B1_SUB_0_ACTOR_0810_020_1")
  EventEnd(eventInfo, "")
end

function GhostShip_B1_SUB_0_ACTOR_0910_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Corpse_1")
  EventEnd(eventInfo, "")
end

function GhostShip_B1_SUB_0_ACTOR_1010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Corpse_1")
  EventEnd(eventInfo, "")
end

function GhostShip_B1_SUB_0_MBR_SCOUT_1110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local volumeTag = (...)
  if volumeTag == "SuccessCollision" then
  elseif volumeTag == "FailCollision" then
  elseif volumeTag == nil then
  end
  local TextTable = {
    Success1 = "NPC_Talk_GhostShip_B1_SUB_0_VOLUME_1110_010_1",
    Success2 = "NPC_Talk_GhostShip_B1_SUB_0_VOLUME_1110_010_2",
    Success3 = "NPC_Talk_GhostShip_B1_SUB_0_VOLUME_1110_010_3"
  }
  local MonsterScoutId = "MBR_SCOUT_WALKINGCORPSE_D13_GhostShip_B1"
  local ActorId
  local mapTime = GetMapTimeFrame()
  if mapTime == MAPTIME_DAYTIME then
    ActorId = "GhostShip_B1_WALKINGCORPSE_00_L1"
  elseif mapTime == MAPTIME_EVENING then
    ActorId = "GhostShip_B1_WALKINGCORPSE_00_L2"
  elseif mapTime == MAPTIME_NIGHT then
    ActorId = "GhostShip_B1_WALKINGCORPSE_00_L3"
  end
  local MonsterLocation = GetNpcLocation(ActorId)
  local PlayerLocation = {
    X = MonsterLocation.X - 500,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z
  }
  local PlayerLook = {Chara = 1, Turn = 0}
  local CameraParam = {
    X = MonsterLocation.X - 150,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z + 70,
    Distance = 1800
  }
  local CameraSets = false
  MonsterScoutScriptCamera(MonsterScoutId, TextTable, ActorId, PlayerLocation, CameraParam, PlayerLook, volumeTag, MonsterLocation, CameraSets)
  EventEnd(eventInfo, "")
end

function GhostShip_B1_Treasure_Important(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  print("Treasure_Normal execute, TreasureId : " .. tostring(TreasureId) .. ", Item : " .. tostring(ItemId) .. ", Count : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold) .. ", EnemyId : " .. tostring(EnemyId))
  print("CanObtainItem=" .. tostring(CanObtainItem))
  if CanObtainItem then
    PlaySE("SE_TD_TREASURE_BOX", {
      X = 0,
      Y = 0,
      Z = 0
    }, eventInfo[1])
    CmdPlayEffectSearchObject(eventInfo[1], "DeleteEffect")
    CmdPlayOpenAnimSearchObj(eventInfo[1])
    CmdMessage("NPC_Talk_Common_SEARCHOBJECT_WOODBOX_1")
    SearchObject_ShowMessage(GetTargetActorIdFromEventInfo(eventInfo), TreasureId, ItemId, ItemCount, Gold)
    SetVisibleActor(eventInfo[1], false)
    --SetFlag(Flag.FE71, true) -- AP
    --SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_GHOSTSHIP_GetLoveLocket, true) -- AP
    RequestAutoSaveFromEvent()
  else
  end
  EventEnd(eventInfo, "")
end
