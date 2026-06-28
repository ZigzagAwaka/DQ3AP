print("Load Script EventScript_T01_Reeve_House2_2F")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Reeve_House2_1F_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local MapTime = GetMapTimeFrame()
  local Oldman_Reeve
  if MapTime == MAPTIME_NIGHT then
    Oldman_Reeve = "Reeve_House2_2F_OldMan_Reeve_01_L3"
  else
    Oldman_Reeve = "Reeve_House2_2F_OldMan_Reeve_01_L1"
  end
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  CmdChangeStageCameraToGlobalPoint(1180, 550, 200, CAMERA_BLEND_EASE_IN_OUT, 1.5, 2, 2200, {
    Yaw = 0,
    Pitch = -25,
    Roll = 0
  })
  SetTagItemId("ITEM_IMPORTANT_THIEFS_KEY")
  CmdMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_010_1")
  local result = CmdChoiceMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_010_2")
  if result == true then
    CmdMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_010_3")
  else
    CmdMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_010_4")
  end
  CmdMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_010_5")
  CmdMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_010_6")
  ItemGetMessageToActor("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_010_7", "ITEM_IMPORTANT_WRECKING_BALL", Oldman_Reeve)
  CmdMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_010_8")
  CmdMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_010_8_1")
  CmdMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_010_9")
  if CheckHeroLiving() == true then
    CmdEventClosingMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_010_10")
    SpawnMangaIcon(Oldman_Reeve, "FIELD_EFX2D_THINK")
    Wait(1.5)
    CloseMangaIconAll(Oldman_Reeve)
    CmdMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_010_11")
    CmdEventClosingMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_010_12")
  else
    CmdEventClosingMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_010_10")
  end
  -- AP
  AP.Log("Reeve_House2_1F_SUB_0_ACTOR_0110_010 called (Reeve - Old man that gives the Wrecking Ball)")
  AP.CheckLocation("Reeve_House2_1F_SUB_0_ACTOR_0110_010")
  local ItemId = "ITEM_ARCHIPELAGO"
  AddItem(ItemId)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
  if ItemId == "ITEM_ARCHIPELAGO" then
    return
  end
  -- AP end
  AddItem("ITEM_IMPORTANT_WRECKING_BALL")
  SetFlag(Flag.FE57, true)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_REEVE_GetMagicBall, true)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function Reeve_House2_1F_SUB_0_ACTOR_0110_020(BeginOverlap, table, ...)
  Reeve_House2_1F_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_020_1")
  EventEnd(eventInfo, "")
  ]]
end

function Reeve_House2_1F_SUB_0_ACTOR_0110_030(BeginOverlap, table, ...)
  Reeve_House2_1F_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_030_1")
  CmdEventClosingMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_030_2")
  EventEnd(eventInfo, "")
  ]]
end

function Reeve_House2_1F_SUB_0_ACTOR_0110_035(BeginOverlap, table, ...)
  Reeve_House2_1F_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_040_1")
  EventEnd(eventInfo, "")
  ]]
end

function Reeve_House2_1F_SUB_0_ACTOR_0110_040(BeginOverlap, table, ...)
  AP.Log("Reeve_House2_1F_SUB_0_ACTOR_0110_040 called (Reeve - Wrecking ball 2)")
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local MapTime = GetMapTimeFrame()
  local Oldman_Reeve
  if MapTime == MAPTIME_NIGHT then
    Oldman_Reeve = "Reeve_House2_2F_OldMan_Reeve_01_L3"
  else
    Oldman_Reeve = "Reeve_House2_2F_OldMan_Reeve_01_L1"
  end
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  SetTagItemId("ITEM_IMPORTANT_WRECKING_BALL")
  if GetFlag(Flag.FE837) == true then
    CmdEventClosingMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_040_4")
  else
    CmdEventClosingMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_040_1")
    SpawnMangaIconByParty(1, "FIELD_EFX2D_THINK")
    Wait(1.5)
    CloseMangaIconAllByParty(1)
    CmdMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_040_2")
    ItemGetMessageToActor("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_040_3", "ITEM_IMPORTANT_WRECKING_BALL", Oldman_Reeve)
    AddItem("ITEM_IMPORTANT_WRECKING_BALL")
    CmdEventClosingMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_040_4")
  end
  SetDispMiniMap(true)
  if GetFlag(Flag.FE837) == true then
  else
    SetFlag(Flag.FE837, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_REEVE_GetMagicBall_2, true)
    RequestAutoSaveFromEvent()
  end
  EventEnd(eventInfo, "")
end

function Reeve_House2_1F_SUB_0_ACTOR_0110_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_030_1")
  CmdEventClosingMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0110_030_2")
  EventEnd(eventInfo, "")
end

function Reeve_House2_1F_SUB_0_ACTOR_0220_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Reeve_House2_1F_SUB_0_ACTOR_0220_010_1")
  EventEnd(eventInfo, "")
end
