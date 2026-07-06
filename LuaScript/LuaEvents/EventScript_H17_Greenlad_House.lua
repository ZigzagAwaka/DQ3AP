print("Load Script EventScript_H17_Greenlad_House")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Greenlad_House_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_010_1")
  CmdMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_010_2")
  local tagItemId = "ITEM_IMPORTANT_MOD_ROD"
  SetTagItemId(tagItemId)
  local result = CmdChoiceMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_010_3")
  if result == true then
    CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_SURPRISE")
    CmdEventClosingMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_010_4")
  else
    CmdMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_010_5")
    tagItemId = "ITEM_IMPORTANT_ULTIMATE_KEY"
    SetTagItemId(tagItemId)
    CmdEventClosingMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_010_6")
  end
  EventEnd(eventInfo, "")
end

function Greenlad_House_SUB_0_ACTOR_0110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FE70) == true then
    CmdEventClosingMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_020_5")
  else
    local itemId1 = "ITEM_IMPORTANT_MOD_ROD"
    SetTagItemId(itemId1)
    CmdMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_020_1")
    local itemId2 = "ITEM_IMPORTANT_BOATMANS_BONE"
    SetTagItemId(itemId2)
    local result = CmdChoiceMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_020_2")
    if result == true then
      itemId2 = "ITEM_IMPORTANT_BOATMANS_BONE"
      SetTagItemId(itemId2)
      CmdMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_020_3")
      ItemsGetMessageToActor(targetActorId, "NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_020_4", 2, itemId1, "ITEM_ARCHIPELAGO"--[[itemId2]]) -- AP
      CmdEventClosingMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_020_5")
      -- AP
      AP.Log("Greenlad_House_SUB_0_ACTOR_0110_020 called (Grimland - Old Man giving the Boatman's Bone)")
      AP.CheckLocation("Greenlad_House_SUB_0_ACTOR_0110_020")
      local ItemId = "ITEM_ARCHIPELAGO"
      if ItemId == "ITEM_ARCHIPELAGO" then
        AddItem(ItemId)
      else
        AddItem("ITEM_IMPORTANT_BOATMANS_BONE")
        SetFlag(Flag.FE70, true)
      end
      -- AP end
      if IsHaveItem("ITEM_IMPORTANT_MOD_ROD") then -- AP
        RemoveItem("ITEM_IMPORTANT_MOD_ROD")
      end
      SetFlag(Flag.FE99, true)
      SetFlag(Flag.FD9, true)
      -- AP
      if ItemId == "ITEM_ARCHIPELAGO" then
      else
        SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_GREENLAD_GetBoatmanBone, true)
      end
      -- AP end
      RequestAutoSaveFromEvent()
    else
      CmdEventClosingMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_020_6")
    end
  end
  EventEnd(eventInfo, "")
end

function Greenlad_House_SUB_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  --[[
  if GetFlag(Flag.FS0) == false then
    local n = math.random(100, 1799)
    n = n / 100
    n = math.floor(n)
    SetSysGlobal(SysGlobal.VD0, n)
    SetFlag(Flag.FS0, true)
  end
  local mapTime = GetMapTimeFrame()
  if GetSysGlobal(SysGlobal.VD0) == 1 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Bard_01_L3")
    else
      SpawnNpc("Greenlad_House_Bard_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 2 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Man_01_L3")
    else
      SpawnNpc("Greenlad_House_Man_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 3 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Merchant_01_L3")
    else
      SpawnNpc("Greenlad_House_Merchant_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 4 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Priest_01_L3")
    else
      SpawnNpc("Greenlad_House_Priest_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 5 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Arakure_01_L3")
    else
      SpawnNpc("Greenlad_House_Arakure_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 6 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Guard_01_L3")
    else
      SpawnNpc("Greenlad_House_Guard_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 7 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_King_01_L3")
    else
      SpawnNpc("Greenlad_House_King_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 8 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Minister_01_L3")
    else
      SpawnNpc("Greenlad_House_Minister_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 9 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Prisoner_01_L3")
    else
      SpawnNpc("Greenlad_House_Prisoner_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 10 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_ToughMan_01_L3")
    else
      SpawnNpc("Greenlad_House_ToughMan_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 11 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_BunnyGirl_01_L3")
    else
      SpawnNpc("Greenlad_House_BunnyGirl_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 12 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Dancer_01_L3")
    else
      SpawnNpc("Greenlad_House_Dancer_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 13 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Miss_01_L3")
    else
      SpawnNpc("Greenlad_House_Miss_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 14 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Woman_01_L3")
    else
      SpawnNpc("Greenlad_House_Woman_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 15 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Corpse_01_L3")
    else
      SpawnNpc("Greenlad_House_Corpse_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 16 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Monster_01_L3")
    else
      SpawnNpc("Greenlad_House_Monster_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 17 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Slime_01_L3")
    else
      SpawnNpc("Greenlad_House_Slime_01_L1")
    end
  end
  DisableEventFastForwardUI()
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  ]]
  EventEnd(eventInfo, "")
