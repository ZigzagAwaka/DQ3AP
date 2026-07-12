print("Load Script EventScript_T09_Myra_Out")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Myra_Out_SUB_0_ACTOR_0120_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0120_010_1")
  EventEnd(eventInfo, "")
end

function Myra_Out_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0110_010_1")
  EventEnd(eventInfo, "")
end

function Myra_Out_SUB_0_ACTOR_0220_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0220_010_1")
  CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0220_010_2")
  local tagItemId = "ITEM_USE_ITEM_SPHERE_OF_LIGHT"
  SetTagItemId(tagItemId)
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0220_010_3")
  EventEnd(eventInfo, "")
end

function Myra_Out_SUB_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0210_010_1")
  CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0210_010_2")
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0210_010_3")
  EventEnd(eventInfo, "")
end

function Myra_Out_SUB_0_ACTOR_0320_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0320_010_1")
  EventEnd(eventInfo, "", false)
end

function Myra_Out_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0310_010_1")
  EventEnd(eventInfo, "", false)
end

function Myra_Out_SUB_0_ACTOR_0420_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local tagItemId = "ITEM_EQUIP_WEAPON_SWORD_OF_KINGS"
  SetTagItemId(tagItemId)
  CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0420_010_1")
  tagItemId = "ITEM_EQUIP_WEAPON_SWORD_OF_KINGS"
  SetTagItemId(tagItemId)
  CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0420_010_2")
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0420_010_3")
  EventEnd(eventInfo, "")
end

function Myra_Out_SUB_0_ACTOR_0410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0410_010_1")
  EventEnd(eventInfo, "")
end

function Myra_Out_SUB_0_ACTOR_0520_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0520_010_1")
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0520_010_2")
  EventEnd(eventInfo, "", false)
end

function Myra_Out_SUB_0_ACTOR_0510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0510_010_1")
  EventEnd(eventInfo, "", false)
end

function Myra_Out_SUB_0_ACTOR_0620_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdCallShopUI("SHOP_MYRA_EQUIP_0001")
  EventEnd(eventInfo, "")
end

function Myra_Out_SUB_0_ACTOR_0610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0610_010_1")
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0610_010_2")
  EventEnd(eventInfo, "")
end

function Myra_Out_SUB_0_ACTOR_0720_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0720_010_1")
  EventEnd(eventInfo, "", false)
end

function Myra_Out_SUB_0_ACTOR_0710_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local result = CmdChoiceMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0710_010_1")
  if result == true then
    CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0710_010_2")
  else
    CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0710_010_3")
  end
  CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0710_010_4")
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0710_010_5")
  EventEnd(eventInfo, "", false)
end

function Myra_Out_SUB_0_ACTOR_0820_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local tagItemId = "ITEM_IMPORTANT_FAERIE_FLUTE"
  SetTagItemId(tagItemId)
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0820_010_1")
  EventEnd(eventInfo, "")
end

function Myra_Out_SUB_0_ACTOR_0820_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0820_020_1")
  CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0820_020_2")
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0820_020_3")
  EventEnd(eventInfo, "")
end

function Myra_Out_SUB_0_ACTOR_0810_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0810_010_1")
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0810_010_2")
  EventEnd(eventInfo, "")
end

function Myra_Out_SUB_0_ACTOR_0920_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local result = CmdChoiceMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0920_010_1")
  if result == true then
    CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0920_010_2")
  else
    CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0920_010_3")
    CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0920_010_4")
    CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0920_010_5")
  end
  EventEnd(eventInfo, "")
end

function Myra_Out_SUB_0_ACTOR_0910_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0910_010_1")
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_0910_010_2")
  EventEnd(eventInfo, "")
end

function Myra_Out_SUB_0_ACTOR_1020_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdCallChurchUI("CHURCH_MYRA_0001")
  EventEnd(eventInfo, "", true)
end

function Myra_Out_SUB_0_ACTOR_1010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Myra_Out_SUB_0_ACTOR_1010_020_1")
  EventEnd(eventInfo, "", true)
end

function Myra_Out_SUB_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE914) == false then
    PlayLocationCamera(table)
    SetFlag(Flag.FE914, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MYRA_ArriveOut, true)
  else
    DisableEventFastForwardUI()
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  end
  EventEnd(eventInfo, "")
end

function Myra_Out_SearchEvent_FaerieFlute(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetVisibleActor(targetActorId, false)
  CmdMessage("NPC_Talk_Common_SEARCHOBJECT_GROUND_1")
  SearchObject_Important(eventInfo, TreasureId, ItemId)
  --SetFlag(Flag.FE86, true)
  --SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MYRA_GetFairyFlute, true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function Myra_Well_SUB_0_MBR_SCOUT_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local volumeTag = (...)
  if volumeTag == "SuccessCollision" then
  elseif volumeTag == "FailCollision" then
  elseif volumeTag == nil then
  end
  local TextTable = {
    Disguise = "NPC_Talk_Myra_Well_SUB_0_ACTOR_0010_010_1",
    RaMirror1 = "NPC_Talk_Myra_Well_SUB_0_ACTOR_0010_010_2",
    RaMirror2 = "NPC_Talk_Myra_Well_SUB_0_ACTOR_0010_010_3",
    Success1 = "NPC_Talk_Myra_Well_SUB_0_ACTOR_0010_010_4",
    Success2 = "NPC_Talk_Myra_Well_SUB_0_ACTOR_0010_010_5",
    Success3 = "NPC_Talk_Myra_Well_SUB_0_ACTOR_0010_010_6"
  }
  local MonsterScoutId = "MBR_SCOUT_SILHOUETTE_T09_Myra_Out"
  local ActorId
  local mapTime = GetMapTimeFrame()
  if mapTime == MAPTIME_DAYTIME then
    ActorId = "Myra_Well_SILHOUETTE_01_L1"
  elseif mapTime == MAPTIME_EVENING then
    ActorId = "Myra_Well_SILHOUETTE_01_L2"
  elseif mapTime == MAPTIME_NIGHT then
    ActorId = "Myra_Well_SILHOUETTE_01_L3"
  end
  local MonsterLocation = GetNpcLocation(ActorId)
  local PlayerLocation = {
    X = MonsterLocation.X - 370,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z
  }
  local PlayerLook = {Chara = 1, Turn = 0}
  local CameraParam = {
    X = MonsterLocation.X - 160,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z + 50,
    Distance = 1800
  }
  MonsterScoutScript(MonsterScoutId, TextTable, ActorId, PlayerLocation, CameraParam, PlayerLook, volumeTag)
  EventEnd(eventInfo, "")
end

function SearchObject_Well(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdSearchObjWellChangeMap("MAPLIST_T09R0401", "FromOut")
  EventEnd(eventInfo, "")
end
