print("Load Script EventScript_C04_Portoga_Castle_1F")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Portoga_Castle_1F_MAIN_0_SCENE_0000_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  DisableEventFastForwardUI()
  print("\227\130\185\227\130\173\227\131\131\227\131\151\233\157\158\232\161\168\231\164\186")
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  if GetFlag(Flag.FE76) == true then
    SetFlag(Flag.FE881, true)
  end
  if GetFlag(Flag.FE908) == true or GetFlag(Flag.FE936) == true then
    SetFlag(Flag.FE882, true)
  end
  if GetFlag(Flag.FE907) == true then
    SetFlag(Flag.FE883, true)
  end
  if GetFlag(Flag.FE909) == true then
    SetFlag(Flag.FE884, true)
  end
  if GetFlag(Flag.FE74) == true then
    SetFlag(Flag.FE885, true)
  end
  if GetFlag(Flag.FE70) == true then
    SetFlag(Flag.FE886, true)
  end
  if GetFlag(Flag.FE71) == true then
    SetFlag(Flag.FE887, true)
  end
  if GetFlag(Flag.FE75) == true then
    SetFlag(Flag.FE888, true)
  end
  if GetFlag(Flag.FE118) == true then
    SetFlag(Flag.FE889, true)
  end
  if GetFlag(Flag.FE911) == true and GetFlag(Flag.FE114) == true then
    SetFlag(Flag.FE890, true)
  end
  if GetFlag(Flag.FE77) == true then
    SetFlag(Flag.FE891, true)
  end
  EventEnd(eventInfo, "")
end

