print("Load Script EventScript_D22_GranDragon_04_Appreciation")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Appreciation()
  EventEnd(eventInfo, "")
end

function GranDragon_04_Appreciation_SUB_0_EVENT_END_0110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Appreciation()
  EventEnd(eventInfo, "")
end

function GranDragon_04_Appreciation_SUB_0_ACTOR_0110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Appreciation()
  EventEnd(eventInfo, "")
end

function GranDragon_04_Appreciation_SUB_0_EVENT_END_0110_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Appreciation()
  EventEnd(eventInfo, "")
end

function GranDragon_04_Appreciation_SUB_0_ACTOR_0110_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Appreciation()
  EventEnd(eventInfo, "")
end

function GranDragon_04_Appreciation_SUB_0_EVENT_END_0110_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Appreciation()
  EventEnd(eventInfo, "")
end

function GranDragon_04_Appreciation_SUB_0_ACTOR_0110_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  Appreciation()
  EventEnd(eventInfo, "")
end

function Appreciation()
  local Item
  if GetFlag(Flag.FE715) == true then
    Item = "ITEM_IMPORTANT_MODMORE_ROD" --[["ITEM_IMPORTANT_MOD_ROD"]] -- AP
  elseif GetFlag(Flag.FE714) == true then
    Item = "ITEM_EQUIP_WEAPON_GRINGHAM_WHIP"
  elseif GetFlag(Flag.FE713) == true then
    Item = "ITEM_EQUIP_HELMET_LIGHT_HELM"
  else
    Item = "ITEM_EQUIP_WEAPON_SWORD_OF_KINGS"
  end
  SetDispMiniMap(false)
  if IsHaveItem(Item) == true then
    if GetFlag(Flag.FE715) == true then
      CmdMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_4")
      CmdMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_5")
      CmdEventClosingMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_9")
      SetFlag(Flag.FE716, true)
    elseif GetFlag(Flag.FE714) == true then
      CmdMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_3")
      CmdMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_5")
      CmdEventClosingMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_8")
      SetFlag(Flag.FE715, true)
    elseif GetFlag(Flag.FE713) == true then
      CmdMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_2")
      CmdMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_5")
      CmdEventClosingMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_7")
      SetFlag(Flag.FE714, true)
    else
      CmdMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_1")
      CmdMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_5")
      CmdEventClosingMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_6")
      SetFlag(Flag.FE713, true)
    end
    if GetFlag(Flag.FE716) == true then
      -- AP
      local trials_edits = AP.GetOption("trials_edits")
      if trials_edits ~= nil and trials_edits ~= 0 then
        if trials_edits == 1 or trials_edits == 2 then -- auto complete south trial
          SetFlag(Flag.FE717, true)
          SetFlag(Flag.FE718, true)
          SetFlag(Flag.FE719, true)
          SetFlag(Flag.FE720, true)
          local victory_goal = AP.GetOption("victory_goal")
          if victory_goal ~= nil and victory_goal ~= 6 then -- auto complete west trial
            SetFlag(Flag.FE706, true)
            SetFlag(Flag.FE707, true)
            SetFlag(Flag.FE708, true)
            SetFlag(Flag.FE709, true)
            SetFlag(Flag.FE710, true)
            SetFlag(Flag.FE711, true)
            SetFlag(Flag.FE712, true)
          end
        end
        if trials_edits == 2 then -- auto complete north-west and north-east trials
          SetFlag(Flag.FE721, true)
          SetFlag(Flag.FE722, true)
          SetFlag(Flag.FE724, true)
          SetFlag(Flag.FE725, true)
        end
      end
      -- AP end
      CheckCompTrial()
      CmdMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_11")
      CmdMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_12")
      if GetFlag(Flag.FE723) == true then
        CmdEventClosingMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_14")
      else
        CmdEventClosingMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_13")
      end
      ChangeMapTravelDoor("MAPLIST_D22R0101", "FromField", ORIENTATION_PLAYER_START)
    else
      CmdMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_10")
    end
  elseif GetFlag(Flag.FE715) == true then
    CmdEventClosingMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_4")
    SetDispMiniMap(true)
  elseif GetFlag(Flag.FE714) == true then
    CmdEventClosingMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_3")
    SetDispMiniMap(true)
  elseif GetFlag(Flag.FE713) == true then
    CmdEventClosingMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_2")
    SetDispMiniMap(true)
  else
    CmdEventClosingMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_1")
    SetDispMiniMap(true)
  end
end

function GranDragon_04_Appreciation_SUB_0_ACTOR_0110_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE705) == true then
    CmdEventClosingMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_15")
  elseif GetFlag(Flag.FE723) == true then
    CmdEventClosingMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_14")
  else
    CmdEventClosingMessage("NPC_Talk_GranDragon_04_Appreciation_SUB_0_ACTOR_0110_010_13")
  end
  EventEnd(eventInfo, "")
end
