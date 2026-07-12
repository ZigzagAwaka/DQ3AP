print("Load Script EventScript_D19_ZomaCastle_B5F")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function ZomaCastle_B5F_MAIN_0_VOLUME_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  RequestPreloadEventBattle("BATTLE_EVENT_BOSS_ZOMACASTLE_KINGHYDRA_1")
  MoveParty({
    X = 6250,
    Y = 3500,
    Z = 0
  })
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  Wait(0.1)
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  if GetFlag(Flag.FE897) == true then
    CmdPlayEventSequenceNextEventBattle(1)
  else
    CmdPlayEventSequenceNextEventBattle(0)
    SetFlag(Flag.FE897, true)
  end
  PlayEffectSearchObject("BP_SearchEvent_SM_PL_D19_Light_04_1", "D19_Fire_First")
  PlayEffectSearchObject("BP_SearchEvent_SM_PL_D19_Light_04_2", "D19_Fire_First")
  PlayEffectSearchObject("BP_SearchEvent_SM_PL_D19_Light_04_3", "D19_Fire_First")
  PlayEffectSearchObject("BP_SearchEvent_SM_PL_D19_Light_04_4", "D19_Fire_First")
  PlayEffectSearchObject("BP_SearchEvent_SM_PL_D19_Light_04_5", "D19_Fire_First")
  PlayEffectSearchObject("BP_SearchEvent_SM_PL_D19_Light_04_6", "D19_Fire_First")
  CmdStartEventBattle("BATTLE_EVENT_BOSS_ZOMACASTLE_KINGHYDRA_1")
  EventEnd(eventInfo, "")
end

function ZomaCastle_B5F_MAIN_0_BATTLE_END_0010_015(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdPlayEventSequencePrevEventBattle(2)
  PlayEffectSearchObject("BP_SearchEvent_SM_PL_D19_Light_04_7", "D19_Fire_First")
  PlayEffectSearchObject("BP_SearchEvent_SM_PL_D19_Light_04_8", "D19_Fire_First")
  ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
  Wait(0.1)
  CmdFadeIn(EFadingPriorityTopMost, 0.5)
  SetFlag(Flag.FE892, true)
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function ZomaCastle_B5F_MAIN_0_VOLUME_0010_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  RequestPreloadEventBattle("BATTLE_EVENT_BOSS_ZOMACASTLE_BARAMOSU_BRO_1")
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  Wait(0.1)
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  CmdPlayEventSequenceNextEventBattle(3)
  CmdStartEventBattle("BATTLE_EVENT_BOSS_ZOMACASTLE_BARAMOSU_BRO_1")
  EventEnd(eventInfo, "")
end

function ZomaCastle_B5F_MAIN_0_BATTLE_END_0010_025(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdPlayEventSequencePrevEventBattle(4)
  PlayEffectSearchObject("BP_SearchEvent_SM_PL_D19_Light_04_9", "D19_Fire_First")
  PlayEffectSearchObject("BP_SearchEvent_SM_PL_D19_Light_04_10", "D19_Fire_First")
  ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
  Wait(0.1)
  CmdFadeIn(EFadingPriorityTopMost, 0.5)
  SetFlag(Flag.FE893, true)
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function ZomaCastle_B5F_MAIN_0_VOLUME_0010_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  RequestPreloadEventBattle("BATTLE_EVENT_BOSS_ZOMACASTLE_BARAMOSU_ZOM_1")
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  Wait(0.1)
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  CmdPlayEventSequenceNextEventBattle(5)
  CmdStartEventBattle("BATTLE_EVENT_BOSS_ZOMACASTLE_BARAMOSU_ZOM_1")
  EventEnd(eventInfo, "")
end

function ZomaCastle_B5F_MAIN_0_BATTLE_END_0010_035(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdPlayEventSequencePrevEventBattle(6)
  PlayEffectSearchObject("BP_SearchEvent_SM_PL_D19_Light_04_11", "D19_Fire_First")
  PlayEffectSearchObject("BP_SearchEvent_SM_PL_D19_Light_04_12", "D19_Fire_First")
  PlayEffectSearchObject("BP_SearchEvent_SM_PL_D19_Light_04_13", "D19_Fire_First")
  PlayEffectSearchObject("BP_SearchEvent_SM_PL_D19_Light_04_14", "D19_Fire_First")
  ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
  Wait(0.1)
  CmdFadeIn(EFadingPriorityTopMost, 0.5)
  SetFlag(Flag.FE894, true)
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function ZomaCastle_B5F_MAIN_0_VOLUME_0010_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  MakeClearSave()
  RequestPreloadEventBattle("BATTLE_EVENT_BOSS_ZOMACASTLE_ZOMA_1")
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  Wait(0.1)
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  if GetFlag(Flag.FE209) == true then
    CmdPlayEventSequenceNextEventBattle(8)
  else
    CmdPlayEventSequenceNextEventBattle(7)
    SetFlag(Flag.FE209, true)
  end
  CmdStartEventBattle("BATTLE_EVENT_BOSS_ZOMACASTLE_ZOMA_1", {isNotChangeBGM = false, isDisableSE = true})
  EventEnd(eventInfo, "")
end

function ZomaCastle_B5F_MAIN_0_BATTLE_END_0010_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_ZOMACASTLE_DefeatZoma, true)
  SetFlag(Flag.FE91, true) -- ZOMA IS DEFEATED
  -- AP
  AP.Log("ZomaCastle_B5F_MAIN_0_BATTLE_END_0010_050 called (Zoma's Citadel - Zoma is defeated)")
  AP.CheckLocation("ZomaCastle_B5F_MAIN_0_BATTLE_END_0010_050")
  -- AP end
  SetFlag(Flag.FE95, true)
  local ResultHeroSolo = CheckHeroSolo()
  if ResultHeroSolo == true then
    SetFlag(Flag.FE210, true)
  end
  if GetFlag(Flag.FE898) == true then
    CmdPlayEventSequencePrevEventBattleNextChangeMap(9)
  else
    CmdPlayEventSequencePrevEventBattleNextChangeMap(10)
  end
  ChangeMap("MAPLIST_D19R0502", "FromB4F", ORIENTATION_DOWN)
  EventEnd(eventInfo, "")
end