function Portoga_Castle_1F_MAIN_0_VOLUME_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local pos_x = 5000
  local pos_y = 1305
  local pos_z = 0
  local offset = 800
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  RequestPreloadEventScreenShot("EVENTSCREENSHOT_Portoga001")
  ChangeStageCameraToGlobalPoint(4700, 1300, 220, CAMERA_BLEND_EASE_IN_OUT, 3, 2, 1200, {
    Yaw = 0,
    Pitch = -12,
    Roll = 0
  })
  Audience(pos_x, pos_y, pos_z)
  Wait(0.5)
  SetTagItemId("ITEM_IMPORTANT_BLACK_PEPPER")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_010_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_010_2")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_010_3")
  CmdShowEventScreenShotUI("EVENTSCREENSHOT_Portoga001", EFadingPriorityTopMost, 0.5)
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_010_4")
  CmdCloseEventScreenShotUI(EFadingPriorityTopMost, 0.5)
  ItemGetMessageToActor("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_010_5", "ITEM_ARCHIPELAGO"--[["ITEM_IMPORTANT_ROYAL_MISSIVE"]], "Portoga_Castle_1F_King_Portoga_01_L1") -- AP
  -- AP
  AP.Log("Portoga_Castle_1F_MAIN_0_VOLUME_0010_010 called (Portoga - King giving the Royal Missive)")
  AP.CheckLocation("Portoga_Castle_1F_MAIN_0_VOLUME_0010_010")
  local ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
    AddItem(ItemId)
  else
    AddItem("ITEM_IMPORTANT_ROYAL_MISSIVE")
    SetFlag(Flag.FE63, true)
  end
  -- AP end
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_010_6")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_010_7")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_010_8")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_010_9")
  CmdSetNpcAnimation("Portoga_Castle_1F_King_Portoga_01_L1", AnimationType.Act2, 1, EFlipbookPlayTypeStopEnd, false)
  SetNpcAnimation("Portoga_Castle_1F_King_Portoga_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, true)
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_010_10")
  WaitAnimNpc("Portoga_Castle_1F_King_Portoga_01_L1")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_010_11")
  ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  AudienceFinish(pos_x, pos_y, pos_z, offset)
  -- AP
  if ItemId == "ITEM_ARCHIPELAGO" then
  else
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_PORTOGA_GetLetter, true)
  end
  -- AP end
  _retry(SYS_WaitStageCameraBlend)
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function Portoga_Castle_1F_MAIN_0_VOLUME_0010_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local pos_x = 5000
  local pos_y = 1305
  local pos_z = 0
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  ChangeStageCameraToGlobalPoint(4700, 1300, 200, CAMERA_BLEND_EASE_IN_OUT, 3, 2, 1200, {
    Yaw = 0,
    Pitch = -12,
    Roll = 0
  })
  Audience(pos_x, pos_y, pos_z)
  Wait(0.5)
  SetTagItemId("ITEM_IMPORTANT_BLACK_PEPPER")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_1")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_2")
  SetNpcAnimation("Portoga_Castle_1F_King_Portoga_01_L1", AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, false)
  CmdSpawnMangaIcon("Portoga_Castle_1F_King_Portoga_01_L1", "FIELD_EFX2D_SURPRISE")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_3")
  WaitAnimNpc("Portoga_Castle_1F_King_Portoga_01_L1")
  SetNpcAnimation("Portoga_Castle_1F_King_Portoga_01_L1", AnimationType.Act4, 1, EFlipbookPlayTypeStopEnd, false)
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_4")
  WaitAnimNpc("Portoga_Castle_1F_King_Portoga_01_L1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_5")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_6")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_7")
  CmdSetNpcAnimation("Portoga_Castle_1F_King_Portoga_01_L1", AnimationType.Act6, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_7_1")
  SpawnMangaIcon("Portoga_Castle_1F_King_Portoga_01_L1", "FIELD_EFX2D_LAUGH")
  Wait(0.2)
  TurnNpc("Portoga_Castle_1F_Minister_01_L1", NPC_D_LEFT)
  TurnNpc("Portoga_Castle_1F_Guard_01_L1", NPC_D_UP)
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_7_2")
  WaitAnimNpc("Portoga_Castle_1F_King_Portoga_01_L1")
  MoveNpc("Portoga_Castle_1F_Guard_01_L1", {
    X = 4500,
    Y = 855.735352,
    Z = 0
  }, 500)
  Wait(0.5)
  CmdFadeOut(EFadingPriorityUIBackGround, 0.5)
  RevivalPartyMember(0, 1)
  HealPartyMemberHP(0, 999)
  HealPartyMemberMP(0, 999)
  HealPartyMemberStatusEffect(0)
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_7_3")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_7_4")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_7_5")
  CmdFadeOut(EFadingPriorityTopMost, 0)
  DestroyPartyClone()
  if IsHaveItem("ITEM_IMPORTANT_BLACK_PEPPER") then -- AP
    RemoveItem("ITEM_IMPORTANT_BLACK_PEPPER")
  end
  -- AP
  AP.Log("Portoga_Castle_1F_MAIN_0_VOLUME_0010_020 called (Portoga - King giving the Ship)")
  AP.CheckLocation("Portoga_Castle_1F_MAIN_0_VOLUME_0010_020")
  AP.Log("Portoga_Castle_1F_MAIN_0_VOLUME_0010_020 - sending Portoga_Castle_1F_MAIN_0_VOLUME_0010_010 for security progress")
  AP.CheckLocation("Portoga_Castle_1F_MAIN_0_VOLUME_0010_010")
  local ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
    --AddItem(ItemId) --still a check but no items
  else
    SetFlag(Flag.FE106, true)
  end
  -- AP end
  ChangeMap("MAPLIST_C04R0501", "FromReality", ORIENTATION_DOWN)
  EventEnd(eventInfo, "")
end

