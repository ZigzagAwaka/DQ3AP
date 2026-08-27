print("Load Script EventScript_T16_PiratesBase_Secret")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function PiratesBase_Secret_RedOrb(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  SetVisibleActorsTag("RedOrb", false)
  SearchObject_Important(eventInfo, TreasureId, ItemId)
  SetFlag(Flag.FE75, true) -- item flag can't be set, check for item in inventory instead
  --SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_PIRATESBASE_GetRedOrb, true) -- AP
  --CheckGopEnum_MAIN_MULTI_GetAllOrb() -- AP
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end
