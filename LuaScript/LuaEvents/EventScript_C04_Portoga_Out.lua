print("Load Script EventScript_C04_Portoga_Out")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Portoga_Out_MAIN_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE904) == false then
    PlayLocationCamera(table)
    SetFlag(Flag.FE904, true)
  else
    DisableEventFastForwardUI()
    print("\227\130\185\227\130\173\227\131\131\227\131\151\233\157\158\232\161\168\231\164\186")
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  end
  if GetFlag(Flag.FE128) == false then
    CheckBurg()
  end
  EventEnd(eventInfo, "")
end

function Portoga_Out_MAIN_0_VOLUME_0010_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local Guard
  local MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Guard = "Portoga_Out_Guard_03_L3"
  else
    Guard = "Portoga_Out_Guard_03_L1"
  end
  EndSkillInvisibleNoEffect()
  EndSkillTransformNoEffect()
  CmdTurnNpc(Guard, NPC_D_TO_PLAYER)
  TurnParty(1, 0)
  Wait(0.2)
  CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1110_010_1")
  CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1110_010_2")
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1110_010_3")
  SetFlag(Flag.FE801, true)
  SetVisibleActor("BP_SearchEvent_C04_Trap_00", true)
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  RequestLoading("MAPLIST_FIELD1")
  SetVisibleActor("BP_SearchEvent_C04_Trap_00", false)
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    CmdPlayEventSequenceNextChangeMap(5, nil, nil, nil, false)
  elseif GetMapTimeFrame() == MAPTIME_EVENING then
    CmdPlayEventSequenceNextChangeMap(4, nil, nil, nil, false)
  else
    CmdPlayEventSequenceNextChangeMap(3, nil, nil, nil, false)
  end
  SetFlag(Flag.FE34, true)
  SetFlag(Flag.FE107, true)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_PORTOGA_RideShip, true)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.SUB_INFORMATION_SHIP, true)
  ChangeFieldShip("F_FromPortogaSouth", ORIENTATION_PLAYER_START, true)
  EventEnd(eventInfo, "")
end

function Portoga_Out_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0110_010_1")
  EventEnd(eventInfo, "", false)
end

function Portoga_Out_SUB_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0210_010_1")
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0210_010_2")
  EventEnd(eventInfo, "")
end

function Portoga_Out_SUB_0_ACTOR_0220_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0220_020_1")
  CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0220_020_2")
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0220_020_3")
  EventEnd(eventInfo, "", false)
end

function Portoga_Out_SUB_0_ACTOR_0210_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0210_030_1")
  CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0210_030_2")
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0210_030_3")
  EventEnd(eventInfo, "")
end

function Portoga_Out_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0310_010_1")
  EventEnd(eventInfo, "")
end

function Portoga_Out_SUB_0_ACTOR_0420_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0420_010_1")
  local result = CmdChoiceMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0420_010_2")
  if result == true then
    CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0420_010_3")
  else
    CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0420_010_4")
  end
  EventEnd(eventInfo, "")
end

function Portoga_Out_SUB_0_ACTOR_0410_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE110) == true then
    CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0410_020_3")
    CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0410_020_4")
    CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0410_020_5")
    CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0410_020_6")
  else
    CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0410_020_1")
    CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0410_020_2")
    SetFlag(Flag.FE110, true)
  end
  EventEnd(eventInfo, "")
end

function Portoga_Out_SUB_0_ACTOR_0510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0510_010_1")
  EventEnd(eventInfo, "", false)
end

function Portoga_Out_SUB_0_ACTOR_0510_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0510_020_1")
  EventEnd(eventInfo, "", false)
end

function Portoga_Out_SUB_0_ACTOR_0510_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0510_030_1")
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0510_030_2")
  EventEnd(eventInfo, "", false)
end

function Portoga_Out_SUB_0_ACTOR_0510_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0510_040_1")
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0510_040_2")
  EventEnd(eventInfo, "", false)
end

function Portoga_Out_SUB_0_ACTOR_0510_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0510_050_1")
  EventEnd(eventInfo, "", false)
end

function Portoga_Out_SUB_0_ACTOR_0610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0610_010_1")
  if GetFlag(Flag.FE64) == true then
    CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0610_010_2")
    local result = CmdChoiceMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0610_010_3")
    if result == true then
      CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0610_010_5")
    else
      CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0610_010_4")
    end
  else
    CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0610_010_2")
  end
  EventEnd(eventInfo, "", false)
