print("Load Script EventScript_C01_Aliahan_Out")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Aliahan_Out_MAIN_0_SCENE_0000_000(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  DisableEventFastForwardUI()
  print("\227\130\185\227\130\173\227\131\131\227\131\151\233\157\158\232\161\168\231\164\186")
  if GetFlag(Flag.FE236) == false and GetMapTimeFrame() == MAPTIME_NIGHT and GetFlag(Flag.FD33) == false then
    SetVisibleActorsTag("HomeDoor", true)
  end
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  if GetFlag(Flag.FD10) == true and GetFlag(Flag.FE954) == false then
    CmdCallTutorialUI("INFORMATION_SHOP")
    CmdCallTutorialUI("INFORMATION_CHURCH")
    SetFlag(Flag.FE954, true)
  end
  if GetFlag(Flag.FE128) == false then
    CheckBurg()
  end
  EventEnd(eventInfo, "", false, true)
end

function Aliahan_Out_MAIN_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetPartyOpacity(1, 0)
  SetPartyOpacity(2, 0)
  SetPartyOpacity(3, 0)
  SetPartyOpacity(4, 0)
  ChangeNpcOpacity("Aliahan_Out_HerosMother_01_L1", 0, 0, false)
  SetVisibleActor("BP_EF_Env_Bird_Spparow_01_2", false)
  CmdPlayEventSequencePrevChangeMap(0, GetCurrentMapId(), nil, nil, nil, false)
  SetDispMiniMap(false)
  EnableCameraLag(false)
  SetPlayerLocation({
    X = 6800,
    Y = 8400,
    Z = 90
  })
  TurnParty(1, 0)
  SetPartyOpacity(1, 1)
  SetPartyOpacity(2, 1)
  SetPartyOpacity(3, 1)
  SetPartyOpacity(4, 1)
  ChangeNpcOpacity("Aliahan_Out_HerosMother_01_L1", 1, 0, false)
  WaitFrame(1)
  CmdChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 1)
  EnableCameraLag(true)
  CmdFadeIn(EFadingPriorityTopMost, 0.5)
  CmdMessage("NPC_TALK_Aliahan_Out_MAIN_0_SCENE_0010_010_1")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_MAIN_0_SCENE_0010_010_2")
  CmdCallTutorialUI("INFORMATION_FIELDMENU")
  SetDisableTownNameUI()
  SetFlag(Flag.FE157, true)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_ALIAHAN_ArriveCastle, true)
  AP.CheckLocation("STORED_INVENTORY_SIGNAL_0") -- AP
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function Aliahan_Out_MAIN_0_ACTOR_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_MAIN_0_SCENE_0010_010_3")
  EventEnd(eventInfo, "")
end

