from __future__ import annotations
from dataclasses import dataclass

import logging
from typing import (Any, TYPE_CHECKING)

from BaseClasses import ItemClassification, Location, LocationProgressType
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
    "[Reeve] Second gift from Old Man in top right house after talking to the man in Quagmire Cave": Info(546, rules.HAS_THIEF_KEY & rules.HAS_SHIP & rules.HAS_SPHERE_OF_LIGHT & rules.HAS_BIRD), #Reeve_House2_1F_SUB_0_ACTOR_0110_040
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
    #"[Path of Promise] Gift from Old Man after using Wrecking Ball": Info(81), #SEARCH_IzanaiCave_B1F_After_TREASURE_IMPORTANT_0 # not randomized, gives the World Map
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
    "[Romaria Castle] Pot top right of the central garden": Info(117), #SEARCH_Romaria_Castle_1F_POT_2
    "[Romaria Castle] Pot top left of the central garden": Info(118), #SEARCH_Romaria_Castle_1F_POT_3
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
    "[Romarian Outpost] Hidden Ground in top left corner of the Passage portal room": Info(131, rules.HAS_ULTIMATE_KEY | rules.HAS_SHIP | rules.HAS_BIRD), #SEARCH_RomariaBarrier_B1F_GROUND_0
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
    "[Skyfell Tower] On ground after defeating Robbin' 'Ood 4F": Info(185), #SEARCH_ShampaneTower_4F_EVENT_0
    "[Skyfell Tower] Chest in top right corner of inner tower 4F": Info(186), #SEARCH_ShampaneTower_4F_TREASURE_NORMAL_0
    "[Skyfell Tower] Chest in top left corner of inner tower 4F": Info(187), #SEARCH_ShampaneTower_4F_TREASURE_NORMAL_1
    "[Skyfell Tower] Pot on left wall outside of inner tower 4F": Info(188), #SEARCH_ShampaneTower_4F_POT_0
    "[Skyfell Tower] Pot at bottom 4F": Info(189), #SEARCH_ShampaneTower_4F_POT_1
    "[Skyfell Tower] Pot in inner tower 4F": Info(190), #SEARCH_ShampaneTower_4F_POT_2
    "[Skyfell Tower] Chest 1 in final floor 6F": Info(191), #SEARCH_ShampaneTower_6F_TREASURE_NORMAL_0
    "[Skyfell Tower] Chest 2 in final floor 6F": Info(192), #SEARCH_ShampaneTower_6F_TREASURE_NORMAL_1
    # ----- Nordy's Grotto -----
    "[Nordy's Grotto] Chest 1 in Nordy's room": Info(193), #SEARCH_NorudCave_B1F_TREASURE_NORMAL_0
    "[Nordy's Grotto] Chest 2 in Nordy's room": Info(194), #SEARCH_NorudCave_B1F_TREASURE_NORMAL_1
    "[Nordy's Grotto] Barrel near right entrance": Info(195, rules.HAS_ROYAL_MISSIVE | rules.HAS_ULTIMATE_KEY | rules.HAS_SHIP | rules.HAS_BIRD), #SEARCH_NorudCave_B1F_BARREL_1
    "[Nordy's Grotto] Barrel in Nordy's room": Info(196), #SEARCH_NorudCave_B1F_BARREL_2
    "[Nordy's Grotto] Hidden Ground on right wall in well": Info(197), #SEARCH_NorudCave_Well_GROUND_0
    "[Nordy's Grotto] Hidden Ground on bottom left wall in well": Info(198), #SEARCH_NorudCave_Well_GROUND_1
    # ----- Asham -----
    "[Asham] Barrel between two houses left of the Item Shop": Info(199), #SEARCH_Ashalam_Out_BARREL_0
    "[Asham] Barrel in the top left corner": Info(200), #SEARCH_Ashalam_Out_BARREL_1
    "[Asham] Pot near right house": Info(201), #SEARCH_Ashalam_Out_POT_0
    "[Asham] Pot near Hotel": Info(202), #SEARCH_Ashalam_Out_POT_1
    "[Asham] Storage in Puff Puff house (night)": Info(203), #SEARCH_Ashalam_House01_2F_STORAGE_0
    "[Asham] Pot in top left house": Info(204, rules.HAS_MAGIC_KEY), #SEARCH_Ashalam_House02_1F_POT_0
    "[Asham] Hidden Ground on top right square tile floor in top left house": Info(205, rules.HAS_MAGIC_KEY), #SEARCH_Ashalam_House02_2F_GROUND_0
    "[Asham] Bookshelf in locked room in top left house": Info(206, rules.HAS_MAGIC_KEY & rules.HAS_THIEF_KEY), #SEARCH_Ashalam_House02_2F_BOOKSHELF_0
    "[Asham] Pot in right house": Info(207), #SEARCH_Ashalam_House03_POT_0
    "[Asham] Storage in Hotel": Info(208), #SEARCH_Ashalam_Hotel_STORAGE_0
    "[Asham] Pot in Hotel": Info(209), #SEARCH_Ashalam_Hotel_POT_0
    "[Asham] Hidden Ground near bottom chair in Theather back room": Info(210, rules.HAS_MAGIC_KEY), #SEARCH_Ashalam_Theater_GROUND_0
    #"[Asham] Event": Info(211), #SEARCH_Ashalam_Theater_EVENT_0 # no items here
    "[Asham] Gift from Theather manager after talking to the girl in Damdara's Inn": Info(730, rules.HAS_SHIP & rules.HAS_BIRD & rules.HAS_SPHERE_OF_LIGHT), #Ashalam_Theater_SUB_0_ACTOR_0520_020
    # ----- Desert Shrine -----
    "[Desert Shrine] Pot in the top left corner": Info(212), #SEARCH_DesertShrine_1F_POT_0
    "[Desert Shrine] Bookshelf in top right corner": Info(213), #SEARCH_DesertShrine_1F_BOOKSHELF_0
    "[Desert Shrine] Drawer on the left": Info(214), #SEARCH_DesertShrine_1F_DRAWER_0
    # ----- Ibis -----
    "[Ibis] Hidden Ground near left of well": Info(215), #SEARCH_Isis_Out_GROUND_0
    "[Ibis] Hidden Ground in the bottom left field": Info(216), #SEARCH_Isis_Out_GROUND_1
    "[Ibis] Pot near left house": Info(217), #SEARCH_Isis_Out_POT_0
    "[Ibis] Pot near Equipment Shop": Info(218), #SEARCH_Isis_Out_POT_1
    "[Ibis] Barrel near right Item Shop": Info(219), #SEARCH_Isis_Out_BARREL_0
    "[Ibis] Sack in left house": Info(220), #SEARCH_Isis_HouseA1F_SACK_0
    "[Ibis] Hidden Ground on bottom left corner in left house": Info(221), #SEARCH_Isis_HouseA1F_GROUND_0
    "[Ibis] Storage in left house": Info(222), #SEARCH_Isis_HouseA2F_STORAGE_0
    "[Ibis] Sack in central locked house (night)": Info(223, rules.HAS_THIEF_KEY), #SEARCH_Isis_HouseB1F_SACK_0
    "[Ibis] Bookshelf in central locked house (night)": Info(224, rules.HAS_THIEF_KEY), #SEARCH_Isis_HouseB2F_BOOKSHELF_0
    "[Ibis] Storage in Inn": Info(225), #SEARCH_Isis_Inn_STORAGE_0
    "[Ibis] Pot in Equipment Shop": Info(226), #SEARCH_Isis_WeaponShop_POT_0
    "[Ibis] Chest in well": Info(227), #SEARCH_Isis_Well_TREASURE_NORMAL_0
    "[Ibis] Barrel at the back of the Monster Arena": Info(228), #SEARCH_Isis_BattleRoad_BARREL_0
    "[Ibis] Pot on the right of the Monster Arena": Info(229), #SEARCH_Isis_BattleRoad_POT_0
    # ----- Palace of Ibis -----
    "[Palace of Ibis] Hidden Ground in the Surroundings isolated area after going through the Secret Passage": Info(230), #SEARCH_Isis_Castle_Out_GROUND_0
    "[Palace of Ibis] Chest 1 in top left room (night)": Info(231, rules.HAS_MAGIC_KEY), #SEARCH_Isis_Castle_1F_TREASURE_NORMAL_0
    "[Palace of Ibis] Chest 2 in top left room (night)": Info(232, rules.HAS_MAGIC_KEY), #SEARCH_Isis_Castle_1F_TREASURE_NORMAL_1
    "[Palace of Ibis] Chest 3 in top left room (night)": Info(233, rules.HAS_MAGIC_KEY), #SEARCH_Isis_Castle_1F_TREASURE_NORMAL_2
    "[Palace of Ibis] Chest 4 in top left room (night)": Info(234, rules.HAS_MAGIC_KEY), #SEARCH_Isis_Castle_1F_TREASURE_NORMAL_3
    "[Palace of Ibis] Chest 1 in top right room (night)": Info(235, rules.HAS_MAGIC_KEY), #SEARCH_Isis_Castle_1F_TREASURE_NORMAL_4
    "[Palace of Ibis] Chest 2 in top right room (night)": Info(236, rules.HAS_MAGIC_KEY), #SEARCH_Isis_Castle_1F_TREASURE_NORMAL_5
    "[Palace of Ibis] Chest 3 in top right room (night)": Info(237, rules.HAS_MAGIC_KEY), #SEARCH_Isis_Castle_1F_TREASURE_NORMAL_6
    "[Palace of Ibis] Chest 4 in top right room (night)": Info(238, rules.HAS_MAGIC_KEY), #SEARCH_Isis_Castle_1F_TREASURE_NORMAL_7
    "[Palace of Ibis] Drawer in right room": Info(239, rules.HAS_THIEF_KEY), #SEARCH_Isis_Castle_1F_DRAWER_0
    "[Palace of Ibis] Bookshelf in bottom right room": Info(240, rules.HAS_THIEF_KEY), #SEARCH_Isis_Castle_1F_BOOKSHELF_0
    "[Palace of Ibis] Pot in the left room": Info(241, rules.HAS_THIEF_KEY), #SEARCH_Isis_Castle_1F_POT_0
    "[Palace of Ibis] Pot in the bottom left room": Info(242, rules.HAS_THIEF_KEY), #SEARCH_Isis_Castle_1F_POT_1
    "[Palace of Ibis] Hidden Ground on throne (night) 2F": Info(243), #SEARCH_Isis_Castle_2F_GROUND_0
    "[Palace of Ibis] Hidden Ground near top right corner of the balcony 2F": Info(244), #SEARCH_Isis_Castle_2F_Out_GROUND_0
    "[Palace of Ibis] Hidden Ground at the back of the queen's bed (night) 3F": Info(245, rules.HAS_MAGIC_KEY), #SEARCH_Isis_Castle_3F_GROUND_0
    "[Palace of Ibis] Chest guarded by ghost after going through the Secret Passage B2": Info(246), #SEARCH_Isis_Castle_B2F_TREASURE_IMPORTANT_0
    # ----- Pyramid -----
    "[Pyramid] Chest at the left of the top left corner room 1F": Info(247), #SEARCH_Pyramid_1F_TREASURE_NORMAL_0
    "[Pyramid] Chest 1 at the right of the top left corner room 1F": Info(248), #SEARCH_Pyramid_1F_TREASURE_NORMAL_1 # empty in vanilla
    "[Pyramid] Chest 2 at the right of the top left corner room 1F": Info(249), #SEARCH_Pyramid_1F_TREASURE_NORMAL_2
    "[Pyramid] Chest 3 at the right of the top left corner room 1F": Info(250), #SEARCH_Pyramid_1F_TREASURE_ENEMY_3
    "[Pyramid] Chest 4 at the right of the top left corner room 1F": Info(251), #SEARCH_Pyramid_1F_TREASURE_NORMAL_4
    "[Pyramid] Chest 1 in the second left corridor 1F": Info(252), #SEARCH_Pyramid_1F_TREASURE_NORMAL_5
    "[Pyramid] Chest 2 in the second left corridor 1F": Info(253), #SEARCH_Pyramid_1F_TREASURE_ENEMY_6
    "[Pyramid] Chest 3 in the second left corridor 1F": Info(254), #SEARCH_Pyramid_1F_TREASURE_ENEMY_7
    "[Pyramid] Chest in the first left corridor 1F": Info(255), #SEARCH_Pyramid_1F_TREASURE_NORMAL_8 # empty in vanilla
    "[Pyramid] Chest in the first right corridor 1F": Info(256), #SEARCH_Pyramid_1F_TREASURE_NORMAL_9
    #"[Pyramid] Event Statue": Info(257), #SEARCH_Pyramid_1F_EVENT_STATUE_0 # no items here
    "[Pyramid] Pot in the middle of the two first corridors 1F": Info(258), #SEARCH_Pyramid_1F_POT_0
    "[Pyramid] Pot at the dead end after the two second corridors 1F": Info(259), #SEARCH_Pyramid_1F_POT_1
    "[Pyramid] Chest at the middle left dead end 2F": Info(260), #SEARCH_Pyramid_2F_TREASURE_NORMAL_0
    "[Pyramid] Pot on the left of the first stairs 2F": Info(261), #SEARCH_Pyramid_2F_POT_0
    "[Pyramid] Pot in the center 2F": Info(262), #SEARCH_Pyramid_2F_POT_1
    "[Pyramid] Pot at the bottom left corner 2F": Info(263), #SEARCH_Pyramid_2F_POT_2
    "[Pyramid] Chest 1 after defeating Ripper of the Rift 3F": Info(264), #SEARCH_Pyramid_3F_TREASURE_NORMAL_0
    "[Pyramid] Chest 2 after defeating Ripper of the Rift 3F": Info(265), #SEARCH_Pyramid_3F_TREASURE_IMPORTANT_0
    #"[Pyramid] Event Switch 1": Info(266), #SEARCH_Pyramid_3F_EVENT_SWITCH_1 # no items here
    #"[Pyramid] Event Switch 2": Info(267), #SEARCH_Pyramid_3F_EVENT_SWITCH_2 # no items here
    #"[Pyramid] Event Switch 3": Info(268), #SEARCH_Pyramid_3F_EVENT_SWITCH_3 # no items here
    #"[Pyramid] Event Switch 4": Info(269), #SEARCH_Pyramid_3F_EVENT_SWITCH_4 # no items here
    #"[Pyramid] Event Door": Info(270), #SEARCH_Pyramid_3F_EVENT_DOOR_0 # no items here
    "[Pyramid] Chest 1 in treasure room 4F": Info(271, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_TREASURE_PYRAMID_0
    "[Pyramid] Chest 2 in treasure room 4F": Info(272, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_TREASURE_PYRAMID_1
    "[Pyramid] Chest 3 in treasure room 4F": Info(273, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_TREASURE_PYRAMID_2
    "[Pyramid] Chest 4 in treasure room 4F": Info(274, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_TREASURE_PYRAMID_3
    "[Pyramid] Chest 5 in treasure room 4F": Info(275, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_TREASURE_PYRAMID_4
    "[Pyramid] Chest 6 in treasure room 4F": Info(276, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_TREASURE_PYRAMID_5
    "[Pyramid] Chest 7 in treasure room 4F": Info(277, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_TREASURE_PYRAMID_6
    "[Pyramid] Chest 8 in treasure room 4F": Info(278, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_TREASURE_PYRAMID_7
    "[Pyramid] Chest 9 in treasure room 4F": Info(279, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_TREASURE_PYRAMID_8
    "[Pyramid] Chest 10 in treasure room 4F": Info(280, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_TREASURE_PYRAMID_9
    "[Pyramid] Chest 11 in treasure room 4F": Info(281, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_TREASURE_PYRAMID_10
    "[Pyramid] Chest 12 in treasure room 4F": Info(282, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_TREASURE_PYRAMID_11
    "[Pyramid] Chest 13 in treasure room 4F": Info(283, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_TREASURE_PYRAMID_12
    "[Pyramid] Chest 14 in treasure room 4F": Info(284, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_TREASURE_PYRAMID_13
    #"[Pyramid] Event Coffin": Info(285, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_EVENT_COFFIN_0 # no items here
    #"[Pyramid] Event Coffin": Info(286, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_EVENT_COFFIN_1 # no items here
    #"[Pyramid] Event Coffin": Info(287, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_EVENT_COFFIN_2 # no items here
    #"[Pyramid] Event Coffin": Info(288, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_EVENT_COFFIN_3 # no items here
    #"[Pyramid] Event Coffin": Info(289, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_EVENT_COFFIN_4 # no items here
    #"[Pyramid] Event Coffin": Info(290, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_EVENT_COFFIN_5 # no items here
    #"[Pyramid] Event Coffin": Info(291, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_EVENT_COFFIN_6 # no items here
    #"[Pyramid] Event Coffin": Info(292, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_EVENT_COFFIN_7 # no items here
    #"[Pyramid] Event Coffin": Info(293, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_EVENT_COFFIN_8 # no items here
    #"[Pyramid] Event Coffin": Info(294, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_EVENT_COFFIN_9 # no items here
    #"[Pyramid] Event Coffin": Info(295, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_EVENT_COFFIN_10 # no items here
    #"[Pyramid] Event Coffin": Info(296, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_EVENT_COFFIN_11 # no items here
    #"[Pyramid] Event Coffin": Info(297, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_EVENT_COFFIN_12 # no items here
    #"[Pyramid] Event Coffin": Info(298, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_4F_EVENT_COFFIN_13 # no items here
    "[Pyramid] Chest on top wall 5F": Info(299, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_5F_TREASURE_NORMAL_0
    "[Pyramid] Pot at the start of the loop path B1": Info(300), #SEARCH_Pyramid_B1F_POT_0
    "[Pyramid] Pot in the top right corner of the loop path B1": Info(301), #SEARCH_Pyramid_B1F_POT_1
    #"[Pyramid] Event": Info(302), #SEARCH_Pyramid_B2FEVENT_BROKENPILLAR_0 # no items here
    "[Pyramid] Coffin in the secret underground room B2": Info(303), #SEARCH_Pyramid_B2FEVENT_COFFIN_0
    "[Pyramid] Hidden Ground at the top of the Pyramid": Info(304, rules.HAS_MAGIC_KEY), #SEARCH_Pyramid_out_GROUND_0
    # ----- Portoga -----
    "[Portoga] Hidden Ground at the back of the Item Shop": Info(305, rules.HAS_THIEF_KEY), #SEARCH_Portoga_Out_GROUND_0
    "[Portoga] Hidden Ground in the bottom right area": Info(306), #SEARCH_Portoga_Out_GROUND_1
    "[Portoga] Hidden Ground at the top of the lighthouse": Info(307), #SEARCH_Portoga_Out_GROUND_2
    #"[Portoga] Event": Info(308), #SEARCH_Portoga_Out_EVENT_0 # no items here
    "[Portoga] Pot 1 at the end of the wooden bridge": Info(309), #SEARCH_Portoga_Out_POT_0
    "[Portoga] Pot 2 at the end of the wooden bridge": Info(310), #SEARCH_Portoga_Out_POT_1
    "[Portoga] Pot at the end of the left dock": Info(311), #SEARCH_Portoga_Out_POT_2
    "[Portoga] Pot left of Portoga Castle": Info(312), #SEARCH_Portoga_Out_POT_3
    "[Portoga] Barrel on the right of the right house": Info(313), #SEARCH_Portoga_Out_BARREL_0
    "[Portoga] Barrel near Church": Info(314), #SEARCH_Portoga_Out_BARREL_1
    "[Portoga] Barrel on the bottom right corner": Info(315), #SEARCH_Portoga_Out_BARREL_2
    "[Portoga] Drawer in Inn": Info(316), #SEARCH_Portoga_Inn_DRAWER_0
    "[Portoga] Sack in right house": Info(317, rules.HAS_THIEF_KEY), #SEARCH_Portoga_Room01_1F_SACK_0
    "[Portoga] Pot downstairs near the lighthouse": Info(318), #SEARCH_Portoga_Room02_B1F_POT_0
    "[Portoga] Bookshelf downstairs near the lighthouse": Info(319), #SEARCH_Portoga_Room02_B1F_BOOKSHELF_0
    "[Portoga] Gift from woman in the bottom right area after defeating Baramos": Info(320, rules.HAS_BIRD), #Portoga_Out_SUB_0_ACTOR_1010_010
    # ----- Portoga Castle -----
    "[Portoga Castle] Chest 1 in middle room": Info(321, rules.HAS_THIEF_KEY), #SEARCH_Portoga_Castle_1F_TREASURE_NORMAL_0
    "[Portoga Castle] Chest 2 in middle room": Info(322, rules.HAS_THIEF_KEY), #SEARCH_Portoga_Castle_1F_TREASURE_NORMAL_1
    "[Portoga Castle] Chest 3 in middle room": Info(323, rules.HAS_THIEF_KEY), #SEARCH_Portoga_Castle_1F_TREASURE_NORMAL_2
    "[Portoga Castle] Drawer in top room": Info(324, rules.HAS_MAGIC_KEY), #SEARCH_Portoga_Castle_1F_DRAWER_0
    "[Portoga Castle] Gift from Portoga King": Info(325), #Portoga_Castle_1F_MAIN_0_VOLUME_0010_010
    "[Portoga Castle] Reward from Portoga King after giving the Black Pepper": Info(326, rules.HAS_BLACK_PEPPER), #Portoga_Castle_1F_MAIN_0_VOLUME_0010_020
    # ----- Olivia's Promontory -----
    "[Olivia's Promontory] Hidden Ground between the two portals in the Portal room": Info(327, rules.HAS_ULTIMATE_KEY | rules.HAS_SHIP | rules.HAS_BIRD), #SEARCH_OliviaMisaki_1F_GROUND_0
    "[Olivia's Promontory] Drawer in top room": Info(328, rules.HAS_ULTIMATE_KEY), #SEARCH_OliviaMisaki_1F_DRAWER_0
    "[Olivia's Promontory] Sack on the left": Info(329), #SEARCH_OliviaMisaki_1F_SACK_0
    "[Olivia's Promontory] Hidden Ground on the outside of the top room": Info(330, rules.HAS_ULTIMATE_KEY), #SEARCH_OliviaMisaki_Out_GROUND_0
    # ----- Baharata -----
    #"[Baharata] Event": Info(331), #SEARCH_Baharata_Out_EVENT_0 # no items here
    "[Baharata] Hidden Ground on the left of the dock": Info(332), #SEARCH_Baharata_Out_GROUND_0
    "[Baharata] Barrel near the left of the Inn": Info(333), #SEARCH_Baharata_Out_BARREL_0
    "[Baharata] Barrel in the left exterior of the bottom left house": Info(334), #SEARCH_Baharata_Out_BARREL_1
    "[Baharata] Pot 1 near the right entrance": Info(335), #SEARCH_Baharata_Out_POT_0
    "[Baharata] Pot near the left of the Inn": Info(336), #SEARCH_Baharata_Out_POT_1
    "[Baharata] Pot 2 near the right entrance": Info(337), #SEARCH_Baharata_Out_POT_2
    "[Baharata] Drawer in the right house": Info(338), #SEARCH_Baharata_House1_1F_DRAWER_0
    "[Baharata] Drawer in Inn": Info(339), #SEARCH_Baharata_inn_1F_DRAWER_0
    "[Baharata] Sack in bottom left house": Info(340), #SEARCH_Baharata_Shop3_1F_SACK_0
    "[Baharata] Drawer in bottom left house": Info(341), #SEARCH_Baharata_Shop3_2F_DRAWER_0
    # ----- Kidnapper's Cave -----
    "[Kidnapper's Cave] Chest 1 in the top locked rooms": Info(342, rules.HAS_THIEF_KEY), #SEARCH_BaharataEastCave_B1F_TREASURE_ENEMY_0
    "[Kidnapper's Cave] Chest 2 in the top locked rooms": Info(343, rules.HAS_THIEF_KEY), #SEARCH_BaharataEastCave_B1F_TREASURE_NORMAL_1
    "[Kidnapper's Cave] Chest 3 in the top locked rooms": Info(344, rules.HAS_THIEF_KEY), #SEARCH_BaharataEastCave_B1F_TREASURE_NORMAL_2
    "[Kidnapper's Cave] Chest 4 in the top locked rooms": Info(345, rules.HAS_THIEF_KEY), #SEARCH_BaharataEastCave_B1F_TREASURE_ENEMY_3
    "[Kidnapper's Cave] Chest 5 in the top locked rooms": Info(346, rules.HAS_THIEF_KEY), #SEARCH_BaharataEastCave_B1F_TREASURE_NORMAL_4
    "[Kidnapper's Cave] Chest in the bottom left corner of the area": Info(347, rules.HAS_THIEF_KEY), #SEARCH_BaharataEastCave_B1F_TREASURE_NORMAL_5
    "[Kidnapper's Cave] Barrel in the second to last left small corridor": Info(348), #SEARCH_BaharataEastCave_B1F_BARREL_0
    "[Kidnapper's Cave] Barrel one room above the bottom right locked door": Info(349), #SEARCH_BaharataEastCave_B1F_BARREL_1
    "[Kidnapper's Cave] Barrel two rooms above the bottom middle locked door": Info(350), #SEARCH_BaharataEastCave_B1F_BARREL_2
    "[Kidnapper's Cave] Hidden Ground at the top left dead end": Info(351), #SEARCH_BaharataEastCave_B1F_GROUND_0
    "[Kidnapper's Cave] Chest 1 in treasure room B2": Info(352, rules.HAS_MAGIC_KEY), #SEARCH_BaharataEastCave_B2F_TREASURE_NORMAL_0
    "[Kidnapper's Cave] Chest 2 in treasure room B2": Info(353, rules.HAS_MAGIC_KEY), #SEARCH_BaharataEastCave_B2F_TREASURE_NORMAL_1
    "[Kidnapper's Cave] Chest 3 in treasure room B2": Info(354, rules.HAS_MAGIC_KEY), #SEARCH_BaharataEastCave_B2F_TREASURE_NORMAL_2
    "[Kidnapper's Cave] Chest 4 in treasure room B2": Info(355, rules.HAS_MAGIC_KEY), #SEARCH_BaharataEastCave_B2F_TREASURE_NORMAL_3
    "[Kidnapper's Cave] Sack on the left wall of the room before jails B2": Info(356), #SEARCH_BaharataEastCave_B2F_SACK_0
    "[Kidnapper's Cave] Hidden Ground in the top left corner of the left jail B2": Info(357, rules.HAS_MAGIC_KEY), #SEARCH_BaharataEastCave_B2F_GROUND_0
    "[Kidnapper's Cave] Hidden Ground in the top right corner of the right jail B2": Info(358, rules.HAS_MAGIC_KEY), #SEARCH_BaharataEastCave_B2F_GROUND_1
    #"[Kidnapper's Cave] Lever Event": Info(359, rules.HAS_MAGIC_KEY), #SEARCH_BaharataEastCave_B2F_EVENT_0 # no items here
    "[Kidnapper's Cave] Barrel near the right jail B2": Info(360, rules.HAS_MAGIC_KEY), #SEARCH_BaharataEastCave_B2F_BARREL_0
    # ----- Alltrades Abbey -----
    "[Alltrades Abbey] Hidden Ground near a statue in the center of the area": Info(361, rules.HAS_MAGIC_KEY), #SEARCH_Dharma_Castle_1F_GROUND_0
    "[Alltrades Abbey] Pot in the right corridor": Info(362, rules.HAS_MAGIC_KEY), #SEARCH_Dharma_Castle_1F_POT_0
    "[Alltrades Abbey] Pot in the left corridor": Info(363, rules.HAS_MAGIC_KEY), #SEARCH_Dharma_Castle_1F_POT_1
    "[Alltrades Abbey] Hidden Ground behind the Church B1": Info(364), #SEARCH_Dharma_Castle_B1F_GROUND_0
    "[Alltrades Abbey] Pot 1 at the bottom of Inn B1": Info(365), #SEARCH_Dharma_Castle_B1F_POT_0
    "[Alltrades Abbey] Pot 2 at the bottom of Inn B1": Info(366), #SEARCH_Dharma_Castle_B1F_POT_1
    "[Alltrades Abbey] Reward from Merchant in the main corridor after talking to a Merchant in Baharata after rescuing the Couple in Kidnapper's Cave from Robbin' 'Ood 2": Info(367, rules.HAS_MAGIC_KEY), #Dharma_1F_SUB_0_ACTOR_0810_010
    # ----- Wayfarer's Inn -----
    "[Wayfarer's Inn] Drawer in left room": Info(368), #SEARCH_TravelersHotel_House_DRAWER_0
    "[Wayfarer's Inn] Drawer in right room": Info(369), #SEARCH_TravelersHotel_House_DRAWER_1
    # ----- Mur -----
    "[Mur] Barrel on the small island": Info(370), #SEARCH_Muor_Out_BARREL_0
    "[Mur] Barrel on the edge near the bottom entrance": Info(371), #SEARCH_Muor_Out_BARREL_1
    "[Mur] Barrel near Church": Info(372), #SEARCH_Muor_Out_BARREL_2
    "[Mur] Sack near the left entrance": Info(373), #SEARCH_Muor_Out_SACK_1
    "[Mur] Hidden Ground between candelabras in Church": Info(374), #SEARCH_Muor_Church_1F_GROUND_0
    "[Mur] Storage in Inn": Info(375), #SEARCH_Muor_Inn_1F_STORAGE_0
    "[Mur] Pot in Inn": Info(376), #SEARCH_Muor_Inn_1F_POT_0
    "[Mur] Hidden Ground at the back of the locked room in Market": Info(377, rules.HAS_ULTIMATE_KEY), #SEARCH_Muor_Market_1F_GROUND_0
    #"[Mur] Event": Info(378), #SEARCH_Muor_Market_1F_EVENT_0 # no items here
    "[Mur] Pot 1 in the back room of the Market": Info(379), #SEARCH_Muor_Market_2F_POT_0
    "[Mur] Pot 2 in the back room of the Market": Info(380), #SEARCH_Muor_Market_2F_POT_1
    "[Mur] Pot in the small island house": Info(381), #SEARCH_Muor_House1_1F_POT_0
    "[Mur] Gift from Old Man in the back room of the Market": Info(382), #Muor_Market_1F_SUB_0_SCENE_0610_010
    # ----- Tower of Transcendence -----
    "[Tower of Transcendence] Chest in middle bottom room": Info(383), #SEARCH_GarunaTower_1F_TREASURE_NORMAL_0
    "[Tower of Transcendence] Pot 1 in middle top room": Info(384), #SEARCH_GarunaTower_1F_POT_0
    "[Tower of Transcendence] Pot 2 in middle top room": Info(385), #SEARCH_GarunaTower_1F_POT_1
    "[Tower of Transcendence] Chest in central room 2F": Info(386), #SEARCH_GarunaTower_2F_TREASURE_IMPORTANT_0
    "[Tower of Transcendence] Pot in the top area 2F": Info(387), #SEARCH_GarunaTower_2F_POT_0
    "[Tower of Transcendence] Chest in top room 3F": Info(388), #SEARCH_GarunaTower_3F_TREASURE_NORMAL_0
    "[Tower of Transcendence] Chest in bottom room 3F": Info(389), #SEARCH_GarunaTower_3F_TREASURE_NORMAL_1
    "[Tower of Transcendence] Chest in left room 3F": Info(390), #SEARCH_GarunaTower_3F_TREASURE_NORMAL_2
    "[Tower of Transcendence] Chest in bottom right room 3F": Info(391), #SEARCH_GarunaTower_3F_TREASURE_NORMAL_3
    "[Tower of Transcendence] Chest in left room 4F": Info(392), #SEARCH_GarunaTower_4F_TREASURE_NORMAL_0
    "[Tower of Transcendence] Pot in central room 4F": Info(393), #SEARCH_GarunaTower_4F_POT_0
    "[Tower of Transcendence] Chest in left room 5F": Info(394), #SEARCH_GarunaTower_5F_TREASURE_NORMAL_0
    # ----- Portoga Lighthouse -----
    "[Portoga Lighthouse] Barrel on the left 2F": Info(395), #SEARCH_PortogaLight_2F_BARREL_0
    "[Portoga Lighthouse] Chest on the bottom left 3F": Info(396), #SEARCH_PortogaLight_3F_TREASURE_NORMAL_0
    #"[Portoga Lighthouse] Event": Info(397), #SEARCH_PortogaLight_4F_EVENT_0 # no items here
    "[Portoga Lighthouse] Pot on the top 4F": Info(398), #SEARCH_PortogaLight_4F_POT_0
    # ----- Shrine of the Dwarf -----
    "[Shrine of the Dwarf] Hidden Ground near the top window": Info(399), #SEARCH_HobbitShrine_1F_GROUND_0
    "[Shrine of the Dwarf] Barrel on the right": Info(400), #SEARCH_HobbitShrine_1F_BARREL_0
    "[Shrine of the Dwarf] Reward from dwarf after giving Ortega's Helm and the Zenithium": Info(788, rules.HAS_ORTEGAS_HELM & rules.HAS_ZENITHIUM), #HobbitShrine_1F_SUB_0_SCENE_0020_010
    # ----- Wayfarer's Shrine -----
    "[Wayfarer's Shrine] Pot in the bottom left corner": Info(401), #SEARCH_TravelersShrine_1F_POT_0
    # ----- Theddon -----
    "[Theddon] Hidden Ground in the middle of the right big poison marsh": Info(402), #SEARCH_Tedon_Out_GROUND_0
    "[Theddon] Hidden Ground on the cross in the bottom right area": Info(403, rules.HAS_BIRD & rules.HAS_SPHERE_OF_LIGHT & rules.HAS_SHIP & rules.HAS_RAINBOW_DROP & rules.HAS_THIEF_KEY & rules.HAS_MAGIC_KEY & rules.HAS_ULTIMATE_KEY), #SEARCH_Tedon_Out_GROUND_1
    "[Theddon] Pot on the right of the right big poison marsh": Info(404), #SEARCH_Tedon_Out_POT_0
    "[Theddon] Storage in the bottom left house (day)": Info(405), #SEARCH_Tedon_Out_STORAGE_0
    "[Theddon] Chest in the bottom left house (day)": Info(406), #SEARCH_Tedon_Out_TREASURE_IMPORTANT_0
    "[Theddon] Barrel near the center cell": Info(407), #SEARCH_Tedon_Out_BARREL_0
    "[Theddon] Barrel in the bottom left house": Info(408), #SEARCH_Tedon_Shop_1F_BARREL_0
    "[Theddon] Hidden Ground next to the broken barrel in the basement room at the right of the right big poison marsh": Info(409), #SEARCH_Tedon_Room_B1F_GROUND_0
    #"[Theddon] Event": Info(410), #SEARCH_Tedon_Room_B1F_EVENT_0 # no items here
    "[Theddon] Reward for defeating Dying Fire (night)": Info(411, rules.HAS_ULTIMATE_KEY), #Tedon_Out_MAIN_0_BATTLE_END_0120_010
    # ----- Shrine of the Everbird -----
    #"[Shrine of the Everbird] Event 0": Info(412), #SEARCH_Reiamuland_Out_EVENT_0 # no items here
    #"[Shrine of the Everbird] Event 1": Info(413), #SEARCH_Reiamuland_Out_EVENT_1 # no items here
    #"[Shrine of the Everbird] Event 2": Info(414), #SEARCH_Reiamuland_Out_EVENT_2 # no items here
    #"[Shrine of the Everbird] Event 3": Info(415), #SEARCH_Reiamuland_Out_EVENT_3 # no items here
    #"[Shrine of the Everbird] Event 4": Info(416), #SEARCH_Reiamuland_Out_EVENT_4 # no items here
    #"[Shrine of the Everbird] Event 5": Info(417), #SEARCH_Reiamuland_Out_EVENT_5 # no items here
    #"[Shrine of the Everbird] Event 6": Info(418), #SEARCH_Reiamuland_Out_EVENT_6 # no items here
    "[Shrine of the Everbird] Hidden Ground near the right of the ladder": Info(419), #SEARCH_Reiamuland_Out_GROUND_0
    "[Shrine of the Everbird] Reward for offering the 6 orbs": Info(420, rules.HAS_ALL_ORBS), #EVESE_REIAMULAND_ORB_SHINE_ALL
    # ----- Jipang -----
    #"[Jipang] Event": Info(421), #SEARCH_Jipang_EVENT_0 # no items here
    "[Jipang] Hidden Ground near left of Pimiko's Palace": Info(422), #SEARCH_Jipang_Out_GROUND_0
    "[Jipang] Hidden Ground behind the top right house": Info(423), #SEARCH_Jipang_Out_GROUND_1
    "[Jipang] Pot behind the bottom house": Info(424), #SEARCH_Jipang_Out_POT_0
    "[Jipang] Storage in bottom house": Info(425), #SEARCH_Jipang_House1_STORAGE_0
    "[Jipang] Storage in top right house": Info(426), #SEARCH_Jipang_House2_STORAGE_0
    "[Jipang] Sack in top right house": Info(427), #SEARCH_Jipang_House2_SACK_0
    "[Jipang] Pot in top left house": Info(428), #SEARCH_Jipang_House3_POT_0
    "[Jipang] Sack in top left house": Info(429), #SEARCH_Jipang_House3_SACK_0
    "[Jipang] On ground in top left house after talking to Kol's blacksmith": Info(430, rules.HAS_SHIP & rules.HAS_SPHERE_OF_LIGHT & rules.HAS_BIRD), #SEARCH_Jipang_House3_GROUND_0
    "[Jipang] Pot 1 in basement room near the top left house": Info(431), #SEARCH_Jipang_Storehouse_POT_0
    "[Jipang] Pot 2 in basement room near the top left house": Info(432), #SEARCH_Jipang_Storehouse_POT_1
    "[Jipang] Pot 3 in basement room near the top left house": Info(433), #SEARCH_Jipang_Storehouse_POT_2
    #"[Jipang] Pot 4 in basement room near the top left house": Info(434), #SEARCH_Jipang_Storehouse_POT_3 # no items here
    "[Jipang] Hidden Ground near the right in the well": Info(435), #SEARCH_Jipang_Well_GROUND_0
    "[Jipang] Barrel on the back right side of the Monster Arena": Info(436, rules.HAS_BIRD & rules.HAS_SPHERE_OF_LIGHT & rules.HAS_SHIP & rules.HAS_RAINBOW_DROP & rules.HAS_THIEF_KEY & rules.HAS_MAGIC_KEY & rules.HAS_ULTIMATE_KEY), #SEARCH_Jipang_BattleRoad_BARREL_0
    "[Jipang] Pot near stairs in Monster Arena": Info(437, rules.HAS_BIRD & rules.HAS_SPHERE_OF_LIGHT & rules.HAS_SHIP & rules.HAS_RAINBOW_DROP & rules.HAS_THIEF_KEY & rules.HAS_MAGIC_KEY & rules.HAS_ULTIMATE_KEY), #SEARCH_Jipang_BattleRoad_POT_0
    # ----- Pimiko's Palace -----
    "[Pimiko's Palace] Pot in top left room": Info(438), #SEARCH_Jipang_Castle_Room_POT_0
    "[Pimiko's Palace] Pot 1 in right room": Info(439), #SEARCH_Jipang_Castle_Room_POT_1
    "[Pimiko's Palace] Pot 2 in right room": Info(440), #SEARCH_Jipang_Castle_Room_POT_2
    "[Pimiko's Palace] Storage 1 in top right room": Info(441), #SEARCH_Jipang_Castle_Room_STORAGE_0
    "[Pimiko's Palace] Storage 2 in top right room": Info(442), #SEARCH_Jipang_Castle_Room_STORAGE_1
    "[Pimiko's Palace] Villager reward 1 for defeating Orochi": Info(443), #Jipang_Room_MAIN_0_SCENE_0010_010_Sub_1
    "[Pimiko's Palace] Villager reward 2 for defeating Orochi": Info(444), #Jipang_Room_MAIN_0_SCENE_0010_010_Sub_2
    "[Pimiko's Palace] Villager reward 3 for defeating Orochi": Info(445), #Jipang_Room_MAIN_0_SCENE_0010_010_Sub_3
    "[Pimiko's Palace] Main reward for defeating Orochi": Info(446), #Jipang_Room_MAIN_0_SCENE_0010_010_Main
    # ----- Orochi's Lair -----
    "[Orochi's Lair] Chest in the right area before the stairs": Info(447), #SEARCH_JipangCave_1F_TREASURE_NORMAL_0
    "[Orochi's Lair] Chest in the center of the big dead end path": Info(448), #SEARCH_JipangCave_1F_TREASURE_NORMAL_1
    "[Orochi's Lair] Chest at the dead end near the entrance": Info(449), #SEARCH_JipangCave_1F_TREASURE_NORMAL_2
    "[Orochi's Lair] Chest in the bottom right corner of the left area": Info(450), #SEARCH_JipangCave_1F_TREASURE_NORMAL_3
    #"[Orochi's Lair] Event": Info(451), #SEARCH_JipangCave_2F_EVENT_0 # no items here
    "[Orochi's Lair] Chest on the left B2": Info(452), #SEARCH_JipangCave_2F_TREASURE_NORMAL_0
    # ----- Teleportal Shrine -----
    "[Teleportal Shrine] Hidden Ground on the back of the center water hole": Info(453), #SEARCH_TravelDoorShrine_1F_GROUND_0
    # ----- Persistence -----
    "[Persistence] Hidden Ground near the river on the right of the bridge": Info(454), #SEARCH_Soo_Out_GROUND_0
    "[Persistence] Hidden Ground near the well": Info(455), #SEARCH_Soo_Out_GROUND_1
    "[Persistence] Pot near the bottom right house": Info(456), #SEARCH_Soo_Out_POT_0
    "[Persistence] Pot near the top house": Info(457), #SEARCH_Soo_Out_POT_1
    "[Persistence] Pot in bottom right house": Info(458), #SEARCH_Soo_Room01_POT_0
    "[Persistence] Pot in top house": Info(459), #SEARCH_Soo_Room02_POT_0
    "[Persistence] Barrel 1 in right house": Info(460), #SEARCH_Soo_Room03_BARREL_0
    "[Persistence] Barrel 2 in right house": Info(461), #SEARCH_Soo_Room03_BARREL_1
    "[Persistence] Drawer in well": Info(462), #SEARCH_Soo_Well_DRAWER_0
    "[Persistence] Sack in Inn": Info(463), #SEARCH_Soo_Inn_SACK_0
    # ----- Grimland -----
    "[Grimland] Chest on bottom left": Info(464), #SEARCH_Greenlad_Out_TREASURE_NORMAL_0
    "[Grimland] Chest on the center left hill": Info(465), #SEARCH_Greenlad_Out_TREASURE_NORMAL_1
    "[Grimland] Chest on bottom right": Info(466), #SEARCH_Greenlad_Out_TREASURE_NORMAL_2
    "[Grimland] Pot near tree": Info(467), #SEARCH_Greenlad_Out_POT_0
    "[Grimland] Sack on the right": Info(468), #SEARCH_Greenlad_Out_SACK_0
    "[Grimland] Drawer 1 in Hermitage house": Info(469), #SEARCH_Greenlad_House_DRAWER_0
    "[Grimland] Drawer 2 in Hermitage house": Info(470), #SEARCH_Greenlad_House_DRAWER_1
    "[Grimland] Reward from Old Man after giving the Mod Rod": Info(471, rules.HAS_MOD_ROD), #Greenlad_House_SUB_0_ACTOR_0110_020
    # ----- Pirates' Den -----
    "[Pirates' Den] Barrel 1 outside near entrance": Info(472), #SEARCH_PiratesBase_Out_BARREL_0
    "[Pirates' Den] Barrel 2 outside near entrance": Info(473), #SEARCH_PiratesBase_Out_BARREL_1
    "[Pirates' Den] Drawer in top left room": Info(474, rules.HAS_THIEF_KEY), #SEARCH_PiratesBase_1F_DRAWER_0
    "[Pirates' Den] Pot 1 in top room": Info(475), #SEARCH_PiratesBase_1F_POT_0
    "[Pirates' Den] Pot 2 in top room": Info(476), #SEARCH_PiratesBase_1F_POT_1
    "[Pirates' Den] Barrel in top room": Info(477), #SEARCH_PiratesBase_1F_BARREL_0
    "[Pirates' Den] Barrel in bottom right room": Info(478), #SEARCH_PiratesBase_1F_BARREL_1
    "[Pirates' Den] Sack in right room": Info(479), #SEARCH_PiratesBase_1F_SACK_0
    "[Pirates' Den] Hidden Ground in top right corner of the right jail B1": Info(480, rules.HAS_THIEF_KEY & rules.HAS_ULTIMATE_KEY), #SEARCH_PiratesBase_B1F_GROUND_0
    "[Pirates' Den] Chest 1 in outside Secret Room": Info(481), #SEARCH_PiratesBase_Secret_TREASURE_NORMAL_0
    "[Pirates' Den] Chest 2 in outside Secret Room": Info(482), #SEARCH_PiratesBase_Secret_TREASURE_NORMAL_1
    "[Pirates' Den] On ground in outside Secret Room": Info(483), #SEARCH_PiratesBase_Secret_EVENT_0
    #"[Pirates' Den] Event": Info(484), #SEARCH_PiratesBase_Out_EVENT_0 # no items here
    # ----- Lozamii -----
    "[Lozamii] Hidden Ground on grave on the top left island": Info(485), #SEARCH_Luzami_Out_GROUND_0
    "[Lozamii] Hidden Ground in the middle of the flower field on the top island": Info(486), #SEARCH_Luzami_Out_GROUND_1
    "[Lozamii] Bookshelf 1 in right house": Info(487), #SEARCH_Luzami_House1_1F_BOOKSHELF_0
    "[Lozamii] Bookshelf 2 in right house": Info(488), #SEARCH_Luzami_House1_1F_BOOKSHELF_1
    "[Lozamii] Bookshelf 3 in right house": Info(489), #SEARCH_Luzami_House1_1F_BOOKSHELF_2
    "[Lozamii] Bookshelf 4 in right house": Info(490), #SEARCH_Luzami_House1_1F_BOOKSHELF_3
    "[Lozamii] Bookshelf 5 in right house": Info(491), #SEARCH_Luzami_House1_1F_BOOKSHELF_4
    "[Lozamii] Drawer in right house": Info(492), #SEARCH_Luzami_House1_1F_DRAWER_0
    "[Lozamii] Hidden Ground near the telescope in right house": Info(493, rules.HAS_BIRD & rules.HAS_SPHERE_OF_LIGHT & rules.HAS_SHIP & rules.HAS_RAINBOW_DROP & rules.HAS_THIEF_KEY & rules.HAS_MAGIC_KEY & rules.HAS_ULTIMATE_KEY), #SEARCH_Luzami_House1_2F_GROUND_0
    "[Lozamii] Bookshelf 1 in top house": Info(494), #SEARCH_Luzami_House2_BOOKSHELF_0
    "[Lozamii] Bookshelf 2 in top house": Info(495), #SEARCH_Luzami_House2_BOOKSHELF_1
    # ----- Merchantburg -----
    #"[Merchantburg] Hidden Ground near Church": Info(496), #SEARCH_Burg_3_Out_GROUND_0 # not randomized, missable
    "[Merchantburg] Pot in Item Shop": Info(497, rules.HAS_ULTIMATE_KEY), #SEARCH_Burg_3_House01_2F_POT_0
    "[Merchantburg] Sack in Inn": Info(498, rules.HAS_ULTIMATE_KEY), #SEARCH_Burg_3_Inn_1F_SACK_0
    "[Merchantburg] Drawer in Inn": Info(499, rules.HAS_ULTIMATE_KEY & rules.HAS_RAS_MIRROR), #SEARCH_Burg_3_Inn_1F_DRAWER_0
    #"[Merchantburg] Chest 1 in top left house": Info(500), #SEARCH_Burg_4_House01_1F_TREASURE_NORMAL_0 # not randomized, missable
    #"[Merchantburg] Chest 2 in top left house": Info(501), #SEARCH_Burg_4_House01_1F_TREASURE_NORMAL_1 # not randomized, missable
    #"[Merchantburg] Drawer 1 in Theater": Info(502), #SEARCH_Burg_4_Theater_1F_DRAWER_0 # not randomized, missable
    #"[Merchantburg] Drawer 2 in Theater": Info(503), #SEARCH_Burg_4_Theater_1F_DRAWER_1 # not randomized, missable
    #"[Merchantburg] Hidden Ground behind throne in top left house": Info(504, rules.HAS_ULTIMATE_KEY & rules.HAS_RAS_MIRROR), #SEARCH_Burg_5_House01_1F_GROUND_0 # excluded, missable in AP, yellow orb moved to SEARCH_Burg_6_House02_2F_DRAWER_0, gold placed here instead
    "[Merchantburg] Drawer in Theater": Info(505, rules.HAS_ULTIMATE_KEY & rules.HAS_RAS_MIRROR & rules.HAS_BIRD), #SEARCH_Burg_6_Theater_1F_DRAWER_0
    "[Merchantburg] Drawer in left house": Info(506, rules.HAS_ULTIMATE_KEY & rules.HAS_RAS_MIRROR & rules.HAS_BIRD), #SEARCH_Burg_6_House02_2F_DRAWER_0 # gold chain in vanilla, now default yellow orb
    # ----- Lanson -----
    "[Lanson] Hidden Ground between the top building and the top right building": Info(507), #SEARCH_Lancel_Out_GROUND_0
    "[Lanson] Pot 1 near the left of the Item Shop": Info(508), #SEARCH_Lancel_Out_POT_0
    "[Lanson] Pot 2 near the left of the Item Shop": Info(509), #SEARCH_Lancel_Out_POT_1
    "[Lanson] Barrel near the left of the Inn": Info(510), #SEARCH_Lancel_Out_BARREL_0
    "[Lanson] Barrel near Church": Info(511), #SEARCH_Lancel_Out_BARREL_1
    "[Lanson] Barrel near the center of Lanson": Info(512), #SEARCH_Lancel_Out_BARREL_2
    "[Lanson] Sack near the center of Lanson, on the right side": Info(513), #SEARCH_Lancel_Out_SACK_0
    "[Lanson] Chest on the right of the top right building": Info(514), #SEARCH_Lancel_Out_TREASURE_NORMAL_0
    "[Lanson] Sack in Inn": Info(515), #SEARCH_Lancel_Inn_SACK_0
    "[Lanson] Pot in left house": Info(516), #SEARCH_Lancel_House_POT_0
    "[Lanson] Drawer in left house": Info(517), #SEARCH_Lancel_House_DRAWER_0
    "[Lanson] Pot in Equipment Shop": Info(518), #SEARCH_Lancel_WeaponShop_POT_0
    "[Lanson] Chest on the bridge after the top building": Info(519, rules.HAS_ULTIMATE_KEY | rules.HAS_BIRD), #SEARCH_Lancel_Bridge_TREASURE_NORMAL_0
    # ----- Gaia's Navel -----
    "[Gaia's Navel] Chest in top left room near entrance": Info(520), #SEARCH_GaiaNavel_B1FA_TREASURE_NORMAL_0
    "[Gaia's Navel] Chest in top right room near entrance": Info(521), #SEARCH_GaiaNavel_B1FA_TREASURE_NORMAL_1
    "[Gaia's Navel] Chest in bottom left room near entrance": Info(522), #SEARCH_GaiaNavel_B1FA_TREASURE_ENEMY_2
    "[Gaia's Navel] Chest in bottom right room near entrance": Info(523), #SEARCH_GaiaNavel_B1FA_TREASURE_NORMAL_3
    "[Gaia's Navel] Chest at the end of the top left stairs corridor B2": Info(524), #SEARCH_GaiaNavel_B1FB_TREASURE_NORMAL_0
    "[Gaia's Navel] Chest at the end of the bottom right stairs corridor B2": Info(525), #SEARCH_GaiaNavel_B1FC_TREASURE_NORMAL_0
    "[Gaia's Navel] Pot 1 near center B2": Info(526), #SEARCH_GaiaNavel_B2F_POT_0
    "[Gaia's Navel] Pot 2 near center B2": Info(527), #SEARCH_GaiaNavel_B2F_POT_1
    "[Gaia's Navel] Pot in the bottom right corner B2": Info(528), #SEARCH_GaiaNavel_B2F_POT_2
    "[Gaia's Navel] Chest 1 after defeating Chiromancer B3": Info(529), #SEARCH_GaiaNavel_B3F_TREASURE_NORMAL_0
    "[Gaia's Navel] Chest 2 after defeating Chiromancer B3": Info(530), #SEARCH_GaiaNavel_B3F_TREASURE_NORMAL_1
    #"[Gaia's Navel] Event": Info(531), #SEARCH_GaiaNavel_B3F_EVENT_1 # no items here
    #"[Gaia's Navel] Event": Info(532), #SEARCH_GaiaNavel_B3F_EVENT_2 # no items here
    #"[Gaia's Navel] Event": Info(533), #SEARCH_GaiaNavel_B3F_EVENT_3 # no items here
    #"[Gaia's Navel] Event": Info(534), #SEARCH_GaiaNavel_B3F_EVENT_4 # no items here
    #"[Gaia's Navel] Event": Info(535), #SEARCH_GaiaNavel_B3F_EVENT_5 # no items here
    #"[Gaia's Navel] Event": Info(536), #SEARCH_GaiaNavel_B3F_EVENT_6 # no items here
    #"[Gaia's Navel] Event": Info(537), #SEARCH_GaiaNavel_B3F_EVENT_7 # no items here
    #"[Gaia's Navel] Event": Info(538), #SEARCH_GaiaNavel_B3F_EVENT_8 # no items here
    #"[Gaia's Navel] Event": Info(539), #SEARCH_GaiaNavel_B3F_EVENT_9 # no items here
    #"[Gaia's Navel] Event": Info(540), #SEARCH_GaiaNavel_B3F_EVENT_10 # no items here
    #"[Gaia's Navel] Event": Info(541), #SEARCH_GaiaNavel_B3F_EVENT_11 # no items here
    #"[Gaia's Navel] Event": Info(542), #SEARCH_GaiaNavel_B3F_EVENT_12 # no items here
    #"[Gaia's Navel] Event": Info(543), #SEARCH_GaiaNavel_B4F_EVENT_0 # no items here
    "[Gaia's Navel] Reward for defeating Chiromancer B3": Info(544), #GaiaNavel_B3F_MAIN_0_BATTLE_END_0020_020
    "[Gaia's Navel] On the right wall behind rocks in the hidden passage B4": Info(545, rules.HAS_WRECKING_BALL_2), #GaiaNavel_B4F_blue
    # ----- Edina Castle -----
    "[Edina Castle] Hidden Ground near the top right corner unicorn's statue at the top of the castle": Info(547), #SEARCH_Edinbear_Castle_Out_GROUND_0
    "[Edina Castle] Hidden Ground in the bottom left corner of the right garden": Info(548), #SEARCH_Edinbear_Castle_Out_GROUND_1
    "[Edina Castle] Pot in the bottom left corner of the left garden": Info(549), #SEARCH_Edinbear_Castle_Out_POT_0
    "[Edina Castle] Pot near the left garden entrance": Info(550), #SEARCH_Edinbear_Castle_Out_POT_1
    "[Edina Castle] Barrel 1 at the top of the castle": Info(551), #SEARCH_Edinbear_Castle_Out_BARREL_0
    "[Edina Castle] Barrel 2 at the top of the castle": Info(552), #SEARCH_Edinbear_Castle_Out_BARREL_1
    "[Edina Castle] Bookshelf in the top right room": Info(553, rules.HAS_MAGIC_KEY), #SEARCH_Edinbear_Castle_1F_BOOKSHELF_0
    "[Edina Castle] Storage 1 in the top right room": Info(554, rules.HAS_MAGIC_KEY), #SEARCH_Edinbear_Castle_1F_STORAGE_0
    "[Edina Castle] Storage 2 in the top right room": Info(555, rules.HAS_MAGIC_KEY), #SEARCH_Edinbear_Castle_1F_STORAGE_1
    "[Edina Castle] Storage in the bottom right room": Info(556, rules.HAS_THIEF_KEY), #SEARCH_Edinbear_Castle_1F_STORAGE_2
    "[Edina Castle] Barrel in the bottom left room": Info(557), #SEARCH_Edinbear_Castle_1F_BARREL_0
    "[Edina Castle] Barrel in the bottom right room": Info(558, rules.HAS_THIEF_KEY), #SEARCH_Edinbear_Castle_1F_BARREL_1
    "[Edina Castle] Chest in the secret basement B1": Info(559), #SEARCH_Edinbear_Castle_B1FB_TREASURE_IMPORTANT_0
    # ----- Shallows Shrine -----
    "[Shallows Shrine] Chest in the center": Info(560), #SEARCH_ShallowShrine_B1F_TREASURE_IMPORTANT_0
    "[Shallows Shrine] Hidden Ground between the chest and the door": Info(561), #SEARCH_ShallowShrine_B1F_GROUND_0
    #"[Shallows Shrine] Event": Info(562), #SEARCH_ShallowShrine_Out_EVENT_0 # no items here
    # ----- Spirit Spring -----
    "[Spirit Spring] Hidden Ground near top rocks": Info(884), #SEARCH_SpiritSpring_1F_GROUND_0
    "[Spirit Spring] Hidden Ground near center of lake": Info(885), #SEARCH_SpiritSpring_1F_GROUND_1
    # ----- Fifer's Spire -----
    "[Fifer's Spire] Chest in the top left corner of the inner corridor": Info(563), #SEARCH_ArpTower_1F_TREASURE_NORMAL_0
    "[Fifer's Spire] Chest in top right room 2F": Info(564), #SEARCH_ArpTower_2F_TREASURE_NORMAL_0
    "[Fifer's Spire] Chest in bottom right room 2F": Info(565), #SEARCH_ArpTower_2F_TREASURE_NORMAL_1
    "[Fifer's Spire] Chest 1 on central platform 3F": Info(566), #SEARCH_ArpTower_3F_TREASURE_IMPORTANT_0
    "[Fifer's Spire] Chest 2 on central platform 3F": Info(567), #SEARCH_ArpTower_3F_TREASURE_NORMAL_1
    "[Fifer's Spire] Chest 3 on central platform 3F": Info(568), #SEARCH_ArpTower_3F_TREASURE_NORMAL_2
    "[Fifer's Spire] Chest 4 on central platform 3F": Info(569), #SEARCH_ArpTower_3F_TREASURE_NORMAL_3
    "[Fifer's Spire] Chest in bottom right area 3F": Info(570), #SEARCH_ArpTower_3F_TREASURE_NORMAL_4
    "[Fifer's Spire] Chest in bottom left area 5F": Info(571), #SEARCH_ArpTower_5F_TREASURE_NORMAL_0
    "[Fifer's Spire] Chest in bottom area 5F": Info(572), #SEARCH_ArpTower_5F_TREASURE_NORMAL_1
    "[Fifer's Spire] Chest in bottom right area 5F": Info(573), #SEARCH_ArpTower_5F_TREASURE_ENEMY_2
    # ----- Wayfarer's Chapel -----
    "[Wayfarer's Chapel] Barrel in top room": Info(883), #SEARCH_TravelersChurch_1F_BARREL_0
    # ----- Manoza -----
    "[Manoza] Hidden Ground 1 on a grave in graveyard": Info(574), #SEARCH_Samanosa_Out_GROUND_0
    "[Manoza] Hidden Ground 2 on a grave in graveyard": Info(575), #SEARCH_Samanosa_Out_GROUND_1
    "[Manoza] Hidden Ground near a tree on the left of the castle": Info(576), #SEARCH_Samanosa_Out_GROUND_2
    "[Manoza] Hidden Ground 3 on a grave in graveyard": Info(577), #SEARCH_Samanosa_Out_GROUND_3
    "[Manoza] Barrel near Inn": Info(578), #SEARCH_Samanosa_Out_BARREL_0
    "[Manoza] Barrel near Monster Arena": Info(579), #SEARCH_Samanosa_Out_BARREL_1
    "[Manoza] Pot near right house": Info(580), #SEARCH_Samanosa_Out_POT_0
    #"[Manoza] Grave Event": Info(581), #SEARCH_Samanosa_Out_EVENT_0 # no items here
    "[Manoza] Pot in right house": Info(582), #SEARCH_Samanosa_House1_POT_0
    "[Manoza] Sack in right house": Info(583), #SEARCH_Samanosa_House1_SACK_0
    "[Manoza] Drawer in Equipment Shop": Info(584), #SEARCH_Samanosa_House2_1F_DRAWER_0
    "[Manoza] Sack in Equipment Shop": Info(585), #SEARCH_Samanosa_House2_1F_SACK_0
    "[Manoza] Pot in graveyard house": Info(586), #SEARCH_Samanosa_House3_POT_0
    "[Manoza] Drawer in Inn": Info(587), #SEARCH_Samanosa_Inn_DRAWER_0
    "[Manoza] Sack in Inn": Info(588), #SEARCH_Samanosa_Inn_SACK_0
    "[Manoza] Pot at the back of the Monster Arena": Info(589), #SEARCH_Samanosa_BattleRoad_POT_0
    "[Manoza] Barrel 1 on the right in Monster Arena": Info(590), #SEARCH_Samanosa_BattleRoad_BARREL_0
    "[Manoza] Barrel 2 on the right in Monster Arena": Info(591), #SEARCH_Samanosa_BattleRoad_BARREL_1
    # ----- Manoza Castle -----
    "[Manoza Castle] Barrel in kitchen room": Info(592, rules.HAS_MAGIC_KEY | rules.HAS_ULTIMATE_KEY), #SEARCH_Samanosa_Castle_1F_BARREL_0
    "[Manoza Castle] Hidden Ground on flower pot statue in top garden": Info(593), #SEARCH_Samanosa_Castle_1F_GROUND_0
    "[Manoza Castle] Pot in central left locked room": Info(594, rules.HAS_MAGIC_KEY), #SEARCH_Samanosa_Castle_1F_POT_0
    "[Manoza Castle] Pot 1 in East Tower": Info(595), #SEARCH_Samanosa_Castle_2F_POT_0
    "[Manoza Castle] Pot 2 in East Tower": Info(596), #SEARCH_Samanosa_Castle_2F_POT_1
    "[Manoza Castle] Bookshelf in the king's bedroom": Info(597), #SEARCH_Samanosa_Castle_2F_BedRoom_BOOKSHELF_0
    "[Manoza Castle] Drawer in the king's bedroom": Info(598), #SEARCH_Samanosa_Castle_2F_BedRoom_DRAWER_0
    #"[Manoza Castle] Chest in the king's bedroom": Info(599), #SEARCH_Samanosa_Castle_2F_BedRoom_TREASURE_IMPORTANT_0 # does not exist in the game
    "[Manoza Castle] Pot in top left jail B1": Info(600, rules.HAS_ULTIMATE_KEY), #SEARCH_Samanosa_Castle_B1_POT_0
    "[Manoza Castle] Hidden Ground near the right wall in left jail B2": Info(601, rules.HAS_ULTIMATE_KEY), #SEARCH_Samanosa_Castle_B2_A_GROUND_0
    "[Manoza Castle] Pot in right jail B2": Info(602), #SEARCH_Samanosa_Castle_B2_A_POT_0
    "[Manoza Castle] Guard reward 1 for defeating Boss Troll (night)": Info(603, rules.HAS_RAS_MIRROR), #Samanosa_Castle_1F_MAIN_0_SCENE_0010_010_Sub_1
    "[Manoza Castle] Guard reward 2 for defeating Boss Troll (night)": Info(604, rules.HAS_RAS_MIRROR), #Samanosa_Castle_1F_MAIN_0_SCENE_0010_010_Sub_2
    "[Manoza Castle] Main reward for defeating Boss Troll (night)": Info(605, rules.HAS_RAS_MIRROR), #Samanosa_Castle_1F_MAIN_0_SCENE_0010_010_Main
    # ----- Manoza Cave -----
    "[Manoza Cave] Chest on the left loop path B1": Info(606), #SEARCH_RaCave_B1_TREASURE_NORMAL_0
    "[Manoza Cave] Chest near the top B1": Info(607), #SEARCH_RaCave_B1_TREASURE_NORMAL_1
    "[Manoza Cave] Chest 1 at the end of the top dead end B2": Info(608), #SEARCH_RaCave_B2_TREASURE_ENEMY_0
    "[Manoza Cave] Chest 2 at the end of the top dead end B2": Info(609), #SEARCH_RaCave_B2_TREASURE_ENEMY_1
    "[Manoza Cave] Chest 3 at the end of the top dead end B2": Info(610), #SEARCH_RaCave_B2_TREASURE_ENEMY_2
    "[Manoza Cave] Chest 4 at the end of the top dead end B2": Info(611), #SEARCH_RaCave_B2_TREASURE_NORMAL_3
    "[Manoza Cave] Chest 1 on the path that leads to the top dead end B2": Info(612), #SEARCH_RaCave_B2_TREASURE_ENEMY_4
    "[Manoza Cave] Chest 2 on the path that leads to the top dead end B2": Info(613), #SEARCH_RaCave_B2_TREASURE_NORMAL_5
    "[Manoza Cave] Chest 3 on the path that leads to the top dead end B2": Info(614), #SEARCH_RaCave_B2_TREASURE_NORMAL_6
    "[Manoza Cave] Chest 4 on the path that leads to the top dead end B2": Info(615), #SEARCH_RaCave_B2_TREASURE_ENEMY_7
    "[Manoza Cave] Chest 1 in the central area B2": Info(616), #SEARCH_RaCave_B2_TREASURE_NORMAL_8
    "[Manoza Cave] Chest 2 in the central area B2": Info(617), #SEARCH_RaCave_B2_TREASURE_NORMAL_9
    "[Manoza Cave] Chest 3 in the central area B2": Info(618), #SEARCH_RaCave_B2_TREASURE_NORMAL_10
    "[Manoza Cave] Chest 4 in the central area B2": Info(619), #SEARCH_RaCave_B2_TREASURE_NORMAL_11
    "[Manoza Cave] Chest 5 in the central area B2": Info(620), #SEARCH_RaCave_B2_TREASURE_ENEMY_12
    "[Manoza Cave] Chest 1 at the bottom left dead end B2": Info(621), #SEARCH_RaCave_B2_TREASURE_ENEMY_13
    "[Manoza Cave] Chest 2 at the bottom left dead end B2": Info(622), #SEARCH_RaCave_B2_TREASURE_NORMAL_14
    "[Manoza Cave] Chest 3 at the bottom left dead end B2": Info(623), #SEARCH_RaCave_B2_TREASURE_NORMAL_15
    "[Manoza Cave] Chest 4 at the bottom left dead end B2": Info(624), #SEARCH_RaCave_B2_TREASURE_ENEMY_16
    "[Manoza Cave] Chest 5 at the bottom left dead end B2": Info(625), #SEARCH_RaCave_B2_TREASURE_NORMAL_17
    "[Manoza Cave] Chest 1 at the bottom right dead end B2": Info(626), #SEARCH_RaCave_B2_TREASURE_ENEMY_18
    "[Manoza Cave] Chest 2 at the bottom right dead end B2": Info(627), #SEARCH_RaCave_B2_TREASURE_ENEMY_19
    "[Manoza Cave] Chest 3 at the bottom right dead end B2": Info(628), #SEARCH_RaCave_B2_TREASURE_NORMAL_20
    "[Manoza Cave] Chest on the left path B3": Info(629), #SEARCH_RaCave_B3_TREASURE_NORMAL_0
    "[Manoza Cave] Chest in the central room B3": Info(630), #SEARCH_RaCave_B3_TREASURE_IMPORTANT_1
    # ----- Ghost Ship -----
    "[Ghost Ship] Barrel in center": Info(631), #SEARCH_GhostShip_1F_BARREL_0
    "[Ghost Ship] Barrel near the top": Info(632), #SEARCH_GhostShip_1F_BARREL_1
    "[Ghost Ship] Pot near right side": Info(633), #SEARCH_GhostShip_1F_POT_0
    #"[Ghost Ship] Event": Info(634), #SEARCH_GhostShip_1F_EVENT_0 # no items here
    "[Ghost Ship] Drawer in top room B1": Info(635), #SEARCH_GhostShip_B1_DRAWER_0
    "[Ghost Ship] Chest 1 in treasure room B1": Info(636, rules.HAS_THIEF_KEY), #SEARCH_GhostShip_B1_TREASURE_NORMAL_0
    "[Ghost Ship] Chest 2 in treasure room B1": Info(637, rules.HAS_THIEF_KEY), #SEARCH_GhostShip_B1_TREASURE_NORMAL_1
    "[Ghost Ship] Chest 3 in treasure room B1": Info(638, rules.HAS_THIEF_KEY), #SEARCH_GhostShip_B1_TREASURE_NORMAL_2
    "[Ghost Ship] Chest 4 in treasure room B1": Info(639, rules.HAS_THIEF_KEY), #SEARCH_GhostShip_B1_TREASURE_ENEMY_3
    "[Ghost Ship] Chest 5 in treasure room B1": Info(640, rules.HAS_THIEF_KEY), #SEARCH_GhostShip_B1_TREASURE_NORMAL_4
    "[Ghost Ship] On ground in bottom room": Info(641), #SEARCH_GhostShip_B1_EVENT_0
    "[Ghost Ship] Barrel in treasure room B1": Info(642, rules.HAS_THIEF_KEY), #SEARCH_GhostShip_B1_BARREL_0
    "[Ghost Ship] Pot in treasure room B1": Info(643, rules.HAS_THIEF_KEY), #SEARCH_GhostShip_B1_POT_0
    # ----- Shrine of Shackles -----
    "[Shrine of Shackles] Pot in top left jail": Info(644), #SEARCH_ShrinePrison_1F_POT_0
    "[Shrine of Shackles] Pot in bottom left jail": Info(645), #SEARCH_ShrinePrison_1F_POT_1
    "[Shrine of Shackles] Pot in bottom right jail": Info(646), #SEARCH_ShrinePrison_1F_POT_2
    "[Shrine of Shackles] On ground in bottom right jail": Info(647), #ShrinePrison_1F_MAIN_3_After_Reminiscence
    # ----- Maw of the Necrogond -----
    "[Maw of the Necrogond] Chest at the end of the top left dead end 1F": Info(648), #SEARCH_NecrogondCave_1F_TREASURE_NORMAL_0
    "[Maw of the Necrogond] Chest on the left near stairs 1F": Info(649), #SEARCH_NecrogondCave_1F_TREASURE_NORMAL_1
    "[Maw of the Necrogond] Chest near water pool in the center 1F": Info(650), #SEARCH_NecrogondCave_1F_TREASURE_NORMAL_2
    "[Maw of the Necrogond] Chest on the top right corner 1F": Info(651), #SEARCH_NecrogondCave_1F_TREASURE_NORMAL_3
    "[Maw of the Necrogond] Chest near holes on the bottom area 2F": Info(652), #SEARCH_NecrogondCave_2FA_TREASURE_NORMAL_0
    "[Maw of the Necrogond] Chest at the start of the loop path 2F": Info(653), #SEARCH_NecrogondCave_2FA_Loop_TREASURE_ENEMY_0
    "[Maw of the Necrogond] Hidden Ground near the left of the rightmost central rock in the hole area 2F": Info(654), #SEARCH_NecrogondCave_2FB_GROUND_0
    "[Maw of the Necrogond] Chest in the top left corner of the hole area 2F": Info(655), #SEARCH_NecrogondCave_2FB_TREASURE_NORMAL_0
    "[Maw of the Necrogond] Chest in the bottom of the hole area 2F": Info(656), #SEARCH_NecrogondCave_2FB_TREASURE_NORMAL_1
    "[Maw of the Necrogond] Chest at the end of the top left dead end 3F": Info(657), #SEARCH_NecrogondCave_3F_TREASURE_NORMAL_0
    "[Maw of the Necrogond] Chest in the bottom right area 3F": Info(658), #SEARCH_NecrogondCave_3F_TREASURE_NORMAL_1
    "[Maw of the Necrogond] Chest in the top left corner 4F": Info(659), #SEARCH_NecrogondCave_4F_TREASURE_NORMAL_0
    "[Maw of the Necrogond] Chest at the dead end near the bottom left stairs 4F": Info(660), #SEARCH_NecrogondCave_4F_TREASURE_NORMAL_1
    "[Maw of the Necrogond] Chest near the left of the central river 4F": Info(661), #SEARCH_NecrogondCave_4F_TREASURE_NORMAL_2
    "[Maw of the Necrogond] Chest in the isolated area on the right of the central river 4F": Info(662), #SEARCH_NecrogondCave_4F_TREASURE_ENEMY_3
    "[Maw of the Necrogond] Chest on the right river small island 4F": Info(663), #SEARCH_NecrogondCave_4F_TREASURE_NORMAL_4
    "[Maw of the Necrogond] Chest at the top dead end between the central and the right rivers 4F": Info(664), #SEARCH_NecrogondCave_4F_TREASURE_NORMAL_5
    # ----- Necrogond Shrine -----
    "[Necrogond Shrine] Hidden Ground near the top windows in the shrine": Info(665), #SEARCH_NecrogondShrine_House_GROUND_0
    "[Necrogond Shrine] Hidden Ground 1 somewhere in the shrine": Info(666), #SEARCH_NecrogondShrine_House_GROUND_1
    "[Necrogond Shrine] Hidden Ground 2 somewhere in the shrine": Info(667), #SEARCH_NecrogondShrine_House_GROUND_2
    "[Necrogond Shrine] Barrel near the right side of the shrine": Info(668), #SEARCH_NecrogondShrine_Out_BARREL_0
    "[Necrogond Shrine] Gift from Priest": Info(669), #NecrogondShrine_House_MAIN_0_VOLUME_0110_010
    # ----- Pit of Giaga -----
    "[Pit of Giaga] Barrel in the bottom room": Info(670), #SEARCH_GiagaPit_1F_Before_BARREL_0
    # ----- Baramos' Lair -----
    "[Baramos' Lair] Hidden Ground in the Surroundings' top right corner garden area": Info(671), #SEARCH_BaramosCastle_Out_GROUND_0
    "[Baramos' Lair] Chest on the Surroundings' roof above the first entrance": Info(672), #SEARCH_BaramosCastle_Out_TREASURE_NORMAL_0
    "[Baramos' Lair] Chest 1 in the central room of the South-East Tower": Info(673), #SEARCH_BaramosCastle_1FB_TREASURE_NORMAL_0
    "[Baramos' Lair] Chest 2 in the central room of the South-East Tower": Info(674), #SEARCH_BaramosCastle_1FB_TREASURE_NORMAL_1
    "[Baramos' Lair] Chest 3 in the central room of the South-East Tower": Info(675), #SEARCH_BaramosCastle_1FB_TREASURE_NORMAL_2
    "[Baramos' Lair] Chest in the left garden of the South-East Tower": Info(676), #SEARCH_BaramosCastle_1FB_TREASURE_NORMAL_3
    "[Baramos' Lair] Chest near the central top wall in the Central Tower": Info(677), #SEARCH_BaramosCastle_1FC_TREASURE_ENEMY_0
    "[Baramos' Lair] Chest in the bottom room of the Central Tower": Info(678), #SEARCH_BaramosCastle_1FC_TREASURE_NORMAL_1
    "[Baramos' Lair] Hidden Ground on the throne in the Throne Room": Info(679), #SEARCH_BaramosCastle_1FF_GROUND_0
    "[Baramos' Lair] Hidden Ground on the left of the jail's bed in the bottom right exterior Passageway": Info(680, rules.HAS_ULTIMATE_KEY), #SEARCH_BaramosCastle_B1A_GROUND_0
    "[Baramos' Lair] Chest near the left stairs of the Central Tower Passageway": Info(681), #SEARCH_BaramosCastle_B1B_TREASURE_ENEMY_0
    # ----- Castle of the Dragon Queen -----
    "[Castle of the Dragon Queen] Hidden Ground at the back in the top room": Info(682), #SEARCH_DragonQueen_back_GROUND_0
    #"[Castle of the Dragon Queen] Event": Info(683), #SEARCH_DragonQueen_1F_EVENT_0 # no items here
    #"[Castle of the Dragon Queen] Event": Info(684), #SEARCH_DragonQueen_Queen_room_EVENT_0 # no items here
    "[Castle of the Dragon Queen] Hidden Ground near the top right corner in the Throne Room": Info(685), #SEARCH_DragonQueen_Queen_room_GROUND_0
    "[Castle of the Dragon Queen] Gift from the Dragon Queen": Info(686), #DragonQueen_Queen_room_MAIN_0_SCENE_0110_010
    # ----- West Tantegel Harbour -----
    "[West Tantegel Harbour] Hidden Ground near wall in small left garden": Info(687), #SEARCH_WestPort_Out_GROUND_0
    "[West Tantegel Harbour] Hidden Ground at the end of the top dock": Info(688), #SEARCH_WestPort_Out_GROUND_1
    #"[West Tantegel Harbour] Event": Info(689), #SEARCH_WestPort_Out_EVENT_1 # no items here
    "[West Tantegel Harbour] Drawer in house": Info(690), #SEARCH_WestPort_House_DRAWER_0
    #"[West Tantegel Harbour] Gift from man in house": Info(691), #WestPort_House_SUB_0_SCENE_0010_010 # not randomized, gives the Alefgard Map
    # ----- Galen's House -----
    "[Galen's House] Barrel in the garden": Info(692, rules.HAS_THIEF_KEY), #SEARCH_GaraiHouse_Out_BARREL_0
    "[Galen's House] Pot near the right entrance": Info(693), #SEARCH_GaraiHouse_Out_POT_0
    "[Galen's House] Drawer 1 in house": Info(694, rules.HAS_THIEF_KEY), #SEARCH_GaraiHouse_1F_DRAWER_0
    "[Galen's House] Drawer 2 in house": Info(695, rules.HAS_THIEF_KEY), #SEARCH_GaraiHouse_1F_DRAWER_1
    "[Galen's House] Chest in basement": Info(696, rules.HAS_THIEF_KEY), #SEARCH_GaraiHouse_B1F_TREASURE_NORMAL_0
    "[Galen's House] On ground in basement": Info(697, rules.HAS_THIEF_KEY), #SEARCH_GaraiHouse_B1F_EVENT_0
    # ----- Sanctum -----
    "[Sanctum] Hidden Ground near the left of the fountain": Info(698), #SEARCH_HolyShrine_2F_GROUND_0
    "[Sanctum] Reward from Priest after giving the Sacred Amulet, Staff of Rain and Sunstone": Info(699, rules.HAS_SACRED_AMULET & rules.HAS_STAFF_OF_RAIN & rules.HAS_SUNSTONE), #HolyShrine_2F_MAIN_0_ACTOR_0120_010
    # ----- Tantegel -----
    "[Tantegel] Hidden Ground near the right of the Equipment Shop": Info(700), #SEARCH_Ludatorm_Out_GROUND_0
    "[Tantegel] Hidden Ground near left of bridge": Info(701), #SEARCH_Ludatorm_Out_GROUND_1
    "[Tantegel] Hidden Ground near Tantegel Castle entrance": Info(702), #SEARCH_Ludatorm_Out_GROUND_2
    "[Tantegel] Barrel near Inn": Info(703), #SEARCH_Ludatorm_Out_BARREL_0
    "[Tantegel] Barrel near right house": Info(704), #SEARCH_Ludatorm_Out_BARREL_1
    "[Tantegel] Pot on the right of the big house": Info(705), #SEARCH_Ludatorm_Out_POT_0
    "[Tantegel] Sack near right house": Info(706), #SEARCH_Ludatorm_Out_SACK_0
    "[Tantegel] Hidden Ground on the left of the Equipment Shop": Info(707), #SEARCH_Ludatorm_Out_TREASURE_NORMAL_0
    "[Tantegel] Bookshelf 1 in the big house": Info(708), #SEARCH_Ludatorm_House1_2F_BOOKSHELF_0
    "[Tantegel] Bookshelf 2 in the big house": Info(709), #SEARCH_Ludatorm_House1_2F_BOOKSHELF_1
    "[Tantegel] Storage in right house": Info(710), #SEARCH_Ludatorm_House2_2F_STORAGE_0
    "[Tantegel] Pot 1 in Church": Info(711, rules.HAS_THIEF_KEY), #SEARCH_Ludatorm_Church_1F_POT_0
    "[Tantegel] Pot 2 in Church": Info(712, rules.HAS_THIEF_KEY), #SEARCH_Ludatorm_Church_2F_POT_0
    "[Tantegel] Barrel in Inn": Info(713), #SEARCH_Ludatorm_Inn_BARREL_0
    "[Tantegel] Pot in Inn": Info(714), #SEARCH_Ludatorm_Inn_POT_0
    "[Tantegel] Sack in Inn": Info(715), #SEARCH_Ludatorm_Inn_SACK_0
    # ----- Tantegel Castle -----
    #"[Tantegel Castle] Chest 1 in treasure room": Info(716, rules.HAS_THIEF_KEY), #SEARCH_Ludatorm_Castle_1F_TREASURE_NORMAL_0 # no items here (not even empty, it's already opened)
    #"[Tantegel Castle] Chest 2 in treasure room": Info(717, rules.HAS_THIEF_KEY), #SEARCH_Ludatorm_Castle_1F_TREASURE_NORMAL_1 # no items here (not even empty, it's already opened)
    #"[Tantegel Castle] Chest 3 in treasure room": Info(718, rules.HAS_THIEF_KEY), #SEARCH_Ludatorm_Castle_1F_TREASURE_NORMAL_2 # no items here (not even empty, it's already opened)
    "[Tantegel Castle] Chest 1 in right locked room": Info(719, rules.HAS_ULTIMATE_KEY), #SEARCH_Ludatorm_Castle_1F_TREASURE_NORMAL_3
    "[Tantegel Castle] Chest 2 in right locked room": Info(720, rules.HAS_ULTIMATE_KEY), #SEARCH_Ludatorm_Castle_1F_TREASURE_NORMAL_4
    "[Tantegel Castle] Barrel in kitchen room": Info(721), #SEARCH_Ludatorm_Castle_1F_BARREL_0
    "[Tantegel Castle] Pot near bottom right healing Old Man": Info(722), #SEARCH_Ludatorm_Castle_1F_POT_0
    "[Tantegel Castle] Storage in top left room 2F": Info(723, rules.HAS_THIEF_KEY), #SEARCH_Ludatorm_Castle_2F_STORAGE_0
    "[Tantegel Castle] Pot in bottom right room 2F": Info(724, rules.HAS_THIEF_KEY), #SEARCH_Ludatorm_Castle_2F_POT_0
    "[Tantegel Castle] Chest in hidden room 2F": Info(725), #SEARCH_Ludatorm_Castle_2F_hidden_room_TREASURE_IMPORTANT_0
    "[Tantegel Castle] Barrel 1 in hidden room 2F": Info(726), #SEARCH_Ludatorm_Castle_2F_hidden_room_BARREL_0
    "[Tantegel Castle] Barrel 2 in hidden room 2F": Info(727), #SEARCH_Ludatorm_Castle_2F_hidden_room_BARREL_1
    "[Tantegel Castle] Hidden Ground in the garden between the two flower fields": Info(728), #SEARCH_Ludatorm_Castle_1F_Out_GROUND_0
    "[Tantegel Castle] Pot in the basement locked room B1": Info(729, rules.HAS_ULTIMATE_KEY), #SEARCH_Ludatorm_Castle_B1F_POT_0
    # ----- Damdara -----
    "[Damdara] Hidden Ground in the top right stable box": Info(731), #SEARCH_Domdora_Out_GROUND_0
    "[Damdara] On ground in the stable": Info(732), #SEARCH_Domdora_Out_EVENT_1
    "[Damdara] Barrel near Item Shop": Info(733), #SEARCH_Domdora_Out_BARREL_0
    "[Damdara] Barrel in bottom left house": Info(734), #SEARCH_Domdora_House01_1F_BARREL_0
    "[Damdara] Pot in bottom left house": Info(735), #SEARCH_Domdora_House02_1F_POT_0
    "[Damdara] Bookshelf in bottom left house": Info(736), #SEARCH_Domdora_House02_1F_BOOKSHELF_1
    "[Damdara] Storage in bottom house": Info(737), #SEARCH_Domdora_House03_1F_STORAGE_0
    "[Damdara] Storage in Inn": Info(738), #SEARCH_Domdora_Inn_2F_STORAGE_0
    "[Damdara] Sack 1 in Inn": Info(739), #SEARCH_Domdora_Inn_2F_SACK_0
    "[Damdara] Sack 2 in Inn": Info(740), #SEARCH_Domdora_Inn_2F_SACK_1
    "[Damdara] Storage in central house": Info(741), #SEARCH_Domdora_Weapon_Shop02_2F_STORAGE_0
    "[Damdara] Sack in central house": Info(742), #SEARCH_Domdora_Weapon_Shop02_2F_SACK_0
    "[Damdara] Hidden Ground at the base of stalagmite at far side of pool of water in well": Info(743), #SEARCH_Domdora_Well_GROUND_0
    # ----- Cantlin -----
    "[Cantlin] Hidden Ground in top left corner": Info(744), #SEARCH_Mercado_Out_GROUND_0
    "[Cantlin] Hidden Ground in bottom left area": Info(745), #SEARCH_Mercado_Out_GROUND_1
    "[Cantlin] Hidden Ground in bottom right area behind the big torch pot": Info(746), #SEARCH_Mercado_Out_GROUND_2
    "[Cantlin] Hidden Ground near flowers of left house": Info(747, rules.HAS_BIRD & rules.HAS_SPHERE_OF_LIGHT & rules.HAS_SHIP & rules.HAS_RAINBOW_DROP & rules.HAS_THIEF_KEY & rules.HAS_MAGIC_KEY & rules.HAS_ULTIMATE_KEY), #SEARCH_Mercado_Out_GROUND_3
    "[Cantlin] Barrel near bottom left area": Info(748), #SEARCH_Mercado_Out_BARREL_0
    "[Cantlin] Pot near bottom right area": Info(749), #SEARCH_Mercado_Out_POT_1
    "[Cantlin] Pot in top left corner": Info(750), #SEARCH_Mercado_Out_POT_2
    "[Cantlin] Storage in Inn": Info(751), #SEARCH_Mercado_Hotel_STORAGE_0
    "[Cantlin] Sack in central right house": Info(752), #SEARCH_Mercado_Shop01_1F_SACK_0
    "[Cantlin] Bookshelf 1 in left house": Info(753), #SEARCH_Mercado_Shop02_2F_BOOKSHELF_0
    "[Cantlin] Bookshelf 2 in left house": Info(754), #SEARCH_Mercado_Shop02_2F_BOOKSHELF_1
    "[Cantlin] Bookshelf 3 in left house": Info(755), #SEARCH_Mercado_Shop02_2F_BOOKSHELF_2
    "[Cantlin] Bookshelf 4 in left house": Info(756), #SEARCH_Mercado_Shop02_2F_BOOKSHELF_3
    "[Cantlin] Bookshelf 5 in left house": Info(757), #SEARCH_Mercado_Shop02_2F_BOOKSHELF_4
    "[Cantlin] Storage in left house": Info(758), #SEARCH_Mercado_Shop02_2F_STORAGE_0
    "[Cantlin] Drawer in left house": Info(759), #SEARCH_Mercado_Shop02_2F_DRAWER_0
    #"[Cantlin] Event": Info(760), #SEARCH_Mercado_Shop02_2F_EVENT_0 # no items here
    #"[Cantlin] Event": Info(761), #SEARCH_Mercado_Shop02_2F_EVENT_1 # no items here
    "[Cantlin] Pot 1 on the back left side of the Monster Arena": Info(762), #SEARCH_Mercado_BattleRoad_POT_0
    "[Cantlin] Pot 2 on the back left side of the Monster Arena": Info(763), #SEARCH_Mercado_BattleRoad_POT_1
    "[Cantlin] Barrel near stairs in Monster Arena": Info(764), #SEARCH_Mercado_BattleRoad_BARREL_0
    "[Cantlin] On table in left house": Info(765), #Mercado_Shop02_2F_RotoSword_02_0
    # ----- Shrine of the Spirit -----
    "[Shrine of the Spirit] Hidden Ground in the center of the room": Info(766), #SEARCH_SpiritShrine_2F_GROUND_0
    "[Shrine of the Spirit] Hidden Ground somewhere in the shrine": Info(767), #SEARCH_SpiritShrine_2F_GROUND_1
    "[Shrine of the Spirit] Gift from Faerie": Info(768), #SpiritShrine_2F_SUB_0_SCENE_0010_010
    # ----- Rimuldar -----
    "[Rimuldar] Barrel 1 near Equipment Shop": Info(769), #SEARCH_Rimuldar_Out_BARREL_0
    "[Rimuldar] Barrel 2 near Equipment Shop": Info(770), #SEARCH_Rimuldar_Out_BARREL_1
    "[Rimuldar] Pot near Equipment Shop": Info(771), #SEARCH_Rimuldar_Out_POT_0
    "[Rimuldar] Pot on the bottom left corner": Info(772), #SEARCH_Rimuldar_Out_POT_1
    "[Rimuldar] Pot on the bottom right corner": Info(773), #SEARCH_Rimuldar_Out_POT_2
    "[Rimuldar] Hidden Ground on the small island": Info(774), #SEARCH_Rimuldar_Out_GROUND_0
    "[Rimuldar] Hidden Ground near chair in Church's jail": Info(775, rules.HAS_ULTIMATE_KEY), #SEARCH_Rimuldar_Church_2F_GROUND_0
    "[Rimuldar] Drawer 1 in top house": Info(776), #SEARCH_Rimuldar_House1_DRAWER_0
    "[Rimuldar] Drawer 2 in top house": Info(777), #SEARCH_Rimuldar_House1_DRAWER_1
    "[Rimuldar] Pot 1 in top house": Info(778), #SEARCH_Rimuldar_House1_POT_0
    "[Rimuldar] Pot 2 in top house": Info(779), #SEARCH_Rimuldar_House1_POT_1
    "[Rimuldar] Drawer 1 in top left house": Info(780), #SEARCH_Rimuldar_House2_DRAWER_0
    "[Rimuldar] Drawer 2 in top left house": Info(781), #SEARCH_Rimuldar_House2_DRAWER_1
    "[Rimuldar] Pot in top left house": Info(782), #SEARCH_Rimuldar_House2_POT_0
    "[Rimuldar] Storage in Inn": Info(783), #SEARCH_Rimuldar_Inn_STORAGE_0
    "[Rimuldar] Chest in Inn": Info(784, rules.HAS_THIEF_KEY), #SEARCH_Rimuldar_Inn_TREASURE_IMPORTANT_1
    # ----- Quagmire Cave -----
    "[Quagmire Cave] Hidden Ground at the end of the bottom dead end": Info(785), #SEARCH_SwampCave_1F_GROUND_0
    "[Quagmire Cave] Hidden Ground in the bottom right path": Info(786), #SEARCH_SwampCave_1F_GROUND_1
    "[Quagmire Cave] Pot in small room": Info(787), #SEARCH_SwampCave_1F_POT_0
    # ----- Kol -----
    "[Kol] Hidden Ground in bottom area of hot spring": Info(789), #SEARCH_Myra_Out_EVENT_0
    "[Kol] Hidden Ground near hot spring": Info(790), #SEARCH_Myra_Out_GROUND_1
    "[Kol] Hidden Ground near the top of Kol": Info(791), #SEARCH_Myra_Out_GROUND_2
    "[Kol] Storage in left house": Info(792, rules.HAS_THIEF_KEY), #SEARCH_Myra_House_STORAGE_0
    "[Kol] Drawer in left house": Info(793, rules.HAS_THIEF_KEY), #SEARCH_Myra_House_DRAWER_0
    "[Kol] Hidden Ground in the middle of carpet in Item Shop": Info(794), #SEARCH_Myra_Shop_1F_GROUND_0
    "[Kol] Barrel in Item Shop": Info(795), #SEARCH_Myra_Shop_1F_BARREL_0
    "[Kol] Sack 1 in Item Shop": Info(796), #SEARCH_Myra_Shop_2F_SACK_0
    "[Kol] Sack 2 in Item Shop": Info(797), #SEARCH_Myra_Shop_2F_SACK_1
    "[Kol] Hidden Ground in well": Info(798), #SEARCH_Myra_Well_GROUND_0
    "[Kol] Reward from blacksmith in Item Shop after giving the Forging Hammer, Orichalcum and Broken Blade": Info(799, rules.HAS_FORGING_HAMMER & rules.HAS_ORICHALCUM & rules.HAS_BROKEN_BLADE), #Myra_Shop_2F_SUB_0_ACTOR_0120_010
    # ----- Craggy Cave -----
    "[Craggy Cave] Chest in top right area B1": Info(800), #SEARCH_RockMtCave_B1F_TREASURE_NORMAL_0
    "[Craggy Cave] Chest on the right area near stairs B1": Info(801), #SEARCH_RockMtCave_B1F_TREASURE_NORMAL_1
    "[Craggy Cave] Chest in the bottom left middle area B1": Info(802), #SEARCH_RockMtCave_B1F_TREASURE_NORMAL_2
    "[Craggy Cave] Pot near entrance B1": Info(803), #SEARCH_RockMtCave_B1F_POT_0
    "[Craggy Cave] Chest 1 at the end of the left dead end B2": Info(804), #SEARCH_RockMtCave_B2FA_TREASURE_NORMAL_0
    "[Craggy Cave] Chest 2 at the end of the left dead end B2": Info(805), #SEARCH_RockMtCave_B2FA_TREASURE_NORMAL_1
    "[Craggy Cave] Chest at the bottom right dead end B2": Info(806), #SEARCH_RockMtCave_B2FA_TREASURE_NORMAL_2
    "[Craggy Cave] Chest near the top left corner B2": Info(807), #SEARCH_RockMtCave_B2FA_TREASURE_NORMAL_3
    "[Craggy Cave] Barrel 1 in underground room B2": Info(808), #SEARCH_RockMtCave_B2FB_BARREL_0
    "[Craggy Cave] Barrel 2 in underground room B2": Info(809), #SEARCH_RockMtCave_B2FB_BARREL_1
    "[Craggy Cave] Hidden Ground at right of stairs in underground room B2": Info(810), #SEARCH_RockMtCave_B2FB_GROUND_0
    # ----- Talontear Tunnel -----
    "[Talontear Tunnel] Chest near the center B1": Info(811), #SEARCH_HeroCave_B1F_TREASURE_NORMAL_0
    "[Talontear Tunnel] Chest in the bottom left corner B1": Info(812), #SEARCH_HeroCave_B1F_TREASURE_NORMAL_1
    "[Talontear Tunnel] Chest at the right dead end B2": Info(813), #SEARCH_HeroCave_B2F_TREASURE_NORMAL_0
    "[Talontear Tunnel] Chest in the bottom left area B2": Info(814), #SEARCH_HeroCave_B2F_TREASURE_NORMAL_1
    "[Talontear Tunnel] Chest 1 in final room B3": Info(815), #SEARCH_HeroCave_B3F_TREASURE_NORMAL_0
    "[Talontear Tunnel] Chest 2 in final room B3": Info(816), #SEARCH_HeroCave_B3F_TREASURE_ENEMY_1
    "[Talontear Tunnel] Chest 3 in final room B3": Info(817), #SEARCH_HeroCave_B3F_TREASURE_NORMAL_2
    "[Talontear Tunnel] Chest 4 in final room B3": Info(818), #SEARCH_HeroCave_B3F_TREASURE_NORMAL_3
    "[Talontear Tunnel] Chest 5 in final room B3": Info(819), #SEARCH_HeroCave_B3F_TREASURE_IMPORTANT_4
    # ----- Tower of Rubiss -----
    "[Tower of Rubiss] Chest 1 in top room 1F": Info(820), #SEARCH_RubissTower_1F_TREASURE_ENEMY_0
    "[Tower of Rubiss] Chest 2 in top room 1F": Info(821), #SEARCH_RubissTower_1F_TREASURE_NORMAL_1
    "[Tower of Rubiss] Chest 1 in central room 2F": Info(822), #SEARCH_RubissTower_2F_TREASURE_NORMAL_0
    "[Tower of Rubiss] Chest 2 in central room 2F": Info(823), #SEARCH_RubissTower_2F_TREASURE_NORMAL_1
    "[Tower of Rubiss] Chest 3 in central room 2F": Info(824), #SEARCH_RubissTower_2F_TREASURE_ENEMY_2
    "[Tower of Rubiss] Chest 4 in central room 2F": Info(825), #SEARCH_RubissTower_2F_TREASURE_NORMAL_3
    "[Tower of Rubiss] Chest 5 in central room 2F": Info(826), #SEARCH_RubissTower_2F_TREASURE_NORMAL_4
    "[Tower of Rubiss] Chest 6 in central room 2F": Info(827), #SEARCH_RubissTower_2F_TREASURE_NORMAL_5
    "[Tower of Rubiss] Chest 7 in central room 2F": Info(828), #SEARCH_RubissTower_2F_TREASURE_NORMAL_6
    "[Tower of Rubiss] Chest 8 in central room 2F": Info(829), #SEARCH_RubissTower_2F_TREASURE_NORMAL_7
    "[Tower of Rubiss] Chest in top left area 3F": Info(830), #SEARCH_RubissTower_3F_TREASURE_NORMAL_0
    "[Tower of Rubiss] Hidden Ground in central area 3F": Info(831), #SEARCH_RubissTower_3F_GROUND_0
    "[Tower of Rubiss] Chest in left area 4F": Info(832), #SEARCH_RubissTower_4F_TREASURE_NORMAL_0
    "[Tower of Rubiss] Chest inside the Central Tower 4F": Info(833), #SEARCH_RubissTower_4FA_TREASURE_NORMAL_0
    "[Tower of Rubiss] Chest in right area 5F": Info(834), #SEARCH_RubissTower_5F_TREASURE_NORMAL_0
    #"[Tower of Rubiss] Event": Info(835), #SEARCH_RubissTower_5FA_EVENT_0 # no items here
    "[Tower of Rubiss] Reward from Rubiss in Central Tower after freeing her with the Faerie Flute 5F": Info(836, rules.HAS_FAERIE_FLUTE), #RubissTower_5FA_RubissStatue_00
    # ----- Zoma's Citadel -----
    "[Zoma's Citadel] Hidden Ground in throne room 1F": Info(837), #SEARCH_ZomaCastle_1F_GROUND_0
    "[Zoma's Citadel] Hidden Ground in bottom right room 1F": Info(838), #SEARCH_ZomaCastle_1F_GROUND_1
    #"[Zoma's Citadel] Event on throne": Info(839), #SEARCH_ZomaCastle_1F_EVENT_1 # no items here
    "[Zoma's Citadel] Chest in top corridor B1": Info(840), #SEARCH_ZomaCastle_B1FA_TREASURE_NORMAL_0
    "[Zoma's Citadel] Chest in top left corner B2": Info(841), #SEARCH_ZomaCastle_B2F_TREASURE_NORMAL_0
    "[Zoma's Citadel] Chest in top right corner B2": Info(842), #SEARCH_ZomaCastle_B2F_TREASURE_NORMAL_1
    "[Zoma's Citadel] Chest in bottom left corner B3": Info(843), #SEARCH_ZomaCastle_B3FA_TREASURE_NORMAL_0
    "[Zoma's Citadel] Chest at top dead end B3": Info(844), #SEARCH_ZomaCastle_B3FA_TREASURE_NORMAL_1
    "[Zoma's Citadel] Chest near left wall in hole room B3": Info(845), #SEARCH_ZomaCastle_B3FB_TREASURE_NORMAL_0
    "[Zoma's Citadel] Chest 1 in treasure room B4": Info(846, rules.HAS_THIEF_KEY), #SEARCH_ZomaCastle_B4F_TREASURE_NORMAL_0
    "[Zoma's Citadel] Chest 2 in treasure room B4": Info(847, rules.HAS_THIEF_KEY), #SEARCH_ZomaCastle_B4F_TREASURE_NORMAL_1
    "[Zoma's Citadel] Chest 3 in treasure room B4": Info(848, rules.HAS_THIEF_KEY), #SEARCH_ZomaCastle_B4F_TREASURE_NORMAL_2
    "[Zoma's Citadel] Chest 4 in treasure room B4": Info(849, rules.HAS_THIEF_KEY), #SEARCH_ZomaCastle_B4F_TREASURE_NORMAL_3
    "[Zoma's Citadel] Chest 5 in treasure room B4": Info(850, rules.HAS_THIEF_KEY), #SEARCH_ZomaCastle_B4F_TREASURE_NORMAL_4
    "[Zoma's Citadel] Chest 6 in treasure room B4": Info(851, rules.HAS_THIEF_KEY), #SEARCH_ZomaCastle_B4F_TREASURE_NORMAL_5
    # ----- ??? -----
    "[???] Chest at the end of the top left dead end in Maw of the Necrogond first area": Info(852), #SEARCH_SecretCave_B1F_TREASURE_NORMAL_0
    "[???] Chest on the left near entrance of Maw of the Necrogond first area": Info(853), #SEARCH_SecretCave_B1F_TREASURE_ENEMY_1
    "[???] Chest near water pool in the center of Maw of the Necrogond first area": Info(854), #SEARCH_SecretCave_B1F_TREASURE_NORMAL_2
    "[???] Chest near the bottom right corner of Maw of the Necrogond second area": Info(855), #SEARCH_SecretCave_B2F_TREASURE_NORMAL_0
    "[???] Chest at the top right dead end in Maw of the Necrogond second area": Info(856), #SEARCH_SecretCave_B2F_TREASURE_NORMAL_1
    "[???] Chest near the left side of Maw of the Necrogond second area": Info(857), #SEARCH_SecretCave_B2F_TREASURE_NORMAL_2
    "[???] Chest near the bottom left corner of Maw of the Necrogond second area": Info(858), #SEARCH_SecretCave_B2F_TREASURE_NORMAL_3
    "[???] Chest near the right side of the bottom stairs in Orochi's Lair area": Info(859), #SEARCH_SecretCave_B3F_TREASURE_NORMAL_0
    "[???] Chest in the top left corner of Orochi's Lair area": Info(860), #SEARCH_SecretCave_B3F_TREASURE_NORMAL_1
    "[???] Chest at the end of the middle dead end in Orochi's Lair area": Info(861), #SEARCH_SecretCave_B3F_TREASURE_NORMAL_2
    "[???] Chest at the bottom right dead end in Orochi's Lair area": Info(862), #SEARCH_SecretCave_B3F_TREASURE_NORMAL_3
    "[???] Chest at the end of the left side dead end in Pyramid area": Info(863), #SEARCH_SecretCave_B4F_TREASURE_NORMAL_0
    "[???] Hidden Ground in the central room of the Tantegel Castle area": Info(864, rules.HAS_ULTIMATE_KEY), #SEARCH_SecretCave_B5F_A_GROUND_0
    "[???] Chest in the top left side of Underground Lake area": Info(865), #SEARCH_SecretCave_B5F_B_TREASURE_NORMAL_0
    "[???] Chest in the top right side of Underground Lake area": Info(866), #SEARCH_SecretCave_B5F_B_TREASURE_NORMAL_1
    "[???] Hidden Ground in the central top jail of the Manoza Castle area": Info(867, rules.HAS_ULTIMATE_KEY), #SEARCH_SecretCave_B5F_C_GROUND_0
    "[???] Pot in the top left jail of the Manoza Castle area": Info(868, rules.HAS_ULTIMATE_KEY), #SEARCH_SecretCave_B5F_C_POT_0
    "[???] Hidden Ground 1 on the bridge in Maw of the Necrogond third area": Info(869), #SEARCH_SecretCave_B6F_GROUND_0
    "[???] Hidden Ground 2 on the bridge in Maw of the Necrogond third area": Info(870), #SEARCH_SecretCave_B6F_GROUND_1
    # ----- Cloudsgate Citadel -----
    "[Cloudsgate Citadel] Chest behind the throne": Info(871), #SEARCH_Zenis_2F_TREASURE_NORMAL_0
    #"[Cloudsgate Citadel] Event": Info(872), #SEARCH_Zenis_1F_EVENT_0 # no items here
    "[Cloudsgate Citadel] Pot 1 in lower room": Info(873), #SEARCH_Zenis_1F_POT_0
    "[Cloudsgate Citadel] Pot 2 in lower room": Info(874), #SEARCH_Zenis_1F_POT_1
    # ----- Citadel Tower -----
    "[Citadel Tower] Chest 1 in center 2F": Info(875), #SEARCH_SecretTower_1F_B_TREASURE_NORMAL_0
    "[Citadel Tower] Chest 2 in center 2F": Info(876), #SEARCH_SecretTower_1F_B_TREASURE_NORMAL_1
    "[Citadel Tower] Chest in top left room 4F": Info(877), #SEARCH_SecretTower_3F_TREASURE_NORMAL_0
    "[Citadel Tower] Chest in middle bottom corridor 4F": Info(878), #SEARCH_SecretTower_3F_TREASURE_NORMAL_1
    "[Citadel Tower] Chest at the end of bottom left dead end 4F": Info(879), #SEARCH_SecretTower_3F_TREASURE_NORMAL_2
    "[Citadel Tower] Reward for wishing to obtain a copy of Guns N' Buns from Xenlon": Info(880), #SecretTower_5F_MAIN_0_BATTLE_END_0100_010_WISH_BOOK_1
    "[Citadel Tower] Reward for wishing to obtain a copy of More Buns N' Guns from Xenlon": Info(881), #SecretTower_5F_MAIN_0_BATTLE_END_0100_010_WISH_BOOK_2
    "[Citadel Tower] Reward for wishing to obtain a Powerful Weapon from Xenlon": Info(882), #SecretTower_5F_MAIN_0_BATTLE_END_0100_010_WISH_SWORD
    # ----- Temple of Trials -----
    #"[Temple of Trials] Event": Info(886), #SEARCH_GranDragon_Entrance_EVENT_0 # no items here
    "[Temple of Trials] Hidden Ground in bottom room of Main Entrance": Info(887), #SEARCH_GranDragon_Entrance_GROUND_0
    "[Temple of Trials] Hidden Ground near the left edge in Main Entrance": Info(888), #SEARCH_GranDragon_Entrance_GROUND_1
    "[Temple of Trials] Hidden Ground on top wall near the right edge in Main Entrance": Info(889), #SEARCH_GranDragon_Entrance_GROUND_2
    "[Temple of Trials] Hidden Ground in top right room of Main Entrance": Info(890), #SEARCH_GranDragon_Entrance_GROUND_3
    "[Temple of Trials] Hidden Ground in top left room of Main Entrance": Info(891), #SEARCH_GranDragon_Entrance_GROUND_4
    "[Temple of Trials] Chest in bottom left corner of North-West Trial": Info(892), #SEARCH_GranDragon_Weapon1_TREASURE_ENEMY_0
    "[Temple of Trials] Chest in isolated bottom left room in North-West Trial": Info(893), #SEARCH_GranDragon_Weapon1_TREASURE_NORMAL_1
    "[Temple of Trials] Chest in isolated left room in North-West Trial": Info(894), #SEARCH_GranDragon_Weapon1_TREASURE_NORMAL_2
    "[Temple of Trials] Chest 1 in top right room of North-West Trial": Info(895), #SEARCH_GranDragon_Weapon1_TREASURE_NORMAL_3
    "[Temple of Trials] Chest 1 in isolated right room in North-West Trial": Info(896), #SEARCH_GranDragon_Weapon1_TREASURE_NORMAL_4
    "[Temple of Trials] Chest near bottom right corner of North-West Trial": Info(897), #SEARCH_GranDragon_Weapon1_TREASURE_NORMAL_5
    "[Temple of Trials] Chest 2 in top right room of North-West Trial": Info(898), #SEARCH_GranDragon_Weapon1_TREASURE_ENEMY_6
    "[Temple of Trials] Chest 3 in top right room of North-West Trial": Info(899), #SEARCH_GranDragon_Weapon1_TREASURE_ENEMY_7
    "[Temple of Trials] Chest 1 in top left room of North-West Trial": Info(900), #SEARCH_GranDragon_Weapon1_TREASURE_NORMAL_8
    "[Temple of Trials] Chest 2 in top left room of North-West Trial": Info(901), #SEARCH_GranDragon_Weapon1_TREASURE_ENEMY_9
    "[Temple of Trials] Chest 3 in top left room of North-West Trial": Info(902), #SEARCH_GranDragon_Weapon1_TREASURE_ENEMY_10
    "[Temple of Trials] Chest 4 in top left room of North-West Trial": Info(903), #SEARCH_GranDragon_Weapon1_TREASURE_ENEMY_11
    "[Temple of Trials] Chest in isolated right room of North-West Trial": Info(904), #SEARCH_GranDragon_Weapon1_TREASURE_NORMAL_12
    "[Temple of Trials] Chest in the center near bottom left corner of North-West Trial": Info(905), #SEARCH_GranDragon_Weapon1_TREASURE_NORMAL_13
    "[Temple of Trials] Chest 2 in isolated right room in North-West Trial": Info(906), #SEARCH_GranDragon_Weapon1_TREASURE_NORMAL_14
    "[Temple of Trials] Chest 1 near rightmost room in North-East Trial": Info(907), #SEARCH_GranDragon_Weapon2_TREASURE_NORMAL_0
    "[Temple of Trials] Chest 2 near rightmost room in North-East Trial": Info(908), #SEARCH_GranDragon_Weapon2_TREASURE_ENEMY_1
    "[Temple of Trials] Chest in leftmost room of North-East Trial": Info(909), #SEARCH_GranDragon_Weapon2_TREASURE_NORMAL_2
    "[Temple of Trials] Chest near bottom left stairs in North-East Trial": Info(910), #SEARCH_GranDragon_Weapon2_TREASURE_NORMAL_3
    "[Temple of Trials] Chest 1 in top right corner area of North-East Trial": Info(911), #SEARCH_GranDragon_Weapon2_TREASURE_ENEMY_4
    "[Temple of Trials] Chest 1 in rightmost room of North-East Trial": Info(912), #SEARCH_GranDragon_Weapon2_TREASURE_NORMAL_5
    "[Temple of Trials] Chest 2 in rightmost room of North-East Trial": Info(913), #SEARCH_GranDragon_Weapon2_TREASURE_ENEMY_6
    "[Temple of Trials] Chest 3 in rightmost room of North-East Trial": Info(914), #SEARCH_GranDragon_Weapon2_TREASURE_ENEMY_7
    "[Temple of Trials] Chest near left side of central area in North-East Trial": Info(915), #SEARCH_GranDragon_Weapon2_TREASURE_NORMAL_8
    "[Temple of Trials] Chest 2 in top right corner area of North-East Trial": Info(916), #SEARCH_GranDragon_Weapon2_TREASURE_NORMAL_9
    "[Temple of Trials] Chest 3 in top right corner area of North-East Trial": Info(917), #SEARCH_GranDragon_Weapon2_TREASURE_NORMAL_10
    "[Temple of Trials] Chest near leftmost room in North-East Trial": Info(918), #SEARCH_GranDragon_Weapon2_TREASURE_NORMAL_11
    "[Temple of Trials] Chest near top right corner area in North-East Trial": Info(919), #SEARCH_GranDragon_Weapon2_TREASURE_NORMAL_12
    "[Temple of Trials] Reward for defeating the Grand Dragon in 19 turns or less": Info(920, rules.HAS_AURORAL_HELM & rules.HAS_SWORD_OF_KINGS & rules.HAS_GRINGHAM_WHIP), #GranDragon_07_Snake_SUB_0_BATTLE_END_0010_020_MEDAL
}


LOCATION_NAME_TO_ID = {item_name: info.id for item_name, info in ALL_LOCATIONS.items()}


# Set of postgame locations that are not located in postgame regions, that needs to be excluded based on option values
specific_postgame_locations = {"[Cantlin] Hidden Ground near flowers of left house",
                               "[Lozamii] Hidden Ground near the telescope in right house",
                               "[Jipang] Pot near stairs in Monster Arena",
                               "[Jipang] Barrel on the back right side of the Monster Arena",
                               "[Theddon] Hidden Ground on the cross in the bottom right area"}


class DQ3Location(Location):
    game = "Dragon Quest III HD-2D Remake"

class DQ3LocationExcluded(DQ3Location):
    progress_type = LocationProgressType.EXCLUDED

class DQ3LocationPriority(DQ3Location):
    progress_type = LocationProgressType.PRIORITY


# Checks if postgame is enabled in the options
def is_postgame_enabled(world: DQ3World) -> bool:
    return world.options.victory_goal == "grand_dragon" or world.options.victory_goal == "medals_postgame"

# Helper method that takes a list of location names and returns them as a dict with their IDs
def get_location_names_with_ids(location_names: list[str]) -> dict[str, int | None]:
    return {location_name: LOCATION_NAME_TO_ID[location_name] for location_name in location_names}

# Helper method that returns a list of location names whose prefix exactly matches the given prefix,
# also exclude specific locations based on options values and returns them
def get_locations_by_prefix(world: DQ3World, prefix: str) -> tuple[list[str], list[str]]:
    # first, get all valid locations by prefix
    valid_locations = [location_name for location_name in LOCATION_NAME_TO_ID.keys()
                       if location_name.split("]")[0][1:] == prefix]
    # then return immediatly depending on option values and given prefix
    if is_postgame_enabled(world) or prefix not in {"Cantlin", "Lozamii", "Jipang", "Theddon"}:
        return valid_locations, []
    # or else construct what locations are excluded and return two lists
    excluded_locations = [location_name for location_name in valid_locations if location_name in specific_postgame_locations]
    valid_locations = [location_name for location_name in valid_locations if location_name not in specific_postgame_locations]
    return valid_locations, excluded_locations


def create_all_locations(world: DQ3World) -> None:
    create_regular_locations(world)
    create_events(world)


def create_regular_locations(world: DQ3World) -> None:
    # Create all locations based of region prefixes that matches said region values in ALL_REGIONS
    for region_name in regions.ALL_REGIONS:
        # Define if said region should be excluded based on option values
        valid_location_type: Location = DQ3Location if is_postgame_enabled(world) or region_name not in {"???", "Cloudsgate Citadel", "Citadel Tower", "Temple of Trials"} else DQ3LocationExcluded
        # Get region from name
        region = world.get_region(region_name)
        # Get locations from region
        valid_locations, excluded_locations = get_locations_by_prefix(world, region_name)
        # Add valid locations
        if len(valid_locations) != 0:
            region.add_locations(get_location_names_with_ids(valid_locations), valid_location_type)
        # Add excluded locations
        if len(excluded_locations) != 0:
            region.add_locations(get_location_names_with_ids(excluded_locations), DQ3LocationExcluded)


def create_events(world: DQ3World) -> None:
    pass