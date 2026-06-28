local AP = require("Src/DQ3AP") -- AP

function OpenFieldTopDirect(BeginOverlap, table, ...)
  print("OpenFieldTopDirect Begin")
  
  local _RuraId = (...)
  _retry(WaitLoadedNotStreamingLevels)
  WaitFrame(5)
  local startPos = GetActorLocation("PLAYER")
  local mapId = GetFieldMapId(startPos)
  StartTransition(mapId)
  tmpInputMode = INPUT_MODE_NO_INPUT
  SetActionInputMode(tmpInputMode, true)
  MapTimeNotifyStartSystemProcessing()
  if IsUndergroundMap(mapId) then
    MapTimeNotifyEnterUndergroundMap(true, false, false)
  else
    MapTimeNotifyEnterUppergroundMap(true, false, false)
  end
  InvisibleAllVisibledSubLevels(mapId, false)
  CameraManagerPreChangeMap()
  RequestLoading(mapId)
  _retry(SYS_WaitLoadingEnd, mapId)
  PlayMapBgm(mapId)
  ChangeVisibleSubLevel(mapId)
  _retry(SYS_WaitVisibleSubLevelOnly, mapId)
  MapOnStartRuraTransition(_RuraId, false)
  CameraManagerPreVisibleFieldMap(startPos)
  WaitOneFrame()
  _retry(SYS_WaitVisibleFieldMapAtLocation, startPos, true, true)
  MapOnPostChangeLevel("", mapId)
  print("OpenFieldTopDirect End")
  SuspendTransition()
end

function OpenFieldTopDirectAfterLevelVisible(BeginOverlap, table, ...)
  print("OpenFieldTopDirectAfterLevelVisible Begin")
  ResumeTransition()
  WaitFrame(2)
  EnableEnvironmentLight(true)
  local startPos = GetActorLocation("PLAYER")
  local mapId = GetFieldMapId(startPos)
  SetPostProcessVolumeInfo(mapId, "")
  SetLightDirRotatorInfo(mapId, "")
  SetDirectionalLightInfo(mapId, "")
  SetDoSkySpheresFollowPlayerCamera(true)
  SetVisibleLightingActors(true)
  UpdateEffectParameterCollectionTime()
  SetEnableFieldLoop(IsUndergroundMap(mapId) == false)
  OnEnterFieldMap()
  WaitFrame(1)
  _retry(SYS_WaitVisibleFieldMapAtLocation, startPos, true, true)
  RefreshActorFadingTriggers()
  CameraManagerPostChangeMap(mapId)
  WaitFrame(2)
  ActivateActorFading()
  WaitFrame(2)
  SetNicolaEnableDOF(true)
  EventActorPostChangeMap()
  SetVolumetricLightMapByMap(mapId)
  MapTimeNotifyEndSystemProcessing()
  tmpInputMode = INPUT_MODE_NO_INPUT
  SetActionInputMode(tmpInputMode, false)
  print("OpenFieldTopDirectAfterLevelVisible End")
  FinishTransition()
end

function OpenFieldTopFromTitle(BeginOverlap, table, ...)
  print("OpenFieldTopFromTitle Begin")
  local _mapId, _startPointName = ...
  local _fadeOut = 0
  StartTransition(_mapId)
  local isField = IsFieldMapId(_mapId)
  local loadId = _mapId
  tmpInputMode = INPUT_MODE_NO_INPUT
  SetActionInputMode(tmpInputMode, true)
  MapOnPreStartTransitionFadeOut({MapIdNext = _mapId})
  FadeOut(EFadingPriorityTopMost, _fadeOut)
  _retry(SYS_WaitFadeOut, EFadingPriorityTopMost)
  MapOnCompleteTransitionFadeOut()
  CameraManagerPreChangeMap()
  MapTimeNotifyStartSystemProcessing()
  MapOnPreChangeLevel("", loadId)
  InvisibleAllVisibledSubLevels(loadId, true)
  SetDoSkySpheresFollowPlayerCamera(false)
  SetEnableFieldLoop(false)
  DestroyActorAll()
  RequestLoading(loadId)
  _retry(SYS_WaitLoadingEnd, loadId)
  _retry(WaitLoadedNotStreamingLevels)
  ChangeVisibleSubLevel(loadId)
  _retry(SYS_WaitVisibleSubLevelOnly, loadId)
  if isField then
    local startPos = GetStartPos(_startPointName)
    SetPlayerWorldLocation(startPos)
    StartUpdateLevelStreaming()
    SetEnableFieldLoop(IsUndergroundMap(_mapId) == false)
    OnEnterFieldMap()
    WaitFrame(1)
    CameraManagerPreVisibleFieldMap(startPos)
    WaitOneFrame()
    _retry(SYS_WaitVisibleFieldMapAtLocation, startPos, true, true)
  end
  MapOnPostChangeLevel("", loadId)
  ResetTempSaveFlag(isField, false)
  EventActorPostChangeMap()
  print("OpenFieldTopFromTitle End")
  SuspendTransition()
