print("Load Script EventScript_C06_Jipang_Room")

local AP = require("Src/DQ3AP") -- AP

local _partyId = {
  "Party1",
  "Party2",
  "Party3",
  "Party4"
}
local _sortPartyId = {
  "Party1",
  "Party2",
  "Party3",
  "Party4"
}
local _partyAudiencePos = {
  X = 3780,
  Y = 2550,
  Z = 150,
  OFFSET = 200
}

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function DreamAnimaBeforeSpeaking(targetActorId, animeRate)
  SetNpcAnimation(targetActorId, AnimationType.Walk, animeRate, EFlipbookPlayTypeLoop, false)
  Wait(0.5)
  ResetNpcAnimation(targetActorId)
end

function JipangRoomAudience(audience)
  local moveAudienceSpeed = 400
  ChangeStageCameraToGlobalPoint(_partyAudiencePos.X, _partyAudiencePos.Y, _partyAudiencePos.Z + 120, CAMERA_BLEND_EASE_IN_OUT, 2, 2, 1500, {
    Yaw = 0,
    Pitch = -10,
    Roll = 0
  })
  if audience == true then
    Audience(_partyAudiencePos.X, _partyAudiencePos.Y, _partyAudiencePos.Z)
  else
    SpawnPartyCloneDisableSkill(true, true, true, true)
    MoveNpc("Party1", {
      X = _partyAudiencePos.X,
      Y = _partyAudiencePos.Y,
      Z = _partyAudiencePos.Z
    }, moveAudienceSpeed)
    MoveNpc("Party2", {
      X = _partyAudiencePos.X - 200,
      Y = _partyAudiencePos.Y - 100,
      Z = _partyAudiencePos.Z
    }, moveAudienceSpeed)
    MoveNpc("Party3", {
      X = _partyAudiencePos.X - 200,
      Y = _partyAudiencePos.Y + 100,
      Z = _partyAudiencePos.Z
    }, moveAudienceSpeed)
    MoveNpc("Party4", {
      X = _partyAudiencePos.X - 300,
      Y = _partyAudiencePos.Y,
      Z = _partyAudiencePos.Z
    }, moveAudienceSpeed)
    WaitMoveNpc("Party1")
    CmdTurnNpc("Party1", NPC_D_UP)
    WaitMoveNpc("Party2")
    CmdTurnNpc("Party2", NPC_D_UP)
    WaitMoveNpc("Party3")
    CmdTurnNpc("Party3", NPC_D_UP)
    WaitMoveNpc("Party4")
    CmdTurnNpc("Party4", NPC_D_UP)
  end
  WaitStageCameraBlend()
  Wait(0.5)
end

function Jipang_Room_MAIN_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE65) == true then
    if GetFlag(Flag.FE151) == true or GetFlag(Flag.FD15) == true then
      SetVisibleActorsTag("HimikoDaytime", false)
      SetVisibleActorsTag("HimikoNight", false)
      SetVisibleActorsTag("Tatami", false)
      SetVisibleActorsTag("Blocking", false)
    else
      SetVisibleActorsTag("HimikoDaytime", true)
      SetVisibleActorsTag("HimikoNight", false)
    end
  elseif GetMapTimeFrame() == MAPTIME_NIGHT then
    SetVisibleActorsTag("HimikoDaytime", false)
    SetVisibleActorsTag("HimikoNight", true)
  else
    SetVisibleActorsTag("HimikoDaytime", true)
    SetVisibleActorsTag("HimikoNight", false)
  end
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    SetVisibleActorsTag("Daytime", false)
    SetVisibleActorsTag("Night", true)
    SetEventVolumeEnabled("Jipang_Room_Himiko_Room_01", false)
  else
    SetVisibleActorsTag("Daytime", true)
    SetVisibleActorsTag("Night", false)
  end
  if GetFlag(Flag.FD16) == true then
    local yayoi01 = "Jipang_Room_Yayoi_01_L1"
    local manJipang10 = "Jipang_Room_man_Jipang_10_L1"
    SetNpcLocation(yayoi01, {
      X = 4280,
      Y = 2440,
      Z = 170
    })
    SetNpcLocation(manJipang10, {
      X = 4280,
      Y = 2660,
      Z = 170
    })
  end
  if GetFlag(Flag.FD15) == true then
    JipangRoomAfterDreamSpace()
  else
    DisableEventFastForwardUI()
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  end
  EventEnd(eventInfo, "")
