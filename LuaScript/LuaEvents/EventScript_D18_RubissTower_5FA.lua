print("Load Script EventScript_D18_RubissTower_5FA")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function RubissTower_5FA_MAIN_0_VOLUME_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetNicolaApertureRate(100, 0)
  RequestPreloadEventBattle("BATTLE_EVENT_NEWBOSS_RUBIS_TOWER_1")
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  CmdPlayEventSequenceNextEventBattle(0)
  CmdStartEventBattle("BATTLE_EVENT_NEWBOSS_RUBIS_TOWER_1")
  EventEnd(eventInfo, "")
end

function RubissTower_5FA_MAIN_0_BATTLE_END_0010_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetNicolaApertureRate(100, 0)
  CmdPlayEventSequencePrevEventBattle(1)
  PlayBGM(GetCurrentMapBgmId(), 0)
  CmdChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 1)
  PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WARP)
  CmdFadeIn(EFadingPriorityTopMost, 0.5)
  SetFlag(Flag.FE870, true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function RubissTower_5FA_MAIN_0_ACTOR_0120_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function RubissTower_5FA_RubissStatue_00(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  TurnParty(1, 0)
  if GetFlag(Flag.FE86) == true then
    CmdMessage("NPC_Talk_RubissTower_5FA_SearchObj_RubissStatue_1")
    CmdMessage("NPC_Talk_RubissTower_5FA_SearchObj_RubissStatue_2")
    SetTagItemId("ITEM_IMPORTANT_FAERIE_FLUTE")
    local result = CmdChoiceMessage("NPC_Talk_RubissTower_5FA_SearchObj_RubissStatue_3")
    if result == true then
      SetNicolaApertureRate(100, 0)
      SetDispMiniMap(false)
      StopBGM(0.5)
      CmdFadeOut(EFadingPriorityTopMost, 0.5)
      Wait(0.1)
      SetTagItemId("ITEM_USE_ITEM_SPHERE_OF_LIGHT")
      SetTagItemId2("ITEM_IMPORTANT_RAINBOW_DROP")
      SetTagItemId3("ITEM_EQUIP_ACCESSORY_SACRED_AMULET")
      FadeIn(EFadingPriorityTopMost, 0.5)
      CmdPlayEventSequence(2)
      CmdFadeOut(EFadingPriorityTopMost, 0)
      CmdChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 1)
      PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WARP)
      -- AP
      AP.Log("RubissTower_5FA_RubissStatue_00 called (Tower of Rubiss - Getting the Sacred Amulet)")
      AP.CheckLocation("RubissTower_5FA_RubissStatue_00")
      local apItemId = "ITEM_ARCHIPELAGO"
      if apItemId == "ITEM_ARCHIPELAGO" then
        AddItem(apItemId)
      else
        AddItem("ITEM_EQUIP_ACCESSORY_SACRED_AMULET")
      end
      -- AP end
      SetVisibleActor("BP_SearchEvent_Ground_Box_01", false)
      SetVisibleActorsTag("RubissStatue", false)
      SetFlag(Flag.FE230, true)
      -- AP
      if apItemId == "ITEM_ARCHIPELAGO" then
      else
        SetFlag(Flag.FE81, true)
      end
      -- AP end
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_RUBISSTOWER_Dispel, true)
      PlayBGM(GetCurrentMapBgmId(), 0)
      CmdFadeIn(EFadingPriorityTopMost, 0.5)
      RequestAutoSaveFromEvent()
    end
  else
    CmdMessage("NPC_Talk_RubissTower_5FA_SearchObj_RubissStatue_1")
    CmdEventClosingMessage("NPC_Talk_RubissTower_5FA_SearchObj_RubissStatue_2")
  end
  EventEnd(eventInfo, "")
end