end

function OpenFieldTopFromTitleAfterLevelVisible(BeginOverlap, table, ...)
  print("OpenFieldTopFromTitleAfterLevelVisible Begin")
  local _mapId, _startPointName, _ShowChurchText, _fadeIn = ...
  ResumeTransition()
  StartTransitionTime(_mapId)
  WaitFrame(2)
  local isField = IsFieldMapId(_mapId)
  if isField then
    local startPos = GetStartPos(_startPointName)
    if IsUndergroundLocation(startPos) == false then
      SetEnableFieldLoop(true)
    else
    end
    SetDoSkySpheresFollowPlayerCamera(true)
    OnEnterFieldMap()
    WaitFrame(1)
    SetNicolaEnableDOF(true)
    SetVolumetricLightMapByMap(_mapId)
  else
    SetNicolaEnableDOFByMap(_mapId)
    SetVolumetricLightMapByMap(_mapId)
    UpdateTownDungeonMapParameterCollection(_mapId)
  end
  SetPostProcessVolumeInfo(_mapId, "")
  SetLightDirRotatorInfo(_mapId, "")
  SetDirectionalLightInfo(_mapId, "")
  UpdateEffectParameterCollectionTime()
  if isField then
    local startPos = GetStartPos(_startPointName)
    _retry(SYS_WaitVisibleFieldMapAtLocation, startPos, true, true)
  end
  ClearTriggerEvent()
  OnChangeAreaSkill()
  RefreshActorFadingTriggers()
  CameraManagerPostChangeMap(_mapId)
  WaitFrame(2)
  ActivateActorFading()
  WaitFrame(2)
  _retry(SYS_WaitTextureStreaming, _mapId)
  _retry(FTS_WaitCatchingLightDirRotator)
  RequestLightDirRotatorUpdating()
  SetVisibleLightingActors(true)
  _retry(WaitLoadingInGameAsset)
  StopSimpleLoadingUI()
  PerformanceSettingFL_OnLoadingEnd()
  bExecEvent = CallSceneEvent(_mapId)
  if bExecEvent == false then
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, _fadeIn, _mapId)
  end
  SetActionInputMode(tmpInputMode, false)
  AddTransitionTime(_mapId, "TransitionEnd")
  MapTimeNotifyEndSystemProcessing()
  print("OpenFieldTopFromTitleAfterLevelVisible End")
  if _ShowChurchText then
    CallStartChurchUIRestart()
  end
  FinishTransition()
end

