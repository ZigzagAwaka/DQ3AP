print("Load Script EventScript_H16_Reiamuland_Out")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

local _ramiasMaiden1L1 = "Reiamuland_Out_RamiasMaiden_01_L1"
local _ramiasMaiden1L3 = "Reiamuland_Out_RamiasMaiden_01_L3"
local _ramiasMaiden2L1 = "Reiamuland_Out_RamiasMaiden_02_L1"
local _ramiasMaiden2L3 = "Reiamuland_Out_RamiasMaiden_02_L3"
local _egg = "SM_PL_H16_Egg_01"
local _orbs = {
  "SM_PL_H16_GreenOrb_01",
  "SM_PL_H16_PurpleOrb_01",
  "SM_PL_H16_RedOrb_01",
  "SM_PL_H16_BlueOrb_01",
  "SM_PL_H16_YellowOrb_01",
  "SM_PL_H16_SilverOrb_01"
}
local _searchEventTorchs = {
  {
    "BP_SearchEvent_H16_Torch_GreenOrb_01",
    "BP_SearchEvent_H16_Torch_GreenOrb_02"
  },
  {
    "BP_SearchEvent_H16_Torch_PurpleOrb_01",
    "BP_SearchEvent_H16_Torch_PurpleOrb_02"
  },
  {
    "BP_SearchEvent_H16_Torch_RedOrb_01",
    "BP_SearchEvent_H16_Torch_RedOrb_02"
  },
  {
    "BP_SearchEvent_H16_Torch_BlueOrb_01",
    "BP_SearchEvent_H16_Torch_BlueOrb_02"
  },
  {
    "BP_SearchEvent_H16_Torch_YellowOrb_01",
    "BP_SearchEvent_H16_Torch_YellowOrb_02"
  },
  {
    "BP_SearchEvent_H16_Torch_SilverOrb_01",
    "BP_SearchEvent_H16_Torch_SilverOrb_02"
  }
}
local _searchEventOrbStands = {
  "BP_SearchEvent_H16_OrbStand_GreenOrb_01",
  "BP_SearchEvent_H16_OrbStand_PurpleOrb_01",
  "BP_SearchEvent_H16_OrbStand_RedOrb_01",
  "BP_SearchEvent_H16_OrbStand_BlueOrb_01",
  "BP_SearchEvent_H16_OrbStand_YellowOrb_01",
  "BP_SearchEvent_H16_OrbStand_SilverOrb_01"
}
local _itemOrbs = {
  "ITEM_IMPORTANT_GREEN_ORB",
  "ITEM_IMPORTANT_PURPLE_ORB",
  "ITEM_IMPORTANT_RED_ORB",
  "ITEM_IMPORTANT_BLUE_ORB",
  "ITEM_IMPORTANT_YELLOW_ORB",
  "ITEM_IMPORTANT_SILVER_ORB"
}
local _orbFlags = {
  Flag.FE738,
  Flag.FE739,
  Flag.FE740,
  Flag.FE741,
  Flag.FE742,
  Flag.FE743
}
local _partyId = {
  "Party1",
  "Party2",
  "Party3",
  "Party4"
}
local _sortPartyId = {
  "Party1",
  "Party2",
  "Party3",
  "Party4"
}

function SetAllOrbs()
  SetSysGlobal(SysGlobal.ORB0, 1)
  SetSysGlobal(SysGlobal.ORB1, 2)
  SetSysGlobal(SysGlobal.ORB2, 3)
  SetSysGlobal(SysGlobal.ORB3, 4)
  SetSysGlobal(SysGlobal.ORB4, 5)
  SetSysGlobal(SysGlobal.ORB5, 6)
end

function CheckOfferedOneOrMoreOrbs()
  if GetSysGlobal(SysGlobal.ORB0) ~= 0 then
    return true
  end
  if GetSysGlobal(SysGlobal.ORB1) ~= 0 then
    return true
  end
  if GetSysGlobal(SysGlobal.ORB2) ~= 0 then
    return true
  end
  if GetSysGlobal(SysGlobal.ORB3) ~= 0 then
    return true
  end
  if GetSysGlobal(SysGlobal.ORB4) ~= 0 then
    return true
  end
  if GetSysGlobal(SysGlobal.ORB5) ~= 0 then
    return true
  end
  return false
