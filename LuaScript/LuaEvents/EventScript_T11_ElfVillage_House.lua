print("Load Script EventScript_T11_ElfVillage_House")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function ElfVillage_House_SUB_0_VOLUME_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_IMPORTANT_DREAMSTONE")
  local pos_x = 700
  local pos_y = 900
  local pos_z = 100
  local offset = 500
  local party1 = "Party1"
  local party2 = "Party2"
  local party3 = "Party3"
  local party4 = "Party4"
  SpawnPartyCloneDisableSkill(true, true, true, true)
  EndSkillTransformNoEffect()
  EndSkillInvisibleNoEffect()
  SetDispMiniMap(false)
  SetNicolaApertureRate(100, 0)
  ChangeStageCameraToGlobalPoint(650, 900, 300, CAMERA_BLEND_LINEAR, 1.5, 0, 1100, {
    Yaw = 0,
    Pitch = -15,
    Roll = 0
  })
  MoveNpc(party1, {
    X = 900,
    Y = 900,
    Z = 0
  }, 350)
  MoveNpc(party2, {
    X = 800,
    Y = 760,
    Z = 0
  }, 350)
  MoveNpc(party3, {
    X = 700,
    Y = 830,
    Z = 0
  }, 350)
  MoveNpc(party4, {
    X = 750,
    Y = 970,
    Z = 0
  }, 350)
  WaitMoveNpc(party1)
  WaitMoveNpc(party2)
  WaitMoveNpc(party3)
  WaitMoveNpc(party4)
  TurnNpc(party1, NPC_D_UP)
  TurnNpc(party2, NPC_D_UP)
  TurnNpc(party3, NPC_D_UP)
  TurnNpc(party4, NPC_D_UP)
  Wait(0.7)
  CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_010_1")
  CmdEventClosingMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_010_2")
  CloseMessage()
  Wait(0.5)
  ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
  DestroyPartyClone()
  PartyMemberAlignment(ALIGNMENT_TOGETHER, ALIGNMENT_MOVE_DASH)
  CmdMoveParty({
    X = pos_x - offset,
    Y = pos_y,
    Z = pos_z
  })
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  Wait(1)
  EventEnd(eventInfo, "")
end

function ElfVillage_House_SUB_0_VOLUME_0110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_IMPORTANT_DREAMSTONE")
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Queen_Elf = "ElfVillage_House_Queen_Elf_01_L3"
  else
    Queen_Elf = "ElfVillage_House_Queen_Elf_01_L1"
  end
  local pos_x = 700
  local pos_y = 900
  local pos_z = 100
  local offset = 500
  local party1 = "Party1"
  local party2 = "Party2"
  local party3 = "Party3"
  local party4 = "Party4"
  SpawnPartyCloneDisableSkill(true, true, true, true)
  EndSkillTransformNoEffect()
  EndSkillInvisibleNoEffect()
  SetDispMiniMap(false)
  SetNicolaApertureRate(100, 0)
  ChangeStageCameraToGlobalPoint(650, 900, 300, CAMERA_BLEND_LINEAR, 1.5, 0, 1100, {
    Yaw = 0,
    Pitch = -15,
    Roll = 0
  })
  MoveNpc(party1, {
    X = 900,
    Y = 900,
    Z = 0
  }, 350)
  MoveNpc(party2, {
    X = 800,
    Y = 760,
    Z = 0
  }, 350)
  MoveNpc(party3, {
    X = 700,
    Y = 830,
    Z = 0
  }, 350)
  MoveNpc(party4, {
    X = 750,
    Y = 970,
    Z = 0
  }, 350)
  WaitMoveNpc(party1)
  WaitMoveNpc(party2)
  WaitMoveNpc(party3)
  WaitMoveNpc(party4)
  TurnNpc("Party1", NPC_D_UP)
  TurnNpc("Party2", NPC_D_UP)
  TurnNpc("Party3", NPC_D_UP)
  TurnNpc("Party4", NPC_D_UP)
  Wait(0.7)
  if GetFlag(Flag.FE145) == true then
  else
    CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_020_1")
    CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_020_2")
    SetFlag(Flag.FE145, true)
  end
  CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_020_3")
  CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_020_4")
  CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_020_5")
  CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_020_6")
  SetNpcAnimation(Queen_Elf, AnimationType.Act7, 1, EFlipbookPlayTypeStopEnd, true)
  Wait(1)
  CmdEventClosingMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_020_7")
  CloseMessage()
  Wait(0.5)
  ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
  DestroyPartyClone()
  PartyMemberAlignment(ALIGNMENT_TOGETHER, ALIGNMENT_MOVE_DASH)
  CmdMoveParty({
    X = pos_x - offset,
    Y = pos_y,
    Z = pos_z
  })
  SetNpcAnimation(Queen_Elf, AnimationType.Act6, 1, EFlipbookPlayTypeStopEnd, true)
  if GetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_ELFVILLAGE_TalkQueen) == false then
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_ELFVILLAGE_TalkQueen, true)
  end
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  Wait(1)
  EventEnd(eventInfo, "")
end

function ElfVillage_House_SUB_0_VOLUME_0110_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_IMPORTANT_DREAMSTONE")
  SetTagItemId2("ITEM_IMPORTANT_WAKEY_DUST")
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Queen_Elf = "ElfVillage_House_Queen_Elf_01_L3"
  else
    Queen_Elf = "ElfVillage_House_Queen_Elf_01_L1"
  end
  local pos_x = 700
  local pos_y = 900
  local pos_z = 100
  local offset = 500
  local party1 = "Party1"
  local party2 = "Party2"
  local party3 = "Party3"
  local party4 = "Party4"
  SpawnPartyCloneDisableSkill(true, true, true, true)
  EndSkillTransformNoEffect()
  EndSkillInvisibleNoEffect()
  SetDispMiniMap(false)
  SetNicolaApertureRate(100, 0)
  ChangeStageCameraToGlobalPoint(650, 900, 300, CAMERA_BLEND_LINEAR, 1.5, 0, 1100, {
    Yaw = 0,
    Pitch = -15,
    Roll = 0
  })
  MoveNpc(party1, {
    X = 900,
    Y = 900,
    Z = 0
  }, 350)
  MoveNpc(party2, {
    X = 800,
    Y = 760,
    Z = 0
  }, 350)
  MoveNpc(party3, {
    X = 700,
    Y = 830,
    Z = 0
  }, 350)
  MoveNpc(party4, {
    X = 750,
    Y = 970,
    Z = 0
  }, 350)
  TurnNpc("Party1", NPC_D_UP)
  TurnNpc("Party2", NPC_D_UP)
  TurnNpc("Party3", NPC_D_UP)
  TurnNpc("Party4", NPC_D_UP)
  WaitMoveNpc(party1)
  WaitMoveNpc(party2)
  WaitMoveNpc(party3)
  WaitMoveNpc(party4)
  Wait(0.7)
  if GetFlag(Flag.FE145) == true then
    Wait(0.2)
  else
    CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_030_1")
    CmdEventClosingMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_030_2")
    CloseMessage()
    MoveNpc(party1, {
      X = 780,
      Y = 900,
      Z = 0
    }, 80)
    SpawnMangaIcon(Queen_Elf, "FIELD_EFX2D_SURPRISE", false)
    Wait(1.2)
    CmdEventClosingMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_030_3")
    CloseMessage()
    CmdMoveNpc(party1, {
      X = 900,
      Y = 900,
      Z = 0
    }, 200)
    Wait(0.5)
  end
  Wait(0.5)
  CmdEventClosingMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_030_4")
  CloseMessage()
  Wait(1)
  CmdMoveNpc(party1, {
    X = 1100,
    Y = 900,
    Z = 0
  }, 200)
  Wait(1)
  SpawnMangaIcon(Queen_Elf, "FIELD_EFX2D_SURPRISE", false)
  Wait(1)
  CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_030_5")
  SetNpcAnimation(Queen_Elf, AnimationType.Act7, 1, EFlipbookPlayTypeStopEnd, true)
  CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_030_6")
  Wait(1)
  CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_030_7")
  Wait(0.5)
  SetNpcAnimation(Queen_Elf, AnimationType.Act8, 1, EFlipbookPlayTypeStopEnd, true)
  CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_030_8")
  CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_030_9")
  SetNpcAnimation(Queen_Elf, AnimationType.Act7, 1, EFlipbookPlayTypeStopEnd, true)
  CmdEventClosingMessage("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_030_10")
  CloseMessage()
  ItemGetMessageToActor("NPC_Talk_ElfVillage_House_SUB_0_VOLUME_0110_030_12", "ITEM_IMPORTANT_WAKEY_DUST", party1, false, true)
  -- AP
  AP.Log("ElfVillage_House_SUB_0_VOLUME_0110_030 called (Faerie Village - Faerie Queen giving the Wakey Dust)")
  AP.CheckLocation("ElfVillage_House_SUB_0_VOLUME_0110_030")
  local ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
    AddItem(ItemId)
  else
    AddItem("ITEM_IMPORTANT_WAKEY_DUST")
    SetFlag(Flag.FE61, true)
  end
  -- AP end
  --RemoveItem("ITEM_IMPORTANT_DREAMSTONE") -- removed for AP because of the flag system causing repeating events
  Wait(0.5)
  ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
  DestroyPartyClone()
  PartyMemberAlignment(ALIGNMENT_TOGETHER, ALIGNMENT_MOVE_WALK)
  CmdMoveParty({
    X = pos_x - offset,
    Y = pos_y,
    Z = pos_z
  })
  SetNpcAnimation(Queen_Elf, AnimationType.Act6, 1, EFlipbookPlayTypeStopEnd, true)
  -- AP
  if ItemId == "ITEM_ARCHIPELAGO" then
  else
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_ELFVILLAGE_GetWakeyDust, true)
  end
  -- AP end
  SetEventVolumeEnabled("ElfVillage_House_Queen", false)
  SetDispMiniMap(true)
  RequestAutoSaveFromEvent()
  Wait(1)
  EventEnd(eventInfo, "")
end

function ElfVillage_House_SUB_0_ACTOR_0110_040(BeginOverlap, table, ...)
  ElfVillage_House_SUB_0_VOLUME_0110_030(BeginOverlap, table, ...)
  return
  --[[
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if CheckTransform() == true then
    CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_ACTOR_0110_040_3")
  end
  if CheckFadingJenny() == true then
    CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_ACTOR_0110_040_3")
  end
  CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_ACTOR_0110_040_1")
  CmdEventClosingMessage("NPC_Talk_ElfVillage_House_SUB_0_ACTOR_0110_040_2")
  EventEnd(eventInfo, "")
  ]]
end

function ElfVillage_House_SUB_0_ACTOR_0110_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if CheckTransform() == true then
    CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_ACTOR_0110_050_4")
  end
  if CheckFadingJenny() == true then
    CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_ACTOR_0110_050_4")
  end
  CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_ACTOR_0110_050_1")
  CmdMessage("NPC_Talk_ElfVillage_House_SUB_0_ACTOR_0110_050_2")
  CmdEventClosingMessage("NPC_Talk_ElfVillage_House_SUB_0_ACTOR_0110_050_3")
  EventEnd(eventInfo, "")
end
