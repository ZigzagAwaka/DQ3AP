print("Load Script Nicola_EventLibrary")

local AP = require("Src/DQ3AP") -- AP

function EventStart(Table, IsLookAtPlayer)
  local eventId = Table[1]
  local targetActorId = Table[2]
  local eventGopId = Table[3]
  local npcTypeId = Table[4]
  local isLookAtTargetForPlayer = string.lower(Table[5]) == "true"
  local collisionTag = Table[6]
  local doChangeEventCamera = IsStageCameraNow() == false
  local didWaitBeforeChangingCamera = false
  if doChangeEventCamera then
    StartChangeTraceCameraLagSpeedRate(2)
  end
  StartRecordRecollection()
  MapTimeNotifyStartEventProcessing()
  ForceCloseTownNameUI()
  SetActionInputMode(INPUT_MODE_GAME_EVENT, true)
  HiddenGuideIcon()
  if targetActorId ~= nil then
    StopNpcAutoMove(targetActorId)
    if IsLookAtPlayer == true then
      print("NPC\227\130\146\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\171\229\144\145\227\129\139\227\129\155\227\130\139")
      CmdTurnNpc(targetActorId, NPC_D_TO_PLAYER)
      didWaitBeforeChangingCamera = true
    end
    if isLookAtTargetForPlayer == true then
      TurnPlayerToTarget(targetActorId)
    end
  end
  if doChangeEventCamera == true then
    if didWaitBeforeChangingCamera == false then
      WaitOneFrame()
    end
    WaitTraceCameraLag()
    EndChangeTraceCameraLagSpeedRate()
    local blendFunc = CAMERA_BLEND_EASE_OUT
    local blendTime = 0
    local blendExp = 2
    local cameraCopyTypeBasic = ENicolaStageCameraParamCopyTypeCurrentTrace
    local cameraCopyTypeLens = ENicolaStageCameraParamCopyTypeCurrentTrace
    ChangeCameraTraceToStage(blendFunc, blendTime, blendExp, cameraCopyTypeBasic, cameraCopyTypeLens)
    WaitStageCameraBlend()
  end
  EnableCameraLag(true)
  if npcTypeId ~= nil then
    SetDefaultPopopoSE(npcTypeId)
    SetDefaultNpcName(npcTypeId)
  end
  SetEnableEventFastForwardControl(true)
  return {
    targetActorId,
    npcTypeId,
    eventGopId,
    eventId,
    collisionTag
  }
end

function GetTargetActorIdFromEventInfo(EventInfo)
  return EventInfo[1]
end

function GetEventIdFromEventInfo(EventInfo)
  return EventInfo[4]
end

function GetCollisionTagFromEventInfo(EventInfo)
  return EventInfo[5]
end

function EventEnd(EventInfo, NextEventId, NpcTurnInit, IsNoCloseMessage)
  print("\227\130\164\227\131\153\227\131\179\227\131\136\231\181\130\228\186\134\229\135\166\231\144\134\233\150\139\229\167\139")
  local targetActorId = EventInfo[1]
  local npcTypeId = EventInfo[2]
  local eventGopId = EventInfo[3]
  local eventId = EventInfo[4]
  SetEnableEventFastForwardControl(false)
  EndRecordRecollection()
  if NpcTurnInit == false then
  else
    CmdTurnNpc(targetActorId, NPC_D_INITIAL_ROT)
  end
  EndNpcControl("")
  if IsNoCloseMessage == nil or IsNoCloseMessage == false then
    CloseMessage()
  end
  FinishEvent(eventGopId)
  local isPlayNextEvent = false
  if NextEventId ~= "" then
    isPlayNextEvent = CallNextEvent(NextEventId)
  else
    isPlayNextEvent = CallNextEvent(eventId)
  end
  if npcTypeId ~= nil then
    SetDefaultPopopoSE("")
    SetDefaultNpcName("")
  end
  if isPlayNextEvent == false then
    print("\233\128\163\231\182\154\227\129\151\227\129\166\227\130\164\227\131\153\227\131\179\227\131\136\227\129\175\229\139\149\227\129\139\227\129\170\227\129\132!")
    UpdateMapGuide()
    UpdateGuideIcon()
    MapTimeNotifyEndEventProcessing()
    EnableCameraLag(false)
    if IsStageCameraNow() == true then
      local blendFunc = CAMERA_BLEND_EASE_OUT
      local blendTime = 0
      local blendExp = 2
      ChangeTraceCamera(blendFunc, blendTime, blendExp)
      WaitStageCameraBlend()
    end
    SetNicolaApertureRate(1)
    EndSettingPostProcessVignette(0)
    SetNicolaEnableDOF(true)
    SetNicolaFocusSpeed(ENicolaCameraParamTypeStageMain, 0)
    SetNicolaFocusSpeed(ENicolaCameraParamTypeStageSub, 0)
    SetNicolaFocusSpeedEaseValue(ENicolaCameraParamTypeStageMain, 0)
    SetNicolaFocusSpeedEaseValue(ENicolaCameraParamTypeStageSub, 0)
    ClearNicolaFocusActor(ENicolaCameraParamTypeStageMain)
    ClearNicolaFocusActor(ENicolaCameraParamTypeStageSub)
  end
  OnPreEndPlayEvent(isPlayNextEvent)
  WaitFrame(1)
  SetActionInputMode(INPUT_MODE_GAME_EVENT, false)
  OnLastEndPlayEvent(isPlayNextEvent)
  print("\227\130\164\227\131\153\227\131\179\227\131\136\231\181\130\228\186\134\229\135\166\231\144\134\231\181\130\228\186\134")
end

function EventStartOneFrameVolume(Table)
  local eventId = Table[1]
  local targetActorId = Table[2]
  local eventGopId = Table[3]
  local npcTypeId = Table[4]
  local collisionTag = Table[6]
  return {
    targetActorId,
    npcTypeId,
    eventGopId,
    eventId,
    collisionTag
  }
end

function EventEndOneFrameVolume(EventInfo)
  local targetActorId = EventInfo[1]
  local npcTypeId = EventInfo[2]
  local eventGopId = EventInfo[3]
  local eventId = EventInfo[4]
end

function CallEventEndEventByOneFrameVolume(EventInfo)
  CallNextEvent(GetEventIdFromEventInfo(EventInfo))
end

function DisableEventFastForwardUI()
  SetEnableEventFastForwardControl(false)
end

function CmdMoveNpc(TargetActorId, Location, Speed)
  MoveNpc(TargetActorId, Location, Speed)
  _retry(SYS_WaitMoveNpc, TargetActorId)
end

function CmdMoveNpcDetail(TargetActorId, Location, Speed, DirectionType, AnimationType, Rate, PlayType)
  MoveNpcDetail(TargetActorId, Location, Speed, DirectionType, AnimationType, Rate, PlayType)
  _retry(SYS_WaitMoveNpc, TargetActorId)
end

function CmdMoveNpcRelative(TargetActorId, RelativeLocation, Speed)
  MoveNpcRelative(TargetActorId, RelativeLocation, Speed)
  _retry(SYS_WaitMoveNpc, TargetActorId)
end

function CmdMoveNpcRelativeDetail(TargetActorId, RelativeLocation, Speed, DirectionType, AnimationType, Rate, PlayType)
  MoveNpcRelativeDetail(TargetActorId, RelativeLocation, Speed, DirectionType, AnimationType, Rate, PlayType)
  _retry(SYS_WaitMoveNpc, TargetActorId)
