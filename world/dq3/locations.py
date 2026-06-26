from __future__ import annotations
from dataclasses import dataclass

from typing import (Any, TYPE_CHECKING)

from BaseClasses import ItemClassification, Location
from rule_builder.rules import Rule

from . import items, rules, regions

if TYPE_CHECKING:
    from .world import DQ3World
    from BaseClasses import CollectionRule


# Describe possible location informations
@dataclass
class Info:
    id: int
    rule: CollectionRule | Rule[Any] | None = None


# Every location must have a unique integer ID associated with it
# and an optional rule access if needed
# format: "[Region prefix] Location name": (id, rule)
ALL_LOCATIONS: dict[str, Info] = {
    # ----- Aliahan -----
    "[Aliahan] Barrel near bridge": Info(1), #SEARCH_Aliahan_Out_BARREL_0
    "[Aliahan] Barrel near Item Shop": Info(2), #SEARCH_Aliahan_Out_BARREL_1
    "[Aliahan] Pot near Item Shop": Info(3), #SEARCH_Aliahan_Out_POT_0
    "[Aliahan] Pot near bridge": Info(4), #SEARCH_Aliahan_Out_POT_1
    "[Aliahan] Hidden Ground left of Aliahan Castle": Info(5), #SEARCH_Aliahan_Out_GROUND_0
    "[Aliahan] Hidden Ground near Tavern": Info(6), #SEARCH_Aliahan_Out_GROUND_1
    "[Aliahan] Hidden Ground near Church": Info(7), #SEARCH_Aliahan_Out_GROUND_2
    "[Aliahan] Hidden Ground right of well": Info(8), #SEARCH_Aliahan_Out_GROUND_3
    "[Aliahan] Chest right of Tavern": Info(9), #SEARCH_Aliahan_Out_TREASURE_NORMAL_0
    "[Aliahan] Barrel in Hero Home": Info(10), #SEARCH_Aliahan_House1_1F_BARREL_0
    "[Aliahan] Drawer 1 in Hero Home": Info(11), #SEARCH_Aliahan_House1_2F_DRAWER_0
    "[Aliahan] Drawer 2 in Hero Home": Info(12), #SEARCH_Aliahan_House1_2F_DRAWER_1
    "[Aliahan] Pot in right house (night)": Info(13), #SEARCH_Aliahan_House2_1F_POT_0
    "[Aliahan] Drawer in right house (night)": Info(14), #SEARCH_Aliahan_House2_2F_DRAWER_0
    #"[Aliahan] Bookshelf in house": Info(15), #SEARCH_Aliahan_House3_1F_BOOKSHELF_0 # no items here
    "[Aliahan] Sack 1 in Inn": Info(16), #SEARCH_Aliahan_Inn_1F_SACK_0
    "[Aliahan] Sack 2 in Inn": Info(17), #SEARCH_Aliahan_Inn_2F_SACK_0
    "[Aliahan] Storage in Inn": Info(18), #SEARCH_Aliahan_Inn_2F_STORAGE_0
    "[Aliahan] Pot 1 in Inn": Info(19), #SEARCH_Aliahan_Inn_2F_POT_0
    "[Aliahan] Pot 2 in Inn": Info(20), #SEARCH_Aliahan_Inn_2F_POT_1
    "[Aliahan] Barrel in Tavern": Info(21), #SEARCH_Aliahan_Luida_1F_BARREL_0
    "[Aliahan] Pot in Tavern": Info(22), #SEARCH_Aliahan_Luida_2F_POT_0
    # ----- Aliahan Castle -----
    "[Aliahan Castle] Barrel 1 in bottom right room": Info(23), #SEARCH_Aliahan_Castle_1F_BARREL_0
    "[Aliahan Castle] Barrel 2 in bottom right room": Info(24), #SEARCH_Aliahan_Castle_1F_BARREL_1
    "[Aliahan Castle] Barrel in left room": Info(25, rules.HAS_THIEF_KEY), #SEARCH_Aliahan_Castle_1F_BARREL_2
    "[Aliahan Castle] Barrel in top garden": Info(26), #SEARCH_Aliahan_Castle_1F_BARREL_3
    "[Aliahan Castle] Chest 1 in treasure room": Info(27, rules.HAS_MAGIC_KEY), #SEARCH_Aliahan_Castle_1F_TREASURE_NORMAL_0
    "[Aliahan Castle] Chest 2 in treasure room": Info(28, rules.HAS_MAGIC_KEY), #SEARCH_Aliahan_Castle_1F_TREASURE_NORMAL_1
    "[Aliahan Castle] Chest 3 in treasure room": Info(29, rules.HAS_MAGIC_KEY), #SEARCH_Aliahan_Castle_1F_TREASURE_NORMAL_2
    "[Aliahan Castle] Chest 4 in treasure room": Info(30, rules.HAS_MAGIC_KEY), #SEARCH_Aliahan_Castle_1F_TREASURE_NORMAL_3
    "[Aliahan Castle] Chest 5 in treasure room": Info(31, rules.HAS_MAGIC_KEY), #SEARCH_Aliahan_Castle_1F_TREASURE_NORMAL_4
    "[Aliahan Castle] Chest 6 in treasure room": Info(32, rules.HAS_MAGIC_KEY), #SEARCH_Aliahan_Castle_1F_TREASURE_NORMAL_5
    "[Aliahan Castle] Pot in bottom left garden": Info(33), #SEARCH_Aliahan_Castle_1F_POT_0
    "[Aliahan Castle] Pot in bottom right room": Info(34, rules.HAS_THIEF_KEY), #SEARCH_Aliahan_Castle_1F_POT_1
    "[Aliahan Castle] Hidden Ground in top garden": Info(35), #SEARCH_Aliahan_Castle_1F_GROUND_0
    "[Aliahan Castle] Hidden Ground near bottom left garden": Info(36), #SEARCH_Aliahan_Castle_1F_GROUND_1
    "[Aliahan Castle] Drawer in top left room": Info(37, rules.HAS_THIEF_KEY), #SEARCH_Aliahan_Castle_1FA_DRAWER_0
    "[Aliahan Castle] Barrel in top right room": Info(38), #SEARCH_Aliahan_Castle_1FB_BARREL_0
    "[Aliahan Castle] Pot in top right room": Info(39), #SEARCH_Aliahan_Castle_1FB_POT_0
    "[Aliahan Castle] Storage in bottom left room 2F": Info(40), #SEARCH_Aliahan_Castle_2F_STORAGE_0
    "[Aliahan Castle] Hidden Ground near top left wall 2F": Info(41), #SEARCH_Aliahan_Castle_2F_GROUND_0
    "[Aliahan Castle] Pot in right jail B1": Info(42, rules.HAS_ULTIMATE_KEY), #SEARCH_Aliahan_Castle_B1F_POT_0
    "[Aliahan Castle] Pot in left jail B1": Info(43, rules.HAS_ULTIMATE_KEY), #SEARCH_Aliahan_Castle_B1F_POT_1
    "[Aliahan Castle] Barrel near stairs B1": Info(44), #SEARCH_Aliahan_Castle_B1F_BARREL_0
    "[Aliahan Castle] Pot in bottom room B1": Info(45), #SEARCH_Aliahan_Castle_B1FB_POT_0
    "[Aliahan Castle] Barrel in right exterior": Info(46), #SEARCH_Aliahan_Castle_1F_Out_BARREL_0
    # ----- Reeve -----
    "[Reeve] Hidden Ground under boulder near right entrance": Info(47), #SEARCH_Reeve_Out_GROUND_0
    "[Reeve] Hidden Ground in field near bottom right entrance": Info(48), #SEARCH_Reeve_Out_GROUND_1
    "[Reeve] Barrel near Equipment Shop": Info(49), #SEARCH_Reeve_Out_BARREL_0
    "[Reeve] Barrel in center of Reeve": Info(50), #SEARCH_Reeve_Out_BARREL_1
    "[Reeve] Pot near top right house": Info(51), #SEARCH_Reeve_Out_POT_0
    "[Reeve] Bookshelf in top house": Info(52), #SEARCH_Reeve_House1_1F_BOOKSHELF_0
    "[Reeve] Pot in top right house": Info(53, rules.HAS_THIEF_KEY), #SEARCH_Reeve_House2_1F_POT_0
    #"[Reeve] Big Pot in top right house": Info(54, rules.HAS_THIEF_KEY), #SEARCH_Reeve_House2_1F_EVENT_0 # no items here
    "[Reeve] Drawer in top right house": Info(55, rules.HAS_THIEF_KEY), #SEARCH_Reeve_House2_2F_DRAWER_0
    "[Reeve] Pot in Church": Info(56), #SEARCH_Reeve_Church_1F_POT_0
    "[Reeve] Pot 1 in Inn": Info(57, rules.HAS_THIEF_KEY), #SEARCH_Reeve_Inn_1F_POT_0
    "[Reeve] Pot 2 in Inn": Info(58), #SEARCH_Reeve_Inn_2F_POT_0
    "[Reeve] Gift from Old Man in top right house": Info(59, rules.HAS_THIEF_KEY), #Reeve_House2_1F_SUB_0_ACTOR_0110_010
    # ----- Shrine of the Plains -----
    "[Shrine of the Plains] Barrel near left entrance": Info(60), #SEARCH_ReeveSouth_BARREL_0
    "[Shrine of the Plains] Pot near Dreamer's Tower entrance": Info(61), #SEARCH_ReeveSouth_POT_0
    # ----- Promontory Passage -----
    "[Promontory Passage] Chest at the dead end": Info(62), #SEARCH_MisakiCave_B2F_TREASURE_NORMAL_0
    "[Promontory Passage] Chest at the start of the loop path": Info(63), #SEARCH_MisakiCave_B2F_TREASURE_NORMAL_1
    "[Promontory Passage] Chest in the top left corner of the loop path": Info(64), #SEARCH_MisakiCave_B2F_TREASURE_NORMAL_2
    "[Promontory Passage] Chest in the top right corner of the loop path": Info(65), #SEARCH_MisakiCave_B2F_TREASURE_NORMAL_3
    # ----- Dreamer's Tower -----
    "[Dreamer's Tower] Chest near Shrine of the Plains entrance B1": Info(66), #SEARCH_NajimiTower_B1F_TREASURE_NORMAL_0
    "[Dreamer's Tower] Chest 1 in locked room B1": Info(67, rules.HAS_THIEF_KEY), #SEARCH_NajimiTower_B1F_TREASURE_NORMAL_1
    "[Dreamer's Tower] Chest 2 in locked room B1": Info(68, rules.HAS_THIEF_KEY), #SEARCH_NajimiTower_B1F_TREASURE_NORMAL_2
    "[Dreamer's Tower] Chest in top left area": Info(69), #SEARCH_NajimiTower_1F_TREASURE_NORMAL_0
    "[Dreamer's Tower] Pot in Inn": Info(70), #SEARCH_NajimiTower_1F_POT_0
    "[Dreamer's Tower] Chest in top left area 2F": Info(71), #SEARCH_NajimiTower_2F_TREASURE_NORMAL_0
    "[Dreamer's Tower] Chest in center area 2F": Info(72), #SEARCH_NajimiTower_2F_TREASURE_NORMAL_1
    "[Dreamer's Tower] Chest in isolated room 3F": Info(73), #SEARCH_NajimiTower_3F_TREASURE_NORMAL_0
    "[Dreamer's Tower] Chest in center area 3F": Info(74), #SEARCH_NajimiTower_3F_TREASURE_NORMAL_1
    "[Dreamer's Tower] Chest in final room 4F": Info(75), #SEARCH_NajimiTower_Penthouse_TREASURE_NORMAL_0
    "[Dreamer's Tower] Bookshelf in final room 4F": Info(76), #SEARCH_NajimiTower_Penthouse_BOOKSHELF_0
    "[Dreamer's Tower] Gift from Old Man in final room 4F": Info(77), #NajimiTower_Penthouse_MAIN_0_ACTOR_0110_010
    # ----- Little Shrine -----
    "[Little Shrine] Pot 1 near top wall": Info(78), #SEARCH_SmallShrine_B1F_POT_0
    "[Little Shrine] Pot 2 near top wall": Info(79), #SEARCH_SmallShrine_B1F_POT_1
    #"[Little Shrine] Bookshelf near top wall": Info(80), #SEARCH_SmallShrine_B1F_BOOKSHELF_0 # no items here
    # ----- Path of Promise -----
    #"[Path of Promise] Gift from NPC after using Wrecking Ball": Info(81), #SEARCH_IzanaiCave_B1F_After_TREASURE_IMPORTANT_0 # not randomized, gives the World Map
    #"[Path of Promise] Event": Info(82), #SEARCH_IzanaiCave_B1F_After_EVENT_0 # no items here
    "[Path of Promise] Chest at the end of the small right path B2": Info(83), #SEARCH_IzanaiCave_B2F_TREASURE_NORMAL_0
    "[Path of Promise] Chest near the bottom left corner B2": Info(84), #SEARCH_IzanaiCave_B2F_TREASURE_NORMAL_1
    "[Path of Promise] Chest in the center B2": Info(85), #SEARCH_IzanaiCave_B2F_TREASURE_NORMAL_2
    "[Path of Promise] Barrel at the top right dead end B2": Info(86), #SEARCH_IzanaiCave_B2F_BARREL_0
    "[Path of Promise] Hidden Ground in the bottom left corner B2": Info(87), #SEARCH_IzanaiCave_B2F_GROUND_0
    "[Path of Promise] Chest in right room B3": Info(88, rules.HAS_THIEF_KEY), #SEARCH_IzanaiCave_B3FA_TREASURE_NORMAL_0
    "[Path of Promise] Pot 1 in left room B3": Info(89, rules.HAS_THIEF_KEY), #SEARCH_IzanaiCave_B3FA_POT_0
    "[Path of Promise] Pot 2 in left room B3": Info(90, rules.HAS_THIEF_KEY), #SEARCH_IzanaiCave_B3FA_POT_1
    "[Path of Promise] Chest in bottom B3 Hole": Info(91), #SEARCH_IzanaiCave_B3FB_TREASURE_NORMAL_0
    "[Path of Promise] Pot 1 in top left B3 Hole": Info(92), #SEARCH_IzanaiCave_B3FB_POT_0
    "[Path of Promise] Pot 2 in top right B3 Hole": Info(93), #SEARCH_IzanaiCave_B3FB_POT_1
    # ----- Shrine of Promise -----
    "[Shrine of Promise] Hidden Ground in the bottom left corner": Info(94), #SEARCH_IzanaiShrine_1F_GROUND_0
    "[Shrine of Promise] Pot near stairs": Info(95), #SEARCH_IzanaiShrine_1F_POT_0
    # ----- Romaria -----
    "[Romaria] Hidden Ground near right wall of Romaria Castle": Info(96), #SEARCH_Romaria_Out_GROUND_0
    "[Romaria] Hidden Ground": Info(97), #SEARCH_Romaria_Out_GROUND_1
    "[Romaria] Pot near Monster Arena": Info(98), #SEARCH_Romaria_Out_POT_0
    "[Romaria] Pot in left house garden": Info(99), #SEARCH_Romaria_Out_POT_1
    "[Romaria] Barrel near Inn": Info(100), #SEARCH_Romaria_Out_BARREL_0
    "[Romaria] Barrel near right entrance": Info(101), #SEARCH_Romaria_Out_BARREL_1
    "[Romaria] Barrel on the left of the Item Shop": Info(102), #SEARCH_Romaria_Out_BARREL_2
    "[Romaria] Drawer 1 in Inn": Info(103), #SEARCH_Romaria_Inn_1F_DRAWER_0
    #"[Romaria] Event": Info(104), #SEARCH_Romaria_Inn_1F_EVENT_0 # no items here
    "[Romaria] Drawer 2 in Inn": Info(105), #SEARCH_Romaria_Inn_2F_DRAWER_0
    "[Romaria] Drawer in left house": Info(106), #SEARCH_Romaria_House_DRAWER_0
    "[Romaria] Pot in left house": Info(107), #SEARCH_Romaria_House_POT_0
    "[Romaria] Drawer in Church": Info(108), #SEARCH_Romaria_Church_DRAWER_0
    "[Romaria] Bookshelf in Church": Info(109), #SEARCH_Romaria_Church_BOOKSHELF_0
    "[Romaria] Pot in Item Shop": Info(110), #SEARCH_Romaria_Shop_POT_0
    "[Romaria] Pot at the back of the Monster Arena": Info(111), #SEARCH_Romaria_BattleRoad_POT_0
    "[Romaria] Pot near stairs in Monster Arena": Info(112), #SEARCH_Romaria_BattleRoad_BARREL_0
    # ----- Romaria Castle -----
    "[Romaria Castle] Hidden Ground in bottom right garden": Info(113), #SEARCH_Romaria_Castle_1F_GROUND_0
    "[Romaria Castle] Hidden Ground right of the fountain in the top garden": Info(114, rules.HAS_MAGIC_KEY), #SEARCH_Romaria_Castle_1F_GROUND_1
    "[Romaria Castle] Pot in the bottom right area": Info(115), #SEARCH_Romaria_Castle_1F_POT_0
    "[Romaria Castle] Pot in the top right area": Info(116), #SEARCH_Romaria_Castle_1F_POT_1
    "[Romaria Castle] Pot top right of the center garden": Info(117), #SEARCH_Romaria_Castle_1F_POT_2
    "[Romaria Castle] Pot top left of the center garden": Info(118), #SEARCH_Romaria_Castle_1F_POT_3
    "[Romaria Castle] Barrel in the top left area": Info(119), #SEARCH_Romaria_Castle_1F_BARREL_0
    "[Romaria Castle] Hidden Ground near the top right corner 2F": Info(120), #SEARCH_Romaria_Castle_2F_GROUND_0
    "[Romaria Castle] Pot left of the stairs 2F": Info(121), #SEARCH_Romaria_Castle_2F_POT_0
    "[Romaria Castle] Pot right of the stairs 2F": Info(122), #SEARCH_Romaria_Castle_2F_POT_1
    "[Romaria Castle] Bookshelf in East Tower room": Info(123), #SEARCH_Romaria_Castle_4F_A_BOOKSHELF_0
    "[Romaria Castle] Drawer in East Tower room": Info(124), #SEARCH_Romaria_Castle_4F_A_DRAWER_0
    "[Romaria Castle] Hidden Ground in West Tower room": Info(125, rules.HAS_ULTIMATE_KEY), #SEARCH_Romaria_Castle_4F_B_GROUND_0
    "[Romaria Castle] Chest 1 in treasure room B1": Info(126, rules.HAS_ULTIMATE_KEY), #SEARCH_Romaria_Castle_B1_TREASURE_NORMAL_0
    "[Romaria Castle] Chest 2 in treasure room B1": Info(127, rules.HAS_ULTIMATE_KEY), #SEARCH_Romaria_Castle_B1_TREASURE_NORMAL_1
    # ----- Romarian Road -----
    "[Romarian Road] Barrel near top entrance": Info(128), #SEARCH_RomariaHighroad_Out_BARREL_0
    # ----- Romarian Outpost -----
    "[Romarian Outpost] Hidden Ground on rock near bottom right entrance": Info(129), #SEARCH_RomariaBarrier_Out_GROUND_0
    "[Romarian Outpost] Pot near right entrance": Info(130), #SEARCH_RomariaBarrier_Out_POT_0
    "[Romarian Outpost] Hidden Ground in top left corner of the Passage portal room": Info(131, rules.HAS_ULTIMATE_KEY), #SEARCH_RomariaBarrier_B1F_GROUND_0 #REQUIRES THE ULTIMATE KEY UNLESS COMING FROM THE OTHER SIDE OF THE PORTAL UNLESS THE OTHER SIDE IS LOCKED BY A ULTIMATE KEY DOOR
    "[Romarian Outpost] Hidden Ground near left Passage entrance": Info(132, rules.HAS_MAGIC_KEY), #SEARCH_RomariaBarrier_B1F_GROUND_1
    "[Romarian Outpost] Barrel on Passage top wall": Info(133, rules.HAS_MAGIC_KEY), #SEARCH_RomariaBarrier_B1F_BARREL_0
    # ----- Khoryv -----
    "[Khoryv] Hidden Ground on bottom right grave in graveyard": Info(134), #SEARCH_Kazave_Out_GROUND_0
    "[Khoryv] Pot on top right house wall": Info(135), #SEARCH_Kazave_Out_POT_0
    "[Khoryv] Barrel near Inn": Info(136), #SEARCH_Kazave_Out_BARREL_0
    "[Khoryv] Chest 1 in Item Shop (night)": Info(137, rules.HAS_THIEF_KEY), #SEARCH_Kazave_Shop_TREASURE_NORMAL_0
    "[Khoryv] Chest 2 in Item Shop (night)": Info(138, rules.HAS_THIEF_KEY), #SEARCH_Kazave_Shop_TREASURE_NORMAL_1
    "[Khoryv] Drawer in Item Shop": Info(139, rules.HAS_THIEF_KEY), #SEARCH_Kazave_Shop_DRAWER_0
    "[Khoryv] Barrel in Bar (day)": Info(140), #SEARCH_Kazave_Bar_1F_BARREL_0
    "[Khoryv] Drawer in back Bar": Info(141), #SEARCH_Kazave_Bar_2F_DRAWER_0
    "[Khoryv] Barrel in back Bar": Info(142), #SEARCH_Kazave_Bar_2F_BARREL_1
    "[Khoryv] Drawer 1 in Inn": Info(143), #SEARCH_Kazave_Inn_1F_DRAWER_0
    "[Khoryv] Drawer 2 in Inn": Info(144), #SEARCH_Kazave_Inn_1F_DRAWER_1
    # ----- Norvik -----
    "[Norvik] Barrel at the back of Inn": Info(145), #SEARCH_Noaniel_Out_BARREL_0
    "[Norvik] Barrel near top right house": Info(146), #SEARCH_Noaniel_Out_BARREL_1
    "[Norvik] Hidden Ground near left entrance": Info(147), #SEARCH_Noaniel_Out_GROUND_0
    "[Norvik] Hidden Ground near right entrance": Info(148), #SEARCH_Noaniel_Out_GROUND_1
    "[Norvik] Drawer 1 in Inn": Info(149), #SEARCH_Noaniel_Inn_2F_DRAWER_0
    "[Norvik] Drawer 2 in Inn": Info(150), #SEARCH_Noaniel_Inn_2F_DRAWER_1
    "[Norvik] Pot in Inn": Info(151), #SEARCH_Noaniel_Inn_2F_POT_0
    "[Norvik] Sack in Inn": Info(152), #SEARCH_Noaniel_Inn_2F_SACK_0
    "[Norvik] Pot in Item Shop": Info(153), #SEARCH_Noaniel_Shop_POT_0
    "[Norvik] Pot in top right house": Info(154), #SEARCH_Noaniel_Room01_1F_POT_0
    "[Norvik] Pot in bottom left house": Info(155), #SEARCH_Noaniel_Room02_1F_POT_0
    "[Norvik] Bookshelf in bottom left house": Info(156), #SEARCH_Noaniel_Room02_2F_BOOKSHELF_0
    "[Norvik] Chest in bottom left house": Info(157), #SEARCH_Noaniel_Room02_2F_TREASURE_NORMAL_0
    # ----- Faerie Village -----
    "[Faerie Village] Hidden Ground left of Faerie Queen house": Info(158), #SEARCH_ElfVillage_Out_GROUND_0
    "[Faerie Village] Hidden Ground near right of lake": Info(159), #SEARCH_ElfVillage_Out_GROUND_1
    "[Faerie Village] Hidden Ground near the middle left entrance, south of the Item Shop": Info(160), #SEARCH_ElfVillage_Out_GROUND_2
    "[Faerie Village] Pot near right entrance": Info(161), #SEARCH_ElfVillage_Out_POT_0
    "[Faerie Village] Pot near lake": Info(162), #SEARCH_ElfVillage_Out_POT_1
    "[Faerie Village] Pot right of the Item Shop": Info(163), #SEARCH_ElfVillage_Out_POT_2
    "[Faerie Village] Hidden Ground in Faerie Queen house": Info(164), #SEARCH_ElfVillage_House_GROUND_0
    "[Faerie Village] Reward from Faerie Queen after giving the Dreamstone": Info(165, rules.HAS_DREAMSTONE), #ElfVillage_House_SUB_0_VOLUME_0110_030
    # ----- Underground Lake -----
    "[Underground Lake] Chest at the dead end near the entrance": Info(166), #SEARCH_UndergroundLake_B1F_TREASURE_NORMAL_0
    "[Underground Lake] Chest at the right dead end": Info(167), #SEARCH_UndergroundLake_B1F_TREASURE_NORMAL_1
    "[Underground Lake] Chest in top left B2": Info(168), #SEARCH_UndergroundLake_B2F_A_TREASURE_NORMAL_0
    "[Underground Lake] Chest in top right B2": Info(169), #SEARCH_UndergroundLake_B2F_A_TREASURE_NORMAL_1
    "[Underground Lake] Chest in loop path B2": Info(170), #SEARCH_UndergroundLake_B2F_B3F_TREASURE_NORMAL_0
    "[Underground Lake] Chest at bottom left dead end B3": Info(171), #SEARCH_UndergroundLake_B3F_TREASURE_NORMAL_0
    "[Underground Lake] Chest at dead end near bottom stairs B3": Info(172), #SEARCH_UndergroundLake_B3F_TREASURE_NORMAL_1
    "[Underground Lake] Chest 1 in center B3": Info(173), #SEARCH_UndergroundLake_B3F_TREASURE_NORMAL_2
    "[Underground Lake] Chest 2 in center B3": Info(174), #SEARCH_UndergroundLake_B3F_TREASURE_NORMAL_3
    "[Underground Lake] Wooden Box in center of altar B4": Info(175), #SEARCH_UndergroundLake_B4F_EVENT_0
    "[Underground Lake] Chest at the end of the isolated path B4": Info(176), #SEARCH_UndergroundLake_B4F_TREASURE_NORMAL_0
    # ----- Skyfell Tower -----
    "[Skyfell Tower] Chest in bottom right area": Info(177), #SEARCH_ShampaneTower_1F_TREASURE_NORMAL_0
    "[Skyfell Tower] Barrel on the path to the stairs": Info(178), #SEARCH_ShampaneTower_1F_BARREL_0
    "[Skyfell Tower] Chest in bottom right area 2F": Info(179), #SEARCH_ShampaneTower_2F_TREASURE_NORMAL_0
    "[Skyfell Tower] Barrel 1 on left wall in top area 2F": Info(180), #SEARCH_ShampaneTower_2F_BARREL_0
    "[Skyfell Tower] Barrel 2 on left wall in top area 2F": Info(181), #SEARCH_ShampaneTower_2F_BARREL_1
    "[Skyfell Tower] Chest near left wall of area near right stairs 3F": Info(182), #SEARCH_ShampaneTower_3F_TREASURE_NORMAL_0
    "[Skyfell Tower] Pot 1 in bottom area 3F": Info(183), #SEARCH_ShampaneTower_3F_POT_0
    "[Skyfell Tower] Pot 2 in bottom area 3F": Info(184), #SEARCH_ShampaneTower_3F_POT_1
    "[Skyfell Tower] Robbin' 'Ood Boss Reward": Info(185), #SEARCH_ShampaneTower_4F_EVENT_0
    "[Skyfell Tower] Chest in top right corner of inner tower 4F": Info(186), #SEARCH_ShampaneTower_4F_TREASURE_NORMAL_0
    "[Skyfell Tower] Chest in top left corner of inner tower 4F": Info(187), #SEARCH_ShampaneTower_4F_TREASURE_NORMAL_1
    "[Skyfell Tower] Pot on left wall exterior of inner tower 4F": Info(188), #SEARCH_ShampaneTower_4F_POT_0
    "[Skyfell Tower] Pot at bottom 4F": Info(189), #SEARCH_ShampaneTower_4F_POT_1
    "[Skyfell Tower] Pot in inner tower 4F": Info(190), #SEARCH_ShampaneTower_4F_POT_2
    "[Skyfell Tower] Chest 1 in final floor 6F": Info(191), #SEARCH_ShampaneTower_6F_TREASURE_NORMAL_0
    "[Skyfell Tower] Chest 2 in final floor 6F": Info(192), #SEARCH_ShampaneTower_6F_TREASURE_NORMAL_1
    # ----- Nordy's Grotto -----
    # ----- Asham -----
}


