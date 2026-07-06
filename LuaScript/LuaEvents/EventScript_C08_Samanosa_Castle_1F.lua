print("Load Script EventScript_C08_Samanosa_Castle_1F")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_MAIN_0_SCENE_0010_000(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  DisableEventFastForwardUI()
  print("\227\130\185\227\130\173\227\131\131\227\131\151\233\157\158\232\161\168\231\164\186")
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    SetFlag(Flag.FS1, true)
  end
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_MAIN_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local pos_x = 4500
  local pos_y = 4500
  local pos_z = 100
  SetPlayerLocation({
    X = pos_x,
    Y = pos_y,
    Z = pos_z
  })
  local HeroNumber = CheckHero()
  SpawnPartyCloneDisableSkill(true, true, true, true)
  if HeroNumber == 1 then
    SetNpcLocation("Party1", {
      X = pos_x,
      Y = pos_y,
      Z = pos_z
    })
    SetNpcLocation("Party2", {
      X = pos_x - 200,
      Y = pos_y - 200,
      Z = pos_z
    })
    SetNpcLocation("Party3", {
      X = pos_x - 300,
      Y = pos_y - 100,
      Z = pos_z
    })
    SetNpcLocation("Party4", {
      X = pos_x - 200,
      Y = pos_y + 100,
      Z = pos_z
    })
  elseif HeroNumber == 2 then
    SetNpcLocation("Party2", {
      X = pos_x,
      Y = pos_y,
      Z = pos_z
    })
    SetNpcLocation("Party1", {
      X = pos_x - 300,
      Y = pos_y - 100,
      Z = pos_z
    })
    SetNpcLocation("Party3", {
      X = pos_x - 200,
      Y = pos_y - 200,
      Z = pos_z
    })
    SetNpcLocation("Party4", {
      X = pos_x - 200,
      Y = pos_y + 100,
      Z = pos_z
    })
  elseif HeroNumber == 3 then
    SetNpcLocation("Party3", {
      X = pos_x,
      Y = pos_y,
      Z = pos_z
    })
    SetNpcLocation("Party1", {
      X = pos_x - 300,
      Y = pos_y - 100,
      Z = pos_z
    })
    SetNpcLocation("Party2", {
      X = pos_x - 200,
      Y = pos_y - 200,
      Z = pos_z
    })
    SetNpcLocation("Party4", {
      X = pos_x - 200,
      Y = pos_y + 100,
      Z = pos_z
    })
  elseif HeroNumber == 4 then
    SetNpcLocation("Party4", {
      X = pos_x,
      Y = pos_y,
      Z = pos_z
    })
    SetNpcLocation("Party1", {
      X = pos_x - 300,
      Y = pos_y - 100,
      Z = pos_z
    })
    SetNpcLocation("Party2", {
      X = pos_x - 200,
      Y = pos_y - 200,
      Z = pos_z
    })
    SetNpcLocation("Party3", {
      X = pos_x - 200,
      Y = pos_y + 100,
      Z = pos_z
    })
  end
  TurnNpc("Party1", NPC_D_UP)
  TurnNpc("Party2", NPC_D_UP)
  TurnNpc("Party3", NPC_D_UP)
  TurnNpc("Party4", NPC_D_UP)
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  CmdChangeStageCameraToGlobalPoint(4000, 4500, 250, CAMERA_BLEND_EASE_IN_OUT, 0, 2, 1200, {
    Yaw = 0,
    Pitch = -12,
    Roll = 0
  })
  Wait(0.1)
  SetTagItemId("ITEM_IMPORTANT_MOD_ROD")
  FadeIn(EFadingPriorityUIBackGround, 0)
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  SetNpcAnimation("Samanosa_Castle_1F_King_Samanosa_True_01_L1", AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_MAIN_0_SCENE_0010_010_1")
  WaitAnimNpc("Samanosa_Castle_1F_King_Samanosa_True_01_L1")
  SetNpcAnimation("Samanosa_Castle_1F_King_Samanosa_True_01_L1", AnimationType.Act1, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_MAIN_0_SCENE_0010_010_2")
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_MAIN_0_SCENE_0010_010_3")
  WaitAnimNpc("Samanosa_Castle_1F_King_Samanosa_True_01_L1")
  SetNpcAnimation("Samanosa_Castle_1F_King_Samanosa_True_01_L1", AnimationType.Act4, 1, EFlipbookPlayTypeStopEnd, false)
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_MAIN_0_SCENE_0010_010_4")
  ItemGetMessageToActor("NPC_Talk_Samanosa_Castle_1F_MAIN_0_SCENE_0010_010_5", "ITEM_ARCHIPELAGO"--[["ITEM_IMPORTANT_MOD_ROD"]], "Samanosa_Castle_1F_King_Samanosa_True_01_L1") -- AP
  Wait(0.2)
  WaitAnimNpc("Samanosa_Castle_1F_King_Samanosa_True_01_L1")
  SetNpcAnimation("Samanosa_Castle_1F_King_Samanosa_True_01_L1", AnimationType.Act6, 1, EFlipbookPlayTypeStopEnd, false)
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_MAIN_0_SCENE_0010_010_6")
  WaitAnimNpc("Samanosa_Castle_1F_King_Samanosa_True_01_L1")
  ChangeSpeaker()
  CmdMoveNpc("Samanosa_Castle_1F_Guard_05_L1", {
    X = 4700,
    Y = 4750,
    Z = pos_z
  }, 400)
  CmdMoveNpc("Samanosa_Castle_1F_Guard_05_L1", {
    X = 4700,
    Y = 4550,
    Z = pos_z
  }, 400)
  TurnNpc("Samanosa_Castle_1F_Guard_05_L1", NPC_D_LOW)
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_MAIN_0_SCENE_0010_010_7")
  ItemGetMessageToActor("NPC_Talk_Samanosa_Castle_1F_MAIN_0_SCENE_0010_010_5", "ITEM_ARCHIPELAGO"--[["ITEM_EQUIP_ACCESSORY_MIGHTY_ARMLET"]], "Samanosa_Castle_1F_Guard_05_L1", true) -- AP
  ItemGetMessage("NPC_Talk_Samanosa_Castle_1F_MAIN_0_SCENE_0010_010_5", "ITEM_ARCHIPELAGO"--[["ITEM_USE_ITEM_ELFIN_ELIXIR"]], true, true) -- AP
  CloseMessage()
  PauseMainBGM(false, 0)
  SetNpcAnimation("Samanosa_Castle_1F_King_Samanosa_True_01_L1", AnimationType.Act7, 1, EFlipbookPlayTypeStopEnd, true)
  MoveNpc("Samanosa_Castle_1F_Guard_05_L1", {
    X = 5050,
    Y = 4750,
    Z = pos_z
  }, 400)
  -- AP
  AP.Log("Samanosa_Castle_1F_MAIN_0_SCENE_0010_010 called (Manoza - Rewards for defeating Boss Troll)")
  AP.CheckLocation("Samanosa_Castle_1F_MAIN_0_SCENE_0010_010_Sub_1\nSamanosa_Castle_1F_MAIN_0_SCENE_0010_010_Sub_2\nSamanosa_Castle_1F_MAIN_0_SCENE_0010_010_Main")
  local ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
    AddItem(ItemId)
    AddItem(ItemId)
    AddItem(ItemId)
  else
    AddItem("ITEM_IMPORTANT_MOD_ROD")
    AddItem("ITEM_EQUIP_ACCESSORY_MIGHTY_ARMLET")
    AddItem("ITEM_USE_ITEM_ELFIN_ELIXIR")
  end
  -- AP end
  DestroyPartyClone()
  SetActorRotation("PLAYER", {
    Yaw = 180,
    Pitch = 0,
    Roll = 0
  })
  PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_DASH)
  MovePartyRelative({
    X = -800,
    Y = 0,
    Z = 0
  })
  ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  WaitAnimNpc("Samanosa_Castle_1F_King_Samanosa_True_01_L1")
  WaitMoveParty()
  TurnNpc("Samanosa_Castle_1F_Guard_05_L1", NPC_D_LOW)
  _retry(SYS_WaitStageCameraBlend)
  SetDispMiniMap(true)
  SetFlag(Flag.FE186, true)
  --SetFlag(Flag.FE69, true) -- AP
  SetFlag(Flag.FE851, true)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_SAMANOSA_DefeatBossTroll, true)
  GameDataSetGopEnumMapBgm(FlagGOPEnumMapBgm.SAMANOSA_CITY01, true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0110_010_1")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0120_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0120_010_1")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0120_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0120_020_1")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0210_010_1")
  EventEnd(eventInfo, "", false)
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0220_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0220_010_1")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0210_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0210_020_1")
  EventEnd(eventInfo, "", false)
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0220_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0220_020_1")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0210_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0210_030_1")
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0210_030_2")
  EventEnd(eventInfo, "", false)
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0310_010_1")
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0310_010_2")
  EventEnd(eventInfo, "", false)
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0320_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0320_010_1")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0310_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0310_020_1")
  EventEnd(eventInfo, "", false)
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0310_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0310_030_1")
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0310_030_2")
  EventEnd(eventInfo, "", false)
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  TurnNpc(targetActorId, NPC_D_UP)
  Wait(0.1)
  TurnNpc(targetActorId, NPC_D_LEFT)
  Wait(0.1)
  TurnNpc(targetActorId, NPC_D_LOW)
  Wait(0.1)
  TurnNpc(targetActorId, NPC_D_RIGHT)
  Wait(0.5)
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0410_010_1")
  EventEnd(eventInfo, "", false)
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  TurnNpc(targetActorId, NPC_D_LOW)
  Wait(0.1)
  TurnNpc(targetActorId, NPC_D_RIGHT)
  Wait(0.1)
  TurnNpc(targetActorId, NPC_D_UP)
  Wait(0.1)
  TurnNpc(targetActorId, NPC_D_LEFT)
  Wait(0.5)
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0510_010_1")
  EventEnd(eventInfo, "", false)
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0610_010_1")
  EventEnd(eventInfo, "", false)
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0620_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0620_010_1")
  EventEnd(eventInfo, "", false)
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0710_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local result = CmdChoiceMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0710_010_1")
  if result == true then
    CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0710_010_2")
  else
    CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0710_010_3")
  end
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0710_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  GuardMove()
  EventEnd(eventInfo, "", false)
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0810_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0810_010_1")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0810_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  GuardMove()
  EventEnd(eventInfo, "", false)