function Aliahan_Out_MAIN_0_VOLUME_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 0, 2)
  TurnNpc("Aliahan_Out_HerosMother_01_L1", NPC_D_TO_PLAYER)
  local result = CmdChoiceMessage("NPC_TALK_Aliahan_Out_MAIN_0_SCENE_0010_010_4")
  if result == true then
    CmdMessage("NPC_TALK_Aliahan_Out_MAIN_0_SCENE_0010_010_6")
    local result = CmdChoiceMessage("NPC_TALK_Aliahan_Out_MAIN_0_SCENE_0010_010_7")
    if result == true then
      CmdEventClosingMessage("NPC_TALK_Aliahan_Out_MAIN_0_SCENE_0010_010_8")
      CmdMoveNpc("Aliahan_Out_HerosMother_01_L1", {
        X = 6430,
        Y = 8400,
        Z = 0
      }, 200)
      CmdTurnNpc("Aliahan_Out_HerosMother_01_L1", NPC_D_UP)
      Wait(0.5)
      local result = CmdChoiceMessage("NPC_TALK_Aliahan_Out_MAIN_0_SCENE_0010_010_9")
      if result == true then
        CmdMessage("NPC_TALK_Aliahan_Out_MAIN_0_SCENE_0010_010_10")
        SetFlag(Flag.FE158, true)
        SetFlag(Flag.FE159, true)
        local result = CmdChoiceMessage("NPC_TALK_Aliahan_Out_MAIN_0_SCENE_0010_010_11")
        if result == true then
          Wait(0.5)
          CmdEventClosingMessage("NPC_TALK_Aliahan_Out_MAIN_0_SCENE_0010_010_12")
          ChangePartyMemberPersonality(0, "PERSONALITY_MULT")
        else
          Wait(0.5)
          CmdMessage("NPC_TALK_Aliahan_Out_MAIN_0_SCENE_0010_010_13")
          Wait(1)
          CmdEventClosingMessage("NPC_TALK_Aliahan_Out_MAIN_0_SCENE_0010_010_14")
          ChangePartyMemberPersonality(0, "PERSONALITY_CONTRARIAN")
        end
        CmdMoveNpc("Aliahan_Out_HerosMother_01_L1", {
          X = 6000,
          Y = 8400,
          Z = 0
        }, 200)
        CmdMoveNpc("Aliahan_Out_HerosMother_01_L1", {
          X = 5900,
          Y = 8200,
          Z = 0
        }, 200)
        CmdMoveNpc("Aliahan_Out_HerosMother_01_L1", {
          X = 5900,
          Y = 7200,
          Z = 0
        }, 200)
        DestroyNpc("Aliahan_Out_HerosMother_01_L1")
        SetFlag(Flag.FE952, true)
        SetFlag(Flag.FE953, true)
      else
        CloseMessage()
        Wait(0.5)
        MoveNpc("Aliahan_Out_HerosMother_01_L1", {
          X = 6700,
          Y = 8470,
          Z = 0
        }, 200)
        CmdEventClosingMessage("NPC_TALK_Aliahan_Out_MAIN_0_SCENE_0010_010_5")
        WaitMoveNpc("Aliahan_Out_HerosMother_01_L1")
        TurnNpc("Aliahan_Out_HerosMother_01_L1", NPC_D_UP)
        MovePartyRelative({
          X = 200,
          Y = 0,
          Z = 0
        })
        Wait(0.6)
      end
    else
      CmdEventClosingMessage("NPC_TALK_Aliahan_Out_MAIN_0_SCENE_0010_010_5")
      TurnNpc("Aliahan_Out_HerosMother_01_L1", NPC_D_UP)
      MovePartyRelative({
        X = 200,
        Y = 0,
        Z = 0
      })
      Wait(0.6)
    end
  else
    CmdEventClosingMessage("NPC_TALK_Aliahan_Out_MAIN_0_SCENE_0010_010_5")
    TurnNpc("Aliahan_Out_HerosMother_01_L1", NPC_D_UP)
    MovePartyRelative({
      X = 200,
      Y = 0,
      Z = 0
    })
    Wait(0.6)
  end
  EventEnd(eventInfo, "")
end

