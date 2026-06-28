print("Load Script EventScript_D06_Pyramid_3F")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function SubPyramidSwitch(eventInfo, switchNum)
  local activate = true
  local nothingHappens = false
  local buttonIsPressed = false
  local fall = false
  local waitTimeAfterClosingWindow = 0.2
  local waitTimeToMatchPitfallSe = 1
  local waitTimeToMatchSandfallsSe = 1
  local switchesPosY = {
    4300,
    5100,
    -1500,
    -700
  }
  local fallPlayerTag = ""
  SetNicolaApertureRate(100, 0)
  CmdChangeStageCameraToGlobalPoint(-2300, switchesPosY[switchNum], 600, CAMERA_BLEND_EASE_IN_OUT, 1.5, 2, 1500, {
    Yaw = 0,
    Pitch = -25,
    Roll = 0
  })
  local result = CmdChoiceMessage("NPC_Talk_Pyramid_3F_SearchObj_Switch_1")
  if result == true then
    CloseMessage()
    if switchNum == 2 then
      if GetFlag(Flag.FS2) == true then
        buttonIsPressed = true
      else
        Wait(waitTimeAfterClosingWindow)
        PlaySEEvent("EVESE_PYRAMID_SWITCH")
        CmdPlayOpenAnimSearchObj(eventInfo[1])
        if GetFlag(Flag.FE246) == true then
          if GetFlag(Flag.FS2) == false then
            nothingHappens = true
            SetFlag(Flag.FS2, true)
          end
        else
          SetFlag(Flag.FS2, true)
          SetFlag(Flag.FS0, true)
        end
      end
    elseif switchNum == 1 then
      if GetFlag(Flag.FS1) == true then
        buttonIsPressed = true
      else
        Wait(waitTimeAfterClosingWindow)
        PlaySEEvent("EVESE_PYRAMID_SWITCH")
        CmdPlayOpenAnimSearchObj(eventInfo[1])
        if GetFlag(Flag.FE246) == true then
          if GetFlag(Flag.FS1) == false then
            nothingHappens = true
            SetFlag(Flag.FS1, true)
          end
        else
          fall = true
          PlayOpenAnimSearchObj("BP_SearchAnimEvent_D06_Pitfall_SW_01_01")
          Wait(waitTimeToMatchPitfallSe)
          PlaySEEvent("EVESE_PYRAMID_PITFALL_2")
          Wait(waitTimeToMatchSandfallsSe)
          PlaySEEvent("EVESE_PYRAMID_SAND_FALLS")
          WaitPlayAnimSearchObj("BP_SearchAnimEvent_D06_Pitfall_SW_01_01")
          SetVisibleActor("BP_SearchAnimEvent_D06_3F_Pitfall_InvisibleFloor_E_01", false)
          SetFlag(Flag.FS1, true)
          fallPlayerTag = "FromFallR"
        end
      end
    elseif switchNum == 4 then
      if GetFlag(Flag.FS4) == true then
        buttonIsPressed = true
      else
        Wait(waitTimeAfterClosingWindow)
        PlaySEEvent("EVESE_PYRAMID_SWITCH")
        CmdPlayOpenAnimSearchObj(eventInfo[1])
        if GetFlag(Flag.FE246) == true then
          if GetFlag(Flag.FS4) == false then
            nothingHappens = true
            SetFlag(Flag.FS4, true)
          end
        else
          fall = true
          PlayOpenAnimSearchObj("BP_SearchAnimEvent_D06_Pitfall_SW_04_01")
          Wait(waitTimeToMatchPitfallSe)
          PlaySEEvent("EVESE_PYRAMID_PITFALL_2")
          Wait(waitTimeToMatchSandfallsSe)
          PlaySEEvent("EVESE_PYRAMID_SAND_FALLS")
          WaitPlayAnimSearchObj("BP_SearchAnimEvent_D06_Pitfall_SW_04_01")
          SetVisibleActor("BP_SearchAnimEvent_D06_3F_Pitfall_InvisibleFloor_W_01", false)
          SetFlag(Flag.FS4, true)
          fallPlayerTag = "FromFallL"
        end
      end
    elseif switchNum == 3 then
      if GetFlag(Flag.FS3) == true then
        buttonIsPressed = true
      else
        Wait(waitTimeAfterClosingWindow)
        PlaySEEvent("EVESE_PYRAMID_SWITCH")
        CmdPlayOpenAnimSearchObj(eventInfo[1])
        if GetFlag(Flag.FE246) == true then
          if GetFlag(Flag.FS3) == false then
            nothingHappens = true
            SetFlag(Flag.FS3, true)
          end
        elseif GetFlag(Flag.FS0) == true then
          SetFlag(Flag.FS3, true)
          SetFlag(Flag.FS5, true)
        else
          fall = true
          PlayOpenAnimSearchObj("BP_SearchAnimEvent_D06_Pitfall_SW_03_01")
          Wait(waitTimeToMatchPitfallSe)
          PlaySEEvent("EVESE_PYRAMID_PITFALL_2")
          Wait(waitTimeToMatchSandfallsSe)
          PlaySEEvent("EVESE_PYRAMID_SAND_FALLS")
          WaitPlayAnimSearchObj("BP_SearchAnimEvent_D06_Pitfall_SW_03_01")
          SetVisibleActor("BP_SearchAnimEvent_D06_3F_Pitfall_InvisibleFloor_W_01", false)
          fallPlayerTag = "FromFallL"
        end
      end
    end
  else
    CloseMessage()
    CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
    activate = false
  end
  if nothingHappens == true then
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_FAILURE_1")
    activate = false
  end
  if buttonIsPressed == true then
    CmdEventClosingMessage("NPC_Talk_Pyramid_3F_SearchObj_Switch_2")
    activate = false
  end
  if GetFlag(Flag.FS5) == true then
    CmdMessage("NPC_Talk_Pyramid_3F_SearchObj_Switch_3")
    PlaySEEvent("EVESE_PYRAMID_DOOR_OPEN")
    PlayOpenAnimSearchObj("BP_SearchAnimEvent_D06_3F_SwitchDoor_01")
    SetVisibleActor("BP_SearchEvent_Ground_Box_01", false)
    PlayCameraShake("Event_Middle", 1)
    Wait(1.5)
    CmdEventClosingMessage("NPC_Talk_Pyramid_3F_SearchObj_Switch_4")
    SetFlag(Flag.FE246, true)
    SetFlag(Flag.FS5, false)
    RequestAutoSaveFromEvent()
  else
    CloseMessage()
  end
  if fall == true then
    PlaySEUI("SYSSE_TD_FALL")
    Wait(2)
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    ChangeMap("MAPLIST_D06R0201", fallPlayerTag, ORIENTATION_CURRENT)
  else
    if activate == true then
      Wait(0.5)
    end
    CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
  end
