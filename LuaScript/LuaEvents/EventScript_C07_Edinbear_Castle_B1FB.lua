print("Load Script EventScript_C07_Edinbear_Castle_B1FB")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Edinbear_Castle_B1FB_TreasurBox(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdTreasure_Important(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  --SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_EDINBEAR_GetBottomlessPot, true) -- AP
  if true--[[GetFlag(Flag.FE66) == false]] then -- AP
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
    --SetFlag(Flag.FE66, true) -- AP
  end
  EventEnd(eventInfo, "")
end
