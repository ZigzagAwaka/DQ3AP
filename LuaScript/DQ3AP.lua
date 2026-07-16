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
    local enemy = string.match(ItemId, "^BATTLE_EVENT_(.+)$")
    return enemy ~= nil, tostring(enemy)
end

-- all possible cannibox battle ids
local random_cannibox = {
  "BATTLE_EVENT_PYRAMID_MANEATERBOX_1",
  "BATTLE_EVENT_BAHARATAEASTCAVE_MANEATERBOX_2",
  "BATTLE_EVENT_GAIA_MIMIC_1",
  "BATTLE_EVENT_ARPTOWER_MANEATERBOX_3",
}

-- all possible mimic battle ids
local random_mimic = {
  "BATTLE_EVENT_RACAVE_MIMIC_2",
  "BATTLE_EVENT_GHOSTSHIP_MIMIC_3",
  "BATTLE_EVENT_NECROGOND_MIMIC_1",
  "BATTLE_EVENT_NECROGOND_MIMIC_2",
  "BATTLE_EVENT_BARAMOS_MIMIC_1",
  "BATTLE_EVENT_TALONTEAR_MIMIC_4",
  "BATTLE_EVENT_RUBISSTOWER_MIMIC_5",
  "BATTLE_EVENT_RUBISSTOWER_MIMIC_5_02",
  "BATTLE_EVENT_SECRET_MIMIC_6",
}

-- all possible pandora's box battle ids
local random_pandora = {
  "BATTLE_EVENT_GRANDRAGON_PANDORABOX_1",
  "BATTLE_EVENT_GRANDRAGON_PANDORABOX_2",
}