end

function Jipang_Room_MAIN_0_VOLUME_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetMapTimeFrame() ~= MAPTIME_NIGHT then
    SetNicolaApertureRate(100, 0)
    SetDispMiniMap(false)
    JipangRoomAudience(true)
    if GetFlag(Flag.FE840) == true then
      CmdMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_0110_020_1")
      CmdEventClosingMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_0110_020_2")
    else
      CmdChoiceMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_0110_010_1")
      CmdMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_0110_010_2")
      CmdMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_0110_010_3")
      CmdMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_0110_010_4")
      CmdMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_0110_010_5")
      CmdEventClosingMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_0110_010_6")
    end
    CloseMessage()
    local partyNum = GetPartyMemberNum()
    local offsetX = 200 + _partyAudiencePos.OFFSET * partyNum
    local traceCameraTime = 0.7 + 0.3 * partyNum
    ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, traceCameraTime, 2)
    AudienceFinish(_partyAudiencePos.X, _partyAudiencePos.Y, _partyAudiencePos.Z, offsetX)
    WaitStageCameraBlend()
    SetDispMiniMap(true)
    if GetFlag(Flag.FE840) == false then
      SetFlag(Flag.FE840, true)
      RequestAutoSaveFromEvent()
    end
  end
  EventEnd(eventInfo, "")
end

function Jipang_Room_MAIN_0_ACTOR_0120_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_0120_010_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_MAIN_0_VOLUME_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  local manJipang09 = ""
  local manJipang11 = ""
  local womanJipang05 = ""
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    manJipang09 = "Jipang_Room_Man_Jipang_09_L3"
    manJipang11 = "Jipang_Room_Man_Jipang_11_L3"
    womanJipang05 = "Jipang_Room_Woman_Jipang_05_L3"
  else
    manJipang09 = "Jipang_Room_Man_Jipang_09_L1"
    manJipang11 = "Jipang_Room_Man_Jipang_11_L1"
    womanJipang05 = "Jipang_Room_Woman_Jipang_05_L1"
  end
  JipangRoomAudience(false)
  if GetFlag(Flag.FE150) == false then
    DreamAnimaBeforeSpeaking(manJipang09, 3)
    CmdMessage("NPC_Talk_Jipang_Room_MAIN_0_VOLUME_0010_010_1")
    HideMessageWindowPageFeedIcon()
    CmdMessage("NPC_Talk_Jipang_Room_MAIN_0_VOLUME_0010_010_2")
    ChangeSpeaker()
    SetFlag(Flag.FE150, true)
  end
  SetEventFadeAlpha(0.5)
  CmdFadeOut(EFadingPriorityEventUIBackGround, 1)
  PlaySEEvent("EVESE_JIPANG_VOICE_INMIND")
  Wait(2.5)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Jipang_Room_MAIN_0_VOLUME_0110_010_1")
  ChangeSpeaker()
  CmdMessageDetail("NPC_Talk_Jipang_Room_MAIN_0_VOLUME_0110_010_2", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_TOP)
  local result = CmdChoiceMessageDetail("NPC_Talk_Jipang_Room_MAIN_0_VOLUME_0110_010_3", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_TOP)
  if result == true then
    CmdEventClosingMessageDetail("NPC_Talk_Jipang_Room_MAIN_0_VOLUME_0110_010_4", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_TOP)
    CloseMessage()
    CmdFadeIn(EFadingPriorityEventUIBackGround, 0.5)
    CmdTurnNpc(manJipang09, NPC_D_LOW)
    Wait(0.2)
    CmdSpawnMangaIcon(manJipang09, "FIELD_EFX2D_IMPATIENCE")
    CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0720_010_1")
    CmdTurnNpc(manJipang09, NPC_D_RIGHT)
    local partyNum = GetPartyMemberNum()
    local offsetX = 200 + _partyAudiencePos.OFFSET * partyNum
    local traceCameraTime = 0.7 + 0.3 * partyNum
    ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, traceCameraTime, 2)
    AudienceFinish(_partyAudiencePos.X, _partyAudiencePos.Y, _partyAudiencePos.Z, offsetX)
    WaitStageCameraBlend()
    SetDispMiniMap(true)
    if GetFlag(Flag.FE153) == false then
      SetFlag(Flag.FE153, true)
      RequestAutoSaveFromEvent()
    end
  else
    RequestPreloadEventBattle("BATTLE_EVENT_BOSS_JIPANGROOM_OROCHI_2")
    CmdEventClosingMessageDetail("NPC_Talk_Jipang_Room_MAIN_0_VOLUME_0110_010_5", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_TOP)
    CloseMessage()
    SetEventVolumeEnabled(targetActorId, false)
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    CmdFadeIn(EFadingPriorityEventUIBackGround, 0)
    EndSkillTransformNoEffect()
    EndSkillInvisibleNoEffect()
    DestroyPartyClone()
    ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
    CmdPlayEventSequenceNextEventBattle(2)
    CmdStartEventBattle("BATTLE_EVENT_BOSS_JIPANGROOM_OROCHI_2")
  end
  EventEnd(eventInfo, "")