function Portoga_Castle_1F_MAIN_0_SCENE_0000_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local pos_x = 5000
  local pos_y = 1305
  local pos_z = 0
  local offset = 800
  SetPlayerLocation({
    X = pos_x,
    Y = pos_y,
    Z = pos_z
  })
  SetActorRotation("PLAYER", {
    Yaw = 180,
    Pitch = 0,
    Roll = 0
  })
  local HeroNumber = CheckHero()
  SpawnPartyCloneDisableSkill(true, true, true, true)
  if HeroNumber == 1 then
    SetNpcLocation("Party1", {
      X = pos_x,
      Y = pos_y,
      Z = pos_z
    })
    SetNpcLocation("Party2", {
      X = pos_x - 200,
      Y = pos_y - 200,
      Z = pos_z
    })
    SetNpcLocation("Party3", {
      X = pos_x - 300,
      Y = pos_y - 100,
      Z = pos_z
    })
    SetNpcLocation("Party4", {
      X = pos_x - 200,
      Y = pos_y + 100,
      Z = pos_z
    })
  elseif HeroNumber == 2 then
    SetNpcLocation("Party2", {
      X = pos_x,
      Y = pos_y,
      Z = pos_z
    })
    SetNpcLocation("Party1", {
      X = pos_x - 300,
      Y = pos_y - 100,
      Z = pos_z
    })
    SetNpcLocation("Party3", {
      X = pos_x - 200,
      Y = pos_y - 200,
      Z = pos_z
    })
    SetNpcLocation("Party4", {
      X = pos_x - 200,
      Y = pos_y + 100,
      Z = pos_z
    })
  elseif HeroNumber == 3 then
    SetNpcLocation("Party3", {
      X = pos_x,
      Y = pos_y,
      Z = pos_z
    })
    SetNpcLocation("Party1", {
      X = pos_x - 300,
      Y = pos_y - 100,
      Z = pos_z
    })
    SetNpcLocation("Party2", {
      X = pos_x - 200,
      Y = pos_y - 200,
      Z = pos_z
    })
    SetNpcLocation("Party4", {
      X = pos_x - 200,
      Y = pos_y + 100,
      Z = pos_z
    })
  elseif HeroNumber == 4 then
    SetNpcLocation("Party4", {
      X = pos_x,
      Y = pos_y,
      Z = pos_z
    })
    SetNpcLocation("Party1", {
      X = pos_x - 300,
      Y = pos_y - 100,
      Z = pos_z
    })
    SetNpcLocation("Party2", {
      X = pos_x - 200,
      Y = pos_y - 200,
      Z = pos_z
    })
    SetNpcLocation("Party3", {
      X = pos_x - 200,
      Y = pos_y + 100,
      Z = pos_z
    })
  end
  TurnNpc("Party1", NPC_D_UP)
  TurnNpc("Party2", NPC_D_UP)
  TurnNpc("Party3", NPC_D_UP)
  TurnNpc("Party4", NPC_D_UP)
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  ChangeStageCameraToGlobalPoint(4700, 1300, 200, CAMERA_BLEND_EASE_IN_OUT, 0, 2, 1200, {
    Yaw = 0,
    Pitch = -12,
    Roll = 0
  })
  SetNpcAnimation("Portoga_Castle_1F_King_Portoga_01_L1", AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, false)
  Wait(0.1)
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  SetNpcAnimation("Portoga_Castle_1F_King_Portoga_01_L1", AnimationType.Act4, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_7_6")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_7_7")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_7_8")
  WaitAnimNpc("Portoga_Castle_1F_King_Portoga_01_L1")
  SetNpcAnimation("Portoga_Castle_1F_King_Portoga_01_L1", AnimationType.Act6, 1, EFlipbookPlayTypeStopEnd, false)
  SpawnMangaIcon("Portoga_Castle_1F_King_Portoga_01_L1", "FIELD_EFX2D_THINK")
  Wait(1.5)
  CloseMangaIconAll("Portoga_Castle_1F_King_Portoga_01_L1")
  WaitAnimNpc("Portoga_Castle_1F_King_Portoga_01_L1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_8")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_9")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_030_10")
  SetNpcAnimation("Portoga_Castle_1F_King_Portoga_01_L1", AnimationType.Act7, 1, EFlipbookPlayTypeStopEnd, true)
  ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  AudienceFinish(pos_x, pos_y, pos_z, offset)
  -- AP
  local ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
  else
    SetFlag(Flag.FE734, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_PORTOGA_TalkWithPepper, true)
  end
  -- AP end
  _retry(SYS_WaitStageCameraBlend)
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