-- returns a possible enemy battle id corresponding to the given enemy name
function AP.GetBattleIdFromEnemyName(enemyName)
  if enemyName == "CANNIBOX" then
    return random_cannibox[math.random(#random_cannibox)]
  elseif enemyName == "MIMIC" then
    return random_mimic[math.random(#random_mimic)]
  else -- PANDORABOX
    return random_pandora[math.random(#random_pandora)]
  end
end

-- checks if the given item is an item that needs an id conversion and returns the new id if it needs one
function AP.ConvertSpecialItemIds(ItemId)
  if ItemId == "ITEM_IMPORTANT_PROGRESSIVE_KEY" then
    if not GetFlag(Flag.FE54) then
      ItemId = "ITEM_IMPORTANT_THIEFS_KEY"
    elseif not GetFlag(Flag.FE55) then
      ItemId = "ITEM_IMPORTANT_MAGIC_KEY"
    elseif not GetFlag(Flag.FE56) then
      ItemId = "ITEM_IMPORTANT_ULTIMATE_KEY"
    end
  elseif ItemId == "ITEM_IMPORTANT_SHIP" or ItemId == "ITEM_IMPORTANT_RAMIA" then
    AP.SetSpecialFlags(ItemId) --set ship/ramia flags before id conversion (discard id, ship/ramia are not real items)
    ItemId = "None"
  end
  return ItemId
end

-- set specific important flags if ItemId needs to have those flags set
function AP.SetSpecialFlags(ItemId)
  if ItemId == "ITEM_IMPORTANT_WRECKING_BALL" then
    if not GetFlag(Flag.FE57) then
      SetFlag(Flag.FE57, true)
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_REEVE_GetMagicBall, true)
    else
      SetFlag(Flag.FE837, true)
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_REEVE_GetMagicBall_2, true)
    end
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
  elseif ItemId == "ITEM_IMPORTANT_ROYAL_MISSIVE" then
    SetFlag(Flag.FE63, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_PORTOGA_GetLetter, true)
  elseif ItemId == "ITEM_IMPORTANT_BLACK_PEPPER" then
    SetFlag(Flag.FE64, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BAHARATA_GetPepper, true)
  elseif ItemId == "ITEM_EQUIP_HELMET_ORTEGAS_HELM" then
    SetFlag(Flag.FE67, true)
    CheckCreateLightHelm()
  elseif ItemId == "ITEM_IMPORTANT_SHIP" then
    SetFlag(Flag.FE106, true)
    SetFlag(Flag.FE734, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_PORTOGA_TalkWithPepper, true)
    SetFlag(Flag.FE801, true)
    SetFlag(Flag.FE34, true)
    SetFlag(Flag.FE107, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_PORTOGA_RideShip, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.SUB_INFORMATION_SHIP, true)
  elseif ItemId == "ITEM_IMPORTANT_GREEN_ORB" then
    --SetFlag(Flag.FE73, true) -- green orb flag cant be set or it will prevent the boss in theddon to spawn
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_TEDON_GetGreenOrb, true)
    CheckGopEnum_MAIN_MULTI_GetAllOrb()
  elseif ItemId == "ITEM_IMPORTANT_RAMIA" then
    SetFlag(Flag.FE35, true)
    SetFlag(Flag.FE214, true)
    SetFlag(Flag.FE215, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_REIAMULAND_RevivalLamia, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.SUB_INFORMATION_RAMIA, true)
  elseif ItemId == "ITEM_IMPORTANT_HAMMER_OF_GAIA" then
    SetFlag(Flag.FE841, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_JIPANG_GetGaiaHanmer, true)
  elseif ItemId == "ITEM_IMPORTANT_PURPLE_ORB" then
    SetFlag(Flag.FE76, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MULTI_HintOrb, true)
    CheckGopEnum_MAIN_MULTI_GetAllOrb()
  elseif ItemId == "ITEM_IMPORTANT_BOATMANS_BONE" then
    SetFlag(Flag.FE70, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_GREENLAD_GetBoatmanBone, true)
  elseif ItemId == "ITEM_IMPORTANT_RED_ORB" then
    SetFlag(Flag.FE75, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_PIRATESBASE_GetRedOrb, true)
    CheckGopEnum_MAIN_MULTI_GetAllOrb()
  elseif ItemId == "ITEM_IMPORTANT_YELLOW_ORB" then
    SetFlag(Flag.FE77, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BURG_GetYellowOrb, true)
    CheckGopEnum_MAIN_MULTI_GetAllOrb()
  elseif ItemId == "ITEM_IMPORTANT_BLUE_ORB" then
    --SetFlag(Flag.FE74, true) -- blue orb flag cant be set or it will prevent the boss in gaia's navel to spawn
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_GAIANAVEL_GetBlueOrb, true)
    CheckGopEnum_MAIN_MULTI_GetAllOrb()
  elseif ItemId == "ITEM_IMPORTANT_BLUE_METAL" then
    SetFlag(Flag.FE859, true)
    CheckCreateLightHelm()
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_GAIANAVEL_GetBlueMetal, true)
  elseif ItemId == "ITEM_IMPORTANT_BOTTOMLESS_POT" then
    SetFlag(Flag.FE66, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_EDINBEAR_GetBottomlessPot, true)
  elseif ItemId == "ITEM_IMPORTANT_ULTIMATE_KEY" then
    SetFlag(Flag.FE56, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_SHALLOWSHRINE_GetLastKey, true)
  elseif ItemId == "ITEM_IMPORTANT_RAS_MIRROR" then
    SetFlag(Flag.FE68, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_RACAVE_GetRaMirror, true)
  elseif ItemId == "ITEM_IMPORTANT_MOD_ROD" then
    SetFlag(Flag.FE69, true)
  elseif ItemId == "ITEM_IMPORTANT_LOVERS_LOCKET" then
    SetFlag(Flag.FE71, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_GHOSTSHIP_GetLoveLocket, true)
  elseif ItemId == "ITEM_EQUIP_WEAPON_MOUNTAINCLEAVER" then
    SetFlag(Flag.FE72, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_SHRINEPRISON_GetGaiaSword, true)
  elseif ItemId == "ITEM_IMPORTANT_SILVER_ORB" then
    SetFlag(Flag.FE78, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_NECROGONDSHRINE_GetSilverOrb, true)
    CheckGopEnum_MAIN_MULTI_GetAllOrb()
  elseif ItemId == "ITEM_USE_ITEM_SPHERE_OF_LIGHT" then
    SetFlag(Flag.FE184, true)
    SetFlag(Flag.FE79, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_DRAGONQUEEN_GetShineBall, true)
    SetFlag(Flag.FD26, true)
    --SetFlag(Flag.FE90, true) -- not needed? baramos defeated flag
  elseif ItemId == "ITEM_IMPORTANT_RAINBOW_DROP" then
    SetFlag(Flag.FE88, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_HOLYSHRINE_GetRainbowDrop, true)
  elseif ItemId == "ITEM_IMPORTANT_SUNSTONE" then
    SetFlag(Flag.FE85, true)
    if IsHaveItem("ITEM_EQUIP_WEAPON_STAFF_OF_RAIN") then
      SetFlag(Flag.FE880, true)
    end
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_LUDATORM_GetSunStone, true)
  elseif ItemId == "ITEM_IMPORTANT_ORICHALCUM" then
    SetFlag(Flag.FE82, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_DOMDORA_GetOrichalcum, true)
  elseif ItemId == "ITEM_IMPORTANT_BROKEN_SWORD" then
    SetFlag(Flag.FE877, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MERCADO_GetBrokenSword, true)
  elseif ItemId == "ITEM_EQUIP_WEAPON_STAFF_OF_RAIN" then
    --SetFlag(Flag.FE87, true) -- can't be set, check for item in inventory instead
    if GetFlag(Flag.FE85) == true then
      SetFlag(Flag.FE880, true)
    end
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_SPIRITSHRINE_GetRainStick, true)
  elseif ItemId == "ITEM_IMPORTANT_FAERIE_FLUTE" then
    SetFlag(Flag.FE86, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MYRA_GetFairyFlute, true)
  elseif ItemId == "ITEM_EQUIP_WEAPON_SWORD_OF_KINGS" then
    --SetFlag(Flag.FE875, true) -- npc talk flag, not needed
    --SetFlag(Flag.FE876, true) -- npc talk flag, not needed
    --SetFlag(Flag.FE83, true) -- sword flag, not needed unless the sword is used for progression
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MYRA_GetKingSword, true)
  elseif ItemId == "ITEM_EQUIP_ACCESSORY_SACRED_AMULET" then
    SetFlag(Flag.FE81, true)
  elseif ItemId == "ITEM_IMPORTANT_VERY_NAUGHTY_BOOK" then
    SetFlag(Flag.FE344, true)
  end
