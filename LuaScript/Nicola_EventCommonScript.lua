print("Load Script Nicola_EventCommonScript")

local AP = require("Src/DQ3AP") -- AP

function SearchObject_ShowMessage(ObjectId, TreasureId, ItemId, ItemCount, Gold)
  local receptor = 0
  local result = 0
  -- AP
  AP.Log("SearchObject_ShowMessage called with ObjectId: " .. tostring(ObjectId) .. ", TreasureId: " .. tostring(TreasureId) .. ", ItemId: " .. tostring(ItemId) .. ", ItemCount: " .. tostring(ItemCount) .. ", Gold: " .. tostring(Gold))
  AP.CheckLocation(TreasureId)
  ItemId = "ITEM_ARCHIPELAGO"
  Gold = 0
  AddItem(ItemId)
  SetTagItemId(ItemId)
  CmdLoadItemIcon(ItemId)
  CmdPlayItemGetNoWait(ObjectId, TreasureId)
  PlaySEUI("SYSSE_TD_TREASURE_BOX_ITEM")
  CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_11")
  if ItemId == "ITEM_ARCHIPELAGO" then
    return result
  end
  -- AP end
  if 1 <= Gold then
    AddGold(Gold)
    SetTagValue(Gold)
    PlaySEUI("SYSSE_TD_TREASURE_BOX_ITEM")
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_8")
  elseif ItemId ~= "None" then
    receptor = AddItem(ItemId)
    SetTagItemId(ItemId)
    print("receptor = " .. receptor)
    if receptor == 0 then
      CmdLoadItemIcon(ItemId)
      CmdPlayItemGetNoWait(ObjectId, TreasureId)
      if IsRareItem(ItemId) then
        PlayJingleOnGetItemRareDefaultFade()
        CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_5")
        WaitPlayJingle()
      else
        PlaySEUI("SYSSE_TD_TREASURE_BOX_ITEM")
        CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_5")
      end
      if GetItemType(ItemId) == EItemTypeITEM_IMPORTANT then
        CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_11")
      else
        CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_7")
      end
    elseif receptor == -2 then
      CmdLoadItemIcon(ItemId)
      CmdPlayItemGetNoWait(ObjectId, TreasureId)
      PlaySEUI("SYSSE_TD_TREASURE_BOX_ITEM")
      CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_5")
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_11")
      if GetFlag(Flag.FE962) == false then
        CloseMessage()
        CmdCallTutorialUI("INFORMATION_MEDAL")
        SetFlag(Flag.FE962, true)
      end
    elseif 0 < receptor then
      CmdLoadItemIcon(ItemId)
      CmdPlayItemGetNoWait(ObjectId, TreasureId)
      if IsRareItem(ItemId) then
        PlayJingleOnGetItemRareDefaultFade()
        SetTagActorFromParty(receptor - 1)
        CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_5")
        WaitPlayJingle()
        CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_11")
      else
        PlaySEUI("SYSSE_TD_TREASURE_BOX_ITEM")
        SetTagActorFromParty(receptor - 1)
        CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_5")
        CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_11")
      end
    elseif receptor == -1 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_ItemGetBagMax_1")
    else
      print("AddItem\227\129\174\232\191\148\227\130\138\229\128\164\227\129\140" .. receptor .. "\227\129\171\227\129\170\227\130\139\227\129\147\227\129\168\227\129\175\230\131\179\229\174\154\227\129\149\227\130\140\227\129\166\227\129\132\227\129\190\227\129\155\227\130\147\227\128\130")
    end
  else
    result = -1
  end
  return result
end

function SearchObject_Important(eventInfo, TreasureId, ItemId, bgmJingleId)
  local receptor = AddItem(ItemId)
  SetTagItemId(ItemId)
  if bgmJingleId ~= nil then
    CmdRequestPlayJingle(bgmJingleId, EBgmPlayerManagerMEPlayRequestTypePAUSE, 0.5, EBgmPlayerManagerLineTypeOnMEEndCURRENT, 0.5, "")
    SetVisibleActor(eventInfo[1], false)
  end
  CmdLoadItemIcon(ItemId)
  CmdPlayItemGetNoWait(eventInfo[1], TreasureId)
  PlayJingleOnGetItemRareDefaultFade()
  SetTagActorFromParty(receptor - 1)
  CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_5")
  WaitPlayJingle()
  if bgmJingleId ~= nil then
    PauseMainBGM(false, 0.5)
  end
  if IsRareItem(ItemId) then
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_11")
  else
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_7")
  end
end