end

function WaitMoveNpc(TargetActorId)
  _retry(SYS_WaitMoveNpc, TargetActorId)
end

function CmdTurnNpc(TargetActorId, DirectionType)
  TurnNpc(TargetActorId, DirectionType)
  _retry(SYS_WaitTurnNpc, TargetActorId)
end

function CmdTurnNpcFromRotation(TargetActorId, Rotation)
  TurnNpcFromRotation(TargetActorId, Rotation)
  _retry(SYS_WaitTurnNpc, TargetActorId)
end

function CmdTurnNpcRelative(TargetActorId, RelativeAngleYaw)
  TurnNpcRelative(TargetActorId, RelativeAngleYaw)
  _retry(SYS_WaitTurnNpc, TargetActorId)
end

function WaitTurnNpc(TargetActorId)
  _retry(SYS_WaitTurnNpc, TargetActorId)
end

function CmdJumpNpc(TargetActorId, JumpHeight, JumpSeconds)
  JumpNpc(TargetActorId, JumpHeight, JumpSeconds, false)
  _retry(SYS_WaitJumpNpc, TargetActorId)
end

function WaitJumpNpc(TargetActorId)
  _retry(SYS_WaitJumpNpc, TargetActorId)
end

function CmdMovePhysicsJumpNpc(TargetActorId, RelativeLocation, Speed, JumpZVelocity, AnimationType)
  MovePhysicsJumpNpc(TargetActorId, RelativeLocation, Speed, JumpZVelocity, AnimationType)
  _retry(SYS_WaitMovePhysicsJumpNpc, TargetActorId)
end

function WaitMoveJumpNpcPhysics(TargetActorId)
  _retry(SYS_WaitMoveJumpNpc, TargetActorId)
end

function WaitCommandNpc(TargetActorId)
  _retry(SYS_WaitCommandNpc, TargetActorId)
end

function WaitAnimNpc(TargetActorId)
  _retry(SYS_WaitNpcAnimation, TargetActorId)
end

function CmdSetNpcAnimation(TargetActorId, AnimType, AnimRate, PlayType, IsOverride)
  SetNpcAnimation(TargetActorId, AnimType, AnimRate, PlayType, IsOverride)
  _retry(SYS_WaitNpcAnimation, TargetActorId)
end

function CmdChangeNpcOpacity(TargetActorId, NewOpacity, DurationSec, UseDissolve)
  ChangeNpcOpacity(TargetActorId, NewOpacity, DurationSec, UseDissolve)
  _retry(SYS_WaitChangeNpcOpacity, TargetActorId)
end

function CmdChangeNpcOpacityEmissive(TargetActorId, NewOpacity, DurationSec)
  ChangeNpcOpacityEmissive(TargetActorId, NewOpacity, DurationSec)
  _retry(SYS_WaitChangeNpcOpacity, TargetActorId)
end

function WaitChangeNpcOpacity(TargetActorId)
  _retry(SYS_WaitChangeNpcOpacity, TargetActorId)
end

function CmdChangeNpcOpacityByOrtega(TargetActorId, DurationSec)
  local isStartParamZero = true
  ChangeNpcEventMaterialParam(TargetActorId, ECharacterMaterialTypeOrtega, isStartParamZero, DurationSec)
  ChangeNpcOpacity(TargetActorId, 0, DurationSec, false)
  _retry(SYS_WaitChangeNpcOpacity, TargetActorId)
end

function CmdChangeNpcEventMaterialByDragonQueen(TargetActorId, DurationSec)
  local isFixedParamZero = true
  ChangeNpcEventMaterialFixedParam(TargetActorId, ECharacterMaterialTypeDragonQueen, isFixedParamZero, DurationSec)
  _retry(SYS_WaitChangeNpcOpacity, TargetActorId)
end

function CmdMovePlayer(Location, Speed)
  MovePlayer(Location, Speed)
  _retry(SYS_WaitMovePlayer)
end

function CmdMovePlayerRelative(Location, Speed)
  MovePlayerRelative(Location, Speed)
  _retry(SYS_WaitMovePlayer)
end

function WaitMovePlayer()
  _retry(SYS_WaitMovePlayer)
end

function CmdMoveParty(Location)
  MoveParty(Location)
  _retry(SYS_WaitMoveParty)
end

function CmdMovePartyRelative(Location)
  MovePartyRelative(Location)
  _retry(SYS_WaitMoveParty)
end

function WaitMoveParty()
  _retry(SYS_WaitMoveParty)
end

function Audience(pos_x, pos_y, pos_z, disableAll)
  local HeroNumber = CheckHero()
  local Disable = false
  if disableAll == true then
    Disable = true
  end
  if Disable == true then
    SpawnPartyCloneDisableAll(true, true, true, true)
  else
    SpawnPartyCloneDisableSkill(true, true, true, true)
  end
  if CheckHeroLiving() == true then
    if HeroNumber == 1 then
      MoveNpc("Party1", {
        X = pos_x,
        Y = pos_y,
        Z = pos_z
      }, 400)
      MoveNpc("Party2", {
        X = pos_x - 200,
        Y = pos_y - 200,
        Z = pos_z
      }, 400)
      MoveNpc("Party3", {
        X = pos_x - 300,
        Y = pos_y - 100,
        Z = pos_z
      }, 400)
      MoveNpc("Party4", {
        X = pos_x - 200,
        Y = pos_y + 100,
        Z = pos_z
      }, 400)
    elseif HeroNumber == 2 then
      MoveNpc("Party2", {
        X = pos_x,
        Y = pos_y,
        Z = pos_z
      }, 400)
      MoveNpc("Party1", {
        X = pos_x - 300,
        Y = pos_y - 100,
        Z = pos_z
      }, 400)
      MoveNpc("Party3", {
        X = pos_x - 200,
        Y = pos_y - 200,
        Z = pos_z
      }, 400)
      MoveNpc("Party4", {
        X = pos_x - 200,
        Y = pos_y + 100,
        Z = pos_z
      }, 400)
    elseif HeroNumber == 3 then
      MoveNpc("Party3", {
        X = pos_x,
        Y = pos_y,
        Z = pos_z
      }, 400)
      MoveNpc("Party1", {
        X = pos_x - 300,
        Y = pos_y - 100,
        Z = pos_z
      }, 400)
      MoveNpc("Party2", {
        X = pos_x - 200,
        Y = pos_y - 200,
        Z = pos_z
      }, 400)
      MoveNpc("Party4", {
        X = pos_x - 200,
        Y = pos_y + 100,
        Z = pos_z
      }, 400)
    elseif HeroNumber == 4 then
      MoveNpc("Party4", {
        X = pos_x,
        Y = pos_y,
        Z = pos_z
      }, 400)
      MoveNpc("Party1", {
        X = pos_x - 300,
        Y = pos_y - 100,
        Z = pos_z
      }, 400)
      MoveNpc("Party2", {
        X = pos_x - 200,
        Y = pos_y - 200,
        Z = pos_z
      }, 400)
      MoveNpc("Party3", {
        X = pos_x - 200,
        Y = pos_y + 100,
        Z = pos_z
      }, 400)
    end
  else
    MoveNpc("Party1", {
      X = pos_x,
      Y = pos_y,
      Z = pos_z
    }, 400)
    MoveNpc("Party2", {
      X = pos_x - 200,
      Y = pos_y - 200,
      Z = pos_z
    }, 400)
    MoveNpc("Party3", {
      X = pos_x - 300,
      Y = pos_y - 100,
      Z = pos_z
    }, 400)
    MoveNpc("Party4", {
      X = pos_x - 200,
      Y = pos_y + 100,
      Z = pos_z
    }, 400)
  end
  WaitMoveNpc("Party1")
  TurnNpc("Party1", NPC_D_UP)
  WaitMoveNpc("Party2")
  TurnNpc("Party2", NPC_D_UP)
  WaitMoveNpc("Party3")
  TurnNpc("Party3", NPC_D_UP)
  WaitMoveNpc("Party4")
  TurnNpc("Party4", NPC_D_UP)
