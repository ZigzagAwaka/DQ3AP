print("Load Script EventScript_C11_Mercado_Shop02_2F")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Mercado_Shop02_SUB_0_ACTOR_0120_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0120_010_1")
  CmdMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0120_010_2")
  CmdEventClosingMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0120_010_3")
  EventEnd(eventInfo, "")
end

function Mercado_Shop02_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0110_010_1")
  CmdMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0110_010_2")
  CmdEventClosingMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0110_010_3")
  EventEnd(eventInfo, "")
end

function Mercado_Shop02_SUB_0_ACTOR_0220_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0220_010_1")
  CmdEventClosingMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0220_010_2")
  EventEnd(eventInfo, "", false)
end

function Mercado_Shop02_SUB_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0210_010_1")
  EventEnd(eventInfo, "", false)
end

function Mercado_Shop02_SUB_0_ACTOR_0320_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0320_010_1")
  CmdMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0320_010_2")
  CmdMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0320_010_3")
  CmdEventClosingMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0320_010_4")
  EventEnd(eventInfo, "")
end

function Mercado_Shop02_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0310_010_1")
  EventEnd(eventInfo, "")
end

function Mercado_Shop02_SUB_0_ACTOR_0420_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local partyNum = CheckPartyMemberNum()
  if GetPartyMemberGender(1) == UNIT_GENDER_MALE then
    if partyNum == 1 then
      CmdMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0420_010_2")
    else
      CmdMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0420_010_1")
    end
  elseif partyNum == 1 then
    CmdMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0420_010_4")
  else
    CmdMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0420_010_3")
  end
  CmdEventClosingMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0420_010_5")
  EventEnd(eventInfo, "")
end

function Mercado_Shop02_SUB_0_ACTOR_0410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0410_010_1")
  EventEnd(eventInfo, "")
end

function Mercado_Shop02_2F_RotoSword_02_0(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  SetTagItemId("ITEM_IMPORTANT_BROKEN_SWORD")
  EndSkillTransformNoEffect()
  EndSkillInvisibleNoEffect()
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Scholar_Mercado = "Mercado_Shop02_2F_Scholar_01_L3"
  else
    Scholar_Mercado = "Mercado_Shop02_2F_Scholar_01_L1"
  end
  CmdTurnNpc(Scholar_Mercado, NPC_D_RIGHT)
  Wait(0.5)
  CmdSpawnMangaIcon(Scholar_Mercado, "FIELD_EFX2D_SURPRISE")
  Wait(0.5)
  CmdChangeStageCameraToGlobalPoint(1255, 195, 200, CAMERA_BLEND_LINEAR, 1.5, 0, 1500, {
    Yaw = 0,
    Pitch = -30,
    Roll = 0
  })
  CmdMessage("NPC_Talk_Mercado_Shop02_2F_RotoSword_02_0_1")
  TurnParty(1, 3)
  CmdMessage("NPC_Talk_Mercado_Shop02_2F_RotoSword_02_0_2")
  CmdMessage("NPC_Talk_Mercado_Shop02_2F_RotoSword_02_0_3")
  TurnParty(1, 1)
  CmdEventClosingMessage("NPC_Talk_Mercado_Shop02_2F_RotoSword_02_0_4")
  CloseMessage()
  Wait(0.5)
  SetVisibleActor("BP_SearchEvent_C11_RotoSword_02_01", false)
  HideMessageWindowPageFeedIcon()
  ItemGetMessageToLocation("NPC_Talk_Mercado_Shop02_2F_RotoSword_02_0_5", "ITEM_IMPORTANT_BROKEN_SWORD", {
    X = 1271,
    Y = 424,
    Z = 200
  })
  -- AP
  AP.Log("Mercado_Shop02_2F_RotoSword_02_0 called (Cantlin - Found Broken Sword)")
  AP.CheckLocation("Mercado_Shop02_2F_RotoSword_02_0")
  local ItemId = "ITEM_ARCHIPELAGO"
  if ItemId == "ITEM_ARCHIPELAGO" then
    AddItem(ItemId)
  else
    AddItem("ITEM_IMPORTANT_BROKEN_SWORD")
    SetFlag(Flag.FE877, true)
  end
  -- AP end
  CmdChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 1.5, 2)
  -- AP
  if ItemId == "ITEM_ARCHIPELAGO" then
  else
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MERCADO_GetBrokenSword, true)
  end
  -- AP end
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function Mercado_Shop02_2F_ProtoGolem_01(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Scholar_Mercado = "Mercado_Shop02_2F_Scholar_01_L3"
  else
    Scholar_Mercado = "Mercado_Shop02_2F_Scholar_01_L1"
  end
  CmdTurnNpc(Scholar_Mercado, NPC_D_RIGHT)
  CmdMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0110_010_1")
  CmdMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0110_010_2")
  CmdEventClosingMessage("NPC_Talk_Mercado_Shop02_SUB_0_ACTOR_0110_010_3")
  EventEnd(eventInfo, "")
end