LOCATION_NAME_TO_ID = {item_name: info.id for item_name, info in ALL_LOCATIONS.items()}


class DQ3Location(Location):
    game = "Dragon Quest III HD-2D Remake"


# Helper method that takes a list of location names and returns them as a dict with their IDs
def get_location_names_with_ids(location_names: list[str]) -> dict[str, int | None]:
    return {location_name: LOCATION_NAME_TO_ID[location_name] for location_name in location_names}

# Helper method that returns a list of location names whose prefix exactly matches the given prefix
# or any of the optional other given prefixes
def get_locations_by_prefix(prefix: str, *other_prefixes: str) -> list[str]:
    prefixes = {prefix, *other_prefixes}
    return [location_name for location_name in LOCATION_NAME_TO_ID.keys() 
            if location_name.split("]")[0][1:] in prefixes]


def create_all_locations(world: DQ3World) -> None:
    create_regular_locations(world)
    create_events(world)


def create_regular_locations(world: DQ3World) -> None:
    # Create all locations based of region prefixes that matches said region values in ALL_REGIONS
    for region_name in regions.ALL_REGIONS:
        region = world.get_region(region_name)
        locations = get_locations_by_prefix(region_name)
        if len(locations) != 0:
            region.add_locations(get_location_names_with_ids(locations), DQ3Location)


def create_events(world: DQ3World) -> None:
    pass