end

function CheckOfferedAllOrbs()
  if GetSysGlobal(SysGlobal.ORB0) == 0 then
    return false
  end
  if GetSysGlobal(SysGlobal.ORB1) == 0 then
    return false
  end
  if GetSysGlobal(SysGlobal.ORB2) == 0 then
    return false
  end
  if GetSysGlobal(SysGlobal.ORB3) == 0 then
    return false
  end
  if GetSysGlobal(SysGlobal.ORB4) == 0 then
    return false
  end
  if GetSysGlobal(SysGlobal.ORB5) == 0 then
    return false
  end
  return true
end

function CheckPedestalOrbItemId()
  if GetSysInfo(SysInfo.VA0) == 1 then
    return _itemOrbs[1]
  elseif GetSysInfo(SysInfo.VA0) == 2 then
    return _itemOrbs[2]
  elseif GetSysInfo(SysInfo.VA0) == 3 then
    return _itemOrbs[3]
  elseif GetSysInfo(SysInfo.VA0) == 4 then
    return _itemOrbs[4]
  elseif GetSysInfo(SysInfo.VA0) == 5 then
    return _itemOrbs[5]
  elseif GetSysInfo(SysInfo.VA0) == 6 then
    return _itemOrbs[6]
  else
    print("\226\151\134\226\151\134\226\151\134\226\151\134\226\151\134CheckPedestalOrbItemId():VA==" .. tostring(GetSysInfo(SysInfo.VA0)) .. "\227\129\167\232\169\178\229\189\147\227\129\153\227\130\139\227\130\170\227\131\188\227\131\150\227\129\140\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147")
    return ""
  end
end

function SubPedestalOrbWords(targetActorId)
  SetSysInfo(SysInfo.VE5, 0)
  if GetSysGlobal(SysGlobal.ORB0) ~= 0 then
    SetSysInfo(SysInfo.VA0, GetSysGlobal(SysGlobal.ORB0))
    SubPedestalOrbWords2(targetActorId)
  end
  if GetSysGlobal(SysGlobal.ORB1) ~= 0 then
    SetSysInfo(SysInfo.VA0, GetSysGlobal(SysGlobal.ORB1))
    SubPedestalOrbWords2(targetActorId)
  end
  if GetSysGlobal(SysGlobal.ORB2) ~= 0 then
    SetSysInfo(SysInfo.VA0, GetSysGlobal(SysGlobal.ORB2))
    SubPedestalOrbWords2(targetActorId)
  end
  if GetSysGlobal(SysGlobal.ORB3) ~= 0 then
    SetSysInfo(SysInfo.VA0, GetSysGlobal(SysGlobal.ORB3))
    SubPedestalOrbWords2(targetActorId)
  end
  if GetSysGlobal(SysGlobal.ORB4) ~= 0 then
    SetSysInfo(SysInfo.VA0, GetSysGlobal(SysGlobal.ORB4))
    SubPedestalOrbWords2(targetActorId)
  end
  if GetSysGlobal(SysGlobal.ORB5) ~= 0 then
    SetSysInfo(SysInfo.VA0, GetSysGlobal(SysGlobal.ORB5))
    SubPedestalOrbWords2(targetActorId)
  end
end

function SubPedestalOrbWords2(targetActorId)
  SetSysInfo(SysInfo.VE5, GetSysInfo(SysInfo.VE5) + 1)
  local itemId = CheckPedestalOrbItemId()
  if GetSysInfo(SysInfo.VE5) == 1 then
    SetTagItemId(itemId)
  end
  if GetSysInfo(SysInfo.VE5) == 2 then
    SetTagItemId(itemId)
  end
  if GetSysInfo(SysInfo.VE5) == 3 then
    SetTagItemId(itemId)
  end
  if GetSysInfo(SysInfo.VE5) == 4 then
    SetTagItemId(itemId)
  end
  if GetSysInfo(SysInfo.VE5) == 5 then
    SetTagItemId(itemId)
  end
  if GetSysInfo(SysInfo.VE5) == 6 then
    SetTagItemId(itemId)
  end
  if GetSysInfo(SysInfo.VE5) ~= 0 then
    if targetActorId == _ramiasMaiden1L1 or targetActorId == _ramiasMaiden1L3 then
      CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_020_2")
    else
      CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_020_2")
    end
  end
