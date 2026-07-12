print("Load Script EventScript_H25_HolyShrine_2F")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function HolyShrine2FPriest(targetActorId)
  local itemImportantRainbowDrop = "ITEM_IMPORTANT_RAINBOW_DROP"
  local itemImportantSunStone = "ITEM_IMPORTANT_SUNSTONE"
  local itemEquipWeaponStaffOfRain = "ITEM_EQUIP_WEAPON_STAFF_OF_RAIN"
  local result = GetFlag(Flag.FE81) and GetFlag(Flag.FE85) --[[and GetFlag(Flag.FE87)]] and IsHaveItem(itemEquipWeaponStaffOfRain)
  if result == true then
    RequestPreloadEventScreenShot("EVENTSCREENSHOT_RubissTower002")
    local partyLivingNum = CheckLivingMemberNum()
    local npcPos = GetNpcLocation(targetActorId)
    local cameraPos = {
      X = npcPos.X,
      Y = npcPos.Y,
      Z = npcPos.Z
    }
    local pos1 = {
      X = 1240,
      Y = 1200,
      Z = 125
    }
    local moveSpeed = 300
    SetNicolaApertureRate(100, 0)
    SetDispMiniMap(false)
    SetVisibleCoffin(false)
    SpawnPartyClone(true, true, true, true)
    ChangeStageCameraToGlobalPoint(cameraPos.X, cameraPos.Y, cameraPos.Z, CAMERA_BLEND_EASE_IN_OUT, 2, 2, 2000, {
      Yaw = 0,
      Pitch = -25,
      Roll = 0
    })
    MoveNpc("Party1", {
      X = pos1.X,
      Y = pos1.Y,
      Z = pos1.Z
    }, moveSpeed)
    MoveNpc("Party2", {
      X = pos1.X - 150,
      Y = pos1.Y - 100,
      Z = 0
    }, moveSpeed)
    MoveNpc("Party3", {
      X = pos1.X - 150,
      Y = pos1.Y + 100,
      Z = 0
    }, moveSpeed)
    MoveNpc("Party4", {
      X = pos1.X - 200,
      Y = pos1.Y,
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
    WaitStageCameraBlend()
    HideMessageWindowPageFeedIcon()
    CmdMessage("NPC_Talk_HolyShrine_2F_MAIN_0_ACTOR_0120_030_2")
    CloseMessage()
    Wait(0.5)
    CmdTurnNpc(targetActorId, NPC_D_UP)
    Wait(1)
    SetNpcAnimation(targetActorId, AnimationType.Act7, 1, EFlipbookPlayTypeStopEnd, false)
    ChangeStageCameraToGlobalPoint(cameraPos.X + 490, cameraPos.Y, cameraPos.Z + 150, CAMERA_BLEND_EASE_IN_OUT, 3, 2, 1800, {
      Yaw = 0,
      Pitch = -10,
      Roll = 0
    })
    WaitAnimNpc(targetActorId)
    WaitStageCameraBlend()
    CmdChangeNpcOpacity("Party1", 0, 0, false)
    CmdChangeNpcOpacity("Party2", 0, 0, false)
    CmdChangeNpcOpacity("Party3", 0, 0, false)
    CmdChangeNpcOpacity("Party4", 0, 0, false)
    Wait(1)
    PlaySEEvent("EVESE_HOLYSHRINE_RAINBOW_DROPS")
    local tagCreateRainbow = "CreateRainbow"
    SpawnLoopEffectWorld("Ev_H25_CreateRainbow_01", tagCreateRainbow, {
      X = 1485,
      Y = 1200,
      Z = 475
    }, {
      Yaw = 0,
      Pitch = 5,
      Roll = 0
    }, 1)
    Wait(7.5)
    PlaySEEvent("EVESE_HOLYSHRINE_RAINBOW_MOVE")
    CmdSetNpcAnimation(targetActorId, AnimationType.Act8, 1, EFlipbookPlayTypeAutoResetIdle, false)
    Wait(1.5)
    ChangeStageCameraToGlobalPoint(cameraPos.X, cameraPos.Y, cameraPos.Z, CAMERA_BLEND_EASE_IN_OUT, 2, 2, 2000, {
      Yaw = 0,
      Pitch = -25,
      Roll = 0
    })
    CmdChangeNpcOpacity("Party1", 1, 0, false)
    if 2 <= partyLivingNum then
      CmdChangeNpcOpacity("Party2", 1, 0, false)
    end
    if 3 <= partyLivingNum then
      CmdChangeNpcOpacity("Party3", 1, 0, false)
    end
    if 4 <= partyLivingNum then
      CmdChangeNpcOpacity("Party4", 1, 0, false)
    end
    WaitStageCameraBlend()
    Wait(0.5)
    CmdTurnNpc(targetActorId, NPC_D_LOW)
    Wait(0.5)
    HideMessageWindowPageFeedIcon()
    CmdMessage("NPC_Talk_HolyShrine_2F_MAIN_0_ACTOR_0120_030_3")
    CloseMessage()
    CmdMoveNpcRelative("Party1", {
      X = 100,
      Y = 0,
      Z = 0
    }, moveSpeed)
    local effectFadeTime = 1.5
    EraseLoopEffectByParamEnd(tagCreateRainbow, effectFadeTime)
    Wait(effectFadeTime)
    SetTagItemId(itemImportantRainbowDrop)
    ItemGetMessageToActor("NPC_Talk_HolyShrine_2F_MAIN_0_ACTOR_0120_030_4", "ITEM_ARCHIPELAGO"--[[itemImportantRainbowDrop]], targetActorId) -- AP
    -- AP
    AP.Log("HolyShrine_2F_MAIN_0_ACTOR_0120_010 called (Sanctum - Priest giving the Rainbow Drop)")
    AP.CheckLocation("HolyShrine_2F_MAIN_0_ACTOR_0120_010")
    local ItemId = "ITEM_ARCHIPELAGO"
    if ItemId == "ITEM_ARCHIPELAGO" then
      AddItem(ItemId)
    else
      AddItem(itemImportantRainbowDrop)
      SetFlag(Flag.FE88, true)
    end
    -- AP end
    Wait(0.5)
    CmdMoveNpcRelativeDetail("Party1", {
      X = -100,
      Y = 0,
      Z = 0
    }, moveSpeed, NPC_D_UP, AnimationType.Walk, 1, EFlipbookPlayTypeAutoResetIdle)
    CmdSetNpcAnimation(targetActorId, AnimationType.Act6, 1, EFlipbookPlayTypeLoop, true)
    CmdMessage("NPC_Talk_HolyShrine_2F_MAIN_0_ACTOR_0120_030_5")
    ResetNpcAnimation(targetActorId)
    HideMessageWindowPageFeedIcon()
    CmdMessage("NPC_Talk_HolyShrine_2F_MAIN_0_ACTOR_0120_030_6")
    CloseMessage()
    CmdShowEventScreenShotUIDefaultParam("EVENTSCREENSHOT_RubissTower002")
    HideMessageWindowPageFeedIcon()
    CmdMessage("NPC_Talk_HolyShrine_2F_MAIN_0_ACTOR_0120_030_7")
    ChangeSpeaker()
    CmdCloseEventScreenShotUIDefaultParam()
    CmdEventClosingMessage("NPC_Talk_HolyShrine_2F_MAIN_0_ACTOR_0120_030_8")
    SetPlayerLocation(pos1)
    Wait(0.1)
    TurnParty(1, 0)
    Wait(0.1)
    DestroyPartyClone()
    PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WALK)
    CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
    SetDispMiniMap(true)
    SetVisibleCoffin(true)
    -- AP
    if ItemId == "ITEM_ARCHIPELAGO" then
    else
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_HOLYSHRINE_GetRainbowDrop, true)
    end
    -- AP end
    RequestAutoSaveFromEvent()
  else
    CmdTurnNpc(targetActorId, NPC_D_TO_PLAYER)
    if GetFlag(Flag.FE857) == true then
      CmdEventClosingMessage("NPC_Talk_HolyShrine_2F_MAIN_0_ACTOR_0120_020_1")
    else
      CmdMessage("NPC_Talk_HolyShrine_2F_MAIN_0_ACTOR_0120_010_1")
      CmdMessage("NPC_Talk_HolyShrine_2F_MAIN_0_ACTOR_0120_010_2")
      CmdEventClosingMessage("NPC_Talk_HolyShrine_2F_MAIN_0_ACTOR_0120_010_3")
      SetFlag(Flag.FE857, true)
    end
  end
