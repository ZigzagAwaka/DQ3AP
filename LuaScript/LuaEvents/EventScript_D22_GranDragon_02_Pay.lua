print("Load Script EventScript_D22_GranDragon_02_Pay")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function GranDragon_02_Pay_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Pay()
  EventEnd(eventInfo, "")
end

function GranDragon_02_Pay_SUB_0_EVENT_END_0110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Pay()
  EventEnd(eventInfo, "")
end

function GranDragon_02_Pay_SUB_0_ACTOR_0110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Pay()
  EventEnd(eventInfo, "")
end

function GranDragon_02_Pay_SUB_0_EVENT_END_0110_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Pay()
  EventEnd(eventInfo, "")
end

function GranDragon_02_Pay_SUB_0_ACTOR_0110_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Pay()
  EventEnd(eventInfo, "")
end

function GranDragon_02_Pay_SUB_0_EVENT_END_0110_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Pay()
  EventEnd(eventInfo, "")
end

function GranDragon_02_Pay_SUB_0_ACTOR_0110_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Pay()
  EventEnd(eventInfo, "")
end

function GranDragon_02_Pay_SUB_0_EVENT_END_0110_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Pay()
  EventEnd(eventInfo, "")
end

function GranDragon_02_Pay_SUB_0_ACTOR_0110_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Pay()
  EventEnd(eventInfo, "")
end

function GranDragon_02_Pay_SUB_0_EVENT_END_0110_060(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Pay()
  EventEnd(eventInfo, "")
end

function GranDragon_02_Pay_SUB_0_ACTOR_0110_060(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Pay()
  EventEnd(eventInfo, "")
end

function GranDragon_02_Pay_SUB_0_EVENT_END_0110_070(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Pay()
  EventEnd(eventInfo, "")
end

function GranDragon_02_Pay_SUB_0_ACTOR_0110_070(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Pay()
  EventEnd(eventInfo, "")
end

function Pay()
  -- AP : replace requirement for west trial by mini medals for grand_dragon_medals victory goal
  local victory_goal = AP.GetOption("victory_goal")
  if victory_goal ~= nil and victory_goal == 6 then
    local Num = 110
    local required_medals_amount = AP.GetOption("required_medals_amount")
    if required_medals_amount ~= nil then
      Num = required_medals_amount
    end
    local Own = GetMiniMedalCount()
    SetTagItemId("ITEM_SMALL_MEDAL")
    SetTagValue(Num)
    SetDispMiniMap(false)
    CmdMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_1")
    local result = CmdChoiceMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_2")
    if result == true then
      if Num <= Own then
        CmdEventClosingMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_3")
        Wait(0.1)
        HideMessageWindowPageFeedIcon()
        CmdMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_4")
        ChangeSpeaker()
        CmdMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_5")
        SetFlag(Flag.FE706, true)
        SetFlag(Flag.FE707, true)
        SetFlag(Flag.FE708, true)
        SetFlag(Flag.FE709, true)
        SetFlag(Flag.FE710, true)
        SetFlag(Flag.FE711, true)
        SetFlag(Flag.FE712, true)
        CheckCompTrial()
        CmdMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_10")
        if GetFlag(Flag.FE723) == true then
          CmdEventClosingMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_12")
        else
          CmdEventClosingMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_11")
        end
        ChangeMapTravelDoor("MAPLIST_D22R0101", "FromField", ORIENTATION_PLAYER_START)
      else
        CmdMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_6")
        CmdEventClosingMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_7")
        SetDispMiniMap(true)
      end
    else
      CmdEventClosingMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_9")
      SetDispMiniMap(true)
    end
    return
  end
  -- AP end
  local Item
  local Num = 0
  if GetFlag(Flag.FE711) == true then
    Item = "ITEM_EQUIP_ARMOR_FLAME_ARMOUR"
    Num = 4
  elseif GetFlag(Flag.FE710) == true then
    Item = "ITEM_USE_ITEM_ELFIN_ELIXIR"
    Num = 10
  elseif GetFlag(Flag.FE709) == true then
    Item = "ITEM_USE_ITEM_MAGIC_WATER"
    Num = 25
  elseif GetFlag(Flag.FE708) == true then
    Item = "ITEM_EQUIP_ACCESSORY_SLIME_EARRINGS"
    Num = 4
  elseif GetFlag(Flag.FE707) == true then
    Item = "ITEM_EQUIP_ARMOR_EPIC_APRON"
    Num = 4
  elseif GetFlag(Flag.FE706) == true then
    Item = "ITEM_EQUIP_WEAPON_STAFF_OF_SENTENCING"
    Num = 4
  else
    Item = "ITEM_EQUIP_HELMET_HARDWOOD_HEADWEAR"
    Num = 4
  end
  local Own = GetHaveItemNum(Item)
  SetTagItemId(Item)
  SetTagValue(Num)
  SetDispMiniMap(false)
  CmdMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_1")
  local result = CmdChoiceMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_2")
  if result == true then
    if Num <= Own then
      CmdEventClosingMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_3")
      Wait(0.1)
      HideMessageWindowPageFeedIcon()
      CmdMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_4")
      local i = 0
      while Num > i do
        RemoveItem(Item)
        i = i + 1
      end
      ChangeSpeaker()
      CmdMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_5")
      if GetFlag(Flag.FE711) == true then
        SetFlag(Flag.FE712, true)
      elseif GetFlag(Flag.FE710) == true then
        SetFlag(Flag.FE711, true)
      elseif GetFlag(Flag.FE709) == true then
        SetFlag(Flag.FE710, true)
      elseif GetFlag(Flag.FE708) == true then
        SetFlag(Flag.FE709, true)
      elseif GetFlag(Flag.FE707) == true then
        SetFlag(Flag.FE708, true)
      elseif GetFlag(Flag.FE706) == true then
        SetFlag(Flag.FE707, true)
      else
        SetFlag(Flag.FE706, true)
      end
      if GetFlag(Flag.FE712) == true then
        CheckCompTrial()
        CmdMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_10")
        if GetFlag(Flag.FE723) == true then
          CmdEventClosingMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_12")
        else
          CmdEventClosingMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_11")
        end
        ChangeMapTravelDoor("MAPLIST_D22R0101", "FromField", ORIENTATION_PLAYER_START)
      else
        CmdMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_8")
      end
    else
      CmdMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_6")
      CmdEventClosingMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_7")
      SetDispMiniMap(true)
    end
  else
    CmdEventClosingMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_9")
    SetDispMiniMap(true)
  end
end

function GranDragon_02_Pay_SUB_0_ACTOR_0110_080(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE705) == true then
    CmdEventClosingMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_13")
  elseif GetFlag(Flag.FE723) == true then
    CmdEventClosingMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_12")
  else
    CmdEventClosingMessage("NPC_Talk_GranDragon_02_Pay_SUB_0_ACTOR_0110_010_11")
  end
  EventEnd(eventInfo, "")
end
