-- AP CODE

local AP = {}

-- log some text in log file
function AP.Log(text)
  local time = os.time()
  local file = io.open("Archipelago/LuaAP.log", "a")
  if file then
    file:write("[" .. os.date("%d/%m/%y %H:%M:%S", time) .. "] " .. text .. "\n")
    file:close()
  end
end

-- mark the given treasure as checked
function AP.CheckLocation(TreasureId)
  local file = io.open("Archipelago/locations.data", "a")
  if file then
    file:write(tostring(TreasureId) .. "\n")
    file:close()
  end
end

-- checks if the given item is gold
function AP.IsItemGold(ItemId)
    local count = string.match(ItemId, "^GOLD_(%d+)$")
    return count ~= nil, tonumber(count)
end

-- checks if the given item is an enemy
function AP.IsItemEnemy(ItemId)
    local enemy = string.match(ItemId, "^BATTLE_")
    return enemy ~= nil
end

-- checks if the given item is an item that needs an id conversion and returns the new id if it needs one
function AP.ConvertSpecialItemIds(ItemId)
  if ItemId == "ITEM_IMPORTANT_PROGRESSIVE_KEY" then
    if not GetFlag(Flag.FE54) then
      ItemId = "ITEM_IMPORTANT_THIEFS_KEY"
    elseif not GetFlag(Flag.FE55) then
      ItemId = "ITEM_IMPORTANT_MAGIC_KEY"
    --elseif not GetFlag(Flag.FE56) then
      --ItemId = "ITEM_IMPORTANT_ULTIMATE_KEY"
    end
  end
  return ItemId
end

-- set specific important flags if ItemId needs to have those flags set
function AP.SetSpecialFlags(ItemId)
  if ItemId == "ITEM_IMPORTANT_WRECKING_BALL" then
    SetFlag(Flag.FE57, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_REEVE_GetMagicBall, true)
  elseif ItemId == "ITEM_IMPORTANT_THIEFS_KEY" then
    SetFlag(Flag.FE54, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_NAJIMITOWER_GetKey, true)
  elseif ItemId == "ITEM_IMPORTANT_WAKEY_DUST" then
    SetFlag(Flag.FE61, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_ELFVILLAGE_GetWakeyDust, true)
  elseif ItemId == "ITEM_IMPORTANT_DREAMSTONE" then
    SetFlag(Flag.FE60, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_UNDERGROUNDLAKE_GetDreamstone, true)
  elseif ItemId == "ITEM_EQUIP_HELMET_KINGS_CROWN" then
    SetFlag(Flag.FE59, true)
  elseif ItemId == "ITEM_IMPORTANT_MAGIC_KEY" then
    SetFlag(Flag.FE55, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_PYRAMID_GetMagicKey, true)
  end
end

-- give the specified item to the player
function AP.GiveItem(ItemId)
  ItemId = AP.ConvertSpecialItemIds(ItemId)
  local isGold, goldCount = AP.IsItemGold(ItemId)
  local isEnemy = AP.IsItemEnemy(ItemId)
  local receptor = 0
  if isEnemy then
    RequestPreloadEventBattle(ItemId)
    local MonsterTextId = GetEventBattleMonsterTextId(ItemId)
    SetTagWord(MonsterTextId)
    CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_1")
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_9")
    CloseMessage()
    CmdStartEventBattle(ItemId)
  elseif isGold then
    AddGold(goldCount)
    SetTagValue(goldCount)
    PlaySEUI("SYSSE_TD_TREASURE_BOX_ITEM")
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_8")
  elseif ItemId ~= "None" then
    receptor = AddItem(ItemId)
    SetTagItemId(ItemId)
    if receptor == 0 then
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
      PlaySEUI("SYSSE_TD_TREASURE_BOX_ITEM")
      CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_5")
      CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_11")
      if GetFlag(Flag.FE962) == false then
        CloseMessage()
        CmdCallTutorialUI("INFORMATION_MEDAL")
        SetFlag(Flag.FE962, true)
      end
    elseif 0 < receptor then
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
    end
  end
  AP.SetSpecialFlags(ItemId)
end

-- check if there is available items and if yes then gives them to the player
function AP.GiveItemsIfAvailable()
  local file = io.open("Archipelago/items.data", "r")
  if file then
    local hasContent = file:read("*l")
    if hasContent then
      file:seek("set", 0)
      for line in file:lines() do
        AP.Log("Available item: " .. line)
        AP.GiveItem(line)
      end
    end
    file:close()
    if hasContent then
      local clearFile = io.open("Archipelago/items.data", "w")
      if clearFile then
          clearFile:close()
      end
    end
  end
end

-- list of all predefined non randomized locations
local predefined_excluded_locations = {
  TEST_TO_COMPLETE_AP = true,
}

-- check if the given location is a excluded from the randomization
function AP.IsLocationExcluded(LocationId)
  if predefined_excluded_locations[LocationId] then
    return true
  else
    return false
  end
end

return AP