-- AP

function ManageKingRewardsForAP(BeginOverlap, table, ...)
  if GetFlag(Flag.FE64) then
    Portoga_Castle_1F_MAIN_0_VOLUME_0010_020(BeginOverlap, table, ...)
  else
    Portoga_Castle_1F_MAIN_0_VOLUME_0010_010(BeginOverlap, table, ...)
  end
end

-- AP end

function Portoga_Castle_1F_MAIN_0_ACTOR_0110_060(BeginOverlap, table, ...)
  ManageKingRewardsForAP(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_IMPORTANT_BLACK_PEPPER")
  RequestPreloadEventScreenShot("EVENTSCREENSHOT_Portoga001")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_060_1")
  CmdShowEventScreenShotUI("EVENTSCREENSHOT_Portoga001", EFadingPriorityTopMost, 0.5)
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_060_2")
  CmdCloseEventScreenShotUI(EFadingPriorityTopMost, 0.5)
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_060_3")
  EventEnd(eventInfo, "")
  ]]
end

function Portoga_Castle_1F_MAIN_0_ACTOR_0110_070(BeginOverlap, table, ...)
  ManageKingRewardsForAP(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_IMPORTANT_BLACK_PEPPER")
  RequestPreloadEventScreenShot("EVENTSCREENSHOT_Portoga002")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_070_1")
  CmdShowEventScreenShotUI("EVENTSCREENSHOT_Portoga002", EFadingPriorityTopMost, 0.5)
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_070_2")
  CmdCloseEventScreenShotUI(EFadingPriorityTopMost, 0.5)
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_070_3")
  EventEnd(eventInfo, "")
  ]]
end

function Portoga_Castle_1F_MAIN_0_ACTOR_0110_080(BeginOverlap, table, ...)
  ManageKingRewardsForAP(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_IMPORTANT_BLACK_PEPPER")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_080_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_080_2")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_080_3")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_080_4")
  EventEnd(eventInfo, "")
  ]]
end

function Portoga_Castle_1F_MAIN_0_ACTOR_0110_090(BeginOverlap, table, ...)
  ManageKingRewardsForAP(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_090_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_090_2")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_090_3")
  EventEnd(eventInfo, "")
  ]]
end

function Portoga_Castle_1F_MAIN_0_ACTOR_0110_100(BeginOverlap, table, ...)
  ManageKingRewardsForAP(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_100_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_100_2")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_100_3")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_100_4")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_100_5")
  EventEnd(eventInfo, "")
  ]]
end

function Portoga_Castle_1F_MAIN_0_ACTOR_0110_110(BeginOverlap, table, ...)
  ManageKingRewardsForAP(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_110_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_110_2")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_110_3")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_110_4")
  EventEnd(eventInfo, "")
  ]]
end

function Portoga_Castle_1F_MAIN_0_ACTOR_0110_120(BeginOverlap, table, ...)
  ManageKingRewardsForAP(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_120_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_120_2")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_120_3")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_120_4")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_120_5")
  EventEnd(eventInfo, "")
  ]]
end

function Portoga_Castle_1F_MAIN_0_ACTOR_0110_130(BeginOverlap, table, ...)
  ManageKingRewardsForAP(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_130_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_130_2")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_130_3")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_130_4")
  EventEnd(eventInfo, "")
  ]]
end

function Portoga_Castle_1F_MAIN_0_ACTOR_0110_140(BeginOverlap, table, ...)
  ManageKingRewardsForAP(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_140_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_140_2")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_140_3")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_140_4")
  EventEnd(eventInfo, "")
  ]]
end

function Portoga_Castle_1F_MAIN_0_ACTOR_0110_150(BeginOverlap, table, ...)
  ManageKingRewardsForAP(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_150_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_150_2")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_150_3")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_150_4")
  EventEnd(eventInfo, "")
  ]]
end

