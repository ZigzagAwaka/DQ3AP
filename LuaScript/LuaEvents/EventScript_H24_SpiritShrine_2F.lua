print("Load Script EventScript_H24_SpiritShrine_2F")

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

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function SpiritShrine_2F_SUB_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE87) == false then
    SpiritShrineEventStart()
  else
    DisableEventFastForwardUI()
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  end
  EventEnd(eventInfo, "")
end

function SpiritShrineEventStart()
  CmdFadeOut(EFadingPriorityUIBackGround, 0)
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  RequestPreloadEventScreenShot("EVENTSCREENSHOT_SpiritShrine001")
  RequestPreloadEventScreenShot("EVENTSCREENSHOT_SpiritShrine002")
  if GetFlag(Flag.FE230) == false then
    RequestPreloadEventScreenShot("EVENTSCREENSHOT_SpiritShrine012")
    if GetFlag(Flag.FE86) == false then
      RequestPreloadEventScreenShot("EVENTSCREENSHOT_SpiritShrine011")
    end
  end
  CmdFadeIn(EFadingPriorityTopMost, 0.5)
  local revivalEvent = false
  local revivalList = {
    false,
    false,
    false,
    false
  }
  local revivalNum = 0
  local partyNum = GetPartyMemberNum()
  for i = 1, partyNum do
    if 0 >= GetPartyMemberStatus(i, UNIT_STATUS_HP) then
      revivalList[i] = true
      revivalEvent = true
      revivalNum = i
    end
  end
  if revivalEvent == true then
    Wait(1)
    for i = 1, partyNum do
      if revivalList[i] == true then
        SetTagWord(GetPartyMemberName(i, UNIT_NAME_NAME))
        if i == revivalNum then
          HideMessageWindowPageFeedIcon()
        end
        CmdMessage("NPC_Talk_SpiritShrine_2F_SUB_0_SCENE_0010_010_0_1")
      end
    end
    CloseMessage()
    Wait(1)
  end
  RevivalPartyMember(0, 1)
  local faerieLight = ""
  local faerie01 = ""
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    faerieLight = ""
    faerie01 = "SpiritShrine_2F_Faerie_SpiritShrine_01_L3"
  else
    faerieLight = ""
    faerie01 = "SpiritShrine_2F_Faerie_SpiritShrine_01_L1"
  end
  local groundZ = 100
  local partyPos = {
    X = 650,
    Y = 1400,
    Z = groundZ
  }
  local movePartyPos1 = {
    X = 900,
    Y = partyPos.Y,
    Z = groundZ + 10
  }
  local moveParty1Pos2 = {
    X = movePartyPos1.X - 100,
    Y = 900,
    Z = movePartyPos1.Z
  }
  local moveParty2Pos2 = {
    X = moveParty1Pos2.X - 250,
    Y = moveParty1Pos2.Y - 100,
    Z = movePartyPos1.Z
  }
  local moveParty3Pos2 = {
    X = moveParty1Pos2.X - 250,
    Y = moveParty1Pos2.Y + 100,
    Z = movePartyPos1.Z
  }
  local moveParty4Pos2 = {
    X = moveParty1Pos2.X - 350,
    Y = moveParty1Pos2.Y,
    Z = movePartyPos1.Z
  }
  local cameraoffset = 50
  local cameraCenterPos = {
    X = movePartyPos1.X,
    Y = movePartyPos1.Y,
    Z = groundZ + cameraoffset
  }
  local cameraFaeriePos = {
    X = 1580,
    Y = 900,
    Z = groundZ + cameraoffset
  }
  local cameraDistance1 = 2500
  local cameraDistance2 = 2200
  local cameraAngle1 = {
    Yaw = 0,
    Pitch = -25,
    Roll = 0
  }
  local cameraAngle2 = {
    Yaw = 0,
    Pitch = -10,
    Roll = 0
  }
  local movePartySpeed = 200
  local tagItemId1 = "ITEM_IMPORTANT_FAERIE_FLUTE"
  local tagItemId2 = "ITEM_EQUIP_WEAPON_STAFF_OF_RAIN"
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
  SetPlayerLocation(partyPos)
  Wait(0.1)
  TurnParty(1, 0)
  Wait(0.1)
  EndSkillTransformNoEffect()
  EndSkillInvisibleNoEffect()
  SpawnPartyCloneDisableSkill(true, true, true, true)
  SetNpcLocation(party1, partyPos)
  SetNpcLocation(party2, partyPos)
  SetNpcLocation(party3, partyPos)
  SetNpcLocation(party4, partyPos)
  CmdTurnNpc(party1, NPC_D_UP)
  CmdTurnNpc(party2, NPC_D_UP)
  CmdTurnNpc(party3, NPC_D_UP)
  CmdTurnNpc(party4, NPC_D_UP)
  CmdChangeNpcOpacity(party1, 0, 0, false)
  CmdChangeNpcOpacity(party2, 0, 0, false)
  CmdChangeNpcOpacity(party3, 0, 0, false)
  CmdChangeNpcOpacity(party4, 0, 0, false)
  CmdChangeStageCameraToGlobalPoint(movePartyPos1.X, movePartyPos1.Y, movePartyPos1.Z, CAMERA_BLEND_LINEAR, 0, 0, cameraDistance1, cameraAngle1)
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityUIBackGround, 0.5, GetCurrentMapId())
  Wait(1)
  CmdChangeNpcOpacity(party1, 1, 0, false)
  CmdMoveNpcRelative(party1, {
    X = 100,
    Y = 0,
    Z = 0
  }, movePartySpeed)
  MoveNpc(party1, {
    X = movePartyPos1.X + 100,
    Y = movePartyPos1.Y,
    Z = 0
  }, movePartySpeed)
  CmdChangeNpcOpacity(party2, 1, 0, false)
  CmdMoveNpcRelative(party2, {
    X = 100,
    Y = 0,
    Z = 0
  }, movePartySpeed)
  MoveNpc(party2, {
    X = movePartyPos1.X,
    Y = movePartyPos1.Y - 100,
    Z = 0
  }, movePartySpeed)
  CmdChangeNpcOpacity(party3, 1, 0, false)
  CmdMoveNpcRelative(party3, {
    X = 100,
    Y = 0,
    Z = 0
  }, movePartySpeed)
  MoveNpc(party3, {
    X = movePartyPos1.X,
    Y = movePartyPos1.Y + 100,
    Z = 0
  }, movePartySpeed)
  CmdChangeNpcOpacity(party4, 1, 0, false)
  CmdMoveNpcRelative(party4, {
    X = 100,
    Y = 0,
    Z = 0
  }, movePartySpeed)
  MoveNpc(party4, {
    X = movePartyPos1.X - 100,
    Y = movePartyPos1.Y,
    Z = 0
  }, movePartySpeed)
  WaitMoveNpc(party1)
  TurnNpc(party1, NPC_D_UP)
  WaitMoveNpc(party2)
  TurnNpc(party2, NPC_D_UP)
  WaitMoveNpc(party3)
  TurnNpc(party3, NPC_D_UP)
  WaitMoveNpc(party4)
  TurnNpc(party4, NPC_D_UP)
  Wait(1)
  WaitTurnNpc(party2)
  TurnNpc(party2, NPC_D_LEFT)
  WaitTurnNpc(party3)
  TurnNpc(party3, NPC_D_RIGHT)
  Wait(0.2)
  WaitTurnNpc(party4)
  TurnNpc(party4, NPC_D_LOW)
  Wait(0.5)
  CmdSpawnMangaIcon(party1, "FIELD_EFX2D_QUESTION")
  Wait(1)
  local effectId1 = "Ev_H24_Fairy_Appear_01"
  local effectTag1 = "fairyAppear01"
  local effectPos = {
    X = 1570,
    Y = 903,
    Z = 200
  }
  PlaySEEvent("EVESE_SPIRITSHRINE_SHINE_APPEARANCE_1")
  SpawnLoopEffectWorld(effectId1, effectTag1, effectPos, {
    Yaw = 0,
    Pitch = 0,
    Roll = 0
  }, 1)
  Wait(1)
  TurnNpc(party1, NPC_D_UP)
  TurnNpc(party2, NPC_D_UP)
  TurnNpc(party3, NPC_D_UP)
  TurnNpc(party4, NPC_D_UP)
  WaitTurnNpc(party1)
  WaitTurnNpc(party2)
  WaitTurnNpc(party3)
  WaitTurnNpc(party4)
  local mangaId1 = SpawnMangaIcon(party1, "FIELD_EFX2D_SURPRISE")
  local mangaId2 = SpawnMangaIcon(party2, "FIELD_EFX2D_SURPRISE")
  local mangaId3 = SpawnMangaIcon(party3, "FIELD_EFX2D_SURPRISE")
  local mangaId4 = SpawnMangaIcon(party4, "FIELD_EFX2D_SURPRISE")
  WaitPlayMangaIconAnimation(party1, mangaId1)
  WaitPlayMangaIconAnimation(party2, mangaId2)
  WaitPlayMangaIconAnimation(party3, mangaId3)
  WaitPlayMangaIconAnimation(party4, mangaId4)
  Wait(0.5)
  ChangeStageCameraToGlobalPoint(cameraFaeriePos.X, cameraFaeriePos.Y, cameraFaeriePos.Z, CAMERA_BLEND_EASE_IN_OUT, 3, 2, cameraDistance1, cameraAngle2)
  local partyMoveY = -150
  MoveNpcRelative(party1, {
    X = 0,
    Y = partyMoveY,
    Z = 0
  }, movePartySpeed)
  MoveNpcRelative(party2, {
    X = 0,
    Y = partyMoveY,
    Z = 0
  }, movePartySpeed)
  MoveNpcRelative(party3, {
    X = 0,
    Y = partyMoveY,
    Z = 0
  }, movePartySpeed)
  MoveNpcRelative(party4, {
    X = 0,
    Y = partyMoveY,
    Z = 0
  }, movePartySpeed)
  WaitMoveNpc(party1)
  WaitMoveNpc(party2)
  WaitMoveNpc(party3)
  WaitMoveNpc(party4)
  MoveNpc(party1, moveParty1Pos2, movePartySpeed)
  MoveNpc(party2, moveParty2Pos2, movePartySpeed)
  MoveNpc(party3, moveParty3Pos2, movePartySpeed)
  MoveNpc(party4, moveParty4Pos2, movePartySpeed)
  WaitMoveNpc(party1)
  CmdTurnNpc(party1, NPC_D_UP)
  WaitMoveNpc(party3)
  CmdTurnNpc(party3, NPC_D_UP)
  WaitMoveNpc(party4)
  CmdTurnNpc(party4, NPC_D_UP)
  WaitMoveNpc(party2)
  CmdTurnNpc(party2, NPC_D_UP)
  WaitStageCameraBlend()
  Wait(1)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_1")
  CloseMessage()
  CmdShowEventScreenShotUIDefaultParam("EVENTSCREENSHOT_SpiritShrine001")
  SetTagMonth(GetBirthdayMonth())
  SetTagDay(GetBirthdayDay())
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_2")
  CloseMessage()
  CmdShowEventScreenShotUIDefaultParam("EVENTSCREENSHOT_SpiritShrine002")
  CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_3")
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_4")
  CloseMessage()
  PlaySEEvent("EVESE_SPIRITSHRINE_SHINE_APPEARANCE_2")
  CmdCloseEventScreenShotUIDefaultParam()
  EraseLoopEffectByParamEnd(effectTag1, 1.5)
  PlaySEEvent("EVESE_SPIRITSHRINE_SHINE_CONVERGENCE")
  local effectId2 = "Ev_H24_Fairy_Appear_02"
  SpawnEffectWorld(effectId2, effectPos, {
    Yaw = 0,
    Pitch = 0,
    Roll = 0
  }, 1)
  Wait(1)
  SpawnNpc(faerie01)
  Wait(1)
  ChangeStageCameraToGlobalPoint(cameraFaeriePos.X, cameraFaeriePos.Y, cameraFaeriePos.Z, CAMERA_BLEND_EASE_IN_OUT, 2, 2, cameraDistance2, cameraAngle2)
  Wait(0.5)
  CmdSetNpcAnimation(faerie01, AnimationType.Act2, 1, EFlipbookPlayTypeStopEnd, true)
  WaitStageCameraBlend()
  Wait(2)
  CmdSetNpcAnimation(faerie01, AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, true)
  Wait(0.5)
  CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_5")
  if GetFlag(Flag.FE230) == true then
    CmdSetNpcAnimation(faerie01, AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, true)
    CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_6")
    CmdSetNpcAnimation(faerie01, AnimationType.Act4, 1, EFlipbookPlayTypeStopEnd, true)
    SetTagItemId(tagItemId2)
    CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_7")
  else
    CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_8")
    CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_9")
    CmdSetNpcAnimation(faerie01, AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, true)
    HideMessageWindowPageFeedIcon()
    CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_10")
    ChangeSpeaker()
    CmdShowEventScreenShotUIDefaultParam("EVENTSCREENSHOT_SpiritShrine012")
    HideMessageWindowPageFeedIcon()
    CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_10_2")
    CloseMessage()
    CmdSetNpcAnimation(faerie01, AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, true)
    CmdCloseEventScreenShotUIDefaultParam()
    SetTagItemId(tagItemId1)
    HideMessageWindowPageFeedIcon()
    CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_11")
  end
  if GetFlag(Flag.FE230) == false then
    if GetFlag(Flag.FE86) == true then
      CmdSetNpcAnimation(faerie01, AnimationType.Act5, 1, EFlipbookPlayTypeStopEnd, true)
      SetTagItemId(tagItemId1)
      CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_12")
      CmdSetNpcAnimation(faerie01, AnimationType.Act6, 1, EFlipbookPlayTypeStopEnd, true)
      HideMessageWindowPageFeedIcon()
      CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_13")
    else
      CloseMessage()
      CmdShowEventScreenShotUIDefaultParam("EVENTSCREENSHOT_SpiritShrine011")
      HideMessageWindowPageFeedIcon()
      CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_14")
      CloseMessage()
      CmdSetNpcAnimation(faerie01, AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, true)
      CmdCloseEventScreenShotUIDefaultParam()
      CmdSetNpcAnimation(faerie01, AnimationType.Act8, 1, EFlipbookPlayTypeStopEnd, true)
      SetTagItemId(tagItemId2)
      HideMessageWindowPageFeedIcon()
      CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_15")
    end
  end
  CloseMessage()
  SetTagItemId(tagItemId2)
  ItemGetMessageToActor("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_16", "ITEM_ARCHIPELAGO"--[[tagItemId2]], faerie01) -- AP
  -- AP
  AP.Log("SpiritShrine_2F_SUB_0_SCENE_0010_010 called (Shrine of the Spirit - Faerie giving the Staff of Rain)")
  AP.CheckLocation("SpiritShrine_2F_SUB_0_SCENE_0010_010")
  SetFlag(Flag.FE87, true) -- can't be skiped or it will play the cutscene multiple times and can be avoided easily
  local ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
    AddItem(ItemId)
  else
    AddItem(tagItemId2)
    if GetFlag(Flag.FE85) == true then
      SetFlag(Flag.FE880, true)
    end
  end
  -- AP end
  CmdSetNpcAnimation(faerie01, AnimationType.Act9, 1, EFlipbookPlayTypeStopEnd, true)
  HideMessageWindowPageFeedIcon()
  CmdEventClosingMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_17")
  CloseMessage()
  Wait(0.5)
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  DestroyPartyClone()
  FadeIn(EFadingPriorityTopMost, 0.5)
  CmdPlayEventSequence(0)
  CmdFadeOut(EFadingPriorityTopMost, 0)
  EndSkillTransformNoEffect()
  EndSkillInvisibleNoEffect()
  SpawnPartyCloneDisableSkill(true, true, true, true)
  SetNpcLocation(party1, moveParty1Pos2)
  SetNpcLocation(party2, moveParty2Pos2)
  SetNpcLocation(party3, moveParty3Pos2)
  SetNpcLocation(party4, moveParty4Pos2)
  CmdTurnNpc(party1, NPC_D_UP)
  CmdTurnNpc(party2, NPC_D_UP)
  CmdTurnNpc(party3, NPC_D_UP)
  CmdTurnNpc(party4, NPC_D_UP)
  HealPartyMemberHP(0, 9999)
  HealPartyMemberMP(0, 9999)
  HealPartyMemberStatusEffect(0)
  CmdChangeStageCameraToGlobalPoint(cameraFaeriePos.X, cameraFaeriePos.Y, cameraFaeriePos.Z, CAMERA_BLEND_LINEAR, 0, 0, cameraDistance2, cameraAngle2)
  CmdFadeIn(EFadingPriorityTopMost, 0.5)
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  Wait(1)
  CmdSetNpcAnimation(faerie01, AnimationType.Act14, 1, EFlipbookPlayTypeStopEnd, true)
  CmdEventClosingMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_010_19")
  CmdSetNpcAnimation(faerie01, AnimationType.Act15, 1, EFlipbookPlayTypeStopEnd, true)
  -- AP
  if ItemId == "ITEM_ARCHIPELAGO" then
  else
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_SPIRITSHRINE_GetRainStick, true)
  end
  -- AP end
  SetPlayerLocation(moveParty1Pos2)
  Wait(0.1)
  TurnParty(1, 0)
  Wait(0.1)
  DestroyPartyClone()
  PartyMemberAlignment(ALIGNMENT_TOGETHER, ALIGNMENT_MOVE_WALK)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
  SetDispMiniMap(true)
  SetDisableRula(true)
  RequestAutoSaveFromEvent()
end

function SpiritShrine_2F_MAIN_0_ACTOR_0220_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if CheckModRod() == true or CheckFadingJenny() == true then
    CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_020_0")
  end
  CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_020_1")
  CmdEventClosingMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0220_020_2")
  EventEnd(eventInfo, "")
end

function SpiritShrine_2F_MAIN_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE87) == false then
    SpiritShrineEventStart()
  else
    DisableEventFastForwardUI()
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  end
  --[[
  if CheckModRod() == true or CheckFadingJenny() == true then
    CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0210_010_0")
  end
  CmdMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0210_010_1")
  CmdEventClosingMessage("NPC_Talk_SpiritShrine_2F_MAIN_0_ACTOR_0210_010_2")
  ]]
  EventEnd(eventInfo, "")
end