end

function Greenlad_House_SUB_0_ACTOR_0110_030(BeginOverlap, table, ...)
  Greenlad_House_SUB_0_ACTOR_0110_020(BeginOverlap, table, ...)
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if GetSysGlobal(SysGlobal.VD0) == 1 then
    CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_NOTE")
  elseif GetSysGlobal(SysGlobal.VD0) == 2 then
    CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_QUESTION")
  elseif GetSysGlobal(SysGlobal.VD0) == 3 then
    CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_LAUGH")
  else
    SetNpcAnimation(targetActorId, AnimationType.Walk, 2, EFlipbookPlayTypeLoop, false)
    Wait(0.5)
    ResetNpcAnimation(targetActorId)
  end
  CmdMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_030_1")
  ChangeForm()
  EventEnd(eventInfo, "")
  ]]
end

function Greenlad_House_SUB_0_ACTOR_0110_040(BeginOverlap, table, ...)
  Greenlad_House_SUB_0_ACTOR_0110_020(BeginOverlap, table, ...)
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if GetSysGlobal(SysGlobal.VD0) == 5 then
    CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_ANGER")
  elseif GetSysGlobal(SysGlobal.VD0) == 6 then
    CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_QUESTION")
    SetNpcAnimation(targetActorId, AnimationType.Walk, 3, EFlipbookPlayTypeLoop, false)
    Wait(0.5)
    ResetNpcAnimation(targetActorId)
  elseif GetSysGlobal(SysGlobal.VD0) == 7 then
    CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_SURPRISE")
  elseif GetSysGlobal(SysGlobal.VD0) == 8 then
    CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_SURPRISE")
    CmdTurnNpcRelative(targetActorId, 90)
    Wait(0.08)
    CmdTurnNpcRelative(targetActorId, -90)
    Wait(0.08)
    CmdTurnNpcRelative(targetActorId, -90)
    Wait(0.08)
    CmdTurnNpcRelative(targetActorId, 90)
    Wait(0.5)
  elseif GetSysGlobal(SysGlobal.VD0) == 9 then
    SpawnMangaIcon(targetActorId, "FIELD_EFX2D_IMPATIENCE")
    SetNpcAnimation(targetActorId, AnimationType.Walk, 3, EFlipbookPlayTypeLoop, false)
    Wait(0.5)
    ResetNpcAnimation(targetActorId)
  else
    CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_IRRITATION")
  end
  CmdMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_040_1")
  ChangeForm()
  EventEnd(eventInfo, "")
  ]]
end

function Greenlad_House_SUB_0_ACTOR_0110_050(BeginOverlap, table, ...)
  Greenlad_House_SUB_0_ACTOR_0110_020(BeginOverlap, table, ...)
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if GetSysGlobal(SysGlobal.VD0) == 11 then
    CmdJumpNpc(targetActorId, 20, 0.2, true)
  elseif GetSysGlobal(SysGlobal.VD0) == 12 then
    CmdTurnNpcRelative(targetActorId, 90)
    Wait(0.08)
    CmdTurnNpcRelative(targetActorId, 90)
    Wait(0.08)
    CmdTurnNpcRelative(targetActorId, 90)
    Wait(0.08)
    CmdTurnNpcRelative(targetActorId, 90)
    Wait(0.08)
  else
    if GetSysGlobal(SysGlobal.VD0) == 13 then
      SetNpcAnimation(targetActorId, AnimationType.Walk, 2, EFlipbookPlayTypeLoop, false)
      Wait(0.5)
      ResetNpcAnimation(targetActorId)
    else
    end
  end
  CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_HEART")
  CmdMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_050_1")
  ChangeForm()
  EventEnd(eventInfo, "")
  ]]
end