end

function Jipang_Room_MAIN_0_BATTLE_END_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetNicolaApertureRate(100, 0)
  SetTagItemId("ITEM_IMPORTANT_PURPLE_ORB")
  CmdPlayEventSequencePrevEventBattle(3, EFadingPriorityUIBackGround)
  SetDispMiniMap(false)
  CmdMessageDetail("NPC_Talk_Jipang_Room_MAIN_0_BATTLE_END_0010_010_1", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
  CmdMessageDetail("NPC_Talk_Jipang_Room_MAIN_0_BATTLE_END_0010_010_2", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
  CmdMessageDetail("NPC_Talk_Jipang_Room_MAIN_0_BATTLE_END_0010_010_3", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
  CmdEventClosingMessageDetail("NPC_Talk_Jipang_Room_MAIN_0_BATTLE_END_0010_010_4", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
  CloseMessage()
  SetFlag(Flag.FD15, true)
  CmdFadeOut(EFadingPriorityTopMost, 0)
  FadeIn(EFadingPriorityUIBackGround, 0)
  RevivalPartyMember(0, 1)
  HealPartyMemberHP(0, 9999)
  HealPartyMemberMP(0, 9999)
  HealPartyMemberStatusEffect(0)
  SetHourMapTime(12)
  Wait(2)
  ChangeMap("MAPLIST_C06R0801", "FromReality", ORIENTATION_UP)
  EventEnd(eventInfo, "")
end

function JipangRoomAfterDreamSpace()
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  Wait(1)
  CmdFadeOut(EFadingPriorityUIBackGround, 0)
  CmdFadeInOnInitialFadeInPostMapTransitionNoWait(EFadingPriorityTopMost, 0, nil)
  local himiko02 = ""
  local manJipang01 = ""
  local manJipang02 = ""
  local manJipang09 = ""
  local manJipang11 = ""
  local womanJipang05 = ""
  local manJipang05 = "Jipang_Room_Man_Jipang_05_L1"
  local oldManJipang01 = "Jipang_Room_OldMan_Jipang_01_L1"
  local yayoi01 = "Jipang_Room_Yayoi_01_L1"
  local manJipang10 = "Jipang_Room_man_Jipang_10_L1"
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    himiko02 = "Jipang_Room_Himiko_02_L3"
    manJipang01 = "Jipang_Room_Man_Jipang_01_L3"
    manJipang02 = "Jipang_Room_Man_Jipang_02_L3"
    manJipang09 = "Jipang_Room_Man_Jipang_09_L3"
    manJipang11 = "Jipang_Room_Man_Jipang_11_L3"
    womanJipang05 = "Jipang_Room_Woman_Jipang_05_L3"
  else
    himiko02 = "Jipang_Room_Himiko_02_L1"
    manJipang01 = "Jipang_Room_Man_Jipang_01_L1"
    manJipang02 = "Jipang_Room_Man_Jipang_02_L1"
    manJipang09 = "Jipang_Room_Man_Jipang_09_L1"
    manJipang11 = "Jipang_Room_Man_Jipang_11_L1"
    womanJipang05 = "Jipang_Room_Woman_Jipang_05_L1"
  end
  local cameraPos = {
    X = 4200,
    Y = 2550,
    Z = 200
  }
  local pos1 = {
    X = cameraPos.X,
    Y = cameraPos.Y,
    Z = 175
  }
  local pos2 = {
    X = pos1.X - 200,
    Y = pos1.Y - 100,
    Z = pos1.Z
  }
  local pos3 = {
    X = pos1.X - 200,
    Y = pos1.Y + 100,
    Z = pos1.Z
  }
  local pos4 = {
    X = pos1.X - 300,
    Y = pos1.Y,
    Z = pos1.Z
  }
  local partyNum = GetPartyMemberNum()
  local heroLiving = CheckHeroLiving()
  local heroNum = CheckHero()
  local party1 = _partyId[1]
  local party2 = _partyId[2]
  local party3 = _partyId[3]
  local party4 = _partyId[4]
  if heroLiving == true and heroNum ~= 1 then
    local countIndex = 2
    for i = 1, partyNum do
      if i == heroNum then
        _sortPartyId[1] = _partyId[i]
      else
        _sortPartyId[countIndex] = _partyId[i]
        countIndex = countIndex + 1
      end
    end
    party1 = _sortPartyId[1]
    party2 = _sortPartyId[2]
    party3 = _sortPartyId[3]
    party4 = _sortPartyId[4]
  end
  DestroyNpc(himiko02)
  DestroyNpc(manJipang09)
  DestroyNpc(manJipang11)
  DestroyNpc(womanJipang05)
  SpawnNpc(oldManJipang01)
  SpawnNpc(yayoi01)
  SpawnNpc(manJipang10)
  SpawnPartyClone(true, true, true, true)
  SetNpcLocation(party1, pos1)
  SetNpcLocation(party2, pos2)
  SetNpcLocation(party3, pos3)
  SetNpcLocation(party4, pos4)
  CmdTurnNpc(party1, NPC_D_UP)
  CmdTurnNpc(party2, NPC_D_UP)
  CmdTurnNpc(party3, NPC_D_UP)
  CmdTurnNpc(party4, NPC_D_UP)
  CmdChangeStageCameraToGlobalPoint(cameraPos.X, cameraPos.Y, cameraPos.Z, CAMERA_BLEND_LINEAR, 0, 0, 1800, {
    Yaw = 0,
    Pitch = -20,
    Roll = 0
  })
  CmdEventClosingMessageDetail("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_0170_010_5", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
  CloseMessage()
  Wait(1)
  CmdPlayJingleInn(-1, -1)
  local bgmFadeTime = 0.5
  PlayBGM(GetCurrentMapBgmId(), bgmFadeTime)
  CmdFadeIn(EFadingPriorityUIBackGround, bgmFadeTime)
  Wait(1)
  CmdSetNpcAnimation(oldManJipang01, AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_1110_010_1")
  ChangeSpeaker()
  local yayoi01MoveX = 120
  local yayoi01MoveSpeed = 200
  CmdMoveNpcRelative(yayoi01, {
    X = 0,
    Y = yayoi01MoveX,
    Z = 0
  }, yayoi01MoveSpeed)
  CmdSetNpcAnimation(yayoi01, AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, false)
  CmdTurnNpc(party1, NPC_D_LEFT)
  CmdMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_1110_010_2")
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_1110_010_3")
  ChangeSpeaker()
  CmdMoveNpcRelativeDetail(yayoi01, {
    X = 0,
    Y = -yayoi01MoveX * 0.5,
    Z = 0
  }, yayoi01MoveSpeed, NPC_D_RIGHT, AnimationType.Walk, 1)
  CmdSetNpcAnimation(oldManJipang01, AnimationType.Act2, 1, EFlipbookPlayTypeStopEnd, false)
  CmdTurnNpc(party1, NPC_D_UP)
  CmdMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_1110_010_4")
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_1110_010_5")
  ChangeSpeaker()
  CmdSetNpcAnimation(yayoi01, AnimationType.Act4, 1, EFlipbookPlayTypeStopEnd, false)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_1110_010_6")
  ChangeSpeaker()
  local oldManJipang01MoveX = 120
  local oldManJipang01MoveSpeed = 100
  CmdMoveNpcRelative(oldManJipang01, {
    X = -oldManJipang01MoveX,
    Y = 0,
    Z = 0
  }, 100)
  CmdMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_1110_010_7")
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_1110_010_8")
  ChangeSpeaker()
  ItemGetMessageToActor("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_0150_010_5", "ITEM_ARCHIPELAGO"--[["ITEM_USE_ITEM_DIEAMEND"]], oldManJipang01, true) -- AP
  ItemGetMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_0150_010_5", "ITEM_ARCHIPELAGO"--[["ITEM_USE_ITEM_YGGDRASIL_LEAF"]], true) -- AP
  ItemGetMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_0150_010_5", "ITEM_ARCHIPELAGO"--[["ITEM_EQUIP_ACCESSORY_AGILITY_RING"]], true) -- AP
  CloseMessage()
  PauseMainBGM(false, 0)
  -- AP
  AP.Log("Jipang_Room_MAIN_0_SCENE_0010_010 called (Pimiko's Palace, rewards for defeating Orochi)")
  AP.CheckLocation("Jipang_Room_MAIN_0_SCENE_0010_010_Sub_1\nJipang_Room_MAIN_0_SCENE_0010_010_Sub_2\nJipang_Room_MAIN_0_SCENE_0010_010_Sub_3\nJipang_Room_MAIN_0_SCENE_0010_010_Main")
  local ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
    AddItem(ItemId)
    AddItem(ItemId)
    AddItem(ItemId)
  else
    AddItem("ITEM_USE_ITEM_DIEAMEND")
    AddItem("ITEM_USE_ITEM_YGGDRASIL_LEAF")
    AddItem("ITEM_EQUIP_ACCESSORY_AGILITY_RING")
  end
  -- AP end
  CmdMoveNpcRelativeDetail(oldManJipang01, {
    X = oldManJipang01MoveX,
    Y = 0,
    Z = 0
  }, oldManJipang01MoveSpeed, NPC_D_LOW, AnimationType.Walk, 1)
  CmdSetNpcAnimation(yayoi01, AnimationType.Act5, 1, EFlipbookPlayTypeStopEnd, false)
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_MAIN_0_ACTOR_1110_010_9")
  ChangeSpeaker()
  CmdFadeOut(EFadingPriorityUIBackGround, 1.5)
  ResetNpcAnimation(yayoi01)
  SpawnNpc(manJipang01)
  SpawnNpc(manJipang02)
  SpawnNpc(manJipang05)
  if heroLiving == true and heroNum ~= 1 then
    SetNpcLocation(party1, pos1)
    SetNpcLocation(party2, pos1)
    SetNpcLocation(party3, pos1)
    SetNpcLocation(party4, pos1)
    Wait(0.1)
    CmdTurnNpc(party1, NPC_D_UP)
    CmdTurnNpc(party2, NPC_D_UP)
    CmdTurnNpc(party3, NPC_D_UP)
    CmdTurnNpc(party4, NPC_D_UP)
  end
  SetPlayerLocation(pos1)
  Wait(0.1)
  TurnParty(1, 0)
  Wait(0.1)
  DestroyPartyClone()
  PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WARP)
  RequestUpdatingTraceCamera()
  WaitOneFrame()
  CmdChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
  SetDispMiniMap(true)
  CmdFadeIn(EFadingPriorityUIBackGround, 1.5)
  SetEventVolumeEnabled("Jipang_Room_Himiko_Room_02", false)
  SetFlag(Flag.FE151, true)
  -- AP
  if ItemId == "ITEM_ARCHIPELAGO" then
    AddItem(ItemId)
  else
    AddItem("ITEM_IMPORTANT_PURPLE_ORB")
    SetFlag(Flag.FE76, true)
  end
  -- AP end
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_JIPANG_DefeatOrochi, true)
  -- AP
  if ItemId == "ITEM_ARCHIPELAGO" then
  else
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MULTI_HintOrb, true)
    CheckGopEnum_MAIN_MULTI_GetAllOrb()
  end
  -- AP end
  SetFlag(Flag.FD15, false)
  SetFlag(Flag.FD16, true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function Jipang_Room_MAIN_0_ACTOR_1210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_House1_SUB_0_ACTOR_0110_020_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_MAIN_0_ACTOR_1310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Storehouse_SUB_0_ACTOR_0210_010_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_MAIN_0_ACTOR_1410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Storehouse_SUB_0_ACTOR_0310_010_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0210_010_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0210_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0210_020_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0210_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0210_030_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0310_010_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0320_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0320_010_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0310_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0310_020_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0310_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0310_030_1")
  CmdMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0310_030_2")
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0310_030_3")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0410_010_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0420_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local mangaIconId = SpawnMangaIcon(targetActorId, "Ev_Cmn_Zzz_01")
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0420_010_1")
  CloseMangaIcon(targetActorId, mangaIconId)
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0410_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0410_020_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0420_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0420_020_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0510_010_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0520_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0520_010_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0510_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Out_SUB_0_ACTOR_0410_020_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0510_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0510_030_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0610_010_1")
  EventEnd(eventInfo, "", false)
end

function Jipang_Room_SUB_0_ACTOR_0620_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0620_010_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0610_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0610_020_1")
  EventEnd(eventInfo, "", false)
end

function Jipang_Room_SUB_0_ACTOR_0620_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0620_010_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0610_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0610_030_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0720_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0720_010_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0810_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0810_010_1")
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0810_010_2")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0910_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0910_010_1")
  EventEnd(eventInfo, "", false)
end

function Jipang_Room_SUB_0_ACTOR_0920_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0920_010_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_0910_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0910_020_1")
  EventEnd(eventInfo, "", false)
end

function Jipang_Room_SUB_0_ACTOR_0910_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0910_030_1")
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_0910_030_2")
  EventEnd(eventInfo, "", false)
end

function Jipang_Room_SUB_0_ACTOR_1010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_1010_010_1")
  EventEnd(eventInfo, "", false)
end

function Jipang_Room_SUB_0_ACTOR_1020_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_1020_010_1")
  EventEnd(eventInfo, "")
end

function Jipang_Room_SUB_0_ACTOR_1010_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_1010_020_1")
  EventEnd(eventInfo, "", false)
end

function Jipang_Room_SUB_0_ACTOR_1010_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Jipang_Room_SUB_0_ACTOR_1010_030_1")
  EventEnd(eventInfo, "")
end
