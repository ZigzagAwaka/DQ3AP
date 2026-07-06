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
  -- AP
  ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
  else
    SetFlag(Flag.FE75, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_PIRATESBASE_GetRedOrb, true)
    CheckGopEnum_MAIN_MULTI_GetAllOrb()
  end
  -- AP end
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end