function TransitionRura(BeginOverlap, table, ...)
  local _LoadMapId, _StartPointName, _MapId, _RuraId, _IsSuccessRura, _IsDisableMagic, _TextId, _TextId2, _AnimationTime, _PlayerType, _Orientation, _FadeIn, _PrevMapId = ...
  MapTimeNotifyStartSystemProcessing()
  SetDispMiniMap(false)
  SetDispBtnGuide(false)
  if _IsSuccessRura then
    HideMessageWindowPageFeedIcon()
    ShowMessage(_TextId)
    _retry(SYS_WaitShowMessage)
    CloseMessage()
    SetActionInputMode(INPUT_MODE_NO_INPUT, true)
    SoundRuraGuard(true)
    if IsUndergroundMap(_PrevMapId) ~= IsUndergroundMap(_MapId) then
      SetMapDefaultTime(_MapId)
    end
    RequestLoading(_LoadMapId)
    Rura()
    _retry(SYS_WaitPlayerAnimation, "rura_start")
    StartTransition(_MapId)
    OnStartTransitionFieldTownDungeon(_MapId, _StartPointName)
    MapOnPreStartTransitionFadeOut({MapIdNext = _MapId, PlayerTypeNext = _PlayerType})
    local fadeType = EFadingPriorityTopMost
    FadeOut(fadeType, _AnimationTime)
    _retry(SYS_WaitFadeOut, fadeType)
    MapOnCompleteTransitionFadeOut()
    MapOnStartRuraTransition(_RuraId, true)
    TransitionLevelImpl(_PrevMapId, _MapId, _StartPointName, _FadeIn, _Orientation, _PlayerType, true, 0.5, 0.5, fadeType)
    RequestAutoSave()
    WaitFrame(1)
    SetActionInputMode(INPUT_MODE_NO_INPUT, false)
    MapTimeNotifyEndSystemProcessing()
    SoundRuraGuard(false)
    FinishTransition()
  else
    if _IsDisableMagic then
      print("todo:\227\129\170\227\129\171\227\129\139\230\188\148\229\135\186\229\133\165\227\130\140\227\130\139")
    end
    local isItem = _TextId2 ~= nil and _TextId2 ~= ""
    if isItem == false then
      HideMessageWindowPageFeedIcon()
    end
    ShowMessage(_TextId)
    _retry(SYS_WaitShowMessage)
    if isItem then
      HideMessageWindowPageFeedIcon()
      ShowMessage(_TextId2)
      _retry(SYS_WaitShowMessage)
    end
    CloseMessage()
    MapTimeNotifyEndSystemProcessing()
  end
  SetDispMiniMap(true)
  SetDispBtnGuide(true)
  -- AP
  if _IsSuccessRura then
    AP.Log("Transition rura")
    AP.GiveItemsIfAvailable();
  end
  -- AP end
end

function TransitionRiremito(BeginOverlap, table, ...)
  local _LoadMapId, _StartPointName, _MapId, _RuraId, _IsSuccessRura, _IsDisableMagic, _TextId, _UnusedId, _AnimationTime, _PlayerType, _Orientation, _FadeTime, _PrevMapId = ...
  MapTimeNotifyStartSystemProcessing()
  SetDispMiniMap(false)
  SetDispBtnGuide(false)
  local effectName = "riremito_temp"
  local pos = GetRiremitoEffectPos()
  SpawnLoopEffectWorldCoord("Sys_Riremito_01", effectName, pos, {
    Yaw = 0,
    Pitch = 0,
    Roll = 0
  }, {
    X = 1,
    Y = 1,
    Z = 1
  })
  local handle1 = PlaySEUI("SYSSE_RIREMITO_EFF_WIND")
  Wait(2)
  local handle2 = PlaySEUI("SYSSE_RIREMITO_EFF_LIGHT")
  local result = CmdChoiceMessage("Txt_Map_Riremito_Confirmation")
  CloseMessage()
  if result then
    SetActionInputMode(INPUT_MODE_NO_INPUT, true)
    StartTransition(_MapId)
    OnStartTransitionFieldTownDungeon(_MapId, _StartPointName)
    MapOnPreStartTransitionFadeOut({MapIdNext = _MapId, PlayerTypeNext = _PlayerType})
    local fadeType = EFadingPriorityWhiteTopMost
    FadeOut(fadeType, _FadeTime)
    _retry(SYS_WaitFadeOut, fadeType)
    MapOnCompleteTransitionFadeOut()
    EraseLoopEffectByParamEnd(effectName, 0.01)
    TransitionLevelImpl(_PrevMapId, _MapId, _StartPointName, _FadeTime, _Orientation, _PlayerType, true, 0.5, 0.5, fadeType)
    RequestAutoSave()
    WaitFrame(1)
    SetActionInputMode(INPUT_MODE_NO_INPUT, false)
    MapTimeNotifyEndSystemProcessing()
    FinishTransition()
  else
    StopSound(handle1)
    StopSound(handle2)
    EraseLoopEffectByParamEnd(effectName, 1)
    Wait(1)
  end
  SetDispMiniMap(true)
  SetDispBtnGuide(true)
  -- AP
  if result then
    AP.Log("Transition riremito")
    AP.GiveItemsIfAvailable();
  end
  -- AP end
