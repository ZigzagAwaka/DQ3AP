print("Load Script EventScript_C10_Ludatorm_Castle_2F_hidden_room")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Ludatorm_Castle_2F_hidden_room_Treasure_Important(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  print("Treasure_Normal execute, TreasureId : " .. tostring(TreasureId) .. ", Item : " .. tostring(ItemId) .. ", Count : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold) .. ", EnemyId : " .. tostring(EnemyId))
  print("CanObtainItem=" .. tostring(CanObtainItem))
  if CanObtainItem then
    PlaySE("SE_TD_TREASURE_BOX", {
      X = 0,
      Y = 0,
      Z = 0
    }, eventInfo[1])
    CmdPlayOpenAnimSearchObj(eventInfo[1])
    CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_1")
    SearchObject_ShowMessage(GetTargetActorIdFromEventInfo(eventInfo), TreasureId, ItemId, ItemCount, Gold)
    --[[
    SetFlag(Flag.FE85, true)
    if GetFlag(Flag.FE87) == true then
      SetFlag(Flag.FE880, true)
    end
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_LUDATORM_GetSunStone, true)
    ]]
    RequestAutoSaveFromEvent()
  else
    CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_3")
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_2")
  end
  EventEnd(eventInfo, "")
end