end

function Portoga_Out_SUB_0_ACTOR_0610_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0610_020_1")
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0610_020_2")
  EventEnd(eventInfo, "", false)
end

function Portoga_Out_SUB_0_ACTOR_0610_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0610_030_1")
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0610_030_2")
  EventEnd(eventInfo, "", false)
end

function Portoga_Out_SUB_0_ACTOR_0710_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0710_010_1")
  EventEnd(eventInfo, "", false)
end

function Portoga_Out_SUB_0_ACTOR_0720_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0720_010_1")
  EventEnd(eventInfo, "")
end

function Portoga_Out_SUB_0_ACTOR_0710_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0710_020_1")
  EventEnd(eventInfo, "", false)
end

function Portoga_Out_SUB_0_ACTOR_0820_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0820_010_1")
  EventEnd(eventInfo, "")
end

function Portoga_Out_SUB_0_ACTOR_0920_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_0920_010_1")
  EventEnd(eventInfo, "")
end

function Portoga_Out_SUB_0_ACTOR_1010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local Sabrina
  local MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Sabrina = "Portoga_Out_Sabrina_Human_01_L3"
  else
    Sabrina = "Portoga_Out_Sabrina_Human_01_L1"
  end
  SetTagItemId("ITEM_EQUIP_WEAPON_SIREN_SWORD")
  if GetFlag(Flag.FE108) == true then
    CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1010_010_7")
    CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1010_010_8")
  else
    CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1010_010_1")
    CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1010_010_2")
    CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1010_010_3")
    ItemGetMessageToActor("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1010_010_5", "ITEM_ARCHIPELAGO"--[["ITEM_EQUIP_WEAPON_SIREN_SWORD"]], Sabrina, false, true) -- AP
    -- AP
    AP.Log("Portoga_Out_SUB_0_ACTOR_1010_010 called (Portoga - Woman giving the Siren Sword)")
    AP.CheckLocation("Portoga_Out_SUB_0_ACTOR_1010_010")
    local ItemId = "ITEM_ARCHIPELAGO"
    if ItemId == "ITEM_ARCHIPELAGO" then
      AddItem(ItemId)
    else
      AddItem("ITEM_EQUIP_WEAPON_SIREN_SWORD")
    end
    -- AP end
    SetFlag(Flag.FE108, true)
    RequestAutoSaveFromEvent()
  end
  EventEnd(eventInfo, "")
end

function Portoga_Out_SUB_0_ACTOR_1110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local Guard
  local MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Guard = "Portoga_Out_Guard_03_L3"
  else
    Guard = "Portoga_Out_Guard_03_L1"
  end
  if GetFlag(Flag.FE801) == true then
    CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1110_010_4")
    CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1110_010_5")
    CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1110_010_6")
  else
    CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1110_010_1")
    CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1110_010_2")
    CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1110_010_3")
    SetFlag(Flag.FE801, true)
    SetVisibleActor("BP_SearchEvent_C04_Trap_00", true)
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    CmdTurnNpc(Guard, NPC_D_LOW)
    RequestLoading("MAPLIST_FIELD1")
    SetVisibleActor("BP_SearchEvent_C04_Trap_00", false)
    if GetMapTimeFrame() == MAPTIME_NIGHT then
      CmdPlayEventSequenceNextChangeMap(5, nil, nil, nil, false)
    elseif GetMapTimeFrame() == MAPTIME_EVENING then
      CmdPlayEventSequenceNextChangeMap(4, nil, nil, nil, false)
    else
      CmdPlayEventSequenceNextChangeMap(3, nil, nil, nil, false)
    end
    SetFlag(Flag.FE34, true)
    SetFlag(Flag.FE107, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_PORTOGA_RideShip, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.SUB_INFORMATION_SHIP, true)
    ChangeFieldShip("F_FromPortogaSouth", ORIENTATION_PLAYER_START, true)
  end
  EventEnd(eventInfo, "")
end

function Portoga_Out_SUB_0_ACTOR_1210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdCallChurchUI("CHURCH_PORTOGA_0001")
  EventEnd(eventInfo, "")
end