end

function TransitionLevel(BeginOverlap, table, ...)
  local _MapId, _StartPointName, _RiremitoPointID, _SeId, _FadeTime, _Orientation, _PlayerType, _bAutoSave, _IsPlayBGM, _IsTravelDoor, _SpawnX, _SpawnY, fadePriority, _ShowChoice, _IsOnProgress, _ProgressId, _TextId = ...
  local isField = IsFieldMapId(_MapId) -- AP
  local execTransition = true
  if _ShowChoice then
    execTransition = CmdChoiceMessage(_TextId)
    CloseMessage()
  end
  if execTransition then
    if _IsOnProgress then
      SetFlagProgress(_ProgressId, true)
    end
    StartTransition(_MapId)
    OnStartTransitionFieldTownDungeon(_MapId, _StartPointName)
    MapOnPreStartTransitionFadeOut({MapIdNext = _MapId, PlayerTypeNext = _PlayerType})
    if _IsTravelDoor then
      CmdStartTravelDoor(true, false, _FadeTime)
    end
    FadeOut(fadePriority, _FadeTime)
    if _SeId ~= nil and _IsTravelDoor == false then
      PlaySE2D(_SeId, "PLAYER")
    end
    _retry(SYS_WaitFadeOut, fadePriority)
    MapOnCompleteTransitionFadeOut()
    local prevMapId = GetCurrentMapId()
    TransitionLevelImpl(prevMapId, _MapId, _StartPointName, _FadeTime, _Orientation, _PlayerType, _IsPlayBGM, _SpawnX, _SpawnY, fadePriority)
    if isField or _bAutoSave == true then -- AP
      RequestAutoSave()
      WaitFrame(1)
    end
    SetActionInputMode(INPUT_MODE_NO_INPUT, false)
    MapTimeNotifyEndSystemProcessing()
    FinishTransition()
  else
    SetActionInputMode(INPUT_MODE_NO_INPUT, false)
  end
  -- AP
  if isField then
    AP.GiveItemsIfAvailable();
  end
  -- AP end
end

function OnStartTransitionFieldTownDungeon(_MapId, _StartPointName)
  MapTimeNotifyStartSystemProcessing()
  SetDoSkySpheresFollowPlayerCamera(false)
  SetEnableFieldLoop(false)
  StartTransitionTime(_MapId)
end

function AfterMapOnPostChangeLevel(_MapId)
  SetPostProcessVolumeInfo(_MapId, "")
  SetLightDirRotatorInfo(_MapId, "")
  SetDirectionalLightInfo(_MapId, "")
  UpdateEffectParameterCollectionTime()
  UpdateTownDungeonMapParameterCollection(_MapId)
  local isField = IsFieldMapId(_MapId)
  if isField then
    SetNicolaEnableDOF(true)
    SetEnableVolumetricLightMap(false)
    SetDoSkySpheresFollowPlayerCamera(true)
  else
    SetNicolaEnableDOFByMap(_MapId)
    SetVolumetricLightMapByMap(_MapId)
  end
  SetVisibleLightingActors(true)
end

function OnCompletePlayerSpawned(_PrevMapId, _NextMapId, _IsLose)
  local isLose = false
  if _IsLose ~= nil then
    isLose = _IsLose
  end
  MapOnCompleteTransitionPlayerSpawned(_PrevMapId, _NextMapId, isLose)
  EventActorPostChangeMap()
  RefreshActorFadingTriggers()
  CameraManagerPostChangeMap(_NextMapId)
  WaitFrame(2)
  ActivateActorFading()
  WaitFrame(2)
end

