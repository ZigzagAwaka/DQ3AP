print("Load Script EventScript_D12_RaCave_B3")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function RaCave_B3_Treasure_Important(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  -- AP
  CmdTreasure_Important(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  -- AP end
  --[[
  if GetFlag(Flag.FE68) == true then
    CmdTreasure_Important(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  else
    CmdTreasure_Important(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
    SetFlag(Flag.FE68, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_RACAVE_GetRaMirror, true)
  end
  ]]
  EventEnd(eventInfo, "")
end