function SearchObject_Storage(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, "")
  CmdSearchObject_Storage(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  EventEnd(eventInfo, "")
end

function CmdSearchObject_Storage(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  print("SearchObject_Storage execute, Item : " .. tostring(ItemId) .. ", Count : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold))
  print("CanObtainItem=" .. tostring(CanObtainItem))
  if CanObtainItem then
    PlaySEUI("SYSSE_TD_DRAWER_OPEN_2")
    CmdPlayOpenAnimSearchObj(eventInfo[1])
    if SearchObject_ShowMessage(GetTargetActorIdFromEventInfo(eventInfo), TreasureId, ItemId, ItemCount, Gold) == -1 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_STORAGE_4")
    end
  else
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_STORAGE_4")
  end
end

function SearchObject_JipangStorage(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, "")
  CmdSearchObject_JipangStorage(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  EventEnd(eventInfo, "")
end

function CmdSearchObject_JipangStorage(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  print("SearchObject_JipangStorage execute, Item : " .. tostring(ItemId) .. ", Count : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold))
  print("CanObtainItem=" .. tostring(CanObtainItem))
  if CanObtainItem then
    PlaySEUI("SYSSE_TD_SLIDE_DOOR_OPEN")
    CmdPlayOpenAnimSearchObj(eventInfo[1])
    if SearchObject_ShowMessage(GetTargetActorIdFromEventInfo(eventInfo), TreasureId, ItemId, ItemCount, Gold) == -1 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_STORAGE_4")
    end
  else
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_STORAGE_4")
  end
end

function SearchObject_Drawer(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, "")
  CmdSearchObject_Drawer(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  EventEnd(eventInfo, "")
end

function CmdSearchObject_Drawer(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  print("SearchObject_Drawer execute, Item : " .. tostring(ItemId) .. ", Count : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold))
  print("CanObtainItem=" .. tostring(CanObtainItem))
  if CanObtainItem then
    PlaySEUI("SYSSE_TD_DRAWER_OPEN_1")
    CmdPlayOpenAnimSearchObj(eventInfo[1])
    if SearchObject_ShowMessage(GetTargetActorIdFromEventInfo(eventInfo), TreasureId, ItemId, ItemCount, Gold) == -1 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_STORAGE_4")
    end
  else
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_STORAGE_4")
  end
end

function SearchObject_Bookshelf(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, "")
  CmdSearchObject_Bookshelf(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  EventEnd(eventInfo, "")
end

function CmdSearchObject_Bookshelf(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  print("SearchObject_Bookshelf execute, Item : " .. tostring(ItemId) .. ", Count : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold))
  CmdMessage("NPC_Talk_Common_SEARCHOBJECT_BOOKSHELF_1")
  print("CanObtainItem=" .. tostring(CanObtainItem))
  if CanObtainItem then
    if SearchObject_ShowMessage(GetTargetActorIdFromEventInfo(eventInfo), TreasureId, ItemId, ItemCount, Gold) == -1 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_STORAGE_4")
    end
  else
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_STORAGE_4")
  end
end

function SearchObject_Barrel(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, "")
  CmdSearchObject_Barrel(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  EventEnd(eventInfo, "")
end

function CmdSearchObject_Barrel(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  print("SearchObject_Barrel execute, Item : " .. tostring(ItemId) .. ", Count : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold))
  CmdMessage("NPC_Talk_Common_SEARCHOBJECT_BARREL_1")
  print("CanObtainItem=" .. tostring(CanObtainItem))
  if CanObtainItem then
    if SearchObject_ShowMessage(GetTargetActorIdFromEventInfo(eventInfo), TreasureId, ItemId, ItemCount, Gold) == -1 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_STORAGE_4")
    end
  else
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_STORAGE_4")
  end
end

function SearchObject_Pot(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, "")
  CmdSearchObject_Pot(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  EventEnd(eventInfo, "")
end

function CmdSearchObject_Pot(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  print("SearchObject_Pot execute, Item : " .. tostring(ItemId) .. ", Count : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold))
  CmdMessage("NPC_Talk_Common_SEARCHOBJECT_POT_1")
  print("CanObtainItem=" .. tostring(CanObtainItem))
  if CanObtainItem then
    if SearchObject_ShowMessage(GetTargetActorIdFromEventInfo(eventInfo), TreasureId, ItemId, ItemCount, Gold) == -1 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_STORAGE_4")
    end
  else
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_STORAGE_4")
  end
end

function SearchObject_Sack(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, "")
  CmdSearchObject_Sack(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  EventEnd(eventInfo, "")
end

function CmdSearchObject_Sack(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  print("SearchObject_Sack execute, Item : " .. tostring(ItemId) .. ", Count : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold))
  PlaySEUI("SYSSE_TD_BAG")
  CmdMessage("NPC_Talk_Common_SEARCHOBJECT_BAG_1")
  print("CanObtainItem=" .. tostring(CanObtainItem))
  if CanObtainItem then
    if SearchObject_ShowMessage(GetTargetActorIdFromEventInfo(eventInfo), TreasureId, ItemId, ItemCount, Gold) == -1 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_BAG_2")
    end
  else
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_BAG_2")
  end
end

function SearchObject_Ground(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  eventInfo = EventStart(table, "")
  SetVisibleActor(eventInfo[1], false)
  CmdSearchObject_Ground(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  EventEnd(eventInfo, "")
end

function CmdSearchObject_Ground(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold)
  print("SearchObject_Ground execute, Item : " .. tostring(ItemId) .. ", Count : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold))
  CmdMessage("NPC_Talk_Common_SEARCHOBJECT_GROUND_1")
  print("CanObtainItem=" .. tostring(CanObtainItem))
  if CanObtainItem then
    if SearchObject_ShowMessage(GetTargetActorIdFromEventInfo(eventInfo), TreasureId, ItemId, ItemCount, Gold) == -1 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_STORAGE_4")
    end
  else
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_STORAGE_4")
  end
end

function Treasure_Normal(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdTreasure_Normal(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  EventEnd(eventInfo, "")
end

function CmdTreasure_Normal(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  print("Treasure_Normal execute, TreasureId : " .. tostring(TreasureId) .. ", Item : " .. tostring(ItemId) .. ", Count : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold) .. ", EnemyId : " .. tostring(EnemyId))
  print("CanObtainItem=" .. tostring(CanObtainItem))
  if CanObtainItem then
    PlaySEUI("SYSSE_TD_TREASURE_BOX")
    CmdPlayOpenAnimSearchObj(eventInfo[1])
    CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_1")
    if SearchObject_ShowMessage(GetTargetActorIdFromEventInfo(eventInfo), TreasureId, ItemId, ItemCount, Gold) == -1 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_2")
    end
  else
    CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_3")
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_2")
  end
end

function Treasure_Important(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdTreasure_Important(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  EventEnd(eventInfo, "")
end

function CmdTreasure_Important(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  print("Treasure_Important execute, TreasureId : " .. tostring(TreasureId) .. ", Item : " .. tostring(ItemId) .. ", Count : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold) .. ", EnemyId : " .. tostring(EnemyId))
  print("CanObtainItem=" .. tostring(CanObtainItem))
  if CanObtainItem then
    PlaySEUI("SYSSE_TD_TREASURE_BOX")
    CmdPlayOpenAnimSearchObj(eventInfo[1])
    CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_1")
    if SearchObject_ShowMessage(GetTargetActorIdFromEventInfo(eventInfo), TreasureId, ItemId, ItemCount, Gold) == -1 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_2")
    end
  else
    CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_3")
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_2")
  end
end

function Treasure_Enemy(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdTreasure_Enemy(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  EventEnd(eventInfo, "")
end

function CmdTreasure_Enemy(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  print("Treasure_Enemy execute, TreasureId : " .. tostring(TreasureId) .. ", Item : " .. tostring(ItemId) .. ", Count : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold) .. ", EnemyId : " .. tostring(EnemyId))
  print("CanObtainItem=" .. tostring(CanObtainItem))
  if CanObtainItem then
    RequestPreloadEventBattle(EnemyId)
    PlaySEUI("SYSSE_TD_TREASURE_BOX")
    CmdPlayOpenAnimSearchObj(eventInfo[1])
    local MonsterTextId = GetEventBattleMonsterTextId(EnemyId)
    SetTagWord(MonsterTextId)
    CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_1")
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_9")
    CloseMessage()
    CmdStartEventBattle(EnemyId)
  else
    CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_3")
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_2")
  end
end

function Treasure_EnemyEnd(BeginOverlap, table, SearchObjectName, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  local eventInfo = EventStart(table, "")
  print("TreasureEnemyEnd execute, SearchObjectName : " .. tostring(SearchObjectName) .. ", TreasureId : " .. tostring(TreasureId) .. ", ItemId : " .. tostring(ItemId) .. ", ItemCount : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold) .. ", EnemyId : " .. tostring(EnemyId))
  CmdPlayOpenAnimSearchObj(SearchObjectName)
  CmdFadeInAfterEventBattle()
  EventEnd(eventInfo, "")
end

function Treasure_Pyramid(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdTreasure_Pyramid(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  EventEnd(eventInfo, "")
end

function CmdTreasure_Pyramid(eventInfo, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  print("Treasure_Pyramid execute, TreasureId : " .. tostring(TreasureId) .. ", Item : " .. tostring(ItemId) .. ", Count : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold) .. ", EnemyId : " .. tostring(EnemyId))
  print("CanObtainItem=" .. tostring(CanObtainItem))
  if CanObtainItem then
    local len = string.len(eventInfo[1])
    local str = string.sub(eventInfo[1], len - 1, len)
    local index = tonumber(str) + 1
    RequestPreloadEventBattle(EnemyId)
    PlaySEUI("SYSSE_TD_TREASURE_BOX")
    CmdPlayOpenAnimSearchObj(eventInfo[1])
    CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_1")
    SetDispMiniMap(false)
    CmdMessage("NPC_Talk_Pyramid_4F_SearchObj_Treasure_1")
    CloseMessage()
    SetEventFadeAlpha(0.5)
    CmdFadeOut(EFadingPriorityEventUIBackGround, 0.5)
    CmdMessageDetail("NPC_Talk_Pyramid_4F_SearchObj_Treasure_2", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
    CmdEventClosingMessageDetail("NPC_Talk_Pyramid_4F_SearchObj_Treasure_3", MESSAGE_WINDOW_PERSONALITY_TEST, MESSAGE_POSITION_CENTER)
    CloseMessage()
    local cameraOffsetZ = 100
    local cameraZL = 540 + cameraOffsetZ
    local cameraZH = 860 + cameraOffsetZ
    local tbl = {
      {
        {
          X = -800,
          Y = 440,
          Z = cameraZH
        },
        0.65,
        -20,
        "BP_SearchAnimEvent_D06_Coffin_01_00"
      },
      {
        {
          X = 0,
          Y = 860,
          Z = cameraZL
        },
        0.75,
        -15,
        "BP_SearchAnimEvent_D06_Coffin_01_01"
      },
      {
        {
          X = 0,
          Y = 2830,
          Z = cameraZL
        },
        0.75,
        -20,
        "BP_SearchAnimEvent_D06_Coffin_01_02"
      },
      {
        {
          X = -800,
          Y = 3250,
          Z = cameraZH
        },
        0.65,
        -20,
        "BP_SearchAnimEvent_D06_Coffin_01_03"
      },
      {
        {
          X = 0,
          Y = 440,
          Z = cameraZH
        },
        0.7,
        -15,
        "BP_SearchAnimEvent_D06_Coffin_01_04"
      },
      {
        {
          X = 0,
          Y = 3250,
          Z = cameraZH
        },
        0.7,
        -15,
        "BP_SearchAnimEvent_D06_Coffin_01_05"
      },
      {
        {
          X = 700,
          Y = 860,
          Z = cameraZL
        },
        0.8,
        -15,
        "BP_SearchAnimEvent_D06_Coffin_01_06"
      },
      {
        {
          X = 700,
          Y = 2830,
          Z = cameraZL
        },
        0.8,
        -15,
        "BP_SearchAnimEvent_D06_Coffin_01_07"
      },
      {
        {
          X = 700,
          Y = 440,
          Z = cameraZH
        },
        0.7,
        -15,
        "BP_SearchAnimEvent_D06_Coffin_01_08"
      },
      {
        {
          X = 700,
          Y = 3250,
          Z = cameraZH
        },
        0.7,
        -15,
        "BP_SearchAnimEvent_D06_Coffin_01_09"
      },
      {
        {
          X = 1350,
          Y = 440,
          Z = cameraZH
        },
        0.7,
        -15,
        "BP_SearchAnimEvent_D06_Coffin_01_10"
      },
      {
        {
          X = 1350,
          Y = 1170,
          Z = cameraZL
        },
        0.75,
        -15,
        "BP_SearchAnimEvent_D06_Coffin_01_11"
      },
      {
        {
          X = 1350,
          Y = 2530,
          Z = cameraZL
        },
        0.75,
        -15,
        "BP_SearchAnimEvent_D06_Coffin_01_12"
      },
      {
        {
          X = 1350,
          Y = 3250,
          Z = cameraZH
        },
        0.7,
        -15,
        "BP_SearchAnimEvent_D06_Coffin_01_13"
      }
    }
    CmdChangeStageCameraToGlobalPoint(tbl[index][1].X, tbl[index][1].Y, tbl[index][1].Z, CAMERA_BLEND_EASE_IN_OUT, tbl[index][2], 2, 2000, {
      Yaw = 0,
      Pitch = tbl[index][3],
      Roll = 0
    })
    PlaySEEvent("EVESE_PYRAMID_COFFIN_1")
    PlayOpenAnimSearchObj(tbl[index][4])
    Wait(1)
    ChangeStageCameraToGlobalPoint(tbl[index][1].X, tbl[index][1].Y, tbl[index][1].Z, CAMERA_BLEND_EASE_IN_OUT, 0.5, 2, 200, {
      Yaw = 0,
      Pitch = tbl[index][3],
      Roll = 0
    })
    Wait(0.3)
    CmdStartEventBattle(EnemyId)
    FadeIn(EFadingPriorityEventUIBackGround, 0)
  else
    CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_3")
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_2")
  end
end

function Treasure_PyramidEnd(BeginOverlap, table, SearchObjectName, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  local eventInfo = EventStart(table, "")
  print("TreasureEnemyEnd execute, SearchObjectName : " .. tostring(SearchObjectName) .. ", TreasureId : " .. tostring(TreasureId) .. ", ItemId : " .. tostring(ItemId) .. ", ItemCount : " .. tostring(ItemCount) .. ", Gold : " .. tostring(Gold) .. ", EnemyId : " .. tostring(EnemyId))
  local name = tostring(SearchObjectName)
  local len = string.len(name)
  local str = string.sub(name, len - 1, len)
  local index = tonumber(str) + 1
  local tbl = {
    {
      "BP_SearchAnimEvent_D06_Coffin_01_00",
      Flag.FE750
    },
    {
      "BP_SearchAnimEvent_D06_Coffin_01_01",
      Flag.FE751
    },
    {
      "BP_SearchAnimEvent_D06_Coffin_01_02",
      Flag.FE752
    },
    {
      "BP_SearchAnimEvent_D06_Coffin_01_03",
      Flag.FE753
    },
    {
      "BP_SearchAnimEvent_D06_Coffin_01_04",
      Flag.FE754
    },
    {
      "BP_SearchAnimEvent_D06_Coffin_01_05",
      Flag.FE755
    },
    {
      "BP_SearchAnimEvent_D06_Coffin_01_06",
      Flag.FE756
    },
    {
      "BP_SearchAnimEvent_D06_Coffin_01_07",
      Flag.FE757
    },
    {
      "BP_SearchAnimEvent_D06_Coffin_01_08",
      Flag.FE758
    },
    {
      "BP_SearchAnimEvent_D06_Coffin_01_09",
      Flag.FE759
    },
    {
      "BP_SearchAnimEvent_D06_Coffin_01_10",
      Flag.FE760
    },
    {
      "BP_SearchAnimEvent_D06_Coffin_01_11",
      Flag.FE761
    },
    {
      "BP_SearchAnimEvent_D06_Coffin_01_12",
      Flag.FE762
    },
    {
      "BP_SearchAnimEvent_D06_Coffin_01_13",
      Flag.FE763
    }
  }
  PlayOpenAnimSearchObj(SearchObjectName)
  PlayOpenAnimSearchObj(tbl[index][1])
  WaitPlayAnimSearchObj(SearchObjectName)
  WaitPlayAnimSearchObj(tbl[index][1])
  SetFlag(tbl[index][2], true)
  CmdFadeInAfterEventBattle()
  if SearchObject_ShowMessage(SearchObjectName, TreasureId, ItemId, ItemCount, Gold) == -1 then
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_2")
  end
  EventEnd(eventInfo, "")
end

function SearchObject_Shine_Sea(BeginOverlap, table, CanObtainItem, TreasureId, ItemId1, ItemCount1, Gold1, ItemId2, ItemCount2, Gold2, ItemId3, ItemCount3, Gold3)
  local eventInfo = EventStart(table, "")
  print(tostring(CanObtainItem) .. ", " .. TreasureId .. ", " .. ItemId1 .. ", " .. tostring(ItemCount1) .. ", " .. tostring(Gold1) .. ", " .. ItemId2 .. ", " .. tostring(ItemCount2) .. ", " .. tostring(Gold2) .. ", " .. ItemId3 .. ", " .. tostring(ItemCount3) .. ", " .. tostring(Gold3))
  SearchObject_Shine_ShowMessage(eventInfo, TreasureId, ItemId1, ItemCount1, Gold1)
  SearchObject_Shine_ShowMessage(eventInfo, TreasureId, ItemId2, ItemCount2, Gold2)
  SearchObject_Shine_ShowMessage(eventInfo, TreasureId, ItemId3, ItemCount3, Gold3)
  EventEnd(eventInfo, "")
end

function SearchObject_Shine_Ground(BeginOverlap, table, CanObtainItem, TreasureId, ItemId1, ItemCount1, Gold1, ItemId2, ItemCount2, Gold2, ItemId3, ItemCount3, Gold3)
  local eventInfo = EventStart(table, "")
  print(tostring(CanObtainItem) .. ", " .. TreasureId .. ", " .. ItemId1 .. ", " .. tostring(ItemCount1) .. ", " .. tostring(Gold1) .. ", " .. ItemId2 .. ", " .. tostring(ItemCount2) .. ", " .. tostring(Gold2) .. ", " .. ItemId3 .. ", " .. tostring(ItemCount3) .. ", " .. tostring(Gold3))
  SearchObject_Shine_ShowMessage(eventInfo, TreasureId, ItemId1, ItemCount1, Gold1)
  SearchObject_Shine_ShowMessage(eventInfo, TreasureId, ItemId2, ItemCount2, Gold2)
  SearchObject_Shine_ShowMessage(eventInfo, TreasureId, ItemId3, ItemCount3, Gold3)
  EventEnd(eventInfo, "")
end

function SearchObject_Shine_ShowMessage(eventInfo, TreasureId, ItemId, ItemCount, Gold)
  if 0 < ItemCount then
    local result = AddItemDetail(ItemId, ItemCount, -1, true)
    SetTagItemId(ItemId)
    SetTagValue(ItemCount)
    print("result = " .. tostring(result))
    if result then
      PlaySEUI("SYSSE_TD_TREASURE_BOX_ITEM")
      if ItemCount == 1 then
        CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_SHINE_1")
      else
        CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_SHINE_2")
      end
    else
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_ItemGetBagMax_1")
    end
  elseif 0 < Gold then
    AddGold(Gold)
    SetTagValue(Gold)
    PlaySEUI("SYSSE_TD_TREASURE_BOX_ITEM")
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_SHINE_3")
  end
end

function SearchObject_Fireplace(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Fireplace_1")
  EventEnd(eventInfo, "")
end

function SearchObject_Ozabuton(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdMessage("NPC_Talk_Common_SEARCHOBJECT_GROUND_1")
  CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Ozabuton_1")
  EventEnd(eventInfo, "")
end

function SearchObject_Shield_01(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Shield_1")
  EventEnd(eventInfo, "")
end

function SearchObject_Spear_01(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Spear_1")
  EventEnd(eventInfo, "")
end

function SearchObject_Spear_02(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Spear_2")
  EventEnd(eventInfo, "")
end

function SearchObject_Axe_01(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Axe_1")
  EventEnd(eventInfo, "")
end

function SearchObject_Sword_01(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Sword_1")
  EventEnd(eventInfo, "")
end

function SearchObject_Mask_01(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Mask_1")
  EventEnd(eventInfo, "")
end

function SearchObject_Mirror_01(BeginOverlap, table, CanObtainItem, TreasureId, ItemId, ItemCount, Gold, EnemyId)
  eventInfo = EventStart(table, "")
  CmdMessage("NPC_Talk_Common_SEARCHOBJECT_Mirror_1")
  if GetCurrentMapId() == "MAPLIST_T04R0801" then
    local gender = GetPartyMemberGender(1)
    if gender == UNIT_GENDER_MALE then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Mirror_11")
    else
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Mirror_3")
    end
  else
    math.randomseed(os.time() * math.random(1, 100))
    local rand = math.random(0, 6)
    if rand == 0 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Mirror_2")
    elseif rand == 1 then
      local gender = GetPartyMemberGender(1)
      if gender == UNIT_GENDER_MALE then
        CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Mirror_4")
      else
        CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Mirror_3")
      end
    elseif rand == 2 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Mirror_5")
    elseif rand == 3 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Mirror_6")
    elseif rand == 4 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Mirror_7")
    elseif rand == 5 then
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Mirror_8")
    elseif rand == 6 then
      HideMessageWindowPageFeedIcon()
      CmdMessage("NPC_Talk_Common_SEARCHOBJECT_Mirror_9")
      if GetFlag(Flag.FE169) == false and 0 < GetPartyMemberStatus(2, UNIT_STATUS_HP) and GetPartyMemberGender(2) == UNIT_GENDER_MALE then
        ChangeSpeaker()
        SetTagWord(GetPartyMemberName(2, UNIT_NAME_NAME))
        CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_Mirror_10")
      else
        CloseMessage()
      end
    end
  end
  EventEnd(eventInfo, "")
end

function SearchObject_NotOpenDoor(BeginOverlap, table, MessageText)
  local eventInfo = EventStart(table, "")
  PlaySEUI("SYSSE_TD_LOCK_PICK_FAIL")
  Wait(0.3)
  CmdEventClosingMessage(MessageText)
  EventEnd(eventInfo, "")
end

local tblPlayerStartTag = {
  BP_SearchEvent_T12_Trap_E = "F_FromMuorEast",
  BP_SearchEvent_T14_Trap_E = "F_FromLuzamiEast",
  BP_SearchEvent_T14_Trap_N = "F_FromLuzamiNorth",
  BP_SearchEvent_T14_Trap_S = "F_FromLuzamiSouth",
  BP_SearchEvent_T14_Trap_W = "F_FromLuzamiWest",
  BP_SearchEvent_D13_Trap_E = "F_FromGhostShip",
  BP_SearchEvent_C10_Trap_S = "F_FromLudatormSouth",
  BP_SearchEvent_Y05_31_Trap_E = "F_FromYard05_31_East",
  BP_SearchEvent_Y05_31_Trap_N = "F_FromYard05_31_North",
  BP_SearchEvent_Y05_31_Trap_S = "F_FromYard05_31_South",
  BP_SearchEvent_Y05_31_Trap_W = "F_FromYard05_31_West",
  BP_SearchEvent_Y05_32_Trap_E = "F_FromYard05_32_East",
  BP_SearchEvent_Y05_32_Trap_N = "F_FromYard05_32_North",
  BP_SearchEvent_Y05_32_Trap_S = "F_FromYard05_32_South",
  BP_SearchEvent_Y05_32_Trap_W = "F_FromYard05_32_West",
  BP_SearchEvent_Y05_33_Trap_E = "F_FromYard05_33_East",
  BP_SearchEvent_Y05_33_Trap_N = "F_FromYard05_33_North",
  BP_SearchEvent_Y05_33_Trap_S = "F_FromYard05_33_South",
  BP_SearchEvent_Y05_33_Trap_W = "F_FromYard05_33_West",
  BP_SearchEvent_Y05_34_Trap_E = "F_FromYard05_34_East",
  BP_SearchEvent_Y05_34_Trap_N = "F_FromYard05_34_North",
  BP_SearchEvent_Y05_34_Trap_S = "F_FromYard05_34_South",
  BP_SearchEvent_Y05_34_Trap_W = "F_FromYard05_34_West",
  BP_SearchEvent_Y05_35_Trap_E = "F_FromYard05_35_East",
  BP_SearchEvent_Y05_35_Trap_N = "F_FromYard05_35_North",
  BP_SearchEvent_Y05_35_Trap_S = "F_FromYard05_35_South",
  BP_SearchEvent_Y05_35_Trap_W = "F_FromYard05_35_West",
  BP_SearchEvent_Y05_36_Trap_E = "F_FromYard05_36_East",
  BP_SearchEvent_Y05_36_Trap_N = "F_FromYard05_36_North",
  BP_SearchEvent_Y05_36_Trap_S = "F_FromYard05_36_South",
  BP_SearchEvent_Y05_36_Trap_W = "F_FromYard05_36_West",
  BP_SearchEvent_Y05_37_Trap_E = "F_FromYard05_37_East",
  BP_SearchEvent_Y05_37_Trap_N = "F_FromYard05_37_North",
  BP_SearchEvent_Y05_37_Trap_S = "F_FromYard05_37_South",
  BP_SearchEvent_Y05_37_Trap_W = "F_FromYard05_37_West",
  BP_SearchEvent_Y05_38_Trap_E = "F_FromYard05_38_East",
  BP_SearchEvent_Y05_38_Trap_N = "F_FromYard05_38_North",
  BP_SearchEvent_Y05_38_Trap_S = "F_FromYard05_38_South",
  BP_SearchEvent_Y05_38_Trap_W = "F_FromYard05_38_West",
  BP_SearchEvent_Y05_39_Trap_E = "F_FromYard05_39_East",
  BP_SearchEvent_Y05_39_Trap_N = "F_FromYard05_39_North",
  BP_SearchEvent_Y05_39_Trap_S = "F_FromYard05_39_South",
  BP_SearchEvent_Y05_39_Trap_W = "F_FromYard05_39_West",
  BP_SearchEvent_Y05_40_Trap_E = "F_FromYard05_40_East",
  BP_SearchEvent_Y05_40_Trap_N = "F_FromYard05_40_North",
  BP_SearchEvent_Y05_40_Trap_S = "F_FromYard05_40_South",
  BP_SearchEvent_Y05_40_Trap_W = "F_FromYard05_40_West",
  BP_SearchEvent_Y05_41_Trap_E = "F_FromYard05_41_East",
  BP_SearchEvent_Y05_41_Trap_N = "F_FromYard05_41_North",
  BP_SearchEvent_Y05_41_Trap_S = "F_FromYard05_41_South",
  BP_SearchEvent_Y05_41_Trap_W = "F_FromYard05_41_West",
  BP_SearchEvent_Y05_42_Trap_E = "F_FromYard05_42_East",
  BP_SearchEvent_Y05_42_Trap_N = "F_FromYard05_42_North",
  BP_SearchEvent_Y05_42_Trap_S = "F_FromYard05_42_South",
  BP_SearchEvent_Y05_42_Trap_W = "F_FromYard05_42_West",
  BP_SearchEvent_Y05_43_Trap_E = "F_FromYard05_43_East",
  BP_SearchEvent_Y05_43_Trap_N = "F_FromYard05_43_North",
  BP_SearchEvent_Y05_43_Trap_S = "F_FromYard05_43_South",
  BP_SearchEvent_Y05_43_Trap_W = "F_FromYard05_43_West",
  BP_SearchEvent_Y05_44_Trap_E = "F_FromYard05_44_East",
  BP_SearchEvent_Y05_44_Trap_N = "F_FromYard05_44_North",
  BP_SearchEvent_Y05_44_Trap_S = "F_FromYard05_44_South",
  BP_SearchEvent_Y05_44_Trap_W = "F_FromYard05_44_West",
  BP_SearchEvent_Y05_45_Trap_E = "F_FromYard05_45_East",
  BP_SearchEvent_Y05_45_Trap_N = "F_FromYard05_45_North",
  BP_SearchEvent_Y05_45_Trap_S = "F_FromYard05_45_South",
  BP_SearchEvent_Y05_45_Trap_W = "F_FromYard05_45_West",
  BP_SearchEvent_Y05_46_Trap_E = "F_FromYard05_46_East",
  BP_SearchEvent_Y05_46_Trap_N = "F_FromYard05_46_North",
  BP_SearchEvent_Y05_46_Trap_S = "F_FromYard05_46_South",
  BP_SearchEvent_Y05_46_Trap_W = "F_FromYard05_46_West",
  BP_SearchEvent_Y05_47_Trap_E = "F_FromYard05_47_East",
  BP_SearchEvent_Y05_47_Trap_N = "F_FromYard05_47_North",
  BP_SearchEvent_Y05_47_Trap_S = "F_FromYard05_47_South",
  BP_SearchEvent_Y05_47_Trap_W = "F_FromYard05_47_West",
  BP_SearchEvent_Y05_61_Trap_E = "F_FromYard05_61_East",
  BP_SearchEvent_Y05_61_Trap_N = "F_FromYard05_61_North",
  BP_SearchEvent_Y05_61_Trap_S = "F_FromYard05_61_South",
  BP_SearchEvent_Y05_61_Trap_W = "F_FromYard05_61_West",
  BP_SearchEvent_Y05_62_Trap_E = "F_FromYard05_62_East",
  BP_SearchEvent_Y05_62_Trap_N = "F_FromYard05_62_North",
  BP_SearchEvent_Y05_62_Trap_S = "F_FromYard05_62_South",
  BP_SearchEvent_Y05_62_Trap_W = "F_FromYard05_62_West",
  BP_SearchEvent_Y05_63_Trap_E = "F_FromYard05_63_East",
  BP_SearchEvent_Y05_63_Trap_N = "F_FromYard05_63_North",
  BP_SearchEvent_Y05_63_Trap_S = "F_FromYard05_63_South",
  BP_SearchEvent_Y05_63_Trap_W = "F_FromYard05_63_West",
  BP_SearchEvent_Y05_64_Trap_E = "F_FromYard05_64_East",
  BP_SearchEvent_Y05_64_Trap_N = "F_FromYard05_64_North",
  BP_SearchEvent_Y05_64_Trap_S = "F_FromYard05_64_South",
  BP_SearchEvent_Y05_64_Trap_W = "F_FromYard05_64_West",
  BP_SearchEvent_Y05_91_Trap_E = "F_FromYard05_91_East",
  BP_SearchEvent_Y05_91_Trap_N = "F_FromYard05_91_North",
  BP_SearchEvent_Y05_91_Trap_S = "F_FromYard05_91_South",
  BP_SearchEvent_Y05_91_Trap_W = "F_FromYard05_91_West",
  BP_SearchEvent_Y05_92_Trap_E = "F_FromYard05_92_East",
  BP_SearchEvent_Y05_92_Trap_N = "F_FromYard05_92_North",
  BP_SearchEvent_Y05_92_Trap_S = "F_FromYard05_92_South",
  BP_SearchEvent_Y05_92_Trap_W = "F_FromYard05_92_West"
}

function SearchObject_Trap_01(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetVisibleActor(targetActorId, false)
  local SE_Stairway = PlaySEEvent("EVESE_STAIRWAY")
  CmdFadeOut(EFadingPriorityTopMost, 0.5)
  WaitPlaySound(SE_Stairway)
  print("Field_PlayerStartTag = " .. tostring(tblPlayerStartTag[targetActorId]))
  ChangeFieldShip(tblPlayerStartTag[targetActorId], ORIENTATION_PLAYER_START, true)
  EventEnd(eventInfo, "")
end

local tblFieldSignBoardMsg = {
  BP_SearchEvent_SignBoard_01_F1 = "NPC_Talk_Common_Field_SignBoard_1",
  BP_SearchEvent_SignBoard_01_F2 = "NPC_Talk_Common_Field_SignBoard_2",
  BP_SearchEvent_SignBoard_01_F3 = "NPC_Talk_Common_Field_SignBoard_3",
  BP_SearchEvent_SignBoard_01_F4 = "NPC_Talk_Common_Field_SignBoard_4",
  BP_SearchEvent_SignBoard_01_F5 = "NPC_Talk_Common_Field_SignBoard_5",
  BP_SearchEvent_SignBoard_01_F6 = "NPC_Talk_Common_Field_SignBoard_6",
  BP_SearchEvent_SignBoard_01_F7 = "NPC_Talk_Common_Field_SignBoard_7",
  BP_SearchEvent_SignBoard_01_F8 = "NPC_Talk_Common_Field_SignBoard_8",
  BP_SearchEvent_SignBoard_01_F9 = "NPC_Talk_Common_Field_SignBoard_9",
  BP_SearchEvent_SignBoard_01_F10 = "NPC_Talk_Common_Field_SignBoard_10",
  BP_SearchEvent_SignBoard_01_F11 = "NPC_Talk_Common_Field_SignBoard_11"
}

function SearchObject_Field_SignBoard_01(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  print("FieldSignBoard_MsgId = " .. tostring(tblFieldSignBoardMsg[targetActorId]))
  CmdEventClosingMessage(tblFieldSignBoardMsg[targetActorId])
  EventEnd(eventInfo, "")
end

function Common_KIE_0_TALK_INVISIBLE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_51")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_1")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_28")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_2")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_041(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_65")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_29")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_051(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_66")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_060(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_32")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_070(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_6")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_071(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_58")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_080(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Common_Kiesari_30")
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_31")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_090(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_4")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_091(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_61")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_100(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_33")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_101(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_60")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_110(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_5")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_111(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_75")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_120(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_34")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_130(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_35")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_140(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Common_Kiesari_7")
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_8")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_150(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_9")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_160(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_16")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_161(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_73")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_170(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_10")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_180(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_SURPRISE")
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_3")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_190(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_12")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_200(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_11")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_210(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Common_Kiesari_13")
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_14")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_220(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_15")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_230(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_17")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_240(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_18")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_241(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_62")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_250(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_48")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_260(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Common_Kiesari_36")
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_37")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_270(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Common_Kiesari_38")
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_39")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_271(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Common_Kiesari_63")
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_64")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_280(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_21")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_290(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdSpawnMangaIcon(targetActorId, "FIELD_EFX2D_SURPRISE")
  Wait(0.2)
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_300(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_40")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_310(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_52")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_320(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_53")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_321(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_59")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_330(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_54")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_331(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_69")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_340(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_55")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_350(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_56")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_351(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_74")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_360(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_57")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_361(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_67")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_370(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Common_Kiesari_19")
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_20")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_371(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Common_Kiesari_71")
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_72")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_380(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_41")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_390(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_22")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_391(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_70")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_400(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_42")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_401(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_68")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_410(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_23")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_420(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_25")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_430(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_43")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_440(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_26")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_450(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_44")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_460(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_24")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_470(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_27")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_480(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Common_Kiesari_45")
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_46")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_490(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_47")
  EventEnd(eventInfo, "", false)
end

function Common_KIE_0_TALK_INVISIBLE_0010_500(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Common_Kiesari_49")
  CmdEventClosingMessage("NPC_Talk_Common_Kiesari_50")
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_44")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformMonster() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_1")
  else
    if CheckTransformSlime() == true then
      CmdEventClosingMessage("NPC_Talk_Common_Slime_1")
    else
    end
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformMonster() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_26")
  else
    if CheckTransformSlime() == true then
      CmdEventClosingMessage("NPC_Talk_Common_Slime_4")
    else
    end
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_2")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_041(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_57")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_050(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformMonster() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_27")
  else
    if CheckTransformSlime() == true then
      CmdEventClosingMessage("NPC_Talk_Common_Slime_5")
    else
    end
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_051(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformMonster() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_60")
  else
    if CheckTransformSlime() == true then
      CmdEventClosingMessage("NPC_Talk_Common_Slime_9")
    else
    end
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_060(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_29")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_070(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_6")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_071(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_51")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_080(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_28")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_090(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_4")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_091(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_54")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_100(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_30")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_101(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_53")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_110(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_5")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_111(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_68")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_120(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_31")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_130(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_32")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_140(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_7")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_150(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_8")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_160(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_14")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_161(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_66")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_170(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_9")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_180(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_3")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_190(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_11")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_200(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformMonster() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_10")
  else
    if CheckTransformSlime() == true then
      CmdEventClosingMessage("NPC_Talk_Common_Slime_2")
    else
    end
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_210(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_12")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_220(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_13")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_230(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_15")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_240(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_16")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_241(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_55")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_250(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_42")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_260(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformMonster() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_33")
  else
    if CheckTransformSlime() == true then
      CmdEventClosingMessage("NPC_Talk_Common_Slime_6")
    else
    end
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_270(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_34")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_271(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_56")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_280(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Kiesari_21")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_290(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdMessage("NPC_Talk_Common_Monster_18")
    CmdEventClosingMessage("NPC_Talk_Common_Monster_19")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_291(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdMessage("NPC_Talk_Common_Monster_58")
    CmdEventClosingMessage("NPC_Talk_Common_Monster_59")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_300(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_35")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_310(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_45")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_320(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_46")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_321(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_52")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_330(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_47")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_331(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_63")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_340(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_48")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_350(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_49")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_351(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_67")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_360(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformMonster() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_50")
  else
    if CheckTransformSlime() == true then
      CmdEventClosingMessage("NPC_Talk_Common_Slime_8")
    else
    end
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_361(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformMonster() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_61")
  else
    if CheckTransformSlime() == true then
      CmdEventClosingMessage("NPC_Talk_Common_Slime_10")
    else
    end
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_370(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_17")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_371(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_65")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_380(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_36")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_390(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_20")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_391(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_64")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_400(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_37")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_401(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_62")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_410(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_21")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_420(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_23")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_430(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_38")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_440(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_24")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_450(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_39")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_460(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformMonster() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_22")
  else
    if CheckTransformSlime() == true then
      CmdEventClosingMessage("NPC_Talk_Common_Slime_3")
    else
    end
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_470(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_25")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_480(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_40")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_490(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformNonHuman() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_41")
  else
  end
  EventEnd(eventInfo, "", false)
end

function Common_HEN_0_TALK_CHANGE_0010_500(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  if CheckTransformMonster() == true then
    CmdEventClosingMessage("NPC_Talk_Common_Monster_43")
  else
    if CheckTransformSlime() == true then
      CmdEventClosingMessage("NPC_Talk_Common_Slime_7")
    else
    end
  end
  EventEnd(eventInfo, "", false)
end

function Secret_Area_SUB_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  DisableEventFastForwardUI()
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  if GetFlagGopEnumProgress(FlagGOPEnumProgress.SUB_INFORMATION_SECRET_AREA) == false then
    CmdCallTutorialUI("INFORMATION_SECRET_AREA")
    SetFlagGopEnumProgress(FlagGOPEnumProgress.SUB_INFORMATION_SECRET_AREA, true)
  end
  EventEnd(eventInfo, "", false)
end

function SearchDLCFunction(BeginOverlap, table, ...)
  local eventInfo = EventStart(table, true)
  DisableEventFastForwardUI()
  if CanOpenDLCChest() then
    local dlcObjectId = GetTargetActorIdFromEventInfo(eventInfo)
    PlaySEUI("SYSSE_TD_TREASURE_BOX")
    CmdPlayOpenAnimSearchObj(dlcObjectId)
    CmdMessage("Txt_Dlc_Open_Treasure")
    CallDlcUI()
    _retry(SYS_WaitDlcUI)
    if IsOpenedDLCChest() == false then
      PlaySEUI("SYSSE_TD_TREASURE_BOX_CLOSE")
      CmdPlayCloseAnimSearchObj(dlcObjectId)
    end
  elseif IsOpenedDLCChest() then
    CmdMessage("Txt_Talk_Common_TREASURE_3")
    CmdEventClosingMessage("Txt_Talk_Common_TREASURE_2")
  else
    CmdMessage("Txt_Dlc_Not_Open_Treasure_1")
    CmdMessage("Txt_Dlc_Not_Open_Treasure_2")
    CmdMessage("Txt_Dlc_Not_Open_Treasure_3")
    CmdEventClosingMessage("Txt_Dlc_Not_Open_Treasure_4")
  end
  EventEnd(eventInfo, "")
end