function TransitionLevelImpl(_PrevMapId, _MapId, _StartPointName, _FadeTime, _Orientation, _PlayerType, _IsPlayBGM, _SpawnX, _SpawnY, _FadeType)
  local isField = IsFieldMapId(_MapId)
  AddTransitionTime(_MapId, "LoadingStart")
  PlaySimpleLoadingUI()
  ExitFloorEvent(_MapId)
  MapOnPreChangeLevel(_PrevMapId, _MapId)
  DestroyActorAll()
  InvisibleAllVisibledSubLevels(_MapId, true)
  _retry(WaitAutoSave)
  CameraManagerPreChangeMap()
  RequestLoading(_MapId)
  WaitFrame(1)
  _retry(SYS_WaitLoadingEnd, _MapId)
  AddTransitionTime(_MapId, "LoadingEnd")
  local startPoint = GetStartPos(_StartPointName)
  AddTransitionTime(_MapId, "VisibleStart")
  ChangeVisibleSubLevel(_MapId)
  if isField then
    SetPlayerWorldLocation(startPoint)
    SetEnableFieldLoop(IsUndergroundMap(_MapId) == false)
    OnEnterFieldMap()
    CameraManagerPreVisibleFieldMap(startPoint)
    WaitOneFrame()
    WaitFrame(1)
    _retry(SYS_WaitVisibleFieldMapAtLocation, startPoint, true, true)
  end
  _retry(SYS_WaitVisibleSubLevelOnly, _MapId)
  AddTransitionTime(_MapId, "VisibleEnd")
  MapOnPostChangeLevel(_PrevMapId, _MapId)
  AfterMapOnPostChangeLevel(_MapId)
  SpawnPlayerUnitByPlayerStart(_StartPointName, _Orientation, _PlayerType, _SpawnX, _SpawnY)
  ResetTime()
  OnCompletePlayerSpawned(_PrevMapId, _MapId)
  _retry(SYS_WaitTextureStreaming, _MapId)
  AddTransitionTime(_MapId, "StreamingEnd")
  StopSimpleLoadingUI()
  local execEvent = CallSceneEvent(_MapId)
  if execEvent == false then
    CmdFadeInOnInitialFadeInPostMapTransition(_FadeType, _FadeTime, _MapId, {
      NicolaSoundBgmManagementTypeOnMapTransition = _IsPlayBGM and ENicolaSoundBgmManagementTypeOnMapTransitionDEFAULT or ENicolaSoundBgmManagementTypeOnMapTransitionNOP
    })
  end
  AddTransitionTime(_MapId, "TransitionEnd")
end

