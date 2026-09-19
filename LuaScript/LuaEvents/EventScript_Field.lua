print("Load Script EventScript_Field")

local AP = require("Src/DQ3AP") -- AP

function Field_TUTO_0_SCENE_0110_080(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  if GetFlag(Flag.FE956) == false then
    CmdCallTutorialUI("INFORMATION_MAPMENU")
    SetFlag(Flag.FE956, true)
  end
  if GetFlag(Flag.FE959) == false then
    CmdCallTutorialUI("INFORMATION_INFORMATION")
    SetFlag(Flag.FE959, true)
  end
  RequestUnlockAchievementByFieldAliahan()
  AP.GiveItemsIfAvailable() -- AP
  EventEnd(eventInfo, "")
end

function Field_MAIN_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  Burg_Remind_1()
  AP.GiveItemsIfAvailable() -- AP
  EventEnd(eventInfo, "")
end

function Field_MAIN_0_SCENE_0010_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  Burg_Remind_2()
  AP.GiveItemsIfAvailable() -- AP
  EventEnd(eventInfo, "")
end

function Field_MAIN_0_SCENE_0010_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  Burg_Remind_3()
  AP.GiveItemsIfAvailable() -- AP
  EventEnd(eventInfo, "")
end

function Field_MAIN_0_SCENE_0010_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  Burg_Remind_4()
  AP.GiveItemsIfAvailable() -- AP
  EventEnd(eventInfo, "")
end

function Field_MAIN_0_SCENE_0010_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  Burg_Remind_5()
  AP.GiveItemsIfAvailable() -- AP
  EventEnd(eventInfo, "")
end

function H12_ShallowShrine_FieldEvent_01(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_IMPORTANT_BOTTOMLESS_POT")
  if GetFlag(Flag.FE101) == true then
    ChangeMap("MAPLIST_H12R0101", "FromField", ORIENTATION_CURRENT)
  elseif GetFlag(Flag.FE66) == true then
    CmdMessage("NPC_Talk_ShallowShrine_Out_MAIN_0_SCENE_0110_010_1")
    result = CmdChoiceMessage("NPC_Talk_ShallowShrine_Out_MAIN_0_SCENE_0110_010_2")
    if result == true then
      PlaySEEvent("EVESE_SHALLOWSHRINE_POT_THROW")
      StopBGM(1)
      CmdEventClosingMessage("NPC_Talk_ShallowShrine_Out_MAIN_0_SCENE_0110_010_3")
      Wait(0.5)
      CloseMessage()
      SetFlag(Flag.FE101, true)
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_SHALLOWSHRINE_UsePot, true)
      CmdFadeOut(EFadingPriorityTopMost, 1)
      ChangeMap("MAPLIST_H12R0102", "FromField", ORIENTATION_CURRENT)
      RemoveItem("ITEM_IMPORTANT_BOTTOMLESS_POT")
    else
    end
  else
    CmdEventClosingMessage("NPC_Talk_ShallowShrine_Out_MAIN_0_SCENE_0110_010_1")
  end
  EventEnd(eventInfo, "")
end

function Field_MAIN_0_VOLUME_0020_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetFlag(Flag.FE872, true)
  ChangeMap("MAPLIST_H14R0102", "From1F", ORIENTATION_DOWN)
  EventEnd(eventInfo, "")
end

function YGGDRASIL_LEAF_FieldEvent_01(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Common_SEARCHOBJECT_Yggdrasil_1")
  if GetFlag(Flag.FE726) == true then
    if IsHaveItem("ITEM_USE_ITEM_YGGDRASIL_LEAF") == true then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Yggdrasil_2")
    else
      ItemGetMessage("NPC_Talk_Common_SEARCHOBJECT_SHINE_1", "ITEM_USE_ITEM_YGGDRASIL_LEAF", false, true)
      AddItem("ITEM_USE_ITEM_YGGDRASIL_LEAF")
    end
  else
    ItemGetMessage("NPC_Talk_Common_SEARCHOBJECT_SHINE_1", "ITEM_USE_ITEM_YGGDRASIL_LEAF", false, true)
    AddItem("ITEM_USE_ITEM_YGGDRASIL_LEAF") -- AP: todo: randomize this item
    SetFlag(Flag.FE726, true)
  end
  EventEnd(eventInfo, "")
end

function H99_Rainbow_Bridge_FieldEvent_01(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_IMPORTANT_RAINBOW_DROP")
  if GetFlag(Flag.FE93) == false then
    TurnParty(1, 3)
    CmdMessage("NPC_Talk_Common_H99_Rainbow_Bridge_FieldEvent_01_1")
    if GetFlag(Flag.FE88) == true then
      CmdMessage("NPC_Talk_Common_H99_Rainbow_Bridge_FieldEvent_01_2")
      result = CmdChoiceMessage("NPC_Talk_Common_H99_Rainbow_Bridge_FieldEvent_01_3")
      if result == true then
        StopBGM(1)
        CmdFadeOut(EFadingPriorityTopMost, 1)
        RemoveItem("ITEM_IMPORTANT_RAINBOW_DROP")
        ChangeMap("MAPLIST_H28F0101", "FromField", ORIENTATION_LEFT)
      else
      end
    else
      CmdEventClosingMessage("NPC_Talk_Common_H99_Rainbow_Bridge_FieldEvent_01_2")
    end
  end
  EventEnd(eventInfo, "")
end

function Field_MAIN_0_SCENE_0030_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityWhiteTopMost, 0.5, GetCurrentMapId())
  local n = GetPartyMemberNum()
  local i = 1
  if n == CheckLivingMemberNum() then
    CmdEventClosingMessage("NPC_Talk_Common_Field_MAIN_0_SCENE_0030_010_1")
  else
    CmdMessage("NPC_Talk_Common_Field_MAIN_0_SCENE_0030_010_1")
    for i = i, n do
      if 1 > GetPartyMemberStatus(i, UNIT_STATUS_HP) then
        SetTagWord(GetPartyMemberName(i, UNIT_NAME_NAME))
        RevivalPartyMember(i, 1)
        if i == n then
          CmdEventClosingMessage("NPC_Talk_Common_Field_MAIN_0_SCENE_0030_010_2")
        else
          CmdMessage("NPC_Talk_Common_Field_MAIN_0_SCENE_0030_010_2")
          i = i + 1
        end
      end
    end
  end
  HealPartyMemberStatusEffect(0)
  HealPartyMemberMP(0, 1000)
  HealPartyMemberHP(0, 1000)
  SetFlag(Flag.FE800, true)
  print("\227\131\169\227\131\128\227\131\136\227\131\188\227\131\160\227\129\171\230\156\157\227\129\140\230\157\165\227\129\159\227\130\146\232\166\139\227\129\159")
  EventEnd(eventInfo, "")
end