end

function AudienceFinish(pos_x, pos_y, pos_z, offset)
  DestroyPartyClone()
  if offset == 0 then
    PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WALK)
  else
    SetActorRotation("PLAYER", {
      Yaw = 180,
      Pitch = 0,
      Roll = 0
    })
    PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_DASH)
    CmdMovePartyRelative({
      X = 0 - offset,
      Y = 0,
      Z = 0
    })
  end
end

function ReturnPartyPosition(partyName, partyIndex, moveSpeed)
  local loc = GetPartyMemberLocation(partyIndex)
  local rot = GetPartyMemberRotation(partyIndex)
  MoveNpc(partyName, loc, moveSpeed)
  TurnNpcFromRotation(partyName, rot)
end

function CmdReturnPartyAlignment(location, rotation, moveSpeed, alignmentType, party1, party2, party3, party4)
  SetPlayerLocation(location)
  SetActorRotation("PLAYER", rotation)
  PartyMemberAlignment(alignmentType, ALIGNMENT_MOVE_WARP)
  WaitFrame(1)
  ReturnPartyPosition(party1, 1, moveSpeed)
  ReturnPartyPosition(party2, 2, moveSpeed)
  ReturnPartyPosition(party3, 3, moveSpeed)
  ReturnPartyPosition(party4, 4, moveSpeed)
  WaitCommandNpc(party1)
  WaitCommandNpc(party2)
  WaitCommandNpc(party3)
  WaitCommandNpc(party4)
  DestroyPartyMemberClone(party1)
  DestroyPartyMemberClone(party2)
  DestroyPartyMemberClone(party3)
  DestroyPartyMemberClone(party4)
end

function CmdMoveUpOrDownInterpolateNpc(TriggerActorId, IsMoveUp, Height, Sec, EaseFuncType, EaseExp)
  MoveUpOrDownInterpolateNpc(TriggerActorId, IsMoveUp, Height, Sec, EaseFuncType, EaseExp)
  _retry(SYS_WaitMoveUpOrDownInterpolateNpc, TriggerActorId)
end

function WaitMoveUpOrDownInterpolateNpc(TriggerActorId)
  _retry(SYS_WaitMoveUpOrDownInterpolateNpc, TriggerActorId)
end

function SpawnPartyCloneEnableAll(pc1, pc2, pc3, pc4)
  SpawnPartyClone(pc1, pc2, pc3, pc4, ECloneUnitLooksTypeDefault)
end

function SpawnPartyCloneDisableSkill(pc1, pc2, pc3, pc4)
  local mask = ECloneUnitLooksTypeDisableSkill + ECloneUnitLooksTypeDisableCoffin
  SpawnPartyClone(pc1, pc2, pc3, pc4, mask)
end

function SpawnPartyCloneDisableAll(pc1, pc2, pc3, pc4)
  SpawnPartyClone(pc1, pc2, pc3, pc4, ECloneUnitLooksTypeDisableAll)
end

function CmdRequestPlayJingle(JingleGopIDSoundBgm, BgmPlayerManagerMEPlayRequestType, CurrentBgmFadeOutSec, BgmPlayerManagerLineTypeOnMEEnd, NextBgmFadeInSec, NextGopIDSoundBgm)
  RequestPlayJingle(JingleGopIDSoundBgm, BgmPlayerManagerMEPlayRequestType, CurrentBgmFadeOutSec, BgmPlayerManagerLineTypeOnMEEnd, NextBgmFadeInSec, NextGopIDSoundBgm)
  _retry(SYS_WaitPlayJingle)
end

function CmdRequestPlayJingleTemporary(JingleGopIDSoundBgm, CurrentBgmFadeOutSec, NextBgmFadeInSec)
  RequestPlayJingleTemporary(JingleGopIDSoundBgm, CurrentBgmFadeOutSec, NextBgmFadeInSec)
  _retry(SYS_WaitPlayJingle)
end

function CmdRequestPlayJingleTemporaryDefaultFade(JingleGopIDSoundBgm)
  RequestPlayJingleTemporaryDefaultFade(JingleGopIDSoundBgm)
  _retry(SYS_WaitPlayJingle)
end

function CmdPlayJingleInn(CurrentBgmFadeOutSec, NextBgmFadeInSec)
  RequestPlayJingleTemporaryInn(CurrentBgmFadeOutSec, NextBgmFadeInSec)
  _retry(SYS_WaitPlayJingle)
end

function WaitPlayJingle()
  _retry(SYS_WaitPlayJingle)
end

function WaitPlaySound(PlaybackID)
  _retry(WaitFinishSound, PlaybackID)
end

function CmdMessage(MessageId)
  ShowMessage(MessageId)
  _retry(SYS_WaitShowMessage)
end

function CmdMessageDetail(MessageId, WindowType, PositionType)
  ShowMessageDetail(MessageId, WindowType, PositionType)
  _retry(SYS_WaitShowMessage)
end

function EventClosingMessage(MessageId)
  HideMessageWindowPageFeedIcon()
  ShowMessage(MessageId)
end

function CmdEventClosingMessage(MessageId)
  HideMessageWindowPageFeedIcon()
  CmdMessage(MessageId)
  CloseMessage()
end

function EventClosingMessageDetail(MessageId, WindowType, PositionType)
  HideMessageWindowPageFeedIcon()
  ShowMessageDetail(MessageId, WindowType, PositionType)
end

function CmdEventClosingMessageDetail(MessageId, WindowType, PositionType)
  HideMessageWindowPageFeedIcon()
  CmdMessageDetail(MessageId, WindowType, PositionType)
  CloseMessage()
end

function CmdChoiceMessage(MessageId)
  ShowChoiceMessage(MessageId)
  _retry(SYS_WaitShowMessage)
  DisableEventFastForwardGrayOut()
  return IsChoiceResult()
end

function CmdChoiceMessageDetail(MessageId, WindowType, PositionType)
  ShowChoiceMessageDetail(MessageId, WindowType, PositionType, "", "")
  _retry(SYS_WaitShowMessage)
  DisableEventFastForwardGrayOut()
  return IsChoiceResult()
end

function CmdChoiceMessageSetChoiceText(MessageId, YesTextId, NoTextId, CanChoiceMessageCancel)
  ShowChoiceMessageDetail(MessageId, MESSAGE_WINDOW_DEFAULT, MESSAGE_POSITION_BOTTOM, YesTextId, NoTextId, CanChoiceMessageCancel)
  _retry(SYS_WaitShowMessage)
  DisableEventFastForwardGrayOut()
  return IsChoiceResult()
end

function CmdMultiChoiceMessage(MessageId, ...)
  ShowMultiChoiceMessage(MessageId, ...)
  _retry(SYS_WaitShowMessage)
  DisableEventFastForwardGrayOut()
  return GetMultiChoiceResult()