function TransitionBattle(BeginOverlap, tbl, ...)
  print("TransitionBattle Start")
  local _mapId, _startPointName, _environmentLightOn, _fadeOut, _fadeIn, _mapConstructFuncName, _seId, bgmId, isNotChangeBGM, isDisableSE = ...
  print("[FieldTransitionScript::TransitionBattle] " .. "_mapId=" .. tostring(_mapId) .. " ,_startPointName=" .. tostring(_startPointName) .. " ,_environmentLightOn=" .. tostring(_environmentLightOn) .. " ,_fadeOut=" .. tostring(_fadeOut) .. " ,_fadeIn=" .. tostring(_fadeIn) .. " ,_mapConstructFuncName=" .. tostring(_mapConstructFuncName) .. " ,_seId=" .. tostring(_seId) .. " ,bgmId=" .. tostring(bgmId) .. " ,isNotChangeBGM=" .. tostring(isNotChangeBGM) .. " ,isDisableSE=" .. tostring(isDisableSE))
  local bgmManageType = ENicolaSoundBgmManagementTypeOnMapTransitionPreMapBgmPAUSE
  if isNotChangeBGM == true then
    bgmManageType = ENicolaSoundBgmManagementTypeOnMapTransitionPreMapBgmNOP
  end
  StartTransition(_mapId)
  if isNotChangeBGM ~= true then
    PauseMainBGM(true, 0)
  end
  MapTimeNotifyStartSystemProcessing()
  MapTimeNotifyStartBattle()
  SetDoSkySpheresFollowPlayerCamera(false)
  SetEnableFieldLoop(false)
  SetDispMiniMap(false)
  OnStartTransitionBattle()
  if IsEventBattle() == false or IsRetryBattle() == true then
    StartEncounterEffect(_fadeOut)
    if _seId ~= "" and isDisableSE ~= true then
      PlaySEUI(_seId)
    end
  end
  SetActionInputMode(INPUT_MODE_NO_INPUT, true)
  RequestLoadingBattle(_mapId)
  _retry(SYS_WaitLoadingEnd, _mapId)
  _retry(WaitEncounterEffect)
  MapOnPreStartTransitionFadeOut({MapIdNext = _mapId, NicolaSoundBgmManagementTypeOnMapTransitionPreMapBgm = bgmManageType})
  FadeOut(EFadingPriorityTopMost, 0)
  _retry(SYS_WaitFadeOut, EFadingPriorityTopMost)
  MapOnCompleteTransitionFadeOut()
  MapOnPreChangeLevel("", _mapId)
  PlaySimpleLoadingUI()
  InvisibleAllVisibledSubLevels(_mapId, true)
  CameraManagerPreChangeMap()
  SetVisibleLightingActors(false)
  OnBeforeVisibleBattleLevel()
  ChangeBattleCamera()
  ChangeVisibleSubLevel(_mapId)
  _retry(SYS_WaitVisibleSubLevel, _mapId)
  MapOnPostChangeLevel("", _mapId)
  SetPostProcessVolumeInfo(_mapId, "")
  SetLightDirRotatorInfo(_mapId, "")
  SetDirectionalLightInfo(_mapId, "")
  UpdateEffectParameterCollectionTime()
  if _mapConstructFuncName ~= "" then
    local f = loadstring(_mapConstructFuncName .. "()")
    pcall(f)
  end
  _retry(WaitLoadingBattleAsset)
  OnAfterVisibleBattleLevel()
  SetNicolaEnableDOF(true)
  SetVisibleLightingActors(true)
  SetVolumetricLightMapByMap(_mapId)
  ClearTriggerEvent()
  RefreshActorFadingTriggers()
  CameraManagerPostChangeMap(_mapId)
  WaitFrame(2)
  ActivateActorFading()
  WaitFrame(2)
  if IsBattleEffectLoading() then
    _retry(SYS_WaitBattleEffectLoading)
  end
  StopSimpleLoadingUI()
  _retry(WaitLoadUIBattleMenu)
  if isNotChangeBGM ~= true then
    _retry(SYS_WaitFinishBGM)
    Wait(SoundGetBattleAdditionalMarginSecPostFadeOutPreBgm())
    local workBgmId = (bgmId == nil or bgmId == "") and "BGM_21_Battle_Theme" or bgmId
    PlayBattleBGM(workBgmId, 0)
  end
  CmdFadeInOnInitialFadeInPostMapTransitionNoWait(EFadingPriorityTopMost, 0, GetCurrentMapId(), {NicolaSoundBgmManagementTypeOnMapTransition = nil})
  EndEncounterEffect(_fadeIn)
  _retry(WaitEncounterEffect)
  SetActionInputMode(INPUT_MODE_NO_INPUT, false)
  OnEndTransitionBattle()
  MapTimeNotifyEndSystemProcessing()
  FinishTransition()
  print("TransitionBattle End")
end

