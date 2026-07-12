print("Load Script EventScript_T09_Myra_Shop_2F")

local AP = require("Src/DQ3AP") -- AP

local _groundZ = 100
local _initSwordsmithPos = {
  X = 800,
  Y = 655,
  Z = _groundZ
}
local _workbenchFrontPos = {
  X = 1450,
  Y = _initSwordsmithPos.Y,
  Z = _initSwordsmithPos.Z
}
local _cameraSwordsmithPos = {
  X = _initSwordsmithPos.X - 50,
  Y = _initSwordsmithPos.Y,
  Z = _initSwordsmithPos.Z
}
local _cameraWeaponFrontPos = {
  X = _workbenchFrontPos.X,
  Y = 400,
  Z = 192
}
local _normalCameraTime = 2
local _normalCameraDistance = 2000
local _normalCameraAngle = {
  Yaw = 0,
  Pitch = -25,
  Roll = 0
}
local _moveSpeed = 300
local _highMoveSpeed = 600
local _pos1 = {
  X = 560,
  Y = _initSwordsmithPos.Y,
  Z = _groundZ
}
local _pos2 = {
  X = _pos1.X - 150,
  Y = _pos1.Y - 100,
  Z = _pos1.Z
}
local _pos3 = {
  X = _pos1.X - 150,
  Y = _pos1.Y + 100,
  Z = _pos1.Z
}
local _pos4 = {
  X = _pos1.X - 200,
  Y = _pos1.Y,
  Z = _pos1.Z
}
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
local _tagGaiaHammer = "GaiaHammer"
local _tagRotoSword = "RotoSword"

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Myra_Shop_2F_MAIN_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetVisibleActorsTag(_tagRotoSword, false)
  if GetFlag(Flag.FE854) == true then
    SetVisibleActorsTag(_tagGaiaHammer, true)
  else
    SetVisibleActorsTag(_tagGaiaHammer, false)
  end
  DisableEventFastForwardUI()
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  EventEnd(eventInfo, "")
end

function SwordSmithSetEventStart(sortParty, move, isSpawned)
  if sortParty == true then
    local partyNum = GetPartyMemberNum()
    local heroNum = CheckHero()
    local countIndex = 2
    for i = 1, partyNum do
      if i == heroNum then
        _sortPartyId[1] = _partyId[i]
      else
        _sortPartyId[countIndex] = _partyId[i]
        countIndex = countIndex + 1
      end
    end
  end
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  if isSpawned == nil then
    local SpawnClone = true
    if SpawnClone == true then
      SpawnPartyClone(true, true, true, true)
    end
  end
  SetPlayerLocation(_pos1)
  Wait(0.1)
  TurnParty(1, 0)
  Wait(0.1)
  if move == true then
    ChangeStageCameraToGlobalPoint(_cameraSwordsmithPos.X, _cameraSwordsmithPos.Y, _cameraSwordsmithPos.Z, CAMERA_BLEND_EASE_IN_OUT, _normalCameraTime, 2, _normalCameraDistance, _normalCameraAngle)
    MoveNpc(_sortPartyId[1], _pos1, _moveSpeed)
    MoveNpc(_sortPartyId[2], _pos2, _moveSpeed)
    MoveNpc(_sortPartyId[3], _pos3, _moveSpeed)
    MoveNpc(_sortPartyId[4], _pos4, _moveSpeed)
    WaitMoveNpc(_sortPartyId[1])
    CmdTurnNpc(_sortPartyId[1], NPC_D_UP)
    WaitMoveNpc(_sortPartyId[2])
    CmdTurnNpc(_sortPartyId[2], NPC_D_UP)
    WaitMoveNpc(_sortPartyId[3])
    CmdTurnNpc(_sortPartyId[3], NPC_D_UP)
    WaitMoveNpc(_sortPartyId[4])
    CmdTurnNpc(_sortPartyId[4], NPC_D_UP)
  else
    ChangeStageCameraToGlobalPoint(_cameraSwordsmithPos.X, _cameraSwordsmithPos.Y, _cameraSwordsmithPos.Z, 0, 0, 0, _normalCameraDistance, _normalCameraAngle)
    SetNpcLocation(_sortPartyId[1], _pos1)
    SetNpcLocation(_sortPartyId[2], _pos2)
    SetNpcLocation(_sortPartyId[3], _pos3)
    SetNpcLocation(_sortPartyId[4], _pos4)
  end
  WaitStageCameraBlend()
end

function SwordSmithEvent(targetActorId)
  local eventCamera = false
  local callShopUI = false
  if GetFlag(Flag.FE83) == true then
    callShopUI = true
  elseif GetFlag(Flag.FE841) == true then
    if GetFlag(Flag.FE854) == false then
      local itemId = "ITEM_IMPORTANT_HAMMER_OF_GAIA"
      SwordSmithSetEventStart(false, true)
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_020_1")
      CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_QUESTION")
      SetTagItemId(itemId)
      HideMessageWindowPageFeedIcon()
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_020_2")
      CloseMessage()
      SpawnMangaIcon(targetActorId, "FIELD_EFX2D_THINK")
      Wait(1.5)
      CloseMangaIconAll(targetActorId)
      Wait(0.5)
      CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_SURPRISE")
      CmdSetNpcAnimation(targetActorId, AnimationType.Act5, 1, EFlipbookPlayTypeStopEnd, true)
      SetTagItemId(itemId)
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_020_3")
      CmdSetNpcAnimation(targetActorId, AnimationType.Act6, 1, EFlipbookPlayTypeAutoResetIdle, false)
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_020_4")
      CmdSetNpcAnimation(targetActorId, AnimationType.Act7, 1, EFlipbookPlayTypeStopEnd, true)
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_020_5")
      CmdSetNpcAnimation(targetActorId, AnimationType.Act8, 1, EFlipbookPlayTypeAutoResetIdle, false)
      SetTagItemId(itemId)
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_020_6")
      CmdSetNpcAnimation(targetActorId, AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, true)
      if GetFlag(Flag.FE876) == false and GetFlag(Flag.FE875) == false and GetFlag(Flag.FE877) == true and GetFlag(Flag.FE82) == true then
        CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_020_7")
        CloseMessage()
      else
        CmdEventClosingMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_020_7")
      end
      CmdSetNpcAnimation(targetActorId, AnimationType.Act4, 1, EFlipbookPlayTypeAutoResetIdle, false)
      RemoveItem(itemId)
      SetFlag(Flag.FE854, true)
      SetFlag(Flag.FF0, true)
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MYRA_ChangeShopItem, true)
      eventCamera = true
      callShopUI = false
    else
      callShopUI = true
    end
    if CheckHeroLiving() == true and GetFlag(Flag.FE876) == false and GetFlag(Flag.FE875) == false and GetFlag(Flag.FE877) == true and GetFlag(Flag.FE82) == true then
      local isSwordSmithSetEventStart = false
      if GetFlag(Flag.FF0) == false then
        isSwordSmithSetEventStart = true
        if CheckHero() == 4 then
          SwordSmithSetEventStart(false, true)
        else
          SwordSmithSetEventStart(true, true)
        end
      end
      if GetFlag(Flag.FF0) == false then
        HideMessageWindowPageFeedIcon()
        CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_1")
        CloseMessage()
      else
        Wait(1)
      end
      CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_QUESTION")
      HideMessageWindowPageFeedIcon()
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_2")
      CloseMessage()
      SpawnMangaIcon(targetActorId, "FIELD_EFX2D_THINK")
      Wait(1.5)
      CloseMangaIconAll(targetActorId)
      Wait(0.5)
      CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_SURPRISE")
      CmdSetNpcAnimation(targetActorId, AnimationType.Act5, 1, EFlipbookPlayTypeStopEnd, true)
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_3")
      CmdSetNpcAnimation(targetActorId, AnimationType.Act6, 1, EFlipbookPlayTypeAutoResetIdle, false)
      CmdSetNpcAnimation(targetActorId, AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, true)
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_4")
      CmdSetNpcAnimation(targetActorId, AnimationType.Act4, 1, EFlipbookPlayTypeAutoResetIdle, false)
      HideMessageWindowPageFeedIcon()
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_5")
      CloseMessage()
      SpawnMangaIcon(targetActorId, "FIELD_EFX2D_THINK")
      Wait(1.5)
      CloseMangaIconAll(targetActorId)
      Wait(0.5)
      CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_QUESTION")
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_6")
      CmdSetNpcAnimation(targetActorId, AnimationType.Act5, 1, EFlipbookPlayTypeStopEnd, true)
      CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_SURPRISE")
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_7")
      CmdSetNpcAnimation(targetActorId, AnimationType.Act6, 1, EFlipbookPlayTypeAutoResetIdle, false)
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_8")
      CmdSetNpcAnimation(targetActorId, AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, true)
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_9")
      HideMessageWindowPageFeedIcon()
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_10")
      CloseMessage()
      CmdSetNpcAnimation(targetActorId, AnimationType.Act4, 1, EFlipbookPlayTypeAutoResetIdle, false)
      if GetFlag(Flag.FF0) == false then
        CmdTurnNpc(targetActorId, NPC_D_RIGHT)
        SetNpcAnimation(targetActorId, AnimationType.Walk, 2, EFlipbookPlayTypeLoop, false)
        Wait(0.5)
        ResetNpcAnimation(targetActorId)
        SetVisibleActorsTag(_tagGaiaHammer, false)
      end
      MoveNpc(targetActorId, _workbenchFrontPos, _highMoveSpeed)
      Wait(0.5)
      StopBGM(1)
      CameraFadeOut(1, 1)
      Wait(1)
      AbortCommandNpc(targetActorId)
      Wait(0.1)
      local npcPosYOffset = 50
      SetNpcLocation(targetActorId, {
        X = _workbenchFrontPos.X,
        Y = _workbenchFrontPos.Y + npcPosYOffset,
        Z = _workbenchFrontPos.Z
      })
      Wait(0.1)
      Wait(1)
      ShowCameraEffect("Ev_T09_Screen_Spark_01", 0)
      PlaySEEvent("EVESE_MYRA_BLACKSMITH_SMALL")
      Wait(2.5)
      PlaySEEvent("EVESE_MYRA_BLACKSMITH_LARGE")
      Wait(1.5)
      PlaySEEvent("EVESE_MYRA_BLACKSMITH_SMALL")
      Wait(3)
      PlaySEEvent("EVESE_MYRA_POLISHING")
      Wait(6)
      HideMessageWindowPageFeedIcon()
      CmdMessageDetail("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_11", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
      CloseMessage()
      Wait(1)
      DestroyPartyClone()
      CmdPlayJingleInn(-1, -1)
      RevivalPartyMember(0, 1)
      HealPartyMemberHP(0, 9999)
      HealPartyMemberMP(0, 9999)
      HealPartyMemberStatusEffect(0)
      SpawnPartyCloneDisableAll(true, true, true, true)
      SetNpcLocation(_sortPartyId[1], _pos1)
      SetNpcLocation(_sortPartyId[2], _pos2)
      SetNpcLocation(_sortPartyId[3], _pos3)
      SetNpcLocation(_sortPartyId[4], _pos4)
      if GetFlag(Flag.FF0) == true or isSwordSmithSetEventStart == false then
        SwordSmithSetEventStart(true, false, false)
      end
      SetVisibleActorsTag(_tagGaiaHammer, false)
      SetVisibleActorsTag(_tagRotoSword, true)
      CmdChangeStageCameraToGlobalPoint(_cameraWeaponFrontPos.X, _cameraWeaponFrontPos.Y, _cameraWeaponFrontPos.Z, CAMERA_BLEND_LINEAR, 0, 0, 600, {
        Yaw = 0,
        Pitch = -30,
        Roll = 0
      })
      local bgmFadeTime = 0.5
      PlayBGM(GetCurrentMapBgmId(), bgmFadeTime)
      CameraFadeIn(bgmFadeTime)
      Wait(bgmFadeTime)
      Wait(0.5)
      local effectTag = "SwordOfRoto_Twinkle_01"
      SpawnLoopEffectWorld("Ev_T09_SwordOfRoto_Twinkle_01", effectTag, {
        X = 1506,
        Y = 480,
        Z = 162
      }, {
        Yaw = 30,
        Pitch = 0,
        Roll = 0
      }, 1)
      PlaySEEvent("EVESE_SHINE")
      PlaySEEvent("EVESE_KIRAKIRA")
      Wait(3)
      EraseLoopEffectByParamEnd(effectTag, 0.5)
      Wait(1)
      ChangeStageCameraToGlobalPoint(_cameraWeaponFrontPos.X, _cameraWeaponFrontPos.Y, _cameraWeaponFrontPos.Z, CAMERA_BLEND_LINEAR, 1.5, 2, 1400, {
        Yaw = 0,
        Pitch = -30,
        Roll = 0
      })
      local moveY = 250
      CmdMoveNpcRelative(targetActorId, {
        X = 0,
        Y = -(moveY + npcPosYOffset),
        Z = 0
      }, _moveSpeed)
      CmdTurnNpc(targetActorId, NPC_D_UP)
      Wait(0.5)
      SetNpcAnimation(targetActorId, AnimationType.Walk, 2, EFlipbookPlayTypeLoop, false)
      Wait(1)
      ResetNpcAnimation(targetActorId)
      SetVisibleActorsTag(_tagRotoSword, false)
      WaitStageCameraBlend()
      local moveCameraTime = (math.abs(_workbenchFrontPos.X - _initSwordsmithPos.X) + moveY) / _moveSpeed
      ChangeStageCameraToGlobalPoint(_cameraSwordsmithPos.X, _cameraSwordsmithPos.Y, _cameraSwordsmithPos.Z, CAMERA_BLEND_EASE_IN_OUT, moveCameraTime, 2, _normalCameraDistance, _normalCameraAngle)
      CmdMoveNpcRelative(targetActorId, {
        X = 0,
        Y = moveY,
        Z = 0
      }, _moveSpeed)
      CmdMoveNpc(targetActorId, _initSwordsmithPos, _moveSpeed)
      CmdTurnNpc(targetActorId, NPC_D_LOW)
      WaitStageCameraBlend()
      CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_LAUGH")
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_12")
      local tagItemId = "ITEM_EQUIP_WEAPON_SWORD_OF_KINGS"
      SetTagItemId(tagItemId)
      RequestUnlockAchievementByGetSwordOfKings()
      ItemGetMessageToActor("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_13", "ITEM_ARCHIPELAGO"--[["ITEM_EQUIP_WEAPON_SWORD_OF_KINGS"]], targetActorId)
      -- AP
      AP.Log("Myra_Shop_2F_SUB_0_ACTOR_0120_010 called (Kol - Blacksmith giving the Sword of Kings)")
      AP.CheckLocation("Myra_Shop_2F_SUB_0_ACTOR_0120_010")
      local apItemId = "ITEM_ARCHIPELAGO"
      if apItemId == "ITEM_ARCHIPELAGO" then
        AddItem(apItemId)
      else
        AddItem("ITEM_EQUIP_WEAPON_SWORD_OF_KINGS")
      end
      -- AP end
      RemoveItem("ITEM_IMPORTANT_BROKEN_SWORD")
      RemoveItem("ITEM_IMPORTANT_ORICHALCUM")
      SetFlag(Flag.FE875, true)
      SetFlag(Flag.FE876, true)
      SetFlag(Flag.FE83, true)
      CmdSetNpcAnimation(_sortPartyId[1], AnimationType.Act18, 1, EFlipbookPlayTypeAutoResetIdle, false)
      Wait(0.5)
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_14")
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_15")
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_16")
      CmdSetNpcAnimation(targetActorId, AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, true)
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_17")
      CmdSetNpcAnimation(targetActorId, AnimationType.Act4, 1, EFlipbookPlayTypeAutoResetIdle, false)
      CmdSetNpcAnimation(targetActorId, AnimationType.Act7, 1, EFlipbookPlayTypeStopEnd, true)
      CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_18")
      CmdSetNpcAnimation(targetActorId, AnimationType.Act8, 1, EFlipbookPlayTypeAutoResetIdle, false)
      CmdEventClosingMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_040_19")
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MYRA_TalkBrokenSword, true)
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MYRA_TalkOrichalcum, true)
      --SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MYRA_GetKingSword, true)
      eventCamera = true
      callShopUI = false
    end
    if GetFlag(Flag.FE83) == false then
      if GetFlag(Flag.FE876) == false and GetFlag(Flag.FE877) == true and GetFlag(Flag.FE875) == false and GetFlag(Flag.FE82) == false then
        if GetFlag(Flag.FE856) == true then
          local tagItemId = "ITEM_IMPORTANT_ORICHALCUM"
          local tagItemId2 = "ITEM_IMPORTANT_HAMMER_OF_GAIA"
          SetTagItemId(tagItemId)
          SetTagItemId2(tagItemId2)
          CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_10")
          CmdEventClosingMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_11")
          callShopUI = true
        else
          if GetFlag(Flag.FF0) == false then
            SwordSmithSetEventStart(false, true)
          end
          local tagItemId = "ITEM_IMPORTANT_ORICHALCUM"
          SetTagItemId(tagItemId)
          CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_5")
          CmdTurnNpc(targetActorId, NPC_D_RIGHT)
          Wait(0.5)
          CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_6")
          CmdTurnNpc(targetActorId, NPC_D_LOW)
          Wait(0.5)
          tagItemId = "ITEM_IMPORTANT_ORICHALCUM"
          local tagItemId2 = "ITEM_IMPORTANT_HAMMER_OF_GAIA"
          SetTagItemId(tagItemId)
          SetTagItemId2(tagItemId2)
          CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_7")
          CmdSetNpcAnimation(targetActorId, AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, true)
          CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_8")
          CmdEventClosingMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_9")
          CmdSetNpcAnimation(targetActorId, AnimationType.Act4, 1, EFlipbookPlayTypeAutoResetIdle, true)
          SetFlag(Flag.FE856, true)
          SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MYRA_TalkOrichalcum, true)
          eventCamera = true
          callShopUI = false
        end
      elseif GetFlag(Flag.FE875) == false and GetFlag(Flag.FE82) == true and GetFlag(Flag.FE876) == false and GetFlag(Flag.FE877) == false then
        if GetFlag(Flag.FE855) == true then
          CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_17")
          CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_18")
          CmdEventClosingMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_19")
          callShopUI = true
        else
          if GetFlag(Flag.FF0) == false then
            SwordSmithSetEventStart(false, true)
            CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_12")
          end
          CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_13")
          CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_14")
          CmdTurnNpc(targetActorId, NPC_D_RIGHT)
          Wait(0.5)
          CmdEventClosingMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_15")
          CmdTurnNpc(targetActorId, NPC_D_LOW)
          SetFlag(Flag.FE855, true)
          SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MYRA_TalkBrokenSword, true)
          eventCamera = true
          callShopUI = false
        end
      elseif GetFlag(Flag.FE876) == false and GetFlag(Flag.FE877) == false and GetFlag(Flag.FE875) == false and GetFlag(Flag.FE82) == false then
        if GetFlag(Flag.FF0) == false then
          if GetFlag(Flag.FE746) == false then
            CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_1")
            CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_2")
            CmdEventClosingMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_030_3")
            SetFlag(Flag.FE746, true)
          end
          callShopUI = true
        else
          callShopUI = false
        end
      end
    end
    SetFlag(Flag.FF0, false)
  elseif GetFlag(Flag.FE853) == false then
    SwordSmithSetEventStart(false, true)
    CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_010_1")
    CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_010_2")
    CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_010_3")
    CmdTurnNpc(targetActorId, NPC_D_UP)
    Wait(0.5)
    CmdMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_010_4")
    CmdTurnNpc(targetActorId, NPC_D_LOW)
    Wait(0.5)
    CmdSetNpcAnimation(targetActorId, AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, true)
    CmdEventClosingMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0120_010_5")
    CmdSetNpcAnimation(targetActorId, AnimationType.Act4, 1, EFlipbookPlayTypeAutoResetIdle, true)
    SetFlag(Flag.FE853, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MYRA_TalkGaiaHanmer, true)
    eventCamera = true
    callShopUI = false
  else
    callShopUI = true
  end
  if callShopUI == true then
    if GetFlag(Flag.FE854) == true then
      CmdCallShopUI("SHOP_MYRA_ITEM_0002")
    else
      CmdCallShopUI("SHOP_MYRA_ITEM_0001")
    end
  end
  if eventCamera == true then
    MoveNpc(_sortPartyId[1], _pos1, _moveSpeed)
    MoveNpc(_sortPartyId[2], _pos1, _moveSpeed)
    MoveNpc(_sortPartyId[3], _pos1, _moveSpeed)
    MoveNpc(_sortPartyId[4], _pos1, _moveSpeed)
    WaitMoveNpc(_sortPartyId[1])
    CmdTurnNpc(_sortPartyId[1], NPC_D_UP)
    WaitMoveNpc(_sortPartyId[2])
    CmdTurnNpc(_sortPartyId[2], NPC_D_UP)
    WaitMoveNpc(_sortPartyId[3])
    CmdTurnNpc(_sortPartyId[3], NPC_D_UP)
    WaitMoveNpc(_sortPartyId[4])
    CmdTurnNpc(_sortPartyId[4], NPC_D_UP)
    DestroyPartyClone()
    PartyMemberAlignment(ALIGNMENT_TOGETHER, ALIGNMENT_MOVE_WARP)
    CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
    SetDispMiniMap(true)
    if callShopUI == false then
      RequestAutoSaveFromEvent()
    end
  end
end

function Myra_Shop_2F_SUB_0_ACTOR_0120_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SwordSmithEvent(targetActorId)
  EventEnd(eventInfo, "")
end

function Myra_Shop_2F_SUB_0_ACTOR_0120_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SwordSmithEvent(targetActorId)
  EventEnd(eventInfo, "")
end

function Myra_Shop_2F_SUB_0_ACTOR_0120_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SwordSmithEvent(targetActorId)
  EventEnd(eventInfo, "")
end

function Myra_Shop_2F_SUB_0_ACTOR_0120_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SwordSmithEvent(targetActorId)
  EventEnd(eventInfo, "")
end

function Myra_Shop_2F_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SwordSmithEvent(targetActorId)
  --CmdEventClosingMessage("NPC_Talk_Myra_Shop_2F_SUB_0_ACTOR_0110_010_1")
  EventEnd(eventInfo, "")
end