end

-- give the specified item to the player
function AP.GiveItem(ItemId, ObjectId, TreasureId)
  ItemId = AP.ConvertSpecialItemIds(ItemId)
  local isGold, goldCount = AP.IsItemGold(ItemId)
  local isEnemy, enemyName = AP.IsItemEnemy(ItemId)
  local receptor = 0
  if isEnemy then
    local BattleId = AP.GetBattleIdFromEnemyName(enemyName)
    RequestPreloadEventBattle(BattleId)
    local MonsterTextId = GetEventBattleMonsterTextId(BattleId)
    SetTagWord(MonsterTextId)
    CmdMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_1")
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_9")
    CloseMessage()
    CmdStartEventBattle(BattleId)
  elseif isGold then
    AddGold(goldCount)
    SetTagValue(goldCount)
    PlaySEUI("SYSSE_TD_TREASURE_BOX_ITEM")
    CmdEventClosingMessage("NPC_Talk_Common_SEARCHOBJECT_TREASURE_8")
  elseif ItemId ~= "None" then
    receptor = AddItem(ItemId)
    SetTagItemId(ItemId)
    if 0 < receptor or receptor == 0 or receptor == -2 then
      CmdLoadItemIcon(ItemId)
      if ObjectId ~= nil and TreasureId ~= nil then
        CmdPlayItemGetNoWait(ObjectId, TreasureId)
      else
        PlayItemGetToLocation(GetPartyMemberLocation(1), ItemId)
      end
    end
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
    AP.SetSpecialFlags(ItemId)
    --AP.CheckMiniMedals(ItemId)
  end
end

-- check if there is available items and if yes then gives them to the player
function AP.GiveItemsIfAvailable(ObjectId, TreasureId)
  local file = io.open("Archipelago/items.data", "r")
  if file then
    local hasContent = file:read("*l")
    if hasContent then
      file:seek("set", 0)
      for line in file:lines() do
        AP.Log("Available item: " .. line)
        AP.GiveItem(line, ObjectId, TreasureId)
        RequestAutoSave()
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

-- check mini medals count if victory goal is to get medals
function AP.CheckMiniMedals(ItemId)
  -- GetHaveItemNum does not work for medals............ needs to be improved
  if ItemId == "ITEM_SMALL_MEDAL" and GetHaveItemNum(ItemId) >= 110 then
    local option = AP.GetOption("victory_goal")
    if option ~= nil and (option == 2 or option == 3) then
        AP.Log("All 110 medals collected")
        AP.CheckLocation("ITEM_SMALL_MEDAL_COLLECT_ALL")
    end
  end
end

-- contains every options received from the client
local client_options = {
  victory_goal = nil,
}

-- gets the option value if it exist or else search it in the option file
function AP.GetOption(OptionName)
  if client_options[OptionName] ~= nil then
    return client_options[OptionName]
  end
  local file = io.open("Archipelago/options.data", "r")
  if not file then
    return nil
  end
  for line in file:lines() do
    local key, value = string.match(line, "^([^:]+):%s*(.+)$")
    if key == OptionName then
      value = tonumber(value)
      client_options[OptionName] = value
      file:close()
      return value
    end
  end
  file:close()
  return nil