function Greenlad_House_SUB_0_ACTOR_0110_060(BeginOverlap, table, ...)
  Greenlad_House_SUB_0_ACTOR_0110_020(BeginOverlap, table, ...)
  --[[
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if GetSysGlobal(SysGlobal.VD0) == 15 then
    SetNpcAnimation(targetActorId, AnimationType.Walk, 3, EFlipbookPlayTypeLoop, false)
    Wait(0.5)
    ResetNpcAnimation(targetActorId)
    local playerPos = GetPartyMemberLocation(1)
    local npcPos = GetNpcLocation(targetActorId)
    if playerPos.X < npcPos.X - 200 then
      CmdSetNpcAnimation(targetActorId, AnimationType.Act4, 1, EFlipbookPlayTypeStopEnd, true)
    end
    CmdMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_060_1")
  elseif GetSysGlobal(SysGlobal.VD0) == 16 then
    CmdSetNpcAnimation(targetActorId, AnimationType.Act1, 1, EFlipbookPlayTypeAutoResetIdle, false)
    CmdMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_060_1")
  else
    CmdSetNpcAnimation(targetActorId, AnimationType.Act2, 1, EFlipbookPlayTypeAutoResetIdle, false)
    CmdMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_060_2_1")
  end
  ChangeForm()
  EventEnd(eventInfo, "")
  ]]
end