function TransitionBattleToLevel(BeginOverlap, tbl, ...)
  print("TransitionBattleToLevel Start")
  local _mapId, _startPointName, _environmentLightOn, _fadeOut, _fadeIn, _mapConstructFuncName, _seId, _orientation, isLose, isLoad, bDoAutoSave, bDoRetry, battleEventId = ...
  StartTransition(_mapId)
  local isBattleRoad = IsBattleRoad()
  MapTimeNotifyStartSystemProcessing()
  SetActionInputMode(INPUT_MODE_NO_INPUT, true)
  if _seId ~= "" then
    PlaySE2D(_seId, "PLAYER")
  end
  MapOnPreStartTransitionFadeOut({MapIdNext = _mapId})
  FadeOut(EFadingPriorityTopMost, _fadeOut)
  _retry(SYS_WaitFadeOut, EFadingPriorityTopMost)
  MapOnCompleteTransitionFadeOut()
  PlaySimpleLoadingUI()
  local playerPos = GetActorLocation("PLAYER")
  ChangeDefaultCamera()
  CameraManagerPreChangeMap()
  local isField = IsFieldMapId(_mapId)
  if isLose == true and isBattleRoad == false and bDoRetry == false then
    SetMapDefaultTime(_mapId)
  end
  RequestLoading(_mapId)
  _retry(SYS_WaitLoadingEnd, _mapId)
  local prevMapId = "MAPLIST_BATTLE_PLAIN00"
  MapOnPreChangeLevel(prevMapId, _mapId)
  if isField == false then
    ChangeVisibleSubLevel(_mapId)
    _retry(SYS_WaitVisibleSubLevel, _mapId)
    MapOnPostChangeLevel(prevMapId, _mapId)
    SetPostProcessVolumeInfo(_mapId, "")
    SetLightDirRotatorInfo(_mapId, "")
    SetDirectionalLightInfo(_mapId, "")
    UpdateEffectParameterCollectionTime()
    UpdateTownDungeonMapParameterCollection(_mapId)
    if _startPointName ~= "" then
      SpawnPlayerUnitByPlayerStart(_startPointName, _orientation, 192, 0.5, 0.5)
      local flag = isLose == true and isBattleRoad == false and bDoRetry == false
      OnCompletePlayerSpawned(prevMapId, _mapId, flag)
    end
  else
    InvisibleAllVisibledSubLevels(_mapId, false)
    local startPos = GetPlayerCharacterLocation()
    ChangeVisibleSubLevel(_mapId)
    CameraManagerPreVisibleFieldMap(startPos)
    WaitOneFrame()
    SetEnableFieldLoop(IsUndergroundMap(_mapId) == false)
    OnEnterFieldMap()
    WaitFrame(1)
    _retry(SYS_WaitVisibleFieldMapAtLocation, startPos, true, true)
    _retry(SYS_WaitVisibleSubLevelOnly, _mapId)
    MapOnPostChangeLevel(prevMapId, _mapId)
    SetDoSkySpheresFollowPlayerCamera(true)
    SetPostProcessVolumeInfo(_mapId, "")
    SetLightDirRotatorInfo(_mapId, "")
    SetDirectionalLightInfo(_mapId, "")
    UpdateEffectParameterCollectionTime()
    ReOpenVehicleGuide()
    if isLose and isLoad and _startPointName ~= "" then
      SpawnPlayerUnitByPlayerStart(_startPointName, _orientation, 192, 0.5, 0.5)
      OnCompletePlayerSpawned(prevMapId, _mapId)
    end
  end
  StopSimpleLoadingUI()
  SetDispMiniMap(true)
  SetVisibleLightingActors(true)
  if _startPointName == "" then
    SetActorLocation("PLAYER", playerPos)
  end
  ResetEncount()
  ClearTriggerEvent()
  RefreshActorFadingTriggers()
  CameraManagerPostChangeMap(_mapId)
  WaitFrame(2)
  ActivateActorFading()
  WaitFrame(2)
  EventActorPostChangeMap()
  SetNicolaEnableDOFByMap(_mapId)
  SetVolumetricLightMapByMap(_mapId)
  local lancelLoseEventId = "BATTLE_END_LANCEL_LOSE"
  local isPlayEvent = false
  if battleEventId ~= nil and battleEventId ~= "" and bDoRetry == false and (isLose == false or isBattleRoad == true or battleEventId == lancelLoseEventId) then
    print("OnEventBattleEnd " .. battleEventId)
    isPlayEvent = CallBattleEndEvent(battleEventId)
  end
  local isPlayLancelLoseEvent = isPlayEvent and battleEventId == lancelLoseEventId
  local isCallChurchUI = isLose == true and isBattleRoad == false and bDoRetry == false and isPlayLancelLoseEvent == false
  if isPlayEvent == false and bDoRetry == false then
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, _fadeIn, GetCurrentMapId(), {
      NicolaSoundBgmManagementTypeOnMapTransition = isLose and ENicolaSoundBgmManagementTypeOnMapTransitionDEFAULT or ENicolaSoundBgmManagementTypeOnMapTransitionRESUME
    })
    if isCallChurchUI == false then
      WaitPlayerOnGround()
    end
  end
  if isField or bDoAutoSave == true then -- AP
    RequestAutoSave()
    WaitFrame(1)
  end
  SetActionInputMode(INPUT_MODE_NO_INPUT, false)
  MapTimeNotifyEndSystemProcessing()
  MapTimeNotifyEndBattle()
  if isCallChurchUI then
    if isLoad == true then
      CallChurchUIRestart(CHURCH_MODE_GAME_START)
    else
      CallChurchUIRestart(CHURCH_MODE_DEFEATED)
    end
  end
  FinishTransition()
  if bDoRetry == true then
    StartRetryBattle()
  end
  print("TransitionBattleToLevel End")
  -- AP
  if isField and not bDoRetry then
    AP.GiveItemsIfAvailable();
  end
  -- AP end