end

-- list of all predefined non randomized locations
local predefined_excluded_locations = {
  SEARCH_Aliahan_House3_1F_BOOKSHELF_0 = true,
  SEARCH_Reeve_House2_1F_EVENT_0 = true,
  SEARCH_SmallShrine_B1F_BOOKSHELF_0 = true,
  SEARCH_IzanaiCave_B1F_After_TREASURE_IMPORTANT_0 = true,
  SEARCH_IzanaiCave_B1F_After_EVENT_0 = true,
  SEARCH_Romaria_Inn_1F_EVENT_0 = true,
  SEARCH_Ashalam_Theater_EVENT_0 = true,
  SEARCH_Pyramid_1F_EVENT_STATUE_0 = true,
  SEARCH_Pyramid_3F_EVENT_SWITCH_1 = true,
  SEARCH_Pyramid_3F_EVENT_SWITCH_2 = true,
  SEARCH_Pyramid_3F_EVENT_SWITCH_3 = true,
  SEARCH_Pyramid_3F_EVENT_SWITCH_4 = true,
  SEARCH_Pyramid_3F_EVENT_DOOR_0 = true,
  SEARCH_Pyramid_4F_EVENT_COFFIN_0 = true,
  SEARCH_Pyramid_4F_EVENT_COFFIN_1 = true,
  SEARCH_Pyramid_4F_EVENT_COFFIN_2 = true,
  SEARCH_Pyramid_4F_EVENT_COFFIN_3 = true,
  SEARCH_Pyramid_4F_EVENT_COFFIN_4 = true,
  SEARCH_Pyramid_4F_EVENT_COFFIN_5 = true,
  SEARCH_Pyramid_4F_EVENT_COFFIN_6 = true,
  SEARCH_Pyramid_4F_EVENT_COFFIN_7 = true,
  SEARCH_Pyramid_4F_EVENT_COFFIN_8 = true,
  SEARCH_Pyramid_4F_EVENT_COFFIN_9 = true,
  SEARCH_Pyramid_4F_EVENT_COFFIN_10 = true,
  SEARCH_Pyramid_4F_EVENT_COFFIN_11 = true,
  SEARCH_Pyramid_4F_EVENT_COFFIN_12 = true,
  SEARCH_Pyramid_4F_EVENT_COFFIN_13 = true,
  SEARCH_Pyramid_B2FEVENT_BROKENPILLAR_0 = true,
  SEARCH_Portoga_Out_EVENT_0 = true,
  SEARCH_Baharata_Out_EVENT_0 = true,
  SEARCH_BaharataEastCave_B2F_EVENT_0 = true,
  SEARCH_Muor_Market_1F_EVENT_0 = true,
  SEARCH_PortogaLight_4F_EVENT_0 = true,
  SEARCH_Tedon_Room_B1F_EVENT_0 = true,
  SEARCH_Reiamuland_Out_EVENT_0 = true,
  SEARCH_Reiamuland_Out_EVENT_1 = true,
  SEARCH_Reiamuland_Out_EVENT_2 = true,
  SEARCH_Reiamuland_Out_EVENT_3 = true,
  SEARCH_Reiamuland_Out_EVENT_4 = true,
  SEARCH_Reiamuland_Out_EVENT_5 = true,
  SEARCH_Reiamuland_Out_EVENT_6 = true,
  SEARCH_Jipang_EVENT_0 = true,
  SEARCH_Jipang_Storehouse_POT_3 = true,
  SEARCH_JipangCave_2F_EVENT_0 = true,
  SEARCH_PiratesBase_Out_EVENT_0 = true,
  SEARCH_Burg_3_Out_GROUND_0 = true,
  SEARCH_Burg_4_House01_1F_TREASURE_NORMAL_0 = true,
  SEARCH_Burg_4_House01_1F_TREASURE_NORMAL_1 = true,
  SEARCH_Burg_4_Theater_1F_DRAWER_0 = true,
  SEARCH_Burg_4_Theater_1F_DRAWER_1 = true,
  SEARCH_Burg_5_House01_1F_GROUND_0 = true,
  SEARCH_GaiaNavel_B3F_EVENT_1 = true,
  SEARCH_GaiaNavel_B3F_EVENT_2 = true,
  SEARCH_GaiaNavel_B3F_EVENT_3 = true,
  SEARCH_GaiaNavel_B3F_EVENT_4 = true,
  SEARCH_GaiaNavel_B3F_EVENT_5 = true,
  SEARCH_GaiaNavel_B3F_EVENT_6 = true,
  SEARCH_GaiaNavel_B3F_EVENT_7 = true,
  SEARCH_GaiaNavel_B3F_EVENT_8 = true,
  SEARCH_GaiaNavel_B3F_EVENT_9 = true,
  SEARCH_GaiaNavel_B3F_EVENT_10 = true,
  SEARCH_GaiaNavel_B3F_EVENT_11 = true,
  SEARCH_GaiaNavel_B3F_EVENT_12 = true,
  SEARCH_GaiaNavel_B4F_EVENT_0 = true,
  SEARCH_ShallowShrine_Out_EVENT_0 = true,
  SEARCH_Samanosa_Out_EVENT_0 = true,
  SEARCH_Samanosa_Castle_2F_BedRoom_TREASURE_IMPORTANT_0 = true,
  SEARCH_Volcano_Out_EVENT_0 = true,
  SEARCH_DreamCastle_STORAGE_0 = true,
  SEARCH_DreamCave_EVENT_1 = true,
  SEARCH_DreamCave_EVENT_2 = true,
  SEARCH_DreamCave_EVENT_3 = true,
  SEARCH_DreamCave_EVENT_4 = true,
  SEARCH_DreamDesert_STORAGE_0 = true,
  SEARCH_DreamForest_STORAGE_0 = true,
  SEARCH_DreamTheater_STORAGE_0 = true,
  SEARCH_DreamTower_STORAGE_0 = true,
  SEARCH_DreamTown_STORAGE_0 = true,
  SEARCH_DreamVillage_DRAWER_1 = true,
  SEARCH_DreamWaterFall_STORAGE_0 = true,
  SEARCH_Common_STORAGE_0 = true,
  SEARCH_Common_EVENT_0 = true,
  SEARCH_Common_EVENT_1 = true,
  SEARCH_Common_EVENT_2 = true,
  SEARCH_Common_EVENT_3 = true,
  SEARCH_Common_EVENT_4 = true,
  SEARCH_Common_EVENT_5 = true,
  SEARCH_Common_EVENT_6 = true,
  SEARCH_Common_EVENT_7 = true,
  SEARCH_Common_EVENT_8 = true,
  SEARCH_Common_EVENT_Trap_1 = true,
  SEARCH_Common_EVENT_Field_SignBoard_1 = true,
  SEARCH_Common_TREASURE_NORMAL_0 = true,
  SEARCH_Common_YGGDRASIL_LEAF_EVENT_0 = true,
  SEARCH_Common_H12_ShallowShrine_EVENT_0 = true,
  SEARCH_Common_H99_Rainbow_Bridge_EVENT_0 = true,
  SEARCH_GranDragon_STORAGE_0 = true,
  SEARCH_GhostShip_1F_EVENT_0 = true,
  SEARCH_DragonQueen_1F_EVENT_0 = true,
  SEARCH_DragonQueen_Queen_room_EVENT_0 = true,
  SEARCH_WestPort_Out_EVENT_1 = true,
  SEARCH_WestPort_House_DRAWER_0 = true,
  WestPort_House_SUB_0_SCENE_0010_010 = true,
  SEARCH_Ludatorm_Castle_1F_TREASURE_NORMAL_0 = true,
  SEARCH_Ludatorm_Castle_1F_TREASURE_NORMAL_1 = true,
  SEARCH_Ludatorm_Castle_1F_TREASURE_NORMAL_2 = true,
  SEARCH_Mercado_Shop02_2F_EVENT_0 = true,
  SEARCH_Mercado_Shop02_2F_EVENT_1 = true,
  SEARCH_RubissTower_5FA_EVENT_0 = true,
  SEARCH_ZomaCastle_1F_EVENT_1 = true,
  SEARCH_Zenis_1F_EVENT_0 = true,
  SEARCH_GranDragon_Entrance_EVENT_0 = true,
  SEARCH_GranDragon_SecretMountain_08_POT_0 = true,
  SEARCH_GranDragon_SecretMountain_08_POT_1 = true,
  SEARCH_GranDragon_SecretMountain_08_POT_2 = true,
  SEARCH_GranDragon_SecretMountain_21_GROUND_0 = true,
  SEARCH_GranDragon_SecretMountain_21_TREASURE_NORMAL_0 = true,
  SEARCH_GranDragon_SecretDesert_04_BARREL_0 = true,
  SEARCH_GranDragon_SecretSea_34_POT_0 = true,
  SEARCH_GranDragon_SecretSea_34_GROUND_0 = true,
  SEARCH_GranDragon_SecretSea_34_GROUND_1 = true,
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