end

function HolyShrine_2F_MAIN_0_ACTOR_0120_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  HolyShrine2FPriest(targetActorId)
  EventEnd(eventInfo, "")
end

function HolyShrine_2F_MAIN_0_ACTOR_0120_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  HolyShrine2FPriest(targetActorId)
  EventEnd(eventInfo, "")
end

function HolyShrine_2F_MAIN_0_ACTOR_0120_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  HolyShrine2FPriest(targetActorId)
  EventEnd(eventInfo, "")
end

function HolyShrine_2F_MAIN_0_ACTOR_0120_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  HolyShrine2FPriest(targetActorId)
  EventEnd(eventInfo, "")
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_HolyShrine_2F_MAIN_0_ACTOR_0120_040_1")
  EventEnd(eventInfo, "")
  ]]
end

function HolyShrine_2F_MAIN_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  HolyShrine2FPriest(targetActorId)
  EventEnd(eventInfo, "")
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local result = CheckHero()
  if result == 1 then
    CmdEventClosingMessage("NPC_Talk_HolyShrine_2F_MAIN_0_ACTOR_0110_010_1")
  else
    CmdMessage("NPC_Talk_HolyShrine_2F_MAIN_0_ACTOR_0110_010_3")
    CmdEventClosingMessage("NPC_Talk_HolyShrine_2F_MAIN_0_ACTOR_0110_010_4")
  end
  EventEnd(eventInfo, "")
  ]]
end

function HolyShrine_2F_SUB_0_MBR_SCOUT_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local volumeTag = (...)
  if volumeTag == "SuccessCollision" then
  elseif volumeTag == "FailCollision" then
  elseif volumeTag == nil then
  end
  local TextTable = {
    Success1 = "NPC_Talk_HolyShrine_2F_SUB_0_VOLUME_0210_010_1",
    Success2 = "NPC_Talk_HolyShrine_2F_SUB_0_VOLUME_0210_010_2",
    Success3 = "NPC_Talk_HolyShrine_2F_SUB_0_VOLUME_0210_010_3"
  }
  local MonsterScoutId = "MBR_SCOUT_SHESLIME_H25_HolyShrine_2F"
  local ActorId = "HolyShrine_2F_SHESLIME_00_L3"
  local MonsterLocation = GetNpcLocation(ActorId)
  local PlayerLocation = {
    X = MonsterLocation.X - 450,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z
  }
  local PlayerLook = {Chara = 1, Turn = 0}
  local CameraParam = {
    X = MonsterLocation.X - 150,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z + 40,
    Distance = 1800
  }
  local CameraSets = False
  MonsterScoutScriptCamera(MonsterScoutId, TextTable, ActorId, PlayerLocation, CameraParam, PlayerLook, volumeTag, MonsterLocation, CameraSets)
  EventEnd(eventInfo, "")
end