end

function SubSetRamiasMaidenDir(dir)
  local ramiasMaiden1 = ""
  local ramiasMaiden2 = ""
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    ramiasMaiden1 = _ramiasMaiden1L3
    ramiasMaiden2 = _ramiasMaiden2L3
  else
    ramiasMaiden1 = _ramiasMaiden1L1
    ramiasMaiden2 = _ramiasMaiden2L1
  end
  CmdTurnNpc(ramiasMaiden1, dir)
  CmdTurnNpc(ramiasMaiden2, dir)
end

function Reiamuland_Out_MAIN_0_VOLUME_0110_000(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SoundTransitionVolumeRateByCategory(ENicolaSoundCategoryAMBIENT, 0, 0.5)
  local initPos = {
    X = 1200,
    Y = 700,
    Z = 5650
  }
  local pos1 = {
    X = 2700,
    Y = 700,
    Z = 5650
  }
  local pos2 = {
    X = pos1.X - 200,
    Y = pos1.Y - 100,
    Z = pos1.Z
  }
  local pos3 = {
    X = pos1.X - 200,
    Y = pos1.Y + 100,
    Z = pos1.Z
  }
  local pos4 = {
    X = pos1.X - 300,
    Y = pos1.Y,
    Z = pos1.Z
  }
  local cameraPos = {
    X = pos1.X,
    Y = pos1.Y,
    Z = 5900
  }
  local movePartySpeed = 300
  local partyNum = GetPartyMemberNum()
  local heroLiving = CheckHeroLiving()
  local heroNum = CheckHero()
  local party1 = _partyId[1]
  local party2 = _partyId[2]
  local party3 = _partyId[3]
  local party4 = _partyId[4]
  if heroLiving == true and heroNum ~= 1 then
    local countIndex = 2
    for i = 1, partyNum do
      if i == heroNum then
        _sortPartyId[1] = _partyId[i]
      else
        _sortPartyId[countIndex] = _partyId[i]
        countIndex = countIndex + 1
      end
    end
    party1 = _sortPartyId[1]
    party2 = _sortPartyId[2]
    party3 = _sortPartyId[3]
    party4 = _sortPartyId[4]
  end
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  EndSkillTransformNoEffect()
  EndSkillInvisibleNoEffect()
  MovePartyRelative({
    X = 600,
    Y = 0,
    Z = 0
  })
  ChangeStageCameraToGlobalPoint(cameraPos.X, cameraPos.Y, cameraPos.Z, CAMERA_BLEND_EASE_IN_OUT, 4.5, 2, 1500, {
    Yaw = 0,
    Pitch = -8,
    Roll = 0
  }, AUTO_FOCUS_CAMERA_ACTOR, 0, "", 50)
  WaitMoveParty()
  SpawnPartyCloneDisableSkill(true, true, true, true)
  MoveNpc(party1, pos1, movePartySpeed)
  MoveNpc(party2, pos2, movePartySpeed)
  MoveNpc(party3, pos3, movePartySpeed)
  MoveNpc(party4, pos4, movePartySpeed)
  WaitMoveNpc(party1)
  WaitMoveNpc(party2)
  WaitMoveNpc(party3)
  WaitMoveNpc(party4)
  CmdTurnNpc(party1, NPC_D_UP)
  CmdTurnNpc(party2, NPC_D_UP)
  CmdTurnNpc(party3, NPC_D_UP)
  CmdTurnNpc(party4, NPC_D_UP)
  WaitStageCameraBlend()
  SetPlayerLocation(pos1)
  Wait(0.1)
  TurnParty(1, 0)
  Wait(0.1)
  PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WARP)
  Wait(0.1)
  local ramiasMaiden1 = ""
  local ramiasMaiden2 = ""
  if GetMapTimeFrame() == MAPTIME_NIGHT then
    ramiasMaiden1 = _ramiasMaiden1L3
    ramiasMaiden2 = _ramiasMaiden2L3
  else
    ramiasMaiden1 = _ramiasMaiden1L1
    ramiasMaiden2 = _ramiasMaiden2L1
  end
  Wait(0.5)
  CmdTurnNpc(ramiasMaiden1, NPC_D_RIGHT)
  Wait(0.08)
  CmdTurnNpc(ramiasMaiden1, NPC_D_LOW)
  Wait(0.5)
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_VOLUME_0110_000_1")
  CmdTurnNpc(ramiasMaiden2, NPC_D_LEFT)
  Wait(0.08)
  CmdTurnNpc(ramiasMaiden2, NPC_D_LOW)
  Wait(0.5)
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_VOLUME_0110_000_2")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_VOLUME_0110_000_3")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_VOLUME_0110_000_4")
  SetNpcAnimation(ramiasMaiden1, AnimationType.Act1, 1, EFlipbookPlayTypeLoop, true)
  SetNpcAnimation(ramiasMaiden2, AnimationType.Act1, 1, EFlipbookPlayTypeLoop, true)
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_VOLUME_0110_000_5")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_VOLUME_0110_000_6")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_VOLUME_0110_000_7")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_VOLUME_0110_000_8")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_VOLUME_0110_000_9")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_VOLUME_0110_000_10")
  ResetNpcAnimation(ramiasMaiden1)
  ResetNpcAnimation(ramiasMaiden2)
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_VOLUME_0110_000_11")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_VOLUME_0110_000_12")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_VOLUME_0110_000_13")
  CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_MAIN_0_VOLUME_0110_000_14")
  CmdTurnNpc(ramiasMaiden1, NPC_D_RIGHT)
  CmdTurnNpc(ramiasMaiden2, NPC_D_LEFT)
  Wait(0.08)
  SubSetRamiasMaidenDir(NPC_D_UP)
  Wait(0.5)
  SetEventVolumeEnabled("Reiamuland_Out_RamiasMaiden_00_L1", false)
  SetFlag(Flag.FE830, true)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MULTI_HintOrb, true)
  DestroyPartyClone()
  PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WALK)
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1, 2)
  SetDispMiniMap(true)
  SoundTransitionVolumeRateByCategory(ENicolaSoundCategoryAMBIENT, 1, 0.5)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function Reiamuland_Out_MAIN_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SubSetRamiasMaidenDir(NPC_D_TO_PLAYER)
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_010_1")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_010_3")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_010_5")
  CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_010_6")
  OfferedOneOrMoreOrbs(targetActorId)
  EventEnd(eventInfo, "")