end

function WaitShowMessage()
  _retry(SYS_WaitShowMessage)
end

function CmdCallShopUI(ShopId)
  --[[
  AP.Log("Shop: " .. ShopId)
  local original = GetHaveItemNum("ITEM_EQUIP_WEAPON_COPPER_SWORD")
  AP.Log("qo " .. original)
  ]]
  CallShopUI(ShopId)
  _retry(SYS_WaitShopUI)
  --[[
  if GetHaveItemNum("ITEM_EQUIP_WEAPON_COPPER_SWORD") > original then
    AP.Log("ITEM_EQUIP_WEAPON_COPPER_SWORD bought from shop " .. ShopId)
    RemoveItem("ITEM_EQUIP_WEAPON_COPPER_SWORD")
    AddItem("ITEM_ARCHIPELAGO")
    AP.Log("qb " .. GetHaveItemNum("ITEM_EQUIP_WEAPON_COPPER_SWORD"))
  end
  AP.Log("Shop end")
  ]]
end

function WaitShopUI()
  _retry(SYS_WaitShopUI)
end

function CmdCallInnUI(InnId)
  ICS_CallInnUI(InnId, -1)
end

function WaitInnUI()
  _retry(SYS_WaitInnUI)
end

function CmdCallChurchUI(ChurchId)
  CallChurchUI(ChurchId, -1)
  _retry(SYS_WaitChurchUI)
  AP.GiveItemsIfAvailable() -- AP
end

function StartChurchRestartGame()
  CallChurchUIRestart(CHURCH_MODE_GAME_START)
  _retry(SYS_WaitChurchUI)
  AP.GiveItemsIfAvailable() -- AP
end

function WaitChurchUI()
  _retry(SYS_WaitChurchUI)
end

function CmdCallBankUI()
  CallBankUI()
  _retry(SYS_WaitBankUI)
end

function WaitBankUI()
  _retry(SYS_WaitBankUI)
end

function CmdCallBarUI()
  CallBarUI()
  _retry(SYS_WaitBarUI)
end

function WaitBarUI()
  _retry(SYS_WaitBarUI)
end

function CmdCallMemberCreateUI()
  CallMemberCreateUI()
  _retry(SYS_WaitMemberCreateUI)
end

function WaitMemberCreateUI()
  _retry(SYS_WaitMemberCreateUI)
end

function CmdCallMedalTradeUI(TargetActorId)
  CallMedalTradeUI(TargetActorId)
  _retry(SYS_WaitMedalTradeUI)
end

function WaitMedalTradeUI()
  _retry(SYS_WaitMedalTradeUI)
end

function CmdCallMedalRewardUI()
  CallMedalRewardUI()
  _retry(SYS_WaitMedalRewardUI)
end

function WaitMedalRewardUI()
  _retry(SYS_WaitMedalRewardUI)
end

function CmdCallTutorialUI(InformationId)
  CallTutorialUI(InformationId)
  _retry(SYS_WaitTutorialUI)
end

function WaitTutorialUI()
  _retry(SYS_WaitTutorialUI)
end

function CmdCallRenameUI()
  CallRenameUI()
  _retry(SYS_WaitRenameUI)
end

function CmdCallJobChangeUI()
  CallJobChangeUI()
  _retry(SYS_WaitJobChangeUI)
end

function WaitJobChangeUI()
  _retry(SYS_WaitJobChangeUI)
end

function CmdCallVisualChangeUI()
  CallVisualChangeUI()
  _retry(SYS_WaitVisualChangeUI)
end

function WaitVisualChangeUI()
  _retry(SYS_WaitVisualChangeUI)
end

function CmdCallBattleRoadInfoUI()
  CallBattleRoadInfoUI()
  _retry(SYS_WaitBattleRoadInfoUI)
end

function WaitBattleRoadInfoUI()
  _retry(SYS_WaitBattleRoadInfoUI)
end

function CmdCallBattleRoadZooUI()
  CallBattleRoadZooUI()
  _retry(SYS_WaitBattleRoadZooUI)
end

function WaitBattleRoadZooUI()
  _retry(SYS_WaitBattleRoadZooUI)
end

function CmdCallBattleRoadEntryUI(BattleRoadEntryId)
  CallBattleRoadEntryUI(BattleRoadEntryId)
  _retry(SYS_WaitBattleRoadEntryUI)
end

function CmdCallBattleRoadEntryUIForResult()
  CallBattleRoadEntryUIForResult()
  _retry(SYS_WaitBattleRoadEntryUI)
end

function WaitBattleRoadEntryUI()
  _retry(SYS_WaitBattleRoadEntryUI)
end

function CmdCallMBRScoutSuccessUI(BattleRoadScoutId)
  CallMBRScoutSuccessUI(BattleRoadScoutId)
  _retry(SYS_WaitMBRScoutSuccessUI)
end

function WaitMBRScoutSuccessUI()
  _retry(SYS_WaitMBRScoutSuccessUI)
end

function CmdCallXenlonWishUI()
  CallXenlonWishUI()
  _retry(SYS_WaitXenlonWishUI)
end

function CmdCallBirthMonthKeyboardUI()
  CallBirthMonthKeyboardUI()
  _retry(SYS_WaitBirthMonthKeyboardUI)
end

function CmdCallBirthDayKeyboardUI()
  CallBirthDayKeyboardUI()
  _retry(SYS_WaitBirthDayKeyboardUI)
end

function CmdCallNameKeyboardUI()
  CallNameKeyboardUI()
  _retry(SYS_WaitNameKeyboardUI)
end

function ItemGetMessage(MessageId, ItemId, NoJingle, NoIcon)
  if ItemId == nil then
  else
    SetTagItemId(ItemId)
  end
  local PlayJingle = true
  if NoJingle == true then
    PlayJingle = false
  end
  local HideIcon = false
  if NoIcon == true then
    HideIcon = true
  end
  if PlayJingle == true then
    CloseMessage()
    Wait(0.4)
    RequestPlayJingleTemporaryDefaultFade("BGM_JINGLE_007", 0, 0)
    HideMessageWindowPageFeedIcon()
    ShowMessage(MessageId)
    _retry(SYS_WaitShowMessage)
    WaitPlayJingle()
    CloseMessage()
  else
    if HideIcon == true then
      HideMessageWindowPageFeedIcon()
    end
    ShowMessage(MessageId)
    _retry(SYS_WaitShowMessage)
  end
end

function ItemGetMessageToActor(MessageId, ItemId, TargetId, PauseBGM, NoIcon, IsRenderPrePass)
  if ItemId == nil then
  else
    SetTagItemId(ItemId)
    CmdLoadItemIcon(ItemId)
  end
  local Pause = false
  if PauseBGM == true then
    Pause = true
  end
  local HideIcon = false
  if NoIcon == true then
    HideIcon = true
  end
  CloseMessage()
  Wait(0.4)
  if Pause == true then
    if HideIcon == true then
      HideMessageWindowPageFeedIcon()
    end
    ShowMessage(MessageId)
    RequestPlayJingle("BGM_JINGLE_007", EBgmPlayerManagerMEPlayRequestTypePAUSE, 0, EBgmPlayerManagerLineTypeOnMEEndCURRENT, 0, "")
    PlayItemGetToActor(TargetId, {
      X = 0,
      Y = 0,
      Z = 0
    }, ItemId, IsRenderPrePass)
    WaitPlayJingle()
    _retry(SYS_WaitPlayItemGet)
    _retry(SYS_WaitShowMessage)
  else
    HideMessageWindowPageFeedIcon()
    ShowMessage(MessageId)
    PlayJingleOnGetItemRareDefaultFade()
    PlayItemGetToActor(TargetId, {
      X = 0,
      Y = 0,
      Z = 0
    }, ItemId, IsRenderPrePass)
    WaitPlayJingle()
    _retry(SYS_WaitPlayItemGet)
    _retry(SYS_WaitShowMessage)
    CloseMessage()
  end
