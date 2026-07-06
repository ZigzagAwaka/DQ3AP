print("Load Script EventScript_H12_ShallowShrine_B1F")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function ShallowShrine_B1F_SUB_0_VOLUME_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  RequestPreloadEventScreenShot("EVENTSCREENSHOT_ShoalShrine001")
  SetDispMiniMap(false)
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Corpse_ShallowShrine = "ShallowShrine_B1F_Corpse_01_L3"
  else
    Corpse_ShallowShrine = "ShallowShrine_B1F_Corpse_01_L1"
  end
  SoundTransitionVolumeRateByCategory(ENicolaSoundCategoryAMBIENT, 0, 1)
  PauseMainBGM(true, 1)
  SetEventFadeAlpha(0.5)
  FadeOut(EFadingPriorityEventUIBackGround, 1.5)
  CmdChangeStageCameraToGlobalPoint(4400, 1500, 140, CAMERA_BLEND_LINEAR, 1.5, 0, 1400, {
    Yaw = 0,
    Pitch = -35,
    Roll = 0
  })
  Wait(0.8)
  CmdMessage("NPC_Talk_ShallowShrine_B1F_SUB_0_VOLUME_0110_010_1")
  CmdMessage("NPC_Talk_ShallowShrine_B1F_SUB_0_VOLUME_0110_010_2")
  CmdShowEventScreenShotUIDefaultParam("EVENTSCREENSHOT_ShoalShrine001")
  CmdEventClosingMessage("NPC_Talk_ShallowShrine_B1F_SUB_0_VOLUME_0110_010_3")
  CloseMessage()
  CmdCloseEventScreenShotUIDefaultParam()
  Wait(1.5)
  PlaySEEvent("EVESE_SHALLOWSHRINE_DEADBODY_NECK")
  CmdSetNpcAnimation(Corpse_ShallowShrine, AnimationType.Act4, 1, EFlipbookPlayTypeStopEnd, true)
  Wait(1)
  FadeIn(EFadingPriorityEventUIBackGround, 0.5)
  SetFlag(Flag.FE770, true)
  SetVisibleActor("BP_TriggerVolume_Corpse", false)
  SoundTransitionVolumeRateByCategory(ENicolaSoundCategoryAMBIENT, 1, 0.5)
  PauseMainBGM(false, 0.5)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  SetDispMiniMap(true)
  if GetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_SHALLOWSHRINE_TalkCorpse) == false then
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_SHALLOWSHRINE_TalkCorpse, true)
  end
  CmdSetNpcAnimation(Corpse_ShallowShrine, AnimationType.Act5, 1, 0, EFlipbookPlayTypeStopEnd, true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function ShallowShrine_B1F_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_ShallowShrine_B1F_SUB_0_ACTOR_0110_010_7")
  EventEnd(eventInfo, "")
end

function ShallowShrine_B1F_SUB_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_ShallowShrine_B1F_SUB_0_ACTOR_0110_010_7")
  EventEnd(eventInfo, "")
end

function ShallowShrine_B1F_Treasure_Important(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  print("Treasure_Normal execute, TreasureId : " .. tostring(TreasureId) .. ", Item : " .. tostring(ItemId) .. ", Count : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold) .. ", EnemyId : " .. tostring(EnemyId))
  print("CanObtainItem=" .. tostring(CanObtainItem))
  if CanObtainItem then
    PlaySE("SE_TD_TREASURE_BOX", {
      X = 0,
      Y = 0,
      Z = 0
    }, eventInfo[1])
    CmdPlayOpenAnimSearchObj(eventInfo[1])
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_1")
    SearchObject_ShowMessage(GetTargetActorIdFromEventInfo(eventInfo), TreasureId, ItemId, ItemCount, Gold)
    -- AP
    ItemId = "ITEM_ARCHIPELAGO"
    if ItemId == "ITEM_ARCHIPELAGO" then
    else
      SetFlag(Flag.FE56, true)
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_SHALLOWSHRINE_GetLastKey, true)
    end
    -- AP end
    RequestAutoSaveFromEvent()
  else
    CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_3")
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_2")
  end
  EventEnd(eventInfo, "")
end
