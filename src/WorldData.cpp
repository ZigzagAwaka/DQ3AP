#include "WorldData.h"

std::unordered_map<int, std::string> WorldData::rev_locations = {};

const std::unordered_map<std::string, int> WorldData::locations =
{
    // ----- Aliahan -----
    {"SEARCH_Aliahan_Out_BARREL_0", 1},
    {"SEARCH_Aliahan_Out_BARREL_1", 2},
    {"SEARCH_Aliahan_Out_POT_0", 3},
    {"SEARCH_Aliahan_Out_POT_1", 4},
    {"SEARCH_Aliahan_Out_GROUND_0", 5},
    {"SEARCH_Aliahan_Out_GROUND_1", 6},
    {"SEARCH_Aliahan_Out_GROUND_2", 7},
    {"SEARCH_Aliahan_Out_GROUND_3", 8},
    {"SEARCH_Aliahan_Out_TREASURE_NORMAL_0", 9},
    {"SEARCH_Aliahan_House1_1F_BARREL_0", 10},
    {"SEARCH_Aliahan_House1_2F_DRAWER_0", 11},
    {"SEARCH_Aliahan_House1_2F_DRAWER_1", 12},
    {"SEARCH_Aliahan_House2_1F_POT_0", 13},
    {"SEARCH_Aliahan_House2_2F_DRAWER_0", 14},
    {"SEARCH_Aliahan_House3_1F_BOOKSHELF_0", 15},
    {"SEARCH_Aliahan_Inn_1F_SACK_0", 16},
    {"SEARCH_Aliahan_Inn_2F_SACK_0", 17},
    {"SEARCH_Aliahan_Inn_2F_STORAGE_0", 18},
    {"SEARCH_Aliahan_Inn_2F_POT_0", 19},
    {"SEARCH_Aliahan_Inn_2F_POT_1", 20},
    {"SEARCH_Aliahan_Luida_1F_BARREL_0", 21},
    {"SEARCH_Aliahan_Luida_2F_POT_0", 22},
    {"SEARCH_Aliahan_Castle_1F_BARREL_0", 23},
    {"SEARCH_Aliahan_Castle_1F_BARREL_1", 24},
    {"SEARCH_Aliahan_Castle_1F_BARREL_2", 25},
    {"SEARCH_Aliahan_Castle_1F_BARREL_3", 26},
    {"SEARCH_Aliahan_Castle_1F_TREASURE_NORMAL_0", 27},
    {"SEARCH_Aliahan_Castle_1F_TREASURE_NORMAL_1", 28},
    {"SEARCH_Aliahan_Castle_1F_TREASURE_NORMAL_2", 29},
    {"SEARCH_Aliahan_Castle_1F_TREASURE_NORMAL_3", 30},
    {"SEARCH_Aliahan_Castle_1F_TREASURE_NORMAL_4", 31},
    {"SEARCH_Aliahan_Castle_1F_TREASURE_NORMAL_5", 32},
    {"SEARCH_Aliahan_Castle_1F_POT_0", 33},
    {"SEARCH_Aliahan_Castle_1F_POT_1", 34},
    {"SEARCH_Aliahan_Castle_1F_GROUND_0", 35},
    {"SEARCH_Aliahan_Castle_1F_GROUND_1", 36},
    {"SEARCH_Aliahan_Castle_1FA_DRAWER_0", 37},
    {"SEARCH_Aliahan_Castle_1FB_BARREL_0", 38},
    {"SEARCH_Aliahan_Castle_1FB_POT_0", 39},
    {"SEARCH_Aliahan_Castle_2F_STORAGE_0", 40},
    {"SEARCH_Aliahan_Castle_2F_GROUND_0", 41},
    {"SEARCH_Aliahan_Castle_B1F_POT_0", 42},
    {"SEARCH_Aliahan_Castle_B1F_POT_1", 43},
    {"SEARCH_Aliahan_Castle_B1F_BARREL_0", 44},
    {"SEARCH_Aliahan_Castle_B1FB_POT_0", 45},
    {"SEARCH_Aliahan_Castle_1F_Out_BARREL_0", 46},
};

const std::unordered_map<int, std::string> WorldData::items =
{
    // GOLD
    {2, "GOLD_31"},
    {8, "GOLD_50"},
    {12, "GOLD_12"},
    {14, "GOLD_6"},
    {17, "GOLD_9"},
    {25, "GOLD_7"},
    {28, "GOLD_26"},
    {31, "GOLD_500"},
    // USABLE ITEMS
    {1, "ITEM_USE_ITEM_HOLY_WATER"},
    {3, "ITEM_USE_ITEM_CHIMERA_WING"},
    {4, "ITEM_USE_ITEM_MEDICAL_HERB"},
    {6, "ITEM_USE_ITEM_ANTIDOTAL_HERB"},
    {10, "ITEM_USE_ITEM_MAGIC_WATER"},
    {16, "ITEM_USE_ITEM_WHISPERING_NECTAR"},
    {23, "ITEM_USE_ITEM_POUCH_OF_MUSK"},
    {32, "ITEM_USE_ITEM_STRONG_MEDICINE"},
    {9, "ITEM_USE_ITEM_SEED_OF_STRENGTH"},
    {15, "ITEM_USE_ITEM_SEED_OF_LIFE"},
    {19, "ITEM_USE_ITEM_SEED_OF_AGILITY"},
    {24, "ITEM_USE_ITEM_SEED_OF_MAGIC"},
    {33, "ITEM_USE_ITEM_SEED_OF_PROTECTION"},
    // MEDAL
    {11, "ITEM_SMALL_MEDAL"},
    // WEAPONS
    {18, "ITEM_EQUIP_WEAPON_RUNE_STAFF"},
    // SHIELDS
    {27, "ITEM_EQUIP_SHIELD_POT_LID"},
    // EQUIPMENT HELMETS
    {13, "ITEM_EQUIP_HELMET_LEATHER_HAT"},
    // EQUIPMENT ARMORS
    {5, "ITEM_EQUIP_ARMOR_TRAINING_TOGS"},
    {29, "ITEM_EQUIP_ARMOR_WAYFARERS_CLOTHES"},
    // EQUIPMENT ACCESSORIES
    {7, "ITEM_EQUIP_ACCESSORY_DRAGON_SCALES"},
    {20, "ITEM_EQUIP_ACCESSORY_WIND_EARRINGS"},
    {21, "ITEM_EQUIP_ACCESSORY_RING_OF_REASON"},
    {22, "ITEM_EQUIP_ACCESSORY_MIGHTY_ARMLET"},
    {26, "ITEM_EQUIP_ACCESSORY_ALARM_RING"},
};
