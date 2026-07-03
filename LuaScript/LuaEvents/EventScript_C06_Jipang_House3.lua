print("Load Script EventScript_C06_Jipang_House3")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Jipang_House3_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_House3_SUB_0_ACTOR_0110_010_1")
  EventEnd(eventInfo, "", false)
end

function Jipang_House3_SUB_0_ACTOR_0120_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_House3_SUB_0_ACTOR_0120_010_1")
  EventEnd(eventInfo, "")
end

function Jipang_House3_SUB_0_ACTOR_0110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_House3_SUB_0_ACTOR_0110_020_1")
  EventEnd(eventInfo, "", false)
end

function Jipang_House3_SUB_0_ACTOR_0110_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_House3_SUB_0_ACTOR_0110_030_1")
  EventEnd(eventInfo, "", false)
end

function Jipang_House3_SUB_0_ACTOR_0220_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_House3_SUB_0_ACTOR_0220_010_1")
  EventEnd(eventInfo, "")
end

function Jipang_House3_Ground_00(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetVisibleActor(targetActorId, false)
  SearchObject_Important(eventInfo, TreasureId, ItemId)
  -- AP
  local ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
  else
    SetFlag(Flag.FE841, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_JIPANG_GetGaiaHanmer, true)
  end
  -- AP end
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end