function ChangeForm()
  local offsetX = -30
  local offsetZ = 60
  local scale = 1
  local waitTimeEffect = 0.5
  local mapTime = GetMapTimeFrame()
  PlaySEEvent("EVESE_MOD_ROD")
  if GetSysGlobal(SysGlobal.VD0) == 1 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_Bard_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Bard_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_Bard_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Bard_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 2 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_Man_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Man_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_Man_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Man_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 3 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_Merchant_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Merchant_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_Merchant_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Merchant_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 4 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_Priest_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Priest_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_Priest_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Priest_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 5 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_Arakure_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Arakure_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_Arakure_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Arakure_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 6 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_Guard_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Guard_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_Guard_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Guard_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 7 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_King_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_King_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_King_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_King_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 8 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_Minister_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Minister_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_Minister_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Minister_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 9 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_Prisoner_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Prisoner_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_Prisoner_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Prisoner_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 10 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_ToughMan_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_ToughMan_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_ToughMan_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_ToughMan_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 11 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_BunnyGirl_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_BunnyGirl_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_BunnyGirl_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_BunnyGirl_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 12 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_Dancer_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Dancer_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_Dancer_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Dancer_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 13 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_Miss_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Miss_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_Miss_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Miss_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 14 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_Woman_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Woman_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_Woman_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Woman_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 15 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_Corpse_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Corpse_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_Corpse_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Corpse_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 16 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_Monster_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Monster_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_Monster_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Monster_01_L1")
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 17 then
    if mapTime == MAPTIME_NIGHT then
      SpawnEffectAtMapObject("BP_TriggerChara_Slime_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Slime_01_L3")
    else
      SpawnEffectAtMapObject("BP_TriggerChara_Slime_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
      Wait(waitTimeEffect)
      DestroyNpc("Greenlad_House_Slime_01_L1")
    end
  end
  local actorId = ""
  if mapTime == MAPTIME_NIGHT then
    actorId = "Greenlad_House_OldMan_Greenlad_01_L3"
  else
    actorId = "Greenlad_House_OldMan_Greenlad_01_L1"
  end
  SpawnNpc(actorId)
  CmdTurnNpc(actorId, NPC_D_TO_PLAYER)
  Wait(0.5)
  CmdSpawnMangaIcon(actorId, "FIELD_EFX2D_LAUGH")
  CmdEventClosingMessage("NPC_Talk_Greenlad_House_SUB_0_ACTOR_0110_030_2")
  PlaySEEvent("EVESE_MOD_ROD")
  if mapTime == MAPTIME_NIGHT then
    SpawnEffectAtMapObject("BP_TriggerChara_OldMan_Greenlad_01_L3", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
    Wait(waitTimeEffect)
    DestroyNpc("Greenlad_House_OldMan_Greenlad_01_L3")
  else
    SpawnEffectAtMapObject("BP_TriggerChara_OldMan_Greenlad_01_L1", "Sys_CharaChangeSmoke_01", offsetX, 0, offsetZ, scale)
    Wait(waitTimeEffect)
    DestroyNpc("Greenlad_House_OldMan_Greenlad_01_L1")
  end
  if GetSysGlobal(SysGlobal.VD0) == 1 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Bard_01_L3")
      CmdTurnNpc("Greenlad_House_Bard_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_Bard_01_L1")
      CmdTurnNpc("Greenlad_House_Bard_01_L1", NPC_D_TO_PLAYER)
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 2 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Man_01_L3")
      CmdTurnNpc("Greenlad_House_Man_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_Man_01_L1")
      CmdTurnNpc("Greenlad_House_Man_01_L1", NPC_D_TO_PLAYER)
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 3 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Merchant_01_L3")
      CmdTurnNpc("Greenlad_House_Merchant_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_Merchant_01_L1")
      CmdTurnNpc("Greenlad_House_Merchant_01_L1", NPC_D_TO_PLAYER)
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 4 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Priest_01_L3")
      CmdTurnNpc("Greenlad_House_Priest_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_Priest_01_L1")
      CmdTurnNpc("Greenlad_House_Priest_01_L1", NPC_D_TO_PLAYER)
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 5 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Arakure_01_L3")
      CmdTurnNpc("Greenlad_House_Arakure_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_Arakure_01_L1")
      CmdTurnNpc("Greenlad_House_Arakure_01_L1", NPC_D_TO_PLAYER)
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 6 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Guard_01_L3")
      CmdTurnNpc("Greenlad_House_Guard_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_Guard_01_L1")
      CmdTurnNpc("Greenlad_House_Guard_01_L1", NPC_D_TO_PLAYER)
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 7 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_King_01_L3")
      CmdTurnNpc("Greenlad_House_King_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_King_01_L1")
      CmdTurnNpc("Greenlad_House_King_01_L1", NPC_D_TO_PLAYER)
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 8 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Minister_01_L3")
      CmdTurnNpc("Greenlad_House_Minister_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_Minister_01_L1")
      CmdTurnNpc("Greenlad_House_Minister_01_L1", NPC_D_TO_PLAYER)
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 9 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Prisoner_01_L3")
      CmdTurnNpc("Greenlad_House_Prisoner_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_Prisoner_01_L1")
      CmdTurnNpc("Greenlad_House_Prisoner_01_L1", NPC_D_TO_PLAYER)
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 10 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_ToughMan_01_L3")
      CmdTurnNpc("Greenlad_House_ToughMan_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_ToughMan_01_L1")
      CmdTurnNpc("Greenlad_House_ToughMan_01_L1", NPC_D_TO_PLAYER)
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 11 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_BunnyGirl_01_L3")
      CmdTurnNpc("Greenlad_House_BunnyGirl_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_BunnyGirl_01_L1")
      CmdTurnNpc("Greenlad_House_BunnyGirl_01_L1", NPC_D_TO_PLAYER)
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 12 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Dancer_01_L3")
      CmdTurnNpc("Greenlad_House_Dancer_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_Dancer_01_L1")
      CmdTurnNpc("Greenlad_House_Dancer_01_L1", NPC_D_TO_PLAYER)
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 13 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Miss_01_L3")
      CmdTurnNpc("Greenlad_House_Miss_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_Miss_01_L1")
      CmdTurnNpc("Greenlad_House_Miss_01_L1", NPC_D_TO_PLAYER)
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 14 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Woman_01_L3")
      CmdTurnNpc("Greenlad_House_Woman_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_Woman_01_L1")
      CmdTurnNpc("Greenlad_House_Woman_01_L1", NPC_D_TO_PLAYER)
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 15 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Corpse_01_L3")
      CmdTurnNpc("Greenlad_House_Corpse_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_Corpse_01_L1")
      CmdTurnNpc("Greenlad_House_Corpse_01_L1", NPC_D_TO_PLAYER)
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 16 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Monster_01_L3")
      CmdTurnNpc("Greenlad_House_Monster_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_Monster_01_L1")
      CmdTurnNpc("Greenlad_House_Monster_01_L1", NPC_D_TO_PLAYER)
    end
  elseif GetSysGlobal(SysGlobal.VD0) == 17 then
    if mapTime == MAPTIME_NIGHT then
      SpawnNpc("Greenlad_House_Slime_01_L3")
      CmdTurnNpc("Greenlad_House_Slime_01_L3", NPC_D_TO_PLAYER)
    else
      SpawnNpc("Greenlad_House_Slime_01_L1")
      CmdTurnNpc("Greenlad_House_Slime_01_L1", NPC_D_TO_PLAYER)
    end
  end
end
