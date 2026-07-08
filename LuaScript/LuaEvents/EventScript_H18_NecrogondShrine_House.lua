print("Load Script EventScript_H18_NecrogondShrine_House")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function NecrogondShrine_House_MAIN_0_VOLUME_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SoundTransitionVolumeRateByCategory(ENicolaSoundCategoryAMBIENT, 0, 0)
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  local minister01 = ""
  local mapTime = GetMapTimeFrame()
  if mapTime == MAPTIME_NIGHT then
    minister01 = "NecrogondShrine_House_Minister_01_L3"
  else
    minister01 = "NecrogondShrine_House_Minister_01_L1"
  end
  local groundZ = 110
  local cameraPos = {
    X = 1600,
    Y = 750,
    Z = 290
  }
  local movePos = {
    X = 1000,
    Y = 750,
    Z = groundZ
  }
  local lastPos = {
    X = 1560,
    Y = 750,
    Z = groundZ
  }
  local moveX = lastPos.X - movePos.X
  local moveSpeed = 300
  EndSkillTransformNoEffect()
  EndSkillInvisibleNoEffect()
  SpawnPartyClone(true, true, true, true)
  SetPlayerLocation(lastPos)
  Wait(0.1)
  TurnParty(1, 0)
  Wait(0.1)
  MoveNpc("Party1", {
    X = movePos.X,
    Y = movePos.Y,
    Z = 0
  }, moveSpeed)
  MoveNpc("Party2", {
    X = movePos.X - 200,
    Y = movePos.Y - 100,
    Z = 0
  }, moveSpeed)
  MoveNpc("Party3", {
    X = movePos.X - 200,
    Y = movePos.Y + 100,
    Z = 0
  }, moveSpeed)
  MoveNpc("Party4", {
    X = movePos.X - 300,
    Y = movePos.Y,
    Z = 0
  }, moveSpeed)
  TurnNpc(minister01, NPC_D_LOW)
  ChangeStageCameraToGlobalPoint(cameraPos.X, cameraPos.Y, cameraPos.Z, CAMERA_BLEND_EASE_IN_OUT, 3, 2, 2000, {
    Yaw = 0,
    Pitch = -25,
    Roll = 0
  })
  WaitMoveNpc("Party1")
  MoveNpcRelative("Party1", {
    X = moveX,
    Y = 0,
    Z = 0
  }, moveSpeed)
  WaitMoveNpc("Party2")
  MoveNpcRelative("Party2", {
    X = moveX,
    Y = 0,
    Z = 0
  }, moveSpeed)
  WaitMoveNpc("Party3")
  MoveNpcRelative("Party3", {
    X = moveX,
    Y = 0,
    Z = 0
  }, moveSpeed)
  WaitMoveNpc("Party4")
  MoveNpcRelative("Party4", {
    X = moveX,
    Y = 0,
    Z = 0
  }, moveSpeed)
  WaitMoveNpc("Party1")
  CmdTurnNpc("Party1", NPC_D_UP)
  WaitMoveNpc("Party2")
  CmdTurnNpc("Party2", NPC_D_UP)
  WaitMoveNpc("Party3")
  CmdTurnNpc("Party3", NPC_D_UP)
  WaitMoveNpc("Party4")
  CmdTurnNpc("Party4", NPC_D_UP)
  Wait(1)
  WaitStageCameraBlend()
  CmdSpawnMangaIcon(minister01, "FIELD_EFX2D_SURPRISE")
  local tagItemId = "ITEM_IMPORTANT_SILVER_ORB"
  SetTagItemId(tagItemId)
  CmdMessage("NPC_Talk_NecrogondShrine_House_MAIN_0_ACTOR_0110_010_1")
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_NecrogondShrine_House_MAIN_0_ACTOR_0110_010_2")
  CloseMessage()
  CmdMoveNpcRelative(minister01, {
    X = -200,
    Y = 0,
    Z = 0
  }, 200)
  CmdMoveNpcRelative("Party1", {
    X = 100,
    Y = 0,
    Z = 0
  }, 200)
  tagItemId = "ITEM_IMPORTANT_SILVER_ORB"
  SetTagItemId(tagItemId)
  ItemGetMessageToActor("NPC_Talk_NecrogondShrine_House_MAIN_0_ACTOR_0110_010_3", "ITEM_ARCHIPELAGO"--[["ITEM_IMPORTANT_SILVER_ORB"]], minister01) -- AP
  -- AP
  AP.Log("NecrogondShrine_House_MAIN_0_VOLUME_0110_010 called (Necrogond Shrine - Priest giving the silver orb)")
  AP.CheckLocation("NecrogondShrine_House_MAIN_0_VOLUME_0110_010")
  local ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
    AddItem(ItemId)
  else
    AddItem("ITEM_IMPORTANT_SILVER_ORB")
    SetFlag(Flag.FE78, true)
  end
  -- AP end
  CmdMoveNpcRelativeDetail("Party1", {
    X = -100,
    Y = 0,
    Z = 0
  }, 200, NPC_D_UP, AnimationType.Walk, 1, EFlipbookPlayTypeLoop)
  Wait(1)
  CmdMessage("NPC_Talk_NecrogondShrine_House_MAIN_0_ACTOR_0110_010_4")
  CmdEventClosingMessage("NPC_Talk_NecrogondShrine_House_MAIN_0_ACTOR_0110_010_5")
  DestroyPartyClone()
  PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WALK)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
  SoundTransitionVolumeRateByCategory(ENicolaSoundCategoryAMBIENT, 1, 0.5)
  SetDispMiniMap(true)
  -- AP
  if ItemId == "ITEM_ARCHIPELAGO" then
  else
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_NECROGONDSHRINE_GetSilverOrb, true)
    CheckGopEnum_MAIN_MULTI_GetAllOrb()
  end
  -- AP end
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function NecrogondShrine_House_MAIN_0_ACTOR_0110_020(BeginOverlap, table, ...)
  NecrogondShrine_House_MAIN_0_VOLUME_0110_010(BeginOverlap, table, ...)
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_NecrogondShrine_House_MAIN_0_ACTOR_0110_010_2_1")
  CmdEventClosingMessage("NPC_Talk_NecrogondShrine_House_MAIN_0_ACTOR_0110_010_2_2")
  EventEnd(eventInfo, "")
  ]]
end

function NecrogondShrine_House_MAIN_0_ACTOR_0110_030(BeginOverlap, table, ...)
  NecrogondShrine_House_MAIN_0_VOLUME_0110_010(BeginOverlap, table, ...)
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_NecrogondShrine_House_MAIN_0_ACTOR_0110_030_1")
  CmdEventClosingMessage("NPC_Talk_NecrogondShrine_House_MAIN_0_ACTOR_0110_030_2")
  EventEnd(eventInfo, "")
  ]]
end
