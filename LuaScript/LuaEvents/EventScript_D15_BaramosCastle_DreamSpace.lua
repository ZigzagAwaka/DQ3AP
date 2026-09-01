print("Load Script EventScript_D15_BaramosCastle_DreamSpace")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function BaramosCastle_DreamSpace_MAIN_0_SCENE_0000_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SetNicolaApertureRate(100, 0)
  RequestLoading("MAPLIST_C01F0101")
  CmdPlayEventSequencePrevChangeMap(0, GetCurrentMapId(), nil, 1, nil, nil, nil)
  SetDispMiniMap(false)
  local ResultHeroSolo = CheckHeroSolo()
  if ResultHeroSolo == true then
    SetFlag(Flag.FE183, true)
  end
  SetFlag(Flag.FE90, true)
  SetFlag(Flag.FE94, true)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BARAMOSCASTLE_DefeatBaramos, true)
  -- AP
  AP.Log("BaramosCastle_DreamSpace_MAIN_0_SCENE_0000_010 called (Baramos Castle - Baramos is defeated)")
  AP.CheckLocation("BaramosCastle_DreamSpace_MAIN_0_SCENE_0000_010")
  -- AP end
  SoundTransitionVolumeRateByCategory(ENicolaSoundCategoryAMBIENT, 1, 0.5)
  FadeIn(EFadingPriorityTopMost, 0)
  CmdFadeOut(EFadingPriorityWhiteTopMost, 0.8)
  SetHourMapTime(8)
  ChangeMapWarpVehicle("MAPLIST_C01F0101", "FromFieldSouth", ORIENTATION_UP, "RURA_RIREMITO_RURA_ALIAHAN")
  EventEnd(eventInfo, "")
end
