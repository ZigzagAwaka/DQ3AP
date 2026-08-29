print("Load Script EventScript_C07_Edinbear_Castle_B1FB")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Edinbear_Castle_B1FB_TreasurBox(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  -- AP: replace CmdTreasure_Important with SearchObject_ShowMessage
  if CanObtainItem then
    PlaySEUI("SYSSE_TD_TREASURE_BOX")
    CmdPlayOpenAnimSearchObj(eventInfo[1])
    CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_1")
    if SearchObject_ShowMessage(GetTargetActorIdFromEventInfo(eventInfo), TreasureId, ItemId, ItemCount, Gold) == -1 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_2")
    end
  else
    CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_3")
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_2")
  end
  --CmdTreasure_Important(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  --SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_EDINBEAR_GetBottomlessPot, true)
  -- AP end
  if not GetFlag(Flag.FAP9) --[[GetFlag(Flag.FE66) == false]] then -- AP
    CloseMessage()
    Wait(0.5)
    SetTagItemId("ITEM_IMPORTANT_BOTTOMLESS_POT")
    CmdMessage("NPC_Talk_Edinbear_Castle_B1FB_TreasurBox_1")
    CmdEventClosingMessage("NPC_Talk_Edinbear_Castle_B1FB_TreasurBox_2")
    SetEventFadeAlpha(0.5)
    CmdFadeOut(EFadingPriorityEventUIBackGround, 0.5)
    CmdMessageDetail("NPC_Talk_Edinbear_Castle_B1FB_TreasurBox_3", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
    CmdMessageDetail("NPC_Talk_Edinbear_Castle_B1FB_TreasurBox_4", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
    CmdMessageDetail("NPC_Talk_Edinbear_Castle_B1FB_TreasurBox_5", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
    CmdMessageDetail("NPC_Talk_Edinbear_Castle_B1FB_TreasurBox_6", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
    CmdMessageDetail("NPC_Talk_Edinbear_Castle_B1FB_TreasurBox_7", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
    CmdMessageDetail("NPC_Talk_Edinbear_Castle_B1FB_TreasurBox_8", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
    CmdEventClosingMessageDetail("NPC_Talk_Edinbear_Castle_B1FB_TreasurBox_9", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
    CloseMessage()
    CmdFadeIn(EFadingPriorityEventUIBackGround, 0.5)
    CmdEventClosingMessage("NPC_Talk_Edinbear_Castle_B1FB_TreasurBox_10")
    SetFlag(Flag.FAP9, true) --SetFlag(Flag.FE66, true) -- AP
  end
  AP.GiveItemsIfAvailable(GetTargetActorIdFromEventInfo(eventInfo), TreasureId) -- AP
  EventEnd(eventInfo, "")
end