end

function Reiamuland_Out_MAIN_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SubSetRamiasMaidenDir(NPC_D_TO_PLAYER)
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_010_1")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_010_3")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_010_5")
  CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_010_6")
  OfferedOneOrMoreOrbs(targetActorId)
  EventEnd(eventInfo, "")
end

function OfferedOneOrMoreOrbs(targetActorId)
  if CheckOfferedOneOrMoreOrbs() == true then
    if targetActorId == _ramiasMaiden1L1 or targetActorId == _ramiasMaiden1L3 then
      CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_020_1")
      SubPedestalOrbWords(targetActorId)
      CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_020_3")
    else
      CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_020_1")
      SubPedestalOrbWords(targetActorId)
      CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_020_3")
    end
  end
  SubSetRamiasMaidenDir(NPC_D_UP)
end

function Reiamuland_Out_MAIN_0_ACTOR_0110_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_040_1")
  SubSetRamiasMaidenDir(NPC_D_TO_PLAYER)
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_040_2")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_040_3")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_040_4")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_040_5")
  CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_040_6")
  SubSetRamiasMaidenDir(NPC_D_LOW)
  EventEnd(eventInfo, "", false)
end

function Reiamuland_Out_MAIN_0_ACTOR_0210_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_040_1")
  SubSetRamiasMaidenDir(NPC_D_TO_PLAYER)
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_040_2")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_040_3")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_040_4")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_040_5")
  CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_040_6")
  SubSetRamiasMaidenDir(NPC_D_LOW)
  EventEnd(eventInfo, "", false)
end

function Reiamuland_Out_MAIN_0_ACTOR_0110_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_050_2")
  SubSetRamiasMaidenDir(NPC_D_TO_PLAYER)
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_050_3")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_050_4")
  CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0110_050_5")
  SubSetRamiasMaidenDir(NPC_D_LOW)
  EventEnd(eventInfo, "", false)
