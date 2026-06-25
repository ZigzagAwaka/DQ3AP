print("Load Script EventScript_D02_NajimiTower_Penthouse")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local OldMan_Najimi
  local MapTime = GetMapTimeFrame()
  local result
  local ResultHeroLiving = CheckHeroLiving()
  if MapTime == MAPTIME_NIGHT then
    OldMan_Najimi = "NajimiTower_Penthouse_OldMan_Najimi_01_L3"
  else
    OldMan_Najimi = "NajimiTower_Penthouse_OldMan_Najimi_01_L1"
  end
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  CmdChangeStageCameraToGlobalPoint(5350, 3900, 7200, CAMERA_BLEND_EASE_IN_OUT, 1.5, 2, 2200, {
    Yaw = 0,
    Pitch = -25,
    Roll = 0
  })
  SetTagItemId("ITEM_IMPORTANT_THIEFS_KEY")
  if GetFlag(Flag.FE227) == false then
    HideMessageWindowPageFeedIcon()
    CmdMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_1")
    EnableDefaultMangaIcon(OldMan_Najimi, false)
    CloseMessage()
    Wait(0.2)
    SpawnMangaIcon(OldMan_Najimi, "FIELD_EFX2D_SURPRISE")
    ResetNpcAnimation(OldMan_Najimi)
    Wait(1.2)
    CmdTurnNpc(OldMan_Najimi, NPC_D_TO_PLAYER)
    if ResultHeroLiving == true then
      CmdMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_2")
      CmdMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_4")
      result = CmdChoiceMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_5")
    else
      CmdMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_3")
      CmdMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_6")
      result = CmdChoiceMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_7")
    end
    SetFlag(Flag.FE227, true)
  else
    CmdTurnNpc(OldMan_Najimi, NPC_D_TO_PLAYER)
    if ResultHeroLiving == true then
      CmdMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_4")
      result = CmdChoiceMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_5")
    else
      CmdMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_6")
      result = CmdChoiceMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_7")
    end
  end
  if result == true then
    ItemGetMessageToActor("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_9", "ITEM_IMPORTANT_THIEFS_KEY", OldMan_Najimi)
    CmdMessage("NPC_Talk_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_9_1")
    CmdEventClosingMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_9_2")
    SetNpcAnimation(OldMan_Najimi, AnimationType.Act4, 1, EFlipbookPlayTypeLoop, true)
    EnableDefaultMangaIcon(OldMan_Najimi, true)
    CmdTurnNpc(OldMan_Najimi, NPC_D_LOW)
    Wait(1)
    EnableDefaultMangaIcon(OldMan_Najimi, false)
    SpawnMangaIcon(OldMan_Najimi, "FIELD_EFX2D_SURPRISE")
    ResetNpcAnimation(OldMan_Najimi)
    Wait(1.2)
    CmdTurnNpc(OldMan_Najimi, NPC_D_TO_PLAYER)
    CmdMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_11")
    CmdMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_12")
    CmdMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_10")
    SetNpcAnimation(OldMan_Najimi, AnimationType.Act4, 1, EFlipbookPlayTypeLoop, true)
    EnableDefaultMangaIcon(OldMan_Najimi, true)
    CmdTurnNpc(OldMan_Najimi, NPC_D_LOW)
    CmdEventClosingMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_13")
    -- AP
    AP.Log("NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010 called (Dreamer's Tower - Old man that gives the Thief's Key)")
    AP.CheckLocation("NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010")
    local ItemId = "ITEM_ARCHIPELAGO"
    AddItem(ItemId)
    if ItemId == "ITEM_ARCHIPELAGO" then
      SetFlag(Flag.FF1, true)
    else
    -- AP end
      AddItem("ITEM_IMPORTANT_THIEFS_KEY")
      SetFlag(Flag.FE54, true)
      SetFlag(Flag.FF1, true)
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_NAJIMITOWER_GetKey, true)
    end
  else
    CmdEventClosingMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010_8")
  end
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  if GetFlag(Flag.FE54) == true then
    CmdCallTutorialUI("INFORMATION_KEY")
    CmdCallTutorialUI("INFORMATION_RULER")
  end
  SetDispMiniMap(true)
  if GetFlag(Flag.FE54) == true then
    RequestAutoSaveFromEvent()
  end
  EventEnd(eventInfo, "")
end

function NajimiTower_Penthouse_MAIN_0_ACTOR_0110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local OldMan_Najimi
  local MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    OldMan_Najimi = "NajimiTower_Penthouse_OldMan_Najimi_01_L3"
  else
    OldMan_Najimi = "NajimiTower_Penthouse_OldMan_Najimi_01_L1"
  end
  if GetFlag(Flag.FF1) == true then
    CmdMessage("NPC_Talk_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_020_4")
    EnableDefaultMangaIcon(OldMan_Najimi, false)
    CmdMessage("NPC_Talk_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_020_5")
    CmdMessage("NPC_Talk_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_020_6")
    SetNpcAnimation(OldMan_Najimi, AnimationType.Act4, 1, EFlipbookPlayTypeLoop, true)
    EnableDefaultMangaIcon(OldMan_Najimi, true)
    CmdEventClosingMessage("NPC_Talk_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_020_7")
  else
    EnableDefaultMangaIcon(OldMan_Najimi, false)
    ResetNpcAnimation(OldMan_Najimi)
    CmdTurnNpc(OldMan_Najimi, NPC_D_TO_PLAYER)
    local result = CmdChoiceMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_020_1")
    if result == true then
      CmdEventClosingMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_020_2")
    else
      CmdEventClosingMessage("NPC_TALK_NajimiTower_Penthouse_MAIN_0_ACTOR_0110_020_3")
    end
  end
  EventEnd(eventInfo, "")
end