end

function TransitionInn()
  print("TransitionInn Start")
  local _mapId = GetSysInfo(SysInfo.TRANSITION_INN_MAP_ID)
  local _startPointName = GetSysInfo(SysInfo.TRANSITION_INN_START_POINT_NAME)
  local _environmentLightOn = GetSysInfo(SysInfo.TRANSITION_INN_ENVIRONMENT_LIGHT_FLAG)
  local isTransition = _startPointName ~= ""
  if isTransition == false then
    OnEndTransitionInn()
  else
    StartTransition(_mapId)
    local isField = IsFieldMapId(_mapId)
    MapTimeNotifyStartSystemProcessing()
    CameraManagerPreChangeMap()
    PlaySimpleLoadingUI()
    if isField then
      SetPostProcessVolumeInfo(_mapId, "")
      SetLightDirRotatorInfo(_mapId, "")
      SetDirectionalLightInfo(_mapId, "")
      _retry(FTS_WaitCatchingLightDirRotator)
      RequestLightDirRotatorUpdating()
      UpdateEffectParameterCollectionTime()
    else
      RequestReloading(_mapId)
      _retry(SYS_WaitLoadingEnd, _mapId)
      MapOnPreChangeLevel("", _mapId)
      ReplaceVisibleSubLevel(_mapId)
      _retry(SYS_WaitVisibleSubLevel, _mapId)
      MapOnPostChangeLevel("", _mapId)
      SetPostProcessVolumeInfo(_mapId, "")
      SetLightDirRotatorInfo(_mapId, "")
      SetDirectionalLightInfo(_mapId, "")
      UpdateEffectParameterCollectionTime()
      UpdateTownDungeonMapParameterCollection(_mapId)
      SpawnPlayerUnitByPlayerStart(_startPointName, 0, 192, 0.5, 0.5)
      OnCompletePlayerSpawned(_mapId, _mapId)
    end
    StopSimpleLoadingUI()
    SetVisibleLightingActors(true)
    ClearTriggerEvent()
    RefreshActorFadingTriggers()
    CameraManagerPostChangeMap(_mapId)
    WaitFrame(2)
    ActivateActorFading()
    WaitFrame(2)
    SetNicolaEnableDOFByMap(_mapId)
    SetVolumetricLightMapByMap(_mapId)
    MapTimeNotifyEndSystemProcessing()
    OnEndTransitionInn()
    FinishTransition()
  end
  print("TransitionInn End")
  -- AP
  --AP.GiveItemsIfAvailable();
  -- AP end
end

function GetStartPos(_startPointName)
  return GetPlayerStartPointInAllLevels(_startPointName)
end

function FTS_WaitCatchingLightDirRotator()
  local retVal
  if IsCatchingLightDirRotator() == false then
    retVal = true
  end
  return retVal
end

function WaitPlayerOnGround()
  local limitTime = 15
  SYS_SetFrame(limitTime)
  _retry(SYS_WaitPlayerOnGround, limitTime)
  SYS_SetFrame(0)
end