function Portoga_Out_SearchEvent_Trap_00(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  TurnParty(1, 3)
  WaitFrame(1)
  if GetFlag(Flag.FE107) == true then
    local SE_Stairway
    SE_Stairway = PlaySEEvent("EVESE_STAIRWAY")
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    WaitPlaySound(SE_Stairway)
    ChangeFieldShip("F_FromPortogaSouth", ORIENTATION_PLAYER_START, true)
  else
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    RequestLoading("MAPLIST_FIELD1")
    SetVisibleActor("BP_SearchEvent_C04_Trap_00", false)
    if GetMapTimeFrame() == MAPTIME_NIGHT then
      CmdPlayEventSequenceNextChangeMap(5, nil, nil, nil, false)
    elseif GetMapTimeFrame() == MAPTIME_EVENING then
      CmdPlayEventSequenceNextChangeMap(4, nil, nil, nil, false)
    else
      CmdPlayEventSequenceNextChangeMap(3, nil, nil, nil, false)
    end
    SetFlag(Flag.FE34, true)
    SetFlag(Flag.FE107, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_PORTOGA_RideShip, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.SUB_INFORMATION_SHIP, true)
    ChangeFieldShip("F_FromPortogaSouth", ORIENTATION_PLAYER_START, true)
  end
  EventEnd(eventInfo, "")
end

function Portoga_Out_SUB_0_MBR_SCOUT_1210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local volumeTag = (...)
  if volumeTag == "SuccessCollision" then
  elseif volumeTag == "FailCollision" then
  elseif volumeTag == nil then
  end
  local TextTable = {
    Success1 = "NPC_Talk_Portoga_Out_SUB_0_VOLUME_1210_010_1",
    Success2 = "NPC_Talk_Portoga_Out_SUB_0_VOLUME_1210_010_2",
    Success3 = "NPC_Talk_Portoga_Out_SUB_0_VOLUME_1210_010_3"
  }
  local MonsterScoutId = "MBR_SCOUT_SEASLIME_C04_Portoga_Out"
  local ActorId
  local mapTime = GetMapTimeFrame()
  if mapTime == MAPTIME_DAYTIME then
    ActorId = "Portoga_Out_SEASLIME_00_L1"
  elseif mapTime == MAPTIME_EVENING then
    ActorId = "Portoga_Out_SEASLIME_00_L2"
  elseif mapTime == MAPTIME_NIGHT then
    ActorId = "Portoga_Out_SEASLIME_00_L3"
  end
  local MonsterLocation = GetNpcLocation(ActorId)
  local PlayerLocation = {
    X = MonsterLocation.X,
    Y = MonsterLocation.Y - 160,
    Z = MonsterLocation.Z
  }
  local PlayerLook = {Chara = 1, Turn = 1}
  local CameraParam = {
    X = MonsterLocation.X - 100,
    Y = MonsterLocation.Y - 80,
    Z = MonsterLocation.Z + 50,
    Distance = 1800
  }
  MonsterScoutScript(MonsterScoutId, TextTable, ActorId, PlayerLocation, CameraParam, PlayerLook, volumeTag)
  EventEnd(eventInfo, "")
end

function Portoga_Out_SUB_0_ACTOR_1310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  araman()
  EventEnd(eventInfo, "")
end

function Portoga_Out_SUB_0_ACTOR_1310_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  manara()
  EventEnd(eventInfo, "")
end

function Portoga_Out_SUB_0_ACTOR_1410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  araman()
  EventEnd(eventInfo, "")
end

function Portoga_Out_SUB_0_ACTOR_1410_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  manara()
  EventEnd(eventInfo, "")
end

function araman()
  local Man, Arakure
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    Man = "Portoga_Out_Man_01_L3"
    Arakure = "Portoga_Out_Arakure_01_L3"
  else
    Man = "Portoga_Out_Man_01_L1"
    Arakure = "Portoga_Out_Arakure_01_L1"
  end
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1310_010_1")
  ChangeSpeaker()
  SpawnMangaIcon(Man, "FIELD_EFX2D_LAUGH")
  CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1410_010_1")
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1410_010_2")
end

function manara()
  local Man, Arakure
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    Man = "Portoga_Out_Man_01_L3"
    Arakure = "Portoga_Out_Arakure_01_L3"
  else
    Man = "Portoga_Out_Man_01_L1"
    Arakure = "Portoga_Out_Arakure_01_L1"
  end
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1410_020_1")
  ChangeSpeaker()
  CmdSpawnMangaIcon(Arakure, "FIELD_EFX2D_SURPRISE")
  CmdEventClosingMessage("NPC_Talk_Portoga_Out_SUB_0_ACTOR_1310_020_1")
end
