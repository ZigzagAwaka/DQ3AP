print("Load Script EventScript_T04_Ashalam_Theater")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_MOYAMOYA")
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0110_010_1")
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_0120_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0120_010_1")
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0120_010_2")
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0120_010_3")
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0120_010_4")
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_0120_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0120_020_1")
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0120_020_2")
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0210_010_1")
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_NOTE")
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0310_010_1")
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_0410_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_IMPATIENCE")
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0410_010_1")
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_0510_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  local dancer01 = "Ashalam_Theater_Dancer_01_L1"
  local dancer02 = "Ashalam_Theater_Dancer_02_L1"
  local dancer03 = "Ashalam_Theater_Dancer_03_L1"
  local dancer04 = "Ashalam_Theater_Dancer_04_L1"
  local waitTime = 0.0416666667
  local moveX = 10
  local moveSpeed = moveX / waitTime
  local animType = AnimationType.Idle
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0510_010_1")
  HideMessageWindowPageFeedIcon()
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0510_010_2")
  CloseMessage()
  Wait(0.3)
  CmdTurnNpc("Ashalam_Theater_TheatreMaster_01_L1", NPC_D_RIGHT)
  Wait(0.5)
  EventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0510_010_3")
  Wait(0.5)
  DisableNpcCollisionNpcToPlayer(targetActorId, true)
  MoveNpcRelativeDetail(targetActorId, {
    X = moveX,
    Y = 0,
    Z = 0
  }, moveSpeed, NPC_D_RIGHT, animType, 1)
  WaitMoveNpc(targetActorId)
  Wait(waitTime)
  MoveNpcRelativeDetail(targetActorId, {
    X = -moveX,
    Y = 0,
    Z = 0
  }, moveSpeed, NPC_D_RIGHT, animType, 1)
  WaitMoveNpc(targetActorId)
  Wait(waitTime)
  MoveNpcRelativeDetail(targetActorId, {
    X = moveX,
    Y = 0,
    Z = 0
  }, moveSpeed, NPC_D_RIGHT, animType, 1)
  WaitMoveNpc(targetActorId)
  Wait(waitTime)
  MoveNpcRelativeDetail(targetActorId, {
    X = -moveX,
    Y = 0,
    Z = 0
  }, moveSpeed, NPC_D_RIGHT, animType, 1)
  WaitMoveNpc(targetActorId)
  Wait(waitTime)
  WaitShowMessage()
  DisableNpcCollisionNpcToPlayer(targetActorId, false)
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_0520_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0520_010_1")
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_0520_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0520_020_1")
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0520_020_2")
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0520_020_3")
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0520_020_4")
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0520_020_5")
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0520_020_6")
  local itemId = "ITEM_EQUIP_ARMOR_MAGIC_BIKINI"
  SetTagItemId(itemId)
  ItemGetMessageToActor("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0520_020_7", "ITEM_ARCHIPELAGO"--[[itemId]], targetActorId) -- AP
  -- AP
  AP.Log("Ashalam_Theater_SUB_0_ACTOR_0520_020 called (Asham - Manager giving the Magic Bikini)")
  AP.CheckLocation("Ashalam_Theater_SUB_0_ACTOR_0520_020")
  local APid = "ITEM_ARCHIPELAGO"
  if APid == "ITEM_ARCHIPELAGO" then
    AddItem(APid)
  else
    AddItem(itemId)
  end
  -- AP end
  SetFlag(Flag.FE136, true)
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0520_030_1")
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0520_030_2")
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_0520_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0520_030_1")
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0520_030_2")
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_0610_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0610_010_1")
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_0620_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0620_010_1")
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0620_010_2")
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_0720_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0720_010_1")
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_0820_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0820_010_1")
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_0920_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0920_010_1")
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_0920_010_2")
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_1020_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_1020_010_1")
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_1120_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_YELL")
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_1120_010_1")
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SUB_0_ACTOR_1220_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_1220_010_1")
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SUB_0_ACTOR_1220_010_2")
  EventEnd(eventInfo, "")
end

function Ashalam_Theater_SearchObj_Ground_Box_01(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdEventClosingMessage("NPC_Talk_Ashalam_Theater_SearchObj_Ground_01_1")
  EventEnd(eventInfo, "")
end
