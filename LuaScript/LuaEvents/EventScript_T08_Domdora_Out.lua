print("Load Script EventScript_T08_Domdora_Out")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Domdora_Out_SUB_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE913) == false and GetFlag(Flag.FE91) == false then
    PlayLocationCamera(table)
    SetFlag(Flag.FE913, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_DOMDORA_ArriveOut, true)
  else
    DisableEventFastForwardUI()
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  end
  EventEnd(eventInfo, "")
end

function Domdora_Out_SUB_0_ACTOR_0120_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0120_010_1")
  EventEnd(eventInfo, "", false)
end

function Domdora_Out_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckPartyMemberNum() == 1 then
    CmdMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0110_010_2")
  else
    CmdMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0110_010_1")
  end
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0110_010_3")
  EventEnd(eventInfo, "", false)
end

function Domdora_Out_SUB_0_ACTOR_0220_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0220_010_1")
  EventEnd(eventInfo, "")
end

function Domdora_Out_SUB_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0210_010_1")
  EventEnd(eventInfo, "")
end

function Domdora_Out_SUB_0_ACTOR_0320_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckFadingJenny() == true or CheckModRod() == true then
    CmdMessage("NPC_Talk_Common_Kiesari_21")
  end
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0320_010_1")
  EventEnd(eventInfo, "")
end

function Domdora_Out_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckFadingJenny() == true or CheckModRod() == true then
    CmdMessage("NPC_Talk_Common_Kiesari_21")
  end
  local result = CmdChoiceMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0310_010_1")
  if result then
    CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0310_010_2")
  else
    CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0310_010_3")
  end
  EventEnd(eventInfo, "")
end

function Domdora_Out_SUB_0_ACTOR_0420_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0420_010_1")
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0420_010_2")
  EventEnd(eventInfo, "", false)
end

function Domdora_Out_SUB_0_ACTOR_0410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0410_010_1")
  EventEnd(eventInfo, "", false)
end

function Domdora_Out_SUB_0_ACTOR_0520_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0520_010_1")
  EventEnd(eventInfo, "")
end

function Domdora_Out_SUB_0_ACTOR_0520_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0520_020_1")
  CmdMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0520_020_2")
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0520_020_3")
  EventEnd(eventInfo, "")
end

function Domdora_Out_SUB_0_ACTOR_0510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_NOTE")
  CmdMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0510_010_1")
  CmdMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0510_010_2")
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0510_010_3")
  EventEnd(eventInfo, "")
end

function Domdora_Out_SUB_0_ACTOR_0620_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Animal_13")
  EventEnd(eventInfo, "", false)
end

function Domdora_Out_SUB_0_ACTOR_0610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0610_010_1")
  EventEnd(eventInfo, "", false)
end

function Domdora_Out_SUB_0_ACTOR_0720_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0720_010_1")
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0720_010_2")
  EventEnd(eventInfo, "", false)
end

function Domdora_Out_SUB_0_ACTOR_0710_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0710_010_1")
  CmdMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0710_010_2")
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0710_010_3")
  EventEnd(eventInfo, "", false)
end

function Domdora_Out_SUB_0_ACTOR_0820_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Animal_10")
  EventEnd(eventInfo, "", false)
end

function Domdora_Out_SUB_0_ACTOR_0810_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Animal_10")
  EventEnd(eventInfo, "", false)
end

function Domdora_Out_SUB_0_ACTOR_0920_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Animal_10")
  EventEnd(eventInfo, "", false)
end

function Domdora_Out_SUB_0_ACTOR_0910_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_NOTE")
  CmdMessage("NPC_Talk_Common_Animal_10")
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_0910_010_1")
  EventEnd(eventInfo, "", false)
end

function Domdora_Out_SUB_0_ACTOR_1020_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_1020_010_1")
  EventEnd(eventInfo, "", false)
end

function Domdora_Out_SUB_0_ACTOR_1010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_1010_010_1")
  EventEnd(eventInfo, "", false)
end

function Domdora_Out_SUB_0_ACTOR_1220_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdCallChurchUI("CHURCH_DOMDORA_0001")
  EventEnd(eventInfo, "")
end

function Domdora_Out_SUB_0_ACTOR_1210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_1210_010_1")
  EventEnd(eventInfo, "")
end

function Domdora_Out_SearchEvent_Orichalcum(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetVisibleActor(targetActorId, false)
  CmdMessage("NPC_Talk_Common_SEARCHOBJECT_GROUND_1")
  SearchObject_Important(eventInfo, TreasureId, ItemId)
  --SetFlag(Flag.FE82, true)
  --SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_DOMDORA_GetOrichalcum, true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function SearchObject_Well(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdSearchObjWellChangeMap("MAPLIST_T08R0901", "FromOut")
  EventEnd(eventInfo, "")
end

function Domdora_Out_SUB_0_ACTOR_1310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if IsScoutedMonster("MBR_SCOUT_GREENDRAGON_Y02_SecretForest_19") == false then
    CmdMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_1310_010_1")
    CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_1310_010_2")
  else
    CmdMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_1310_010_3")
    CmdEventClosingMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_1310_010_4")
  end
  EventEnd(eventInfo, "")
end

function Domdora_Out_SUB_0_MBR_SCOUT_1110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local volumeTag = (...)
  if volumeTag == "SuccessCollision" then
  elseif volumeTag == "FailCollision" then
  elseif volumeTag == nil then
  end
  local TextTable = {
    Disguise = "NPC_Talk_Domdora_Out_SUB_0_ACTOR_1110_010_1",
    RaMirror1 = "NPC_Talk_Domdora_Out_SUB_0_ACTOR_1110_010_2",
    RaMirror2 = "NPC_Talk_Domdora_Out_SUB_0_ACTOR_1110_010_3",
    Success1 = "NPC_Talk_Domdora_Out_SUB_0_ACTOR_1110_010_4",
    Success2 = "NPC_Talk_Domdora_Out_SUB_0_ACTOR_1110_010_5",
    Success3 = "NPC_Talk_Domdora_Out_SUB_0_ACTOR_1110_010_6"
  }
  local MonsterScoutId = "MBR_SCOUT_HOCUSPOKER_T08_Domdora_Out"
  local ActorId = "Domdora_Out_HOCUSPOKER_01_L3"
  local MonsterLocation = GetNpcLocation(ActorId)
  local PlayerLocation = {
    X = MonsterLocation.X - 355,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z + 10
  }
  local PlayerLook = {Chara = 1, Turn = 0}
  local CameraParam = {
    X = MonsterLocation.X - 150,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z + 65,
    Distance = 1800
  }
  CmdMessage("NPC_Talk_Domdora_Out_SUB_0_ACTOR_1110_010_7")
  MonsterScoutScript(MonsterScoutId, TextTable, ActorId, PlayerLocation, CameraParam, PlayerLook, volumeTag)
  EventEnd(eventInfo, "")
end