end

function ItemsGetMessageToActor(TargetId, MessageId, GetItemIdIndex, ...)
  if select(1, ...) ~= nil then
    SetTagItemId(select(1, ...))
  end
  if select(2, ...) ~= nil then
    SetTagItemId2(select(2, ...))
  end
  if select(3, ...) ~= nil then
    SetTagItemId3(select(3, ...))
  end
  CmdLoadItemIcon(select(GetItemIdIndex, ...))
  CloseMessage()
  Wait(0.4)
  HideMessageWindowPageFeedIcon()
  ShowMessage(MessageId)
  PlayJingleOnGetItemRareDefaultFade()
  PlayItemGetToActor(TargetId, {
    X = 0,
    Y = 0,
    Z = 0
  }, select(GetItemIdIndex, ...))
  _retry(SYS_WaitShowMessage)
  _retry(SYS_WaitPlayItemGet)
  WaitPlayJingle()
  CloseMessage()
end

function ItemGetMessageToLocation(MessageId, ItemId, Location, NoIcon)
  if ItemId == nil then
  else
    SetTagItemId(ItemId)
    CmdLoadItemIcon(ItemId)
  end
  local Pause = false
  if PauseBGM == true then
    Pause = true
  end
  local HideIcon = false
  if NoIcon == true then
    HideIcon = true
  end
  CloseMessage()
  Wait(0.4)
  if Pause == true then
    if HideIcon == true then
      HideMessageWindowPageFeedIcon()
    end
    ShowMessage(MessageId)
    RequestPlayJingle("BGM_JINGLE_007", EBgmPlayerManagerMEPlayRequestTypePAUSE, 0, EBgmPlayerManagerLineTypeOnMEEndCURRENT, 0, "")
    PlayItemGetToLocation(Location, ItemId)
    _retry(SYS_WaitShowMessage)
    _retry(SYS_WaitPlayItemGet)
    WaitPlayJingle()
  else
    HideMessageWindowPageFeedIcon()
    ShowMessage(MessageId)
    PlayJingleOnGetItemRareDefaultFade()
    PlayItemGetToLocation(Location, ItemId)
    _retry(SYS_WaitShowMessage)
    _retry(SYS_WaitPlayItemGet)
    WaitPlayJingle()
    CloseMessage()
  end
end

function ChangeSpeaker(Next)
  CloseMessage()
  Wait(0.1)
  if Next == nil then
  else
    SpawnMangaIcon(Next, "FIELD_EFX2D_YELL")
  end
end

function CmdSpawnMangaIcon(TargetId, EventObjectId)
  local iconId = SpawnMangaIcon(TargetId, EventObjectId)
  _retry(SYS_WaitPlayMangaIconAnimation, TargetId, iconId)
end

function WaitPlayMangaIconAnimation(TargetId, IconId)
  _retry(SYS_WaitPlayMangaIconAnimation, TargetId, IconId)
end

function CmdSpawnMangaIconByParty(PartyNum, MangaIconId)
  SpawnMangaIconByParty(PartyNum, MangaIconId)
  _retry(SYS_WaitPlayMangaIconAnimationByParty, PartyNum)
end

function WaitPlayMangaIconAnimationByParty(PartyNum)
  _retry(SYS_WaitPlayMangaIconAnimationByParty, PartyNum)
end

function CmdShowEventScreenShotUI(ScreenShotId, FadePriority, FadeSec)
  FadeOut(FadePriority, FadeSec)
  CallEventScreenShotUI()
  WaitFadeOut(FadePriority)
  _retry(SYS_WaitEventScreenShotUI)
  ShowEventScreenShotUI(ScreenShotId)
  _retry(SYS_WaitLoadingEventScreenShot)
  CmdFadeIn(FadePriority, FadeSec)
end

function CmdCloseEventScreenShotUI(FadePriority, FadeSec)
  CmdFadeOut(FadePriority, FadeSec)
  CloseEventScreenShotUI()
  CmdFadeIn(FadePriority, FadeSec)
end

function CmdShowEventScreenShotUIDefaultParam(ScreenShotId)
  CmdShowEventScreenShotUI(ScreenShotId, EFadingPriorityTopMost, 0.3)
end

function CmdCloseEventScreenShotUIDefaultParam()
  CmdCloseEventScreenShotUI(EFadingPriorityTopMost, 0.3)
end

function RequestPreloadEventScreenShot(ScreenShotId)
  CallEventScreenShotUI()
  PreloadEventScreenShot(ScreenShotId)
end

function SetTagWord2(Word)
  SetTagWord(Word, 2)
end

function SetTagWord3(Word)
  SetTagWord(Word, 3)
end

function SetTagItemId2(ItemId)
  SetTagItemId(ItemId, 2)
end

function SetTagItemId3(ItemId)
  SetTagItemId(ItemId, 3)
end

function SetTagWord2PersonalityId(PersonalityId)
  SetTagWordPersonalityId(PersonalityId, 2)
end

function SetTagWord3PersonalityId(PersonalityId)
  SetTagWordPersonalityId(PersonalityId, 2)
end

function SetTagWordZodiacSignFromBirthDay(tagIndex)
  local birthMonth = GetBirthdayMonth()
  local birthDay = GetBirthdayDay()
  SetTagWordZodiacSign(birthMonth, birthDay, tagIndex)
end

function SetTagWord2ZodiacSignFromBirthDay()
  SetTagWordZodiacSignFromBirthDay(2)
end

function SetTagWord3ZodiacSignFromBirthDay()
  SetTagWordZodiacSignFromBirthDay(3)
end

function SetTagMonthFromBirthDay()
  SetTagMonth(GetBirthdayMonth())
end

function SetTagDayFromBirthDay()
  SetTagDay(GetBirthdayDay())
end

function SetTagWordMonsterSpeciesFromScoutId(MonsterScoutId)
  SetTagWord(GetMonsterSpeciesTextIdFromScout(MonsterScoutId))
end

function SetTagWordCurrentMonsterFromScoutId(MonsterScoutId)
  SetTagWord(GetCurrentScoutMonsterTextId(MonsterScoutId))
end

function SetTagWordMonsterFromScoutId(MonsterScoutId, ScoutNum)
  SetTagWord(GetScoutMonsterTextId(MonsterScoutId, ScoutNum))
end

function MBRBattleResultProcess()
  local prevMatchNum = BattleRoadBattleResultProcess()
  local battleResult = GetBattleRoadBattleResult()
  local battleResultData = {
    PrevMatch = prevMatchNum,
    NextMatch = prevMatchNum + 1,
    Result = battleResult
  }
  return battleResultData
end