function Aliahan_Out_MAIN_0_SCENE_0010_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetPartyOpacity(1, 0)
  SetPartyOpacity(2, 0)
  SetPartyOpacity(3, 0)
  SetPartyOpacity(4, 0)
  SetVisibleActor("BP_EF_Env_Bird_Spparow_01_2", false)
  CmdPlayEventSequencePrevChangeMap(1, GetCurrentMapId())
  PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WARP)
  SetPartyOpacity(1, 1)
  SetPartyOpacity(2, 1)
  SetPartyOpacity(3, 1)
  SetPartyOpacity(4, 1)
  CmdChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 1)
  CmdFadeIn(EFadingPriorityTopMost, 0.5)
  SetDisableRula(true)
  SetFlag(Flag.FE163, true)
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_VOLUME_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EndSkillInvisibleNoEffect()
  EndSkillTransformNoEffect()
  ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 0, 2)
  TurnNpc("Aliahan_Out_Guard_06_L1", NPC_D_TO_PLAYER)
  TurnNpc("Aliahan_Out_Guard_07_L1", NPC_D_TO_PLAYER)
  CmdEventClosingMessage("NPC_Talk_Aliahan_Out_SUB_0_VOLUME_0010_010_1")
  TurnNpc("Aliahan_Out_Guard_06_L1", NPC_D_LOW)
  TurnNpc("Aliahan_Out_Guard_07_L1", NPC_D_UP)
  MovePartyRelative({
    X = 0,
    Y = 200,
    Z = 0
  })
  Wait(0.6)
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_VOLUME_0010_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EndSkillInvisibleNoEffect()
  EndSkillTransformNoEffect()
  ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 0, 2)
  TurnNpc("Aliahan_Out_Guard_02_L1", NPC_D_TO_PLAYER)
  TurnNpc("Aliahan_Out_Guard_03_L1", NPC_D_TO_PLAYER)
  CmdEventClosingMessage("NPC_Talk_Aliahan_Out_SUB_0_VOLUME_0010_010_1")
  TurnNpc("Aliahan_Out_Guard_02_L1", NPC_D_LOW)
  TurnNpc("Aliahan_Out_Guard_03_L1", NPC_D_UP)
  MovePartyRelative({
    X = 0,
    Y = -200,
    Z = 0
  })
  Wait(0.6)
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_VOLUME_0010_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EndSkillInvisibleNoEffect()
  EndSkillTransformNoEffect()
  ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 0, 2)
  TurnNpc("Aliahan_Out_Guard_04_L1", NPC_D_TO_PLAYER)
  TurnNpc("Aliahan_Out_Guard_05_L1", NPC_D_TO_PLAYER)
  CmdEventClosingMessage("NPC_Talk_Aliahan_Out_SUB_0_VOLUME_0010_010_1")
  TurnNpc("Aliahan_Out_Guard_04_L1", NPC_D_LEFT)
  TurnNpc("Aliahan_Out_Guard_05_L1", NPC_D_RIGHT)
  MovePartyRelative({
    X = 200,
    Y = 0,
    Z = 0
  })
  Wait(0.6)
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0110_010_1")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0110_010_2")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0110_020_1")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0110_020_2")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0110_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0110_030_1")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0110_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0110_040_1")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0210_010_1")
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0210_010_2")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0210_010_3")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0210_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0210_020_1")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0210_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local result = CmdChoiceMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0210_030_1")
  if result == true then
    CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0210_030_2")
  else
    CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0210_030_3")
  end
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0210_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0210_040_1")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0210_040_2")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0210_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0210_050_1")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0310_010_1")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0310_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0310_020_1")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0310_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0310_030_1")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0310_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0310_040_1")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0310_040_2")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0310_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local result = CmdChoiceMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0310_050_1")
  if result == true then
    CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0310_050_2")
  else
    CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0310_050_3")
  end
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0410_010_1")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0410_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0410_020_1")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0410_020_2")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0410_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0410_030_1")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0410_030_2")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0410_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0410_040_1")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0510_010_1")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0510_010_2")
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_0510_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0510_020_1")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0510_020_2")
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_0510_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0510_030_1")
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_0510_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0510_040_1")
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_0610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local result = CmdChoiceMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0610_010_1")
  if result == true then
    CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0610_010_2")
  else
    CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0610_010_3")
  end
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_0610_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0610_020_1")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0610_020_2")
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_0610_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0610_030_1")
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_0610_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0610_020_1")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0610_020_2")
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_0610_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0610_020_1")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0610_020_2")
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_0710_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0710_010_1")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0710_010_2")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0710_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0710_020_1")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0710_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0710_030_1")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0710_030_2")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_0820_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if CheckFadingJenny() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Kiesari_11")
  elseif CheckTransformMonster() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_10")
  elseif CheckTransformSlime() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Slime_2")
  else
    if CheckLeaderGender() == true then
      local result = CmdChoiceMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0820_010_1")
    else
      local result = CmdChoiceMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0820_010_2")
    end
    CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0820_010_3")
  end
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_0820_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if CheckFadingJenny() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Kiesari_11")
  elseif CheckTransformMonster() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_10")
  elseif CheckTransformSlime() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Slime_2")
  else
    CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0820_020_1")
    CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0820_020_2")
  end
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_0820_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if CheckFadingJenny() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Kiesari_11")
  elseif CheckTransformMonster() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_10")
  elseif CheckTransformSlime() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Slime_2")
  else
    CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0820_030_1")
  end
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_0820_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if CheckFadingJenny() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Kiesari_11")
  elseif CheckTransformMonster() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_10")
  elseif CheckTransformSlime() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Slime_2")
  else
    CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0820_040_1")
  end
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_0920_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_0920_010_1")
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_1020_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local HeroNumber = CheckHero()
  if HeroNumber == 0 then
    CmdMessage("NPC_Talk_Aliahan_House1_1F_SUB_0_ACTOR_0110_020_3")
    CmdEventClosingMessage("NPC_Talk_Aliahan_House1_1F_SUB_0_ACTOR_0110_020_4")
  else
    local ResultHeroSubsistence = CheckHeroSubsistence()
    if ResultHeroSubsistence == true then
      CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_1020_010_1")
      CmdEventClosingMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_1020_010_2")
      SetVisibleActorsTag("HomeDoor", false)
      DisableNpcCollisionNpcToPlayer("Aliahan_Out_HerosMother_01_L3", true)
      CmdMoveNpc("Aliahan_Out_HerosMother_01_L3", {
        X = 2370,
        Y = 3430,
        Z = 0
      }, -1)
      Wait(0.2)
      OpenDoor("BP_Door_Normal_C01_House_01_Door_01", false, "")
      Wait(0.5)
      CmdMoveNpc("Aliahan_Out_HerosMother_01_L3", {
        X = 2480,
        Y = 3430,
        Z = 0
      }, -1)
      DisableNpcCollisionNpcToPlayer("Aliahan_Out_HerosMother_01_L3", false)
      CmdChangeNpcOpacity("Aliahan_Out_HerosMother_01_L3", 0, 1, false)
      DestroyNpc("Aliahan_Out_HerosMother_01_L3")
      SetFlag(Flag.FD33, true)
    else
      CmdMessage("NPC_TALK_Aliahan_House1_1F_SUB_0_ACTOR_0110_010_10")
      CmdMessage("NPC_TALK_Aliahan_House1_1F_SUB_0_ACTOR_0110_010_11")
      CmdEventClosingMessage("NPC_TALK_Aliahan_House1_1F_SUB_0_ACTOR_0110_010_12")
    end
  end
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_1110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdCallShopUI("SHOP_ALIAHAN_ITEM_0001")
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_1210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_1210_010_1")
  CmdCallChurchUI("CHURCH_ALIAHAN_0002")
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_1210_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_1210_020_1")
  CmdCallChurchUI("CHURCH_ALIAHAN_0002")
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_1210_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_TALK_Aliahan_Out_SUB_0_ACTOR_1210_030_1")
  CmdCallChurchUI("CHURCH_ALIAHAN_0002")
  EventEnd(eventInfo, "")
