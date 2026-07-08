print("Load Script EventScript_C09_DragonQueen_Queen_room")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function DragonQueen_Queen_room_MAIN_0_SCENE_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetDispMiniMap(false)
  SetTagItemId("ITEM_USE_ITEM_SPHERE_OF_LIGHT")
  RequestPreloadEventScreenShot("EVENTSCREENSHOT_DragonQueen004")
  RequestPreloadEventScreenShot("EVENTSCREENSHOT_DragonQueen001")
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Queen_DragonQueen = "DragonQueen_Queen_room_DragonQueen_01_L3"
    Cleric1_DragonQueen = "DragonQueen_Queen_room_Cleric_DragonQueen_01_L3"
    Cleric2_DragonQueen = "DragonQueen_Queen_room_Cleric_DragonQueen_02_L3"
    Cleric3_DragonQueen = "DragonQueen_Queen_room_Cleric_DragonQueen_03_L3"
    Elf_DragonQueen = "DragonQueen_Queen_room_Elf_01_L3"
    Hargon_DragonQueen = "DragonQueen_Queen_room_Hargon_01_L3"
    Hobbit1_DragonQueen = "DragonQueen_Queen_room_Hobbit_01_L3"
    Hobbit2_DragonQueen = "DragonQueen_Queen_room_Hobbit_02_L3"
  else
    Queen_DragonQueen = "DragonQueen_Queen_room_DragonQueen_01_L1"
    Cleric1_DragonQueen = "DragonQueen_Queen_room_Cleric_DragonQueen_01_L1"
    Cleric2_DragonQueen = "DragonQueen_Queen_room_Cleric_DragonQueen_02_L1"
    Cleric3_DragonQueen = "DragonQueen_Queen_room_Cleric_DragonQueen_03_L1"
    Elf_DragonQueen = "DragonQueen_Queen_room_Elf_01_L1"
    Hargon_DragonQueen = "DragonQueen_Queen_room_Hargon_01_L1"
    Hobbit1_DragonQueen = "DragonQueen_Queen_room_Hobbit_01_L1"
    Hobbit2_DragonQueen = "DragonQueen_Queen_room_Hobbit_02_L1"
  end
  CmdFadeOut(EFadingPriorityUIBackGround, 0)
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0, GetCurrentMapId())
  if CheckHeroLiving() == true then
  else
    CmdEventClosingMessage("NPC_Talk_DragonQueen_Queen_room_MAIN_0_SCENE_0110_010_23")
    CloseMessage()
    RevivalPartyMember(0, 1)
    Wait(0.1)
  end
  SetNicolaApertureRate(100, 0)
  local pos_x = 5700
  local pos_y = 4500
  local pos_z = 100
  local offset = 300
  local party1 = "Party1"
  local party2 = "Party2"
  local party3 = "Party3"
  local party4 = "Party4"
  SpawnPartyCloneDisableAll(true, true, true, true)
  EndSkillTransformNoEffect()
  EndSkillInvisibleNoEffect()
  CmdSetNpcAnimation(Queen_DragonQueen, AnimationType.Act1, 0, EFlipbookPlayTypeStopEnd, true)
  CmdChangeStageCameraToGlobalPoint(4900, 4500, 200, CAMERA_BLEND_LINEAR, 0.1, 0, 1000, {
    Yaw = 0,
    Pitch = -30,
    Roll = 0
  })
  SetNpcLocation("party1", {
    X = 5100,
    Y = 4500,
    Z = 100
  })
  SetNpcLocation("party2", {
    X = 5000,
    Y = 4500,
    Z = 100
  })
  SetNpcLocation("party3", {
    X = 4900,
    Y = 4500,
    Z = 100
  })
  SetNpcLocation("party4", {
    X = 4800,
    Y = 4500,
    Z = 100
  })
  CmdFadeIn(EFadingPriorityUIBackGround, 2)
  ChangeStageCameraToGlobalPoint(5500, 4500, 200, CAMERA_BLEND_LINEAR, 3, 0, 1400, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  Audience(pos_x, pos_y, pos_z)
  WaitStageCameraBlend()
  ChangeStageCameraToGlobalPoint(5800, 4500, 200, CAMERA_BLEND_LINEAR, 4, 0, 1900, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  CmdSetNpcAnimation(Queen_DragonQueen, AnimationType.Act2, 1, EFlipbookPlayTypeStopEnd, true)
  Wait(0.7)
  PlaySEEvent("EVESE_QUEEN_DRAGON_GETUP")
  Wait(4)
  WaitAnimNpc(Queen_DragonQueen)
  CmdSetNpcAnimation(Queen_DragonQueen, AnimationType.Act3, 1, EFlipbookPlayTypeLoop, true)
  Wait(0.8)
  CmdMessage("NPC_Talk_DragonQueen_Queen_room_MAIN_0_SCENE_0110_010_1")
  CmdMessage("NPC_Talk_DragonQueen_Queen_room_MAIN_0_SCENE_0110_010_2")
  CmdMessage("NPC_Talk_DragonQueen_Queen_room_MAIN_0_SCENE_0110_010_3")
  CmdMessage("NPC_Talk_DragonQueen_Queen_room_MAIN_0_SCENE_0110_010_4")
  CmdMessage("NPC_Talk_DragonQueen_Queen_room_MAIN_0_SCENE_0110_010_5")
  result = CmdChoiceMessage("NPC_Talk_DragonQueen_Queen_room_MAIN_0_SCENE_0110_010_6")
  if result == true then
    CmdEventClosingMessage("NPC_Talk_DragonQueen_Queen_room_MAIN_0_SCENE_0110_010_7")
  else
    CmdEventClosingMessage("NPC_Talk_DragonQueen_Queen_room_MAIN_0_SCENE_0110_010_8")
  end
  CloseMessage()
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  CmdShowEventScreenShotUIDefaultParam("EVENTSCREENSHOT_DragonQueen004")
  CmdMessage("NPC_Talk_DragonQueen_Queen_room_MAIN_0_SCENE_0110_010_9")
  CmdShowEventScreenShotUIDefaultParam("EVENTSCREENSHOT_DragonQueen001")
  CmdEventClosingMessage("NPC_Talk_DragonQueen_Queen_room_MAIN_0_SCENE_0110_010_10")
  CmdCloseEventScreenShotUIDefaultParam()
  CloseMessage()
  CmdSetNpcAnimation(Queen_DragonQueen, AnimationType.Act5, 1, EFlipbookPlayTypeStopEnd, true)
  Wait(2.5)
  PlaySEEvent("EVESE_QUEEN_DRAGON_GETDOWN")
  Wait(1)
  PlaySEEvent("EVESE_QUEEN_DRAGON_SIGH")
  CmdChangeNpcEventMaterialByDragonQueen(Queen_DragonQueen, 2)
  SpawnMangaIcon(party1, "FIELD_EFX2D_SURPRISE", false)
  SpawnMangaIcon(party2, "FIELD_EFX2D_SURPRISE", false)
  SpawnMangaIcon(party3, "FIELD_EFX2D_SURPRISE", false)
  CmdSpawnMangaIcon(party4, "FIELD_EFX2D_SURPRISE", false)
  Wait(0.5)
  local HeroNumber = CheckHero()
  if HeroNumber == 1 then
    MoveNpc(party1, {
      X = 5900,
      Y = 4500,
      Z = 100
    }, 500)
  elseif HeroNumber == 2 then
    MoveNpc(party2, {
      X = 5900,
      Y = 4500,
      Z = 100
    }, 500)
  elseif HeroNumber == 3 then
    MoveNpc(party3, {
      X = 5900,
      Y = 4500,
      Z = 100
    }, 500)
  elseif HeroNumber == 4 then
    MoveNpc(party4, {
      X = 5900,
      Y = 4500,
      Z = 100
    }, 500)
  end
  CmdSetNpcAnimation(Queen_DragonQueen, AnimationType.Act7, 1, EFlipbookPlayTypeStopEnd, true)
  Wait(1.5)
  CmdEventClosingMessage("NPC_Talk_DragonQueen_Queen_room_MAIN_0_SCENE_0110_010_11")
  CmdSetNpcAnimation(Queen_DragonQueen, AnimationType.Act6, 1, EFlipbookPlayTypeStopEnd, true)
  CloseMessage()
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  DestroyPartyClone()
  SetPlayerLocation({
    X = 5900,
    Y = 4500,
    Z = 100
  })
  Wait(1)
  FadeIn(EFadingPriorityTopMost, 0)
  CmdPlayEventSequence(0, nil, nil, false)
  -- AP
  AP.Log("DragonQueen_Queen_room_MAIN_0_SCENE_0110_010 called (Castle of the Dragon Queen - Dragon Queen giving the Light Orb)")
  AP.CheckLocation("DragonQueen_Queen_room_MAIN_0_SCENE_0110_010")
  local ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
    AddItem(ItemId)
  else
    SetFlag(Flag.FE184, true)
    AddItem("ITEM_USE_ITEM_SPHERE_OF_LIGHT")
    SetFlag(Flag.FE79, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_DRAGONQUEEN_GetShineBall, true)
  end
  -- AP end
  FadeIn(EFadingPriorityTopMost, 0)
  CmdPlayEventSequence(1, EFadingPriorityUIBackGround, nil, false)
  SetDispMiniMap(false)
  CloseMessage()
  -- AP
  if ItemId == "ITEM_ARCHIPELAGO" then
  else
    SetFlag(Flag.FD26, true)
  end
  -- AP end
  CmdMessageDetail("NPC_Talk_DragonQueen_Queen_room_MAIN_0_SCENE_0110_010_19", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
  CmdMessageDetail("NPC_Talk_DragonQueen_Queen_room_MAIN_0_SCENE_0110_010_20", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
  CmdEventClosingMessageDetail("NPC_Talk_DragonQueen_Queen_room_MAIN_0_SCENE_0110_010_21", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
  DestroyNpc(Queen_DragonQueen)
  SpawnNpc(Cleric1_DragonQueen)
  SpawnNpc(Cleric2_DragonQueen)
  SpawnNpc(Cleric3_DragonQueen)
  SpawnNpc(Elf_DragonQueen)
  SpawnNpc(Hobbit1_DragonQueen)
  SpawnNpc(Hobbit2_DragonQueen)
  SpawnNpc(Hargon_DragonQueen)
  CloseMessage()
  PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WARP)
  CmdChangeStageCameraToGlobalPoint(5500, 4500, 300, CAMERA_BLEND_LINEAR, 0, 0, 1600, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  CmdFadeIn(EFadingPriorityUIBackGround, 1)
  CmdMoveNpc(Hargon_DragonQueen, {
    X = 5945,
    Y = 4200,
    Z = 100
  }, 300)
  Wait(1)
  CmdEventClosingMessage("NPC_Talk_DragonQueen_Queen_room_MAIN_0_SCENE_0110_010_22")
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function DragonQueen_Queen_room_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_DragonQueen_1F_SUB_0_ACTOR_0410_020_1")
  EventEnd(eventInfo, "")
end

function DragonQueen_Queen_room_SUB_0_ACTOR_0410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_DragonQueen_1F_SUB_0_ACTOR_0510_020_1")
  EventEnd(eventInfo, "")
end

function DragonQueen_Queen_room_SUB_0_ACTOR_0510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_DragonQueen_1F_SUB_0_ACTOR_0610_020_1")
  EventEnd(eventInfo, "")
end

function DragonQueen_Queen_room_SUB_0_ACTOR_0610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_DragonQueen_1F_SUB_0_ACTOR_0710_020_1")
  CmdEventClosingMessage("NPC_Talk_DragonQueen_1F_SUB_0_ACTOR_0710_020_2")
  EventEnd(eventInfo, "")
end

function DragonQueen_Queen_room_SUB_0_ACTOR_0710_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_DragonQueen_1F_SUB_0_ACTOR_0310_020_1")
  EventEnd(eventInfo, "")
end

function DragonQueen_Queen_room_SUB_0_ACTOR_0810_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_DragonQueen_1F_SUB_0_ACTOR_0110_020_1")
  EventEnd(eventInfo, "")
end

function DragonQueen_Queen_room_SUB_0_ACTOR_0910_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_DragonQueen_1F_SUB_0_ACTOR_0210_020_1")
  EventEnd(eventInfo, "")
end

function SEARCH_DragonQueen_Queen_room_EVENT_0(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_DragonQueen_Queen_room_SUB_0_ACTOR_0210_010_1")
  CmdEventClosingMessage("NPC_Talk_DragonQueen_Queen_room_SUB_0_ACTOR_0210_010_2")
  -- AP
  AP.Log("SEARCH_DragonQueen_Queen_room_EVENT_0 called : sending DragonQueen_Queen_room_MAIN_0_SCENE_0110_010")
  AP.CheckLocation("DragonQueen_Queen_room_MAIN_0_SCENE_0110_010") -- sending the location here for security progress for AP
  --AddItem("ITEM_ARCHIPELAGO") -- no items here
  -- AP end
  EventEnd(eventInfo, "")
end

function DragonQueen_Queen_room_MAIN_0_SCENE_1010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdFadeInOnInitialFadeInPostMapTransitionNoWait(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  CmdPlayEventSequence(2)
  CmdFadeOut(EFadingPriorityTopMost, 0)
  ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 1)
  CmdFadeIn(EFadingPriorityTopMost, 0.5)
  EventEnd(eventInfo, "")
end