function CmdStartEventBattle(eventBattleId, option)
  local seId = "SYSSE_BTL_ENCOUNT"
  local encountSec = 0.25
  local isDisableSE = false
  if option ~= nil and option.isDisableSE == true then
    isDisableSE = true
  end
  RequestPreloadEventBattle(eventBattleId)
  StartEncounterEffect(encountSec)
  if isDisableSE == false then
    PlaySEUI(seId)
  end
  _retry(WaitEncounterEffect)
  CmdFadeOut(EFadingPriorityTopMost, 0)
  if option ~= nil then
    StartEventBattleAddOption(eventBattleId, option)
  else
    StartEventBattle(eventBattleId)
  end
end

function CmdFadeIn(FadePriority, FadeTime)
  FadeIn(FadePriority, FadeTime)
  _retry(SYS_WaitFadeIn, FadePriority)
end

function CmdStartTravelDoor(_DoPlaySE, _DoDisableEffectAfterFadeOut, _FadeTime)
  local doPlaySE = true
  if _DoPlaySE ~= nil and IsBool(_DoPlaySE) then
    doPlaySE = _DoPlaySE
  end
  local doDisableEffectAfterFadeOut = false
  if _DoDisableEffectAfterFadeOut ~= nil and IsBool(_DoDisableEffectAfterFadeOut) then
    doDisableEffectAfterFadeOut = _DoDisableEffectAfterFadeOut
  end
  StartTravelDoor(doPlaySE, doDisableEffectAfterFadeOut)
  local fadeTime = 0.5
  if _FadeTime ~= nil then
    fadeTime = _FadeTime
  end
  local waitTime = 4 - fadeTime
  Wait(waitTime)
end

function CmdEndTravelDoor(_DoPlaySE)
  local doPlaySE = true
  if _DoPlaySE ~= nil and IsBool(_DoPlaySE) then
    doPlaySE = _DoPlaySE
  end
  EndTravelDoor(doPlaySE)
  _retry(SYS_WaitEndTravelDoor)
end

function CmdFadeInOnInitialFadeInPostMapTransition(FadePriority, FadeTime, _MapId, _SoundTable)
  LuaMapOnPreStartTransitionFadeIn(_MapId, _SoundTable)
  FadePriority = GetTransitionFadingPriority(FadePriority)
  WaitFrame(1)
  if IsEnableTravelDoor() then
    FadeIn(FadePriority, FadeTime)
    CmdEndTravelDoor()
  else
    CmdFadeIn(FadePriority, FadeTime)
  end
  _retry(SYS_WaitPlayerAnimation, "post_fade_animation")
  MapOnCompleteTransitionFadeIn()
end

function CmdFadeInOnInitialFadeInPostMapTransitionNoWait(FadePriority, FadeTime, _MapId, _SoundTable)
  LuaMapOnPreStartTransitionFadeIn(_MapId, _SoundTable)
  if FadePriority == EFadingPriorityTopMost or FadePriority == EFadingPriorityWhiteTopMost then
    FadeIn(EFadingPriorityTopMost, FadeTime)
    FadeIn(EFadingPriorityWhiteTopMost, FadeTime)
  else
    FadeIn(FadePriority, FadeTime)
  end
  MapReserveCallbackOnInitialFadeInPostMapTransition(FadeTime)
end

function CmdFadeInAfterEventBattle()
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId(), {NicolaSoundBgmManagementTypeOnMapTransition = ENicolaSoundBgmManagementTypeOnMapTransitionRESUME})
end

function FadeInAfterEventBattle()
  CmdFadeInOnInitialFadeInPostMapTransitionNoWait(EFadingPriorityTopMost, 0.5, GetCurrentMapId(), {NicolaSoundBgmManagementTypeOnMapTransition = ENicolaSoundBgmManagementTypeOnMapTransitionRESUME})
end

function FadeInAfterEventBattleNextSequencer(FadeTime, MapId)
  CmdFadeInOnInitialFadeInPostMapTransitionNoWait(EFadingPriorityTopMost, FadeTime, MapId, {NicolaSoundBgmManagementTypeOnMapTransition = ENicolaSoundBgmManagementTypeOnMapTransitionNOP})
end

function LuaMapOnPreStartTransitionFadeIn(_MapId, _SoundTable)
  if _SoundTable == nil then
    _SoundTable = {}
  end
  if _SoundTable.NicolaSoundBgmManagementTypeOnMapTransition == nil then
    _SoundTable.NicolaSoundBgmManagementTypeOnMapTransition = ENicolaSoundBgmManagementTypeOnMapTransitionDEFAULT
  end
  if _MapId == nil then
    _MapId = "HOGE"
    _SoundTable.NicolaSoundBgmManagementTypeOnMapTransition = ENicolaSoundBgmManagementTypeOnMapTransitionNOP
  end
  _retry(SYS_WaitPrimaryBGMFadeOut)
  MapFixMapTransitionAdditionalWaitSecInBlackout()
  Wait(MapGetMapTransitionAdditionalWaitSecInBlackout())
  MapOnPreStartTransitionFadeIn({
    MapId = _MapId,
    NicolaSoundBgmManagementTypeOnMapTransition = _SoundTable.NicolaSoundBgmManagementTypeOnMapTransition
  })
end

function WaitFadeIn(FadePriority)
  _retry(SYS_WaitFadeIn, FadePriority)
end

function CmdFadeOut(FadePriority, FadeTime)
  FadeOut(FadePriority, FadeTime)
  _retry(SYS_WaitFadeOut, FadePriority)
end

function WaitFadeOut(FadePriority)
  _retry(SYS_WaitFadeOut, FadePriority)
end

function ChangeStageCameraTraceTarget(TargetActorName, Distance)
  if Distance == nil then
    Distance = 2800
  end
  local tmpEnable = IsEnableCameraLag()
  EnableCameraLag(false)
  ChangeStageCameraAttachActor(TargetActorName, CAMERA_BLEND_LINEAR, 0, 0, Distance)
  WaitStageCameraBlend()
  EnableCameraLag(tmpEnable)
end

function WaitStageCameraBlend()
  _retry(SYS_WaitStageCameraBlend)
end

function CmdChangeStageCameraToActor(TargetActorName, BlendFunc, Time, BlendExp, ...)
  ChangeStageCameraToActor(TargetActorName, BlendFunc, Time, BlendExp, ...)
  _retry(SYS_WaitStageCameraBlend)
end

function CmdChangeStageCameraToGlobalPoint(LocX, LocY, Height, BlendFunc, Time, ...)
  ChangeStageCameraToGlobalPoint(LocX, LocY, Height, BlendFunc, Time, ...)
  _retry(SYS_WaitStageCameraBlend)
end

function CmdChangeTraceCamera(BlendFunc, Time, BlendExp, ...)
  ChangeTraceCamera(BlendFunc, Time, BlendExp, ...)
  _retry(SYS_WaitStageCameraBlend)
end

function CmdChangeTraceCameraDefaultParam()
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_OUT, 0.5, 2)
end

function WaitTraceCameraLag()
  _retry(SYS_WaitTraceCameraLag)
end

function WaitPlayEventSequence()
  _retry(SYS_WaitPlayEventSequence)
end

function CmdPlayEventSequence(Index, EndSequenceFadeOutPriority, IsInvisibleNpc, IsLeavePartyCostume)
  SetDispMiniMap(false)
  if EndSequenceFadeOutPriority == nil then
    EndSequenceFadeOutPriority = EFadingPriorityTopMost
  end
  PlayEventSequence(Index, EndSequenceFadeOutPriority, IsInvisibleNpc, IsLeavePartyCostume)
  _retry(SYS_WaitPlayEventSequence)
  SetDispMiniMap(true)