end

function GuardMove()
  local GUARD_R, GUARD_L
  local MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    GUARD_R = "Samanosa_Castle_1F_Guard_01_L3"
    GUARD_L = "Samanosa_Castle_1F_Guard_02_L3"
  else
    GUARD_R = "Samanosa_Castle_1F_Guard_01_L1"
    GUARD_L = "Samanosa_Castle_1F_Guard_02_L1"
  end
  if GetFlag(Flag.FS0) == true then
    CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0710_020_2")
    TurnNpc(GUARD_R, NPC_D_LEFT)
    TurnNpc(GUARD_L, NPC_D_RIGHT)
  else
    CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0710_020_1")
    DisableNpcCollisionNpcToPlayer(GUARD_R, true)
    DisableNpcCollisionNpcToPlayer(GUARD_L, true)
    MoveNpc(GUARD_R, {
      X = 2100,
      Y = 4700,
      Z = 0
    }, -1)
    CmdMoveNpc(GUARD_L, {
      X = 2100,
      Y = 4300,
      Z = 0
    }, -1)
    TurnNpc(GUARD_R, NPC_D_LEFT)
    CmdTurnNpc(GUARD_L, NPC_D_RIGHT)
    DisableNpcCollisionNpcToPlayer(GUARD_R, false)
    DisableNpcCollisionNpcToPlayer(GUARD_L, false)
    SetFlag(Flag.FS0, true)
  end
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0910_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if GetCollisionTagFromEventInfo(eventInfo) == "Rear" then
    if GetFlag(Flag.FS2) == true then
      CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0910_010_3")
    else
      CmdSpawnMangaIcon("Samanosa_Castle_1F_Guard_03_L1", "FIELD_EFX2D_SURPRISE")
      CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0910_010_2")
      CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0910_010_3")
      SetFlag(Flag.FS2, true)
    end
  else
    CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0910_010_1")
  end
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0920_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if GetCollisionTagFromEventInfo(eventInfo) == "Rear" then
    if GetFlag(Flag.FS2) == true then
      CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0910_010_3")
    else
      CmdSpawnMangaIcon("Samanosa_Castle_1F_Guard_03_L3", "FIELD_EFX2D_SURPRISE")
      CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0910_010_2")
      CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0910_010_3")
      DisableNpcCollisionNpcToPlayer("Samanosa_Castle_1F_Guard_03_L3", true)
      CmdMoveNpc("Samanosa_Castle_1F_Guard_03_L3", {
        X = 6080,
        Y = 4080,
        Z = 0
      }, -1)
      CmdTurnNpc("Samanosa_Castle_1F_Guard_03_L3", NPC_D_RIGHT)
      DisableNpcCollisionNpcToPlayer("Samanosa_Castle_1F_Guard_03_L3", false)
      SetFlag(Flag.FS2, true)
    end
  elseif GetFlag(Flag.FS2) == true then
    CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0910_010_3")
  else
    CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0920_010_1")
  end
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_0910_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_0910_020_1")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_1010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1010_010_1")
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1010_010_2")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_1010_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1010_020_1")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_1110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1110_010_1")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_1110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1110_020_1")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_1210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1110_010_1")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_1210_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1110_020_1")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_1320_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1310_010_1")
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1310_010_2")
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1310_010_3")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_1320_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1310_020_1")
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1310_020_2")
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1310_020_3")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_MAIN_0_VOLUME_1410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  ChangeStageCameraToGlobalPoint(4000, 4500, 250, CAMERA_BLEND_EASE_IN_OUT, 2, 2, 1200, {
    Yaw = 0,
    Pitch = -12,
    Roll = 0
  })
  CmdMoveParty({
    X = 4500,
    Y = 4500,
    Z = 0
  })
  TurnParty(1, 0)
  EndSkillInvisibleNoEffect()
  WaitStageCameraBlend()
  CmdSpawnMangaIcon("Samanosa_Castle_1F_King_Samanosa_Fake_01_L1", "FIELD_EFX2D_SURPRISE")
  Wait(0.5)
  SpawnMangaIcon("Samanosa_Castle_1F_King_Samanosa_Fake_01_L1", "FIELD_EFX2D_IRRITATION")
  SetNpcAnimation("Samanosa_Castle_1F_King_Samanosa_Fake_01_L1", AnimationType.Act2, 1, EFlipbookPlayTypeStopEnd, false)
  PlaySEEvent("EVESE_SAMANOSA_CANE_POKE")
  if GetFlag(Flag.FE193) == true then
    CmdMessage("NPC_Talk_Samanosa_Castle_1F_MAIN_0_VOLUME_1410_010_6")
    WaitAnimNpc("Samanosa_Castle_1F_King_Samanosa_Fake_01_L1")
    SetNpcAnimation("Samanosa_Castle_1F_King_Samanosa_Fake_01_L1", AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, false)
    HideMessageWindowPageFeedIcon()
    CmdMessage("NPC_Talk_Samanosa_Castle_1F_MAIN_0_VOLUME_1410_010_7")
  else
    CmdMessage("NPC_Talk_Samanosa_Castle_1F_MAIN_0_VOLUME_1410_010_1")
    WaitAnimNpc("Samanosa_Castle_1F_King_Samanosa_Fake_01_L1")
    SetNpcAnimation("Samanosa_Castle_1F_King_Samanosa_Fake_01_L1", AnimationType.Act3, 1, EFlipbookPlayTypeStopEnd, false)
    HideMessageWindowPageFeedIcon()
    CmdMessage("NPC_Talk_Samanosa_Castle_1F_MAIN_0_VOLUME_1410_010_2")
  end
  WaitAnimNpc("Samanosa_Castle_1F_King_Samanosa_Fake_01_L1")
  CloseMessage()
  Wait(0.3)
  TurnNpc("Samanosa_Castle_1F_Guard_05_L1", NPC_D_LEFT)
  TurnNpc("Samanosa_Castle_1F_Guard_06_L1", NPC_D_RIGHT)
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_MAIN_0_VOLUME_1410_010_3")
  MoveNpc("Samanosa_Castle_1F_Guard_05_L1", {
    X = 4600,
    Y = 4550,
    Z = 0
  }, 600)
  MoveNpc("Samanosa_Castle_1F_Guard_06_L1", {
    X = 4550,
    Y = 4430,
    Z = 0
  }, 550)
  WaitMoveNpc("Samanosa_Castle_1F_Guard_05_L1")
  WaitMoveNpc("Samanosa_Castle_1F_Guard_06_L1")
  TurnNpc("Samanosa_Castle_1F_Guard_06_L1", NPC_D_RIGHT)
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_MAIN_0_VOLUME_1410_010_4")
  if GetFlag(Flag.FE56) then -- AP: ONLY TELEPORT TO JAIL IF YOU HAVE THE ULTIMATE KEY OR ELSE IT WILL SOFTLOCK THE PLAYER
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    Wait(0.5)
    local SE_Stairway
    SE_Stairway = PlaySEEvent("EVESE_STAIRWAY")
    SetDisableRula(true)
    SetFlag(Flag.FE193, true)
    SetFlag(Flag.FD34, true)
    WaitPlaySound(SE_Stairway)
    ChangeMap("MAPLIST_C08R0104", "From1F", ORIENTATION_DOWN)
  end
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_1510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_IMPORTANT_MOD_ROD")
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_010_1")
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_010_2")
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_010_3")
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_010_4")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_1510_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_020_1")
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_020_2")
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_020_3")
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_020_4")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_1510_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_030_1")
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_030_2")
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_030_3")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_1510_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_040_1")
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_040_2")
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_040_3")
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_040_4")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_1510_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_050_1")
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_050_2")
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_050_3")
  CmdMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_050_4")
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_050_5")
  EventEnd(eventInfo, "")
end

function Samanosa_Castle_1F_SUB_0_ACTOR_1510_060(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Samanosa_Castle_1F_SUB_0_ACTOR_1510_060_1")
  EventEnd(eventInfo, "")
end