end

function Pyramid_3F_Switch_01(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SubPyramidSwitch(eventInfo, 1)
  EventEnd(eventInfo, "")
end

function Pyramid_3F_Switch_02(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SubPyramidSwitch(eventInfo, 2)
  EventEnd(eventInfo, "")
end

function Pyramid_3F_Switch_03(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SubPyramidSwitch(eventInfo, 3)
  EventEnd(eventInfo, "")
end

function Pyramid_3F_Switch_04(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SubPyramidSwitch(eventInfo, 4)
  EventEnd(eventInfo, "")
end

function Pyramid_3F_Door_00(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Pyramid_3F_SearchObj_Door_1")
  EventEnd(eventInfo, "")
end

function Pyramid_3F_Boss_01(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE63) == true or GetFlag(Flag.FE247) == true or GetFlag(Flag.FF0) == true then
  else
    SetFlag(Flag.FF0, true)
    RequestPreloadEventBattle("BATTLE_EVENT_NEWBOSS_PYRAMID_1")
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    if GetMapTimeFrame() == MAPTIME_NIGHT then
      DestroyNpc("Flyingflayer_L3")
    else
      DestroyNpc("Flyingflayer_L1")
    end
    EndSkillTransformNoEffect()
    EndSkillInvisibleNoEffect()
    CmdPlayEventSequenceNextEventBattle(0)
    CmdStartEventBattle("BATTLE_EVENT_NEWBOSS_PYRAMID_1")
  end
  EventEnd(eventInfo, "")
end

function Pyramid_3F_Boss_02(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    DestroyNpc("Flyingflayer_L3")
  else
    DestroyNpc("Flyingflayer_L1")
  end
  SetPlayerLocation({
    X = 1500,
    Y = 1800,
    Z = 350
  })
  Wait(0.1)
  CmdPlayEventSequencePrevEventBattle(1)
  SetPlayerLocation({
    X = 3500,
    Y = 1800,
    Z = 700
  })
  Wait(0.1)
  TurnParty(1, 0)
  Wait(0.1)
  PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WARP)
  Wait(0.1)
  CmdChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 1)
  SetEventVolumeEnabled("Pyramid_3F_Boss_01", false)
  local bgmFadeTime = 0.5
  PlayBGM(GetCurrentMapBgmId(), bgmFadeTime)
  CmdFadeIn(EFadingPriorityTopMost, bgmFadeTime)
  SetFlag(Flag.FE247, true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function Pyramid_3F_MAIN_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  DisableEventFastForwardUI()
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  EventEnd(eventInfo, "")
end

function Pyramid_3F_IMPORTANT_MAGIC_KEY(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, "")
  CmdTreasure_Important(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  -- AP
  ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
  else
    SetFlag(Flag.FE55, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_PYRAMID_GetMagicKey, true)
  end
  -- AP end
  EventEnd(eventInfo, "")
end

function Pyramid_1F_SUB_0_MBR_SCOUT_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local volumeTag = (...)
  if volumeTag == "SuccessCollision" then
  elseif volumeTag == "FailCollision" then
  elseif volumeTag == nil then
  end
  local TextTable = {
    Disguise = "NPC_Talk_Pyramid_1F_SUB_0_ACTOR_0010_010_2",
    RaMirror1 = "NPC_Talk_Pyramid_1F_SUB_0_ACTOR_0010_010_3",
    RaMirror2 = "NPC_Talk_Pyramid_1F_SUB_0_ACTOR_0010_010_4",
    Success1 = "NPC_Talk_Pyramid_1F_SUB_0_ACTOR_0010_010_5",
    Success2 = "NPC_Talk_Pyramid_1F_SUB_0_ACTOR_0010_010_6",
    Success3 = "NPC_Talk_Pyramid_1F_SUB_0_ACTOR_0010_010_7"
  }
  local MonsterScoutId = "MBR_SCOUT_IMP_D06_Pyramid_3F"
  local ActorId
  local mapTime = GetMapTimeFrame()
  if mapTime == MAPTIME_DAYTIME then
    ActorId = "Pyramid_3F_IMP_01_L1"
  elseif mapTime == MAPTIME_EVENING then
    ActorId = "Pyramid_3F_IMP_01_L2"
  elseif mapTime == MAPTIME_NIGHT then
    ActorId = "Pyramid_3F_IMP_01_L3"
  end
  local MonsterLocation = GetNpcLocation(ActorId)
  local PlayerLocation = {
    X = MonsterLocation.X - 340,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z
  }
  local PlayerLook = {Chara = 1, Turn = 0}
  local CameraParam = {
    X = MonsterLocation.X - 150,
    Y = MonsterLocation.Y,
    Z = MonsterLocation.Z + 50,
    Distance = 1800
  }
  CmdMessage("NPC_Talk_Pyramid_1F_SUB_0_ACTOR_0010_010_1")
  MonsterScoutScript(MonsterScoutId, TextTable, ActorId, PlayerLocation, CameraParam, PlayerLook, volumeTag)
  EventEnd(eventInfo, "")
end