end

local SequencerChangeMapStateType = {
  NoChange = 0,
  TransitionMap = 1,
  TransitionBattle = 2
}

function CmdPlayEventSequenceByChangeMapImpl(Index, SequencerParam)
  local fadeInPriority = SequencerParam.FadeInPriority
  local fadeInSec = SequencerParam.FadeInSec
  local mapId = SequencerParam.MapId
  local prevState = SequencerParam.PrevState
  local nextState = SequencerParam.NextState
  local isInvisibleNpc = SequencerParam.IsInvisibleNpc
  local isLeavePartyCostume = SequencerParam.IsLeavePartyCostume
  local fadeOutPriority = SequencerParam.FadeOutPriority
  if fadeInPriority == nil then
    fadeInPriority = EFadingPriorityTopMost
  end
  if fadeInSec == nil then
    fadeInSec = 0.5
  end
  print("Index : " .. tostring(Index) .. ", prevState : " .. tostring(prevState) .. ", nextState : " .. tostring(nextState) .. ", mapId : " .. tostring(mapId) .. ", fadeInPriority : " .. tostring(fadeInPriority) .. ", fadeInSec : " .. tostring(fadeInSec) .. ", InvisibleNpc : " .. tostring(isInvisibleNpc))
  local isPreNotifySound = prevState ~= SequencerChangeMapStateType.NoChange
  local enableForceEventSequenceSoundDukingAfterPlay = nextState ~= SequencerChangeMapStateType.NoChange
  EventSequencePreProcessBySound(isPreNotifySound, enableForceEventSequenceSoundDukingAfterPlay)
  if prevState == SequencerChangeMapStateType.TransitionMap then
    CmdFadeInOnInitialFadeInPostMapTransitionNoWait(fadeInPriority, fadeInSec, mapId)
  elseif prevState == SequencerChangeMapStateType.TransitionBattle then
    FadeInAfterEventBattleNextSequencer(fadeInSec, mapId)
  else
    FadeIn(fadeInPriority, fadeInSec)
  end
  CmdPlayEventSequence(Index, fadeOutPriority, isInvisibleNpc, isLeavePartyCostume)
end

function CmdPlayEventSequenceNextChangeMap(Index, InFadeInPriority, InFadeInSec, InFadeOutPriority, InIsInvisible, InIsLeavePartyCostume)
  local param = {
    FadeInPriority = InFadeInPriority,
    FadeInSec = InFadeInSec,
    IsInvisibleNpc = InIsInvisible,
    IsLeavePartyCostume = InIsLeavePartyCostume,
    FadeOutPriority = InFadeOutPriority,
    PrevState = SequencerChangeMapStateType.NoChange,
    NextState = SequencerChangeMapStateType.TransitionMap
  }
  CmdPlayEventSequenceByChangeMapImpl(Index, param)
end

function CmdPlayEventSequencePrevChangeMap(Index, InMapId, InFadeInPriority, InFadeInSec, InFadeOutPriority, InIsInvisible, InIsLeavePartyCostume)
  local param = {
    FadeInPriority = InFadeInPriority,
    FadeInSec = InFadeInSec,
    MapId = InMapId,
    IsInvisibleNpc = InIsInvisible,
    IsLeavePartyCostume = InIsLeavePartyCostume,
    FadeOutPriority = InFadeOutPriority,
    PrevState = SequencerChangeMapStateType.TransitionMap,
    NextState = SequencerChangeMapStateType.NoChange
  }
  CmdPlayEventSequenceByChangeMapImpl(Index, param)
end

function CmdPlayEventSequenceChangeMapPrevAndNext(Index, InMapId, InFadeInPriority, InFadeInSec, InFadeOutPriority, InIsLeavePartyCostume)
  local param = {
    FadeInPriority = InFadeInPriority,
    FadeInSec = InFadeInSec,
    MapId = InMapId,
    IsLeavePartyCostume = InIsLeavePartyCostume,
    FadeOutPriority = InFadeOutPriority,
    PrevState = SequencerChangeMapStateType.TransitionMap,
    NextState = SequencerChangeMapStateType.TransitionMap
  }
  CmdPlayEventSequenceByChangeMapImpl(Index, param)
end

function CmdPlayEventSequenceNextEventBattle(Index, InFadeInPriority, InFadeInSec, InIsLeavePartyCostume)
  local param = {
    FadeInPriority = InFadeInPriority,
    FadeInSec = InFadeInSec,
    IsLeavePartyCostume = InIsLeavePartyCostume,
    PrevState = SequencerChangeMapStateType.NoChange,
    NextState = SequencerChangeMapStateType.TransitionBattle
  }
  CmdPlayEventSequenceByChangeMapImpl(Index, param)
end

function CmdPlayEventSequencePrevEventBattle(Index, InFadeOutPriority, InIsLeavePartyCostume)
  local param = {
    FadeOutPriority = InFadeOutPriority,
    IsLeavePartyCostume = InIsLeavePartyCostume,
    PrevState = SequencerChangeMapStateType.TransitionBattle,
    NextState = SequencerChangeMapStateType.NoChange
  }
  CmdPlayEventSequenceByChangeMapImpl(Index, param)
end

function CmdPlayEventSequenceEventBattlePrevAndNext(Index, InIsLeavePartyCostume)
  local param = {
    IsLeavePartyCostume = InIsLeavePartyCostume,
    PrevState = SequencerChangeMapStateType.TransitionBattle,
    NextState = SequencerChangeMapStateType.TransitionBattle
  }
  CmdPlayEventSequenceByChangeMapImpl(Index, param)
end

function CmdPlayEventSequencePrevEventBattleNextChangeMap(Index, InIsLeavePartyCostume)
  local param = {
    IsLeavePartyCostume = InIsLeavePartyCostume,
    PrevState = SequencerChangeMapStateType.TransitionBattle,
    NextState = SequencerChangeMapStateType.TransitionMap
  }
  CmdPlayEventSequenceByChangeMapImpl(Index, param)
end

function ChangeFieldShip(PlayerTag, OrientationType, IsRequreAutoSave)
  ChangeMap("Field", PlayerTag, OrientationType, IsRequreAutoSave, {PlayerType = PLAYER_TYPE_SWIM})
end

function ChangeFieldRamia(PlayerTag, OrientationType, IsRequreAutoSave)
  ChangeMap("Field", PlayerTag, OrientationType, IsRequreAutoSave, {PlayerType = PLAYER_TYPE_FLY})
end

function ChangeFieldRamiaWhiteFade(PlayerTag, OrientationType, IsRequreAutoSave)
  ChangeMap("Field", PlayerTag, OrientationType, IsRequreAutoSave, {PlayerType = PLAYER_TYPE_FLY, FadePriority = EFadingPriorityWhiteTopMost})
end

function ChangeField(PlayerTag, OrientationType, IsRequreAutoSave)
  ChangeMap("Field", PlayerTag, OrientationType, IsRequreAutoSave)
end

function ChangeFieldWhiteFade(PlayerTag, OrientationType, IsRequreAutoSave)
  ChangeMap("Field", PlayerTag, OrientationType, IsRequreAutoSave, {FadePriority = EFadingPriorityWhiteTopMost})
end

function ChangeMapMonster(_mapId, _startTag, _orientation, _isRequreAutoSave)
  ChangeMap(_mapId, _startTag, _orientation, _isRequreAutoSave, {PlayerType = PLAYER_TYPE_MONSTER})
