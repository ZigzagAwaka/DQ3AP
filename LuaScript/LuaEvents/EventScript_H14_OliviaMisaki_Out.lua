print("Load Script EventScript_H14_OliviaMisaki_Out")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function OliviaMisaki_Out_MAIN_0_SCENE_0010_010(BeginOverlap, table, ...)
  -- AP
  if IsHaveItem("ITEM_IMPORTANT_LOVERS_LOCKET") then
    if not GetFlag(Flag.FE100) then
      OliviaMisaki_Out_MAIN_0_SCENE_0010_020(BeginOverlap, table, ...)
    end
    return
  end
  -- AP end
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local mapTime = GetMapTimeFrame()
  if GetFlag(Flag.FE872) == true then
    SetDispMiniMap(false)
    if GetFlag(Flag.FE873) == true then
      if mapTime == MAPTIME_NIGHT then
        CmdPlayEventSequenceChangeMapPrevAndNext(3)
      elseif mapTime == MAPTIME_EVENING then
        CmdPlayEventSequenceChangeMapPrevAndNext(7)
      else
        CmdPlayEventSequenceChangeMapPrevAndNext(2)
      end
    else
      if mapTime == MAPTIME_NIGHT then
        CmdPlayEventSequenceChangeMapPrevAndNext(1)
      elseif mapTime == MAPTIME_EVENING then
        CmdPlayEventSequenceChangeMapPrevAndNext(6)
      else
        CmdPlayEventSequenceChangeMapPrevAndNext(0)
      end
      SetFlag(Flag.FE873, true)
    end
    SetFlag(Flag.FE872, false)
    ChangeFieldShip("Olivia_Before", ORIENTATION_UP, true)
  else
    DisableEventFastForwardUI()
    print("\227\130\185\227\130\173\227\131\131\227\131\151\233\157\158\232\161\168\231\164\186")
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  end
  EventEnd(eventInfo, "")
end

function OliviaMisaki_Out_MAIN_0_SCENE_0010_020(BeginOverlap, table, ...)
  -- AP
  if not IsHaveItem("ITEM_IMPORTANT_LOVERS_LOCKET") then
    OliviaMisaki_Out_MAIN_0_SCENE_0010_010(BeginOverlap, table, ...)
    return
  end
  -- AP end
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local mapTime = GetMapTimeFrame()
  if GetFlag(Flag.FE872) == true then
    SetDispMiniMap(false)
    RequestLoading("MAPLIST_FIELD1")
    SetTagItemId("ITEM_IMPORTANT_LOVERS_LOCKET")
    if mapTime == MAPTIME_NIGHT then
      CmdPlayEventSequenceChangeMapPrevAndNext(5)
    elseif mapTime == MAPTIME_EVENING then
      CmdPlayEventSequenceChangeMapPrevAndNext(8)
    else
      CmdPlayEventSequenceChangeMapPrevAndNext(4)
    end
    SetFlag(Flag.FE100, true)
    if IsHaveItem("ITEM_IMPORTANT_LOVERS_LOCKET") then -- AP
      RemoveItem("ITEM_IMPORTANT_LOVERS_LOCKET")
    end
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_OLIVIAMISAKI_Dispel, true)
    SetFlag(Flag.FE872, false)
    ChangeFieldShip("Olivia_After", ORIENTATION_PLAYER_START, true)
  else
    DisableEventFastForwardUI()
    print("\227\130\185\227\130\173\227\131\131\227\131\151\233\157\158\232\161\168\231\164\186")
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  end
  EventEnd(eventInfo, "")
end