function Portoga_Castle_1F_MAIN_0_ACTOR_0110_160(BeginOverlap, table, ...)
  ManageKingRewardsForAP(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_160_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_160_2")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_160_3")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_160_4")
  EventEnd(eventInfo, "")
  ]]
end

function Portoga_Castle_1F_MAIN_0_ACTOR_0110_170(BeginOverlap, table, ...)
  ManageKingRewardsForAP(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_170_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_170_2")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_170_3")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_170_4")
  EventEnd(eventInfo, "")
  ]]
end

function Portoga_Castle_1F_MAIN_0_ACTOR_0110_180(BeginOverlap, table, ...)
  ManageKingRewardsForAP(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_180_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_180_2")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_180_3")
  EventEnd(eventInfo, "")
  ]]
end

function Portoga_Castle_1F_MAIN_0_ACTOR_0110_190(BeginOverlap, table, ...)
  ManageKingRewardsForAP(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_190_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_190_2")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_190_3")
  EventEnd(eventInfo, "")
  ]]
end

function Portoga_Castle_1F_MAIN_0_ACTOR_0110_200(BeginOverlap, table, ...)
  ManageKingRewardsForAP(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_200_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_200_2")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_200_3")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_200_4")
  EventEnd(eventInfo, "")
  ]]
end

function Portoga_Castle_1F_MAIN_0_ACTOR_0110_210(BeginOverlap, table, ...)
  ManageKingRewardsForAP(BeginOverlap, table, ...) -- AP
  return
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_210_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_210_2")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_MAIN_0_ACTOR_0110_210_3")
  EventEnd(eventInfo, "")
  ]]
end

function Portoga_Castle_1F_SUB_0_ACTOR_0210_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_IMPORTANT_BLACK_PEPPER")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0210_020_1")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0210_020_2")
  EventEnd(eventInfo, "")
end

function Portoga_Castle_1F_SUB_0_ACTOR_0210_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0210_030_1")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0210_030_2")
  EventEnd(eventInfo, "")
end

function Portoga_Castle_1F_SUB_0_ACTOR_0210_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0210_040_1")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0210_040_2")
  EventEnd(eventInfo, "")
end

function Portoga_Castle_1F_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local result = CmdChoiceMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0310_010_1")
  if result == true then
    CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0310_010_2")
  else
    CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0310_010_3")
  end
  EventEnd(eventInfo, "")
end

function Portoga_Castle_1F_SUB_0_ACTOR_0410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0410_010_1")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0410_010_2")
  EventEnd(eventInfo, "")
end

function Portoga_Castle_1F_SUB_0_ACTOR_0410_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0410_020_1")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0410_020_2")
  EventEnd(eventInfo, "")
end

function Portoga_Castle_1F_SUB_0_ACTOR_0510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0510_010_1")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0510_010_2")
  EventEnd(eventInfo, "", false)
end

function Portoga_Castle_1F_SUB_0_ACTOR_0610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0610_010_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0610_010_2")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0610_010_3")
  EventEnd(eventInfo, "", false)
end

function Portoga_Castle_1F_SUB_0_ACTOR_0710_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0710_010_1")
  EventEnd(eventInfo, "")
end

function Portoga_Castle_1F_SUB_0_ACTOR_0710_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0710_020_1")
  EventEnd(eventInfo, "")
end

function Portoga_Castle_1F_SUB_0_ACTOR_0710_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0710_030_1")
  EventEnd(eventInfo, "")
end

function Portoga_Castle_1F_SUB_0_ACTOR_0810_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0810_010_1")
  EventEnd(eventInfo, "")
end

function Portoga_Castle_1F_SUB_0_ACTOR_0910_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_0910_010_1")
  EventEnd(eventInfo, "")
end

function Portoga_Castle_1F_SUB_0_ACTOR_1010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_IMPORTANT_MAGIC_KEY")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_1010_010_1")
  CmdMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_1010_010_2")
  CmdEventClosingMessage("NPC_Talk_Portoga_Castle_1F_SUB_0_ACTOR_1010_010_3")
  EventEnd(eventInfo, "", false)
end
