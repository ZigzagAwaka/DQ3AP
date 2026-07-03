print("Load Script EventScript_D05_UndergroundLake_B4F")

function UndergroundLake_B4F_Treasure(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  print("Treasure_Normal execute, TreasureId : " .. tostring(TreasureId) .. ", Item : " .. tostring(ItemId) .. ", Count : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold) .. ", EnemyId : " .. tostring(EnemyId))
  print("CanObtainItem=" .. tostring(CanObtainItem))
  if CanObtainItem then
    SetNicolaApertureRate(100, 0)
    SetDispMiniMap(false)
    PlaySE("SE_TD_TREASURE_BOX", {
      X = 0,
      Y = 0,
      Z = 0
    }, eventInfo[1])
    CmdPlayEffectSearchObject(eventInfo[1], "DeleteEffect")
    CmdPlayOpenAnimSearchObj(eventInfo[1])
    CmdMessage("NPC_Talk_UndergroundLake_B4F_SearchObj_Treasure_1")
    SearchObject_ShowMessage(GetTargetActorIdFromEventInfo(eventInfo), TreasureId, ItemId, ItemCount, Gold)
    CmdEventClosingMessage("NPC_Talk_UndergroundLake_B4F_SearchObj_Treasure_2")
    CloseMessage()
    SoundTransitionVolumeRateByCategory(ENicolaSoundCategoryAMBIENT, 0, 1)
    CmdFadeOut(EFadingPriorityUIBackGround, 0.5)
    CmdChangeStageCameraToGlobalPoint(6050, 5250, 800, CAMERA_BLEND_EASE_IN, 0, 0, 2000, {
      Yaw = 0,
      Pitch = -30,
      Roll = 0
    })
    CmdFadeIn(EFadingPriorityUIBackGround, 1)
    ChangeStageCameraToGlobalPoint(7550, 3650, 500, CAMERA_BLEND_EASE_IN, 20, 1, 1700, {
      Yaw = 0,
      Pitch = -30,
      Roll = 0
    })
    SetEventFadeAlpha(0.6)
    FadeOut(EFadingPriorityEventUIBackGround, 4)
    Wait(2)
    CmdMessageDetail("NPC_Talk_UndergroundLake_B4F_SearchObj_Treasure_3", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
    CmdMessageDetail("NPC_Talk_UndergroundLake_B4F_SearchObj_Treasure_4", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
    CmdEventClosingMessageDetail("NPC_Talk_UndergroundLake_B4F_SearchObj_Treasure_5", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
    CloseMessage()
    CmdFadeOut(EFadingPriorityUIBackGround, 0.5)
    ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
    FadeIn(EFadingPriorityEventUIBackGround, 0.5)
    CmdFadeIn(EFadingPriorityUIBackGround, 1)
    Wait(0.5)
    SetVisibleActor(eventInfo[1], false)
    -- AP
    ItemId = "ITEM_ARCHIPELAGO"
    if ItemId == "ITEM_ARCHIPELAGO" then
    else
      SetFlag(Flag.FE60, true)
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_UNDERGROUNDLAKE_GetDreamstone, true)
    end
    -- AP end
    SoundTransitionVolumeRateByCategory(ENicolaSoundCategoryAMBIENT, 1, 0.5)
    RequestAutoSaveFromEvent()
  else
  end
  SetDispMiniMap(true)
  EventEnd(eventInfo, "")
end
