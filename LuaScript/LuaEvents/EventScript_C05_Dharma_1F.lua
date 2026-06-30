print("Load Script EventScript_C05_Dharma_1F")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Dharma_1F_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0110_010_1")
  EventEnd(eventInfo, "")
end

function Dharma_1F_SUB_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0210_010_1")
  EventEnd(eventInfo, "")
end

function Dharma_1F_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0310_010_1")
  EventEnd(eventInfo, "")
end

function Dharma_1F_SUB_0_ACTOR_0410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0410_010_1")
  EventEnd(eventInfo, "")
end

function Dharma_1F_SUB_0_ACTOR_0510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if GetFlagGopEnumProgress(FlagGOPEnumProgress.SUB_INFORMATION_JOB_CHANGE) == false then
    CmdCallTutorialUI("INFORMATION_JOB_CHANGE")
    CmdCallTutorialUI("INFORMATION_JOB_CHANGE_RECOMMEND")
    CmdCallTutorialUI("INFORMATION_JOB_CHANGE_RECOMMEND_3")
    SetFlagGopEnumProgress(FlagGOPEnumProgress.SUB_INFORMATION_JOB_CHANGE, true)
  end
  CmdCallJobChangeUI()
  if GetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_DHARMA_TalkAbbot) == false then
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_DHARMA_TalkAbbot, true)
  end
  EventEnd(eventInfo, "")
end

function Dharma_1F_SUB_0_ACTOR_0610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0610_010_1")
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0610_010_2")
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0610_010_3")
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0610_010_4")
  CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0610_010_5")
  EventEnd(eventInfo, "")
end

function Dharma_1F_SUB_0_ACTOR_0710_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0710_010_1")
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0710_010_2")
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0710_010_3")
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0710_010_4")
  CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0710_010_5")
  EventEnd(eventInfo, "")
end

function Dharma_1F_SUB_0_ACTOR_0810_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local Trader
  local MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Trader = "Dharma_1F_Trader_01_L3"
  else
    Trader = "Dharma_1F_Trader_01_L1"
  end
  if GetFlag(Flag.FE64) == true then
    CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0810_010_5")
  else
    CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0810_010_1")
    CloseMessage()
    CmdSpawnMangaIcon(Trader, "FIELD_EFX2D_SURPRISE")
    CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0810_010_2")
    CloseMessage()
    TurnNpc(Trader, NPC_D_UP)
    WaitFrame(1)
    SetNpcAnimation(Trader, AnimationType.Walk, 2, EFlipbookPlayTypeLoop, false)
    PlaySEEvent("SE_EVENT_SEARCH")
    Wait(0.5)
    ResetNpcAnimation(Trader)
    Wait(1)
    TurnNpc(Trader, NPC_D_TO_PLAYER)
    CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0810_010_3")
    ItemGetMessageToActor("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0810_010_4", "ITEM_IMPORTANT_BLACK_PEPPER", Trader)
    -- AP
    AP.Log("Dharma_1F_SUB_0_ACTOR_0810_010 called (Trader giving the Black Pepper)")
    AP.CheckLocation("Dharma_1F_SUB_0_ACTOR_0810_010")
    local ItemId = "ITEM_ARCHIPELAGO"
    if ItemId == "ITEM_ARCHIPELAGO" then
      AddItem(ItemId)
    else
      SetFlag(Flag.FE64, true)
      AddItem("ITEM_IMPORTANT_BLACK_PEPPER")
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BAHARATA_GetPepper, true)
    end
    -- AP end
    RequestAutoSaveFromEvent()
  end
  EventEnd(eventInfo, "", false)
end

function Dharma_1F_SUB_0_ACTOR_0910_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE745) == true then
    CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0910_010_5")
    CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0910_010_6")
  else
    CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0910_010_1")
    CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0910_010_2")
    CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0910_010_3")
    CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_0910_010_4")
    SetFlag(Flag.FE745, true)
  end
  EventEnd(eventInfo, "")
end

function Dharma_1F_SUB_0_ACTOR_1010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1010_010_1")
  CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1010_010_2")
  EventEnd(eventInfo, "")
end

function Dharma_1F_SUB_0_ACTOR_1110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1110_010_1")
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1110_010_2")
  CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1110_010_3")
  EventEnd(eventInfo, "", false)
end

function Dharma_1F_SUB_0_ACTOR_1210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SpawnMangaIcon("Dharma_1F_Swordsman_01_L1", "FIELD_EFX2D_MOYAMOYA")
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1210_010_1")
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1210_010_2")
  CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1210_010_3")
  EventEnd(eventInfo, "", false)
end

function Dharma_1F_SUB_0_ACTOR_1310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1310_010_1")
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1310_010_2")
  CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1310_010_3")
  EventEnd(eventInfo, "", false)
end

function Dharma_1F_SUB_0_ACTOR_1410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1410_010_1")
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1410_010_2")
  CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1410_010_3")
  EventEnd(eventInfo, "", false)
end

function Dharma_1F_SUB_0_ACTOR_1510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  nunara()
  EventEnd(eventInfo, "", false)
end

function Dharma_1F_SUB_0_ACTOR_1610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  nunara()
  EventEnd(eventInfo, "", false)
end

function nunara()
  SpawnMangaIcon("Dharma_1F_Nun_01_L1", "FIELD_EFX2D_IRRITATION")
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1510_010_1")
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1510_010_2")
  ChangeSpeaker()
  SpawnMangaIcon("Dharma_1F_Arakure_01_L1", "FIELD_EFX2D_IMPATIENCE")
  CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1610_010_1")
end

function Dharma_1F_SUB_0_ACTOR_1710_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1710_010_1")
  CmdEventClosingMessage("NPC_Talk_Dharma_1F_SUB_0_ACTOR_1710_010_2")
  EventEnd(eventInfo, "", false)
end