end

function Reiamuland_Out_MAIN_0_ACTOR_0210_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_050_1")
  SubSetRamiasMaidenDir(NPC_D_TO_PLAYER)
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_050_2")
  CmdMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_050_3")
  CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_MAIN_0_ACTOR_0210_050_4")
  SubSetRamiasMaidenDir(NPC_D_LOW)
  EventEnd(eventInfo, "", false)
end

function SEARCH_Reiamuland_Out_EVENT_0(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Reiamuland_Out_SUB_0_VOLUME_0410_010_1")
  CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_SUB_0_VOLUME_0410_010_2")
  EventEnd(eventInfo, "")
end

function SEARCH_Reiamuland_Out_EVENT_1(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_SUB_0_VOLUME_0310_010_1")
  CloseMessage()
  SetSysInfo(SysInfo.VA0, 0)
  --if GetFlag(Flag.FE73) == true and GetSysGlobal(SysGlobal.ORB0) == 0 then
  if IsHaveItem("ITEM_IMPORTANT_GREEN_ORB") and GetSysGlobal(SysGlobal.ORB0) == 0 then -- AP: green orb flag can't be used
    SetTagItemId(_itemOrbs[1])
    local result = CmdChoiceMessage("NPC_Talk_Reiamuland_Out_SUB_0_VOLUME_0310_020_1")
    if result == true then
      SetSysInfo(SysInfo.VA0, 1)
      SetSysGlobal(SysGlobal.ORB0, 1)
      if IsHaveItem(_itemOrbs[1]) then -- AP
        RemoveItem(_itemOrbs[1])
      end
      CheckPedestalOrbOffered(1)
    end
  elseif GetSysGlobal(SysGlobal.ORB0) ~= 0 then
    SetSysInfo(SysInfo.VA0, GetSysGlobal(SysGlobal.ORB0))
    PedestalOrbOffered()
  end
  EventEnd(eventInfo, "")
end

function SEARCH_Reiamuland_Out_EVENT_2(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_SUB_0_VOLUME_0310_010_2")
  CloseMessage()
  SetSysInfo(SysInfo.VA0, 0)
  if GetFlag(Flag.FE76) == true and GetSysGlobal(SysGlobal.ORB1) == 0 then
    SetTagItemId(_itemOrbs[2])
    local result = CmdChoiceMessage("NPC_Talk_Reiamuland_Out_SUB_0_VOLUME_0310_020_1")
    if result == true then
      SetSysInfo(SysInfo.VA0, 2)
      SetSysGlobal(SysGlobal.ORB1, 2)
      if IsHaveItem(_itemOrbs[2]) then -- AP
        RemoveItem(_itemOrbs[2])
      end
      CheckPedestalOrbOffered(2)
    end
  elseif GetSysGlobal(SysGlobal.ORB1) ~= 0 then
    SetSysInfo(SysInfo.VA0, GetSysGlobal(SysGlobal.ORB1))
    PedestalOrbOffered()
  end
  EventEnd(eventInfo, "")
end

function SEARCH_Reiamuland_Out_EVENT_3(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_SUB_0_VOLUME_0310_010_3")
  CloseMessage()
  SetSysInfo(SysInfo.VA0, 0)
  if GetFlag(Flag.FE75) == true and GetSysGlobal(SysGlobal.ORB2) == 0 then
    SetTagItemId(_itemOrbs[3])
    local result = CmdChoiceMessage("NPC_Talk_Reiamuland_Out_SUB_0_VOLUME_0310_020_1")
    if result == true then
      SetSysInfo(SysInfo.VA0, 3)
      SetSysGlobal(SysGlobal.ORB2, 3)
      if IsHaveItem(_itemOrbs[3]) then -- AP
        RemoveItem(_itemOrbs[3])
      end
      CheckPedestalOrbOffered(3)
    end
  elseif GetSysGlobal(SysGlobal.ORB2) ~= 0 then
    SetSysInfo(SysInfo.VA0, GetSysGlobal(SysGlobal.ORB2))
    PedestalOrbOffered()
  end
  EventEnd(eventInfo, "")
end

function SEARCH_Reiamuland_Out_EVENT_4(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_SUB_0_VOLUME_0310_010_4")
  CloseMessage()
  SetSysInfo(SysInfo.VA0, 0)
  if GetFlag(Flag.FE74) == true and GetSysGlobal(SysGlobal.ORB3) == 0 then
    SetTagItemId(_itemOrbs[4])
    local result = CmdChoiceMessage("NPC_Talk_Reiamuland_Out_SUB_0_VOLUME_0310_020_1")
    if result == true then
      SetSysInfo(SysInfo.VA0, 4)
      SetSysGlobal(SysGlobal.ORB3, 4)
      if IsHaveItem(_itemOrbs[4]) then -- AP
        RemoveItem(_itemOrbs[4])
      end
      CheckPedestalOrbOffered(4)
    end
  elseif GetSysGlobal(SysGlobal.ORB3) ~= 0 then
    SetSysInfo(SysInfo.VA0, GetSysGlobal(SysGlobal.ORB3))
    PedestalOrbOffered()
  end
  EventEnd(eventInfo, "")
end

function SEARCH_Reiamuland_Out_EVENT_5(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_SUB_0_VOLUME_0310_010_5")
  CloseMessage()
  SetSysInfo(SysInfo.VA0, 0)
  if GetFlag(Flag.FE77) == true and GetSysGlobal(SysGlobal.ORB4) == 0 then
    SetTagItemId(_itemOrbs[5])
    local result = CmdChoiceMessage("NPC_Talk_Reiamuland_Out_SUB_0_VOLUME_0310_020_1")
    if result == true then
      SetSysInfo(SysInfo.VA0, 5)
      SetSysGlobal(SysGlobal.ORB4, 5)
      if IsHaveItem(_itemOrbs[5]) then -- AP
        RemoveItem(_itemOrbs[5])
      end
      CheckPedestalOrbOffered(5)
    end
  elseif GetSysGlobal(SysGlobal.ORB4) ~= 0 then
    SetSysInfo(SysInfo.VA0, GetSysGlobal(SysGlobal.ORB4))
    PedestalOrbOffered()
  end
  EventEnd(eventInfo, "")
end

function SEARCH_Reiamuland_Out_EVENT_6(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_SUB_0_VOLUME_0310_010_6")
  CloseMessage()
  SetSysInfo(SysInfo.VA0, 0)
  if GetFlag(Flag.FE78) == true and GetSysGlobal(SysGlobal.ORB5) == 0 then
    SetTagItemId(_itemOrbs[6])
    local result = CmdChoiceMessage("NPC_Talk_Reiamuland_Out_SUB_0_VOLUME_0310_020_1")
    if result == true then
      SetSysInfo(SysInfo.VA0, 6)
      SetSysGlobal(SysGlobal.ORB5, 6)
      if IsHaveItem(_itemOrbs[6]) then -- AP
        RemoveItem(_itemOrbs[6])
      end
      CheckPedestalOrbOffered(6)
    end
  elseif GetSysGlobal(SysGlobal.ORB5) ~= 0 then
    SetSysInfo(SysInfo.VA0, GetSysGlobal(SysGlobal.ORB5))
    PedestalOrbOffered()
  end
  EventEnd(eventInfo, "")
end

function CheckPedestalOrbOffered(index)
  CloseMessage()
  Wait(0.5)
  PlaySEEvent("EVESE_REIAMULAND_ORB_PUT")
  PlayEffectSearchObject(_searchEventOrbStands[index], "H16_OrbStand_First")
  Wait(0.5)
  PlaySEEvent("EVESE_REIAMULAND_ORB_SHINE")
  Wait(2.5)
  PlaySEEvent("EVESE_REIAMULAND_CANDLESTICK_FIRE")
  PlayEffectSearchObject(_searchEventTorchs[index][1], "H16_OrbStand_First")
  CmdPlayEffectSearchObject(_searchEventTorchs[index][2], "H16_OrbStand_First")
  WaitPlayEffectSearchObject(_searchEventOrbStands[index])
  Wait(1)
  local itemId = CheckPedestalOrbItemId()
  SetTagItemId(itemId)
  CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_SUB_0_VOLUME_0310_030_1")
  CloseMessage()
  Wait(0.2)
  SetFlag(_orbFlags[index], true)
  if CheckOfferedAllOrbs() == true then
    -- AP
    AP.Log("EVESE_REIAMULAND_ORB_SHINE_ALL - All 6 orbs offered at Shrine of the Everbird")
    AP.CheckLocation("EVESE_REIAMULAND_ORB_SHINE_ALL")
    local ItemId = "ITEM_ARCHIPELAGO"
    if ItemId == "ITEM_ARCHIPELAGO" then
      AddItem(ItemId)
      SetTagItemId(ItemId)
      PlaySEUI("SYSSE_TD_TREASURE_BOX_ITEM")
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_11")
      RequestAutoSaveFromEvent()
      return
    end
    -- AP end
    Wait(1)
    SetDispMiniMap(false)
    SetVisibleActor("BP_SearchEvent_Pedestal_1", false)
    SetVisibleActor("BP_SearchEvent_Pedestal_2", false)
    SetVisibleActor("BP_SearchEvent_Pedestal_3", false)
    SetVisibleActor("BP_SearchEvent_Pedestal_4", false)
    SetVisibleActor("BP_SearchEvent_Pedestal_5", false)
    SetVisibleActor("BP_SearchEvent_Pedestal_6", false)
    SetAllOrbs()
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    FadeIn(EFadingPriorityTopMost, 0.5)
    if GetMapTimeFrame() == MAPTIME_NIGHT then
      CmdPlayEventSequence(4)
    else
      CmdPlayEventSequence(3)
    end
    if GetMapTimeFrame() == MAPTIME_NIGHT then
      CmdPlayEventSequenceNextChangeMap(7, nil, nil, EFadingPriorityWhiteTopMost)
    elseif GetMapTimeFrame() == MAPTIME_EVENING then
      CmdPlayEventSequenceNextChangeMap(6, nil, nil, EFadingPriorityWhiteTopMost)
    else
      CmdPlayEventSequenceNextChangeMap(5, nil, nil, EFadingPriorityWhiteTopMost)
    end
    SetDispMiniMap(true)
    SetFlag(Flag.FE35, true)
    SetFlag(Flag.FE214, true)
    SetFlag(Flag.FE215, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_REIAMULAND_RevivalLamia, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.SUB_INFORMATION_RAMIA, true)
    ChangeFieldRamiaWhiteFade("F_FromReiamuland", ORIENTATION_PLAYER_START, true)
  else
    -- AP
    if not GetFlag(Flag.FE830) then
      SetFlag(Flag.FE830, true)
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MULTI_HintOrb, true)
    end
    -- AP end
    RequestAutoSaveFromEvent()
  end
end

function PedestalOrbOffered()
  local itemId = CheckPedestalOrbItemId()
  SetTagItemId(itemId)
  CmdEventClosingMessage("NPC_Talk_Reiamuland_Out_SUB_0_VOLUME_0310_040_1")
end

function Reiamuland_Out_SUB_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE214) == true then
    SetVisibleActorsTag("Egg", false)
    SubSetRamiasMaidenDir(NPC_D_LOW)
  end
  if GetSysGlobal(SysGlobal.ORB0) == 0 then
    SetVisibleActor(_orbs[1], false)
  end
  if GetSysGlobal(SysGlobal.ORB1) == 0 then
    SetVisibleActor(_orbs[2], false)
  end
  if GetSysGlobal(SysGlobal.ORB2) == 0 then
    SetVisibleActor(_orbs[3], false)
  end
  if GetSysGlobal(SysGlobal.ORB3) == 0 then
    SetVisibleActor(_orbs[4], false)
  end
  if GetSysGlobal(SysGlobal.ORB4) == 0 then
    SetVisibleActor(_orbs[5], false)
  end
  if GetSysGlobal(SysGlobal.ORB5) == 0 then
    SetVisibleActor(_orbs[6], false)
  end
  if CheckHeroLiving() == false or GetFlag(Flag.FS0) == true then
    SetEventVolumeEnabled("Reiamuland_Out_RamiasMaiden_00_L1", false)
    SetFlag(Flag.FS0, true)
  end
  if GetFlag(Flag.FE927) == false then
    PlayLocationCamera(table)
    SetFlag(Flag.FE927, true)
  else
    DisableEventFastForwardUI()
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  end
  EventEnd(eventInfo, "")
end