end

function ChangeMapKing(_mapId, _startTag, _orientation, _isRequreAutoSave)
  ChangeMap(_mapId, _startTag, _orientation, _isRequreAutoSave, {PlayerType = PLAYER_TYPE_KING})
end

function ChangeMapParty(_mapId, _startTag, _orientation, _isRequreAutoSave)
  ChangeMap(_mapId, _startTag, _orientation, _isRequreAutoSave, {PlayerType = PLAYER_TYPE_MORPHEND})
end

function ChangeMapTravelDoor(_mapId, _startTag, _orientation, _isRequreAutoSave)
  ChangeMap(_mapId, _startTag, _orientation, _isRequreAutoSave, {IsTravelDoor = true})
end

function ChangeMapWhiteFade(_mapId, _startTag, _orientation, _isRequreAutoSave)
  ChangeMap(_mapId, _startTag, _orientation, _isRequreAutoSave, {FadePriority = EFadingPriorityWhiteTopMost})
end

function ChangeMapWarpVehicle(_mapId, _startTag, _orientation, _ruraId)
  MapOnStartRuraTransition(_ruraId, false)
  ChangeMap(_mapId, _startTag, _orientation)
end

function CmdPlayResetEffectRock(FadeSec)
  PlayResetEffectRock(FadeSec)
  _retry(SYS_WaitPlayResetRock)
end

function CmdPlayEffectSearchObject(ActorName, EffectName)
  PlayEffectSearchObject(ActorName, EffectName)
  _retry(SYS_WaitPlayEffectSearchObject, ActorName)
end

function WaitPlayEffectSearchObject(ActorName)
  _retry(SYS_WaitPlayEffectSearchObject, ActorName)
end

function RequestUnlockAchievementByFieldAliahan()
  print("\227\130\164\227\131\153\227\131\179\227\131\136\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\227\129\139\227\130\137\229\174\159\231\184\190\227\129\174\227\130\162\227\131\179\227\131\173\227\131\131\227\130\175 : \227\130\162\227\131\170\227\130\162\227\131\143\227\131\179\227\129\139\227\130\137\227\131\149\227\130\163\227\131\188\227\131\171\227\131\137\227\129\171\229\135\186\227\129\159")
  RequestUnlockAchievement(EAchievementACHIEVEMENT_FIELD_Aliahan)
end

function RequestUnlockAchievementByDefeatKandata1()
  print("\227\130\164\227\131\153\227\131\179\227\131\136\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\227\129\139\227\130\137\229\174\159\231\184\190\227\129\174\227\130\162\227\131\179\227\131\173\227\131\131\227\130\175 : \227\130\171\227\131\179\227\131\128\227\130\191\227\130\146\229\128\146\227\129\151\227\129\159\239\188\1361\229\155\158\231\155\174\239\188\137")
  RequestUnlockAchievement(EAchievementACHIEVEMENT_DEFEAT_Kandata1)
end

function RequestUnlockAchievementByDefeatKandata2()
  print("\227\130\164\227\131\153\227\131\179\227\131\136\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\227\129\139\227\130\137\229\174\159\231\184\190\227\129\174\227\130\162\227\131\179\227\131\173\227\131\131\227\130\175 : \227\130\171\227\131\179\227\131\128\227\130\191\227\130\146\229\128\146\227\129\151\227\129\159\239\188\1362\229\155\158\231\155\174\239\188\137")
  RequestUnlockAchievement(EAchievementACHIEVEMENT_DEFEAT_Kandata2)
end

function RequestUnlockAchievementByDefeatRevnant()
  print("\227\130\164\227\131\153\227\131\179\227\131\136\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\227\129\139\227\130\137\229\174\159\231\184\190\227\129\174\227\130\162\227\131\179\227\131\173\227\131\131\227\130\175 : \227\131\172\227\131\180\227\131\138\227\131\179\227\131\136\227\130\146\229\128\146\227\129\151\227\129\159")
  RequestUnlockAchievement(EAchievementACHIEVEMENT_DEFEAT_Revnant)
end

function RequestUnlockAchievementByGetGoldenMedal()
  print("\227\130\164\227\131\153\227\131\179\227\131\136\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\227\129\139\227\130\137\229\174\159\231\184\190\227\129\174\227\130\162\227\131\179\227\131\173\227\131\131\227\130\175 : \233\135\145\227\129\174\227\131\161\227\131\128\227\131\171\227\130\146\230\137\139\227\129\171\229\133\165\227\130\140\227\129\159")
  RequestUnlockAchievement(EAchievementACHIEVEMENT_GET_GoldenMedal)
end

function RequestUnlockAchievementByGetLightHelm()
  print("\227\130\164\227\131\153\227\131\179\227\131\136\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\227\129\139\227\130\137\229\174\159\231\184\190\227\129\174\227\130\162\227\131\179\227\131\173\227\131\131\227\130\175 : \227\129\178\227\129\139\227\130\138\227\129\174\227\129\139\227\129\182\227\129\168\227\130\146\230\137\139\227\129\171\229\133\165\227\130\140\227\129\159")
  RequestUnlockAchievement(EAchievementACHIEVEMENT_GET_LightHelm)
end

function RequestUnlockAchievementByGetSwordOfKings()
  print("\227\130\164\227\131\153\227\131\179\227\131\136\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\227\129\139\227\130\137\229\174\159\231\184\190\227\129\174\227\130\162\227\131\179\227\131\173\227\131\131\227\130\175 : \231\142\139\232\128\133\227\129\174\229\137\163\227\130\146\230\137\139\227\129\171\229\133\165\227\130\140\227\129\159")
  RequestUnlockAchievement(EAchievementACHIEVEMENT_GET_SwordOfKings)
end

function RequestUnlockAchievementByShopPiffPuff()
  print("\227\130\164\227\131\153\227\131\179\227\131\136\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\227\129\139\227\130\137\229\174\159\231\184\190\227\129\174\227\130\162\227\131\179\227\131\173\227\131\131\227\130\175 : \227\129\177\227\129\181\227\129\177\227\129\181\227\130\146\227\129\151\227\129\159")
  RequestUnlockAchievement(EAchievementACHIEVEMENT_SHOP_PiffPuff)
end

function RequestUnlockAchievementByXenlon()
  print("\227\130\164\227\131\153\227\131\179\227\131\136\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\227\129\139\227\130\137\229\174\159\231\184\190\227\129\174\227\130\162\227\131\179\227\131\173\227\131\131\227\130\175 : \227\129\151\227\130\147\227\130\138\227\130\133\227\129\134\227\129\174\233\161\152\227\129\132\228\186\139\227\130\146\229\136\182\232\166\135\227\129\151\227\129\159")
  RequestUnlockAchievement(EAchievementACHIEVEMENT_Xenlon)
end

function DispelCurseGoldenClaws(BeginOverlap, Tags, ...)
  local fadeSeconds = 0.5
  local blackoutSeconds = 0.1
  SetActionInputMode(INPUT_MODE_NO_INPUT, true)
  CmdFadeOut(EFadingPriorityTopMost, fadeSeconds)
  ResetCurseByDisposeGoldenClaws()
  Wait(blackoutSeconds)
  CmdFadeIn(EFadingPriorityTopMost, fadeSeconds)
  SetActionInputMode(INPUT_MODE_NO_INPUT, false)
end
