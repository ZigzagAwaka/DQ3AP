print("Load Script EventScript_T15_Burg_5_House01_1F")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Burg_5_House01_1F_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Burg_5_House01_1F_SUB_0_ACTOR_0110_010_1")
  EventEnd(eventInfo, "")
end

function Burg_5_House01_1F_Ground(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if true--[[GetFlag(Flag.FE77) == false]] then -- AP
    if GetFlag(Flag.FE126) == true then
      SetVisibleActor(eventInfo[1], false)
      --SetFlag(Flag.FE77, true) -- AP
      CmdSearchObject_Ground(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, 1--[[Gold]]) -- AP
      SetFlagGopEnumSearch(FlagGOPEnumSearch.SEARCH_Burg_5_House01_1F_GROUND_0, true)
      --SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BURG_GetYellowOrb, true) -- AP
      --CheckGopEnum_MAIN_MULTI_GetAllOrb() -- AP
      RequestAutoSaveFromEvent()
    else
      CmdEventClosingMessage("NPC_Talk_Burg_5_House01_1F_SearchObj_Chair_1")
    end
  end
  EventEnd(eventInfo, "")
end
