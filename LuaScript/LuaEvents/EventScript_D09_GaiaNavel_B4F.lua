print("Load Script EventScript_D09_GaiaNavel_B4F")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function GaiaNavel_B4F_blue(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  SetTagItemId("ITEM_IMPORTANT_WRECKING_BALL")
  SetTagItemId2("ITEM_IMPORTANT_BLUE_METAL")
  if GetFlag(Flag.FE837) == true then
    CmdMessage("NPC_Talk_GaiaNavel_B4F_Event_0010_010_1")
    CmdMessage("NPC_Talk_GaiaNavel_B4F_Event_0010_010_2")
    local result = CmdChoiceMessage("NPC_Talk_GaiaNavel_B4F_Event_0010_010_3")
    if result == true then
      CloseMessage()
      CmdFadeOut(EFadingPriorityTopMost, 0.5)
      FadeIn(EFadingPriorityTopMost, 0.5)
      CmdPlayEventSequence(0)
      CmdFadeOut(EFadingPriorityTopMost, 0)
      ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 0, 2)
      PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WARP)
      SetDispMiniMap(false)
      SetFlag(Flag.FF0, true)
      SetVisibleActorsTag("before", false)
      SetVisibleActorsTag("after", true)
      SetVisibleActorsTag("after_Metal", true)
      CmdFadeIn(EFadingPriorityTopMost, 0.5)
      CmdMessage("NPC_Talk_GaiaNavel_B4F_Event_0010_010_5")
      SetVisibleActor("BP_SearchEvent_Ground_01", false)
      SetVisibleActorsTag("after_Metal", false)
      HideMessageWindowPageFeedIcon()
      ItemGetMessageToLocation("NPC_Talk_GaiaNavel_B4F_Event_0010_010_6", "ITEM_ARCHIPELAGO"--[["ITEM_IMPORTANT_BLUE_METAL"]], { -- AP
        X = 650,
        Y = 777,
        Z = 120
      })
      -- AP
      AP.Log("GaiaNavel_B4F_blue called (Gaia's Navel - Getting Zenithium)")
      AP.CheckLocation("GaiaNavel_B4F_blue")
      --AddItem("ITEM_IMPORTANT_BLUE_METAL")
      -- AP end
      if IsHaveItem("ITEM_IMPORTANT_WRECKING_BALL") then -- AP
        RemoveItem("ITEM_IMPORTANT_WRECKING_BALL")
      end
      SetFlag(Flag.FE859, true) -- item flag can't be set, check for item in inventory instead
      -- AP
      --CheckCreateLightHelm()
      if GetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_GAIANAVEL_GetBlueMetal) == false then
        --SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_GAIANAVEL_GetBlueMetal, true)
      end
      -- AP end
      RequestAutoSaveFromEvent()
    else
    end
  elseif GetFlag(Flag.FE835) == true then
    CmdMessage("NPC_Talk_GaiaNavel_B4F_Event_0010_010_1")
    CmdEventClosingMessage("NPC_Talk_GaiaNavel_B4F_Event_0010_010_2")
  else
    CmdEventClosingMessage("NPC_Talk_GaiaNavel_B4F_Event_0010_010_1")
  end
  SetDispMiniMap(true)
  if GetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_GAIANAVEL_FindDeposit) == false then
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_GAIANAVEL_FindDeposit, true)
  end
  EventEnd(eventInfo, "")
end
