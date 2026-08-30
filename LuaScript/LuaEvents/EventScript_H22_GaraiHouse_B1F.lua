print("Load Script EventScript_H22_GaraiHouse_B1F")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function GaraiHouse_B1F_SilverHarp_0(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetVisibleActor(targetActorId, false) -- AP: destroy item actor as it will not be destroyed during SearchObject_Important (vanilla) because of the AP patch
  SearchObject_Important(eventInfo, TreasureId, ItemId, "BGM_JINGLE_017")
  SetFlag(Flag.FE895, true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end