end

function Aliahan_Out_SUB_0_ACTOR_1310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Aliahan_Out_SUB_0_ACTOR_1310_010_1")
  CmdEventClosingMessage("NPC_Talk_Aliahan_Out_SUB_0_ACTOR_1310_010_2")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_1410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Aliahan_Out_SUB_0_ACTOR_1410_010_1")
  CmdEventClosingMessage("NPC_Talk_Aliahan_Out_SUB_0_ACTOR_1410_010_2")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_1510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Aliahan_Out_SUB_0_ACTOR_1510_010_1")
  CmdEventClosingMessage("NPC_Talk_Aliahan_Out_SUB_0_ACTOR_1510_010_2")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_1610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Aliahan_Out_SUB_0_ACTOR_1610_010_1")
  CmdEventClosingMessage("NPC_Talk_Aliahan_Out_SUB_0_ACTOR_1610_010_2")
  EventEnd(eventInfo, "", false)
end

function Aliahan_Out_SUB_0_ACTOR_1710_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_USE_ITEM_CHIMERA_WING")
  CmdMessage("NPC_TALK_Aliahan_Luida_1F_SUB_0_ACTOR_0610_010_1")
  CmdEventClosingMessage("NPC_TALK_Aliahan_Luida_1F_SUB_0_ACTOR_0610_010_2")
  EventEnd(eventInfo, "")
end

function Aliahan_Out_TUTO_0_VOLUME_0010_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdCallTutorialUI("INFORMATION_BAR")
  SetFlag(Flag.FE952, true)
  EventEnd(eventInfo, "")
end

function SearchObject_Well(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdSearchObjWellChangeMap("MAPLIST_C01R0701", "FromOut")
  EventEnd(eventInfo, "")
end
