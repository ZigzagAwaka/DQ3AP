print("Load Script EventScript_H04_RomariaBarrier_B1F")

function RomariaBarrier_B1F_SUB_0_MBR_SCOUT_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local volumeTag = (...)
  if volumeTag == "SuccessCollision" then
  elseif volumeTag == "FailCollision" then
  elseif volumeTag == nil then
  end
  local TextTable = {
    Success1 = "NPC_Talk_RomariaBarrier_B1F_SUB_0_VOLUME_0010_010_1",
    Success2 = "NPC_Talk_RomariaBarrier_B1F_SUB_0_VOLUME_0010_010_2",
    Success3 = "NPC_Talk_RomariaBarrier_B1F_SUB_0_VOLUME_0010_010_3"
  }
  local MonsterScoutId = "MBR_SCOUT_METALSLIME_H04_RomariaBarrier_B1F"
  local ActorId
  local mapTime = GetMapTimeFrame()
  if mapTime == MAPTIME_DAYTIME then
    ActorId = "RomariaBarrie_B1F_METALSLIME_00_L1"
  elseif mapTime == MAPTIME_EVENING then
    ActorId = "RomariaBarrie_B1F_METALSLIME_00_L2"
  elseif mapTime == MAPTIME_NIGHT then
    ActorId = "RomariaBarrie_B1F_METALSLIME_00_L3"
  end
  local MonsterLocation = GetNpcLocation(ActorId)
  local PlayerLocation = {
    X = MonsterLocation.X - 385,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z
  }
  local PlayerLook = {Chara = 1, Turn = 0}
  local CameraParam = {
    X = MonsterLocation.X - 150,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z + 50,
    Distance = 1800
  }
  MonsterScoutScript(MonsterScoutId, TextTable, ActorId, PlayerLocation, CameraParam, PlayerLook, volumeTag)
  EventEnd(eventInfo, "")
end

function RomariaBarrier_B1F_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  -- AP: remove the guard as he blocks an ultimate key door
  if GetFlag(Flag.FE55) or GetFlag(Flag.FE56) then
    CmdEventClosingMessage("NPC_Talk_RomariaBarrier_1F_SUB_0_ACTOR_0110_010_2")
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    DestroyNpc(targetActorId)
    CmdFadeIn(EFadingPriorityTopMost, 0.5)
  else
    CmdEventClosingMessage("NPC_Talk_RomariaBarrier_B1F_SUB_0_ACTOR_0110_010_1")
  end
  -- AP end
  EventEnd(eventInfo, "")
end
