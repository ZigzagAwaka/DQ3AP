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
    "[Nordy's Grotto] Chest 1 in Nordy's room": Info(193), #SEARCH_NorudCave_B1F_TREASURE_NORMAL_0
    "[Nordy's Grotto] Chest 2 in Nordy's room": Info(194), #SEARCH_NorudCave_B1F_TREASURE_NORMAL_1
    "[Nordy's Grotto] Barrel near right entrance": Info(195, rules.HAS_MISSIVE), #SEARCH_NorudCave_B1F_BARREL_1
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
    "[Asham] Bookshelf in locked room in top left house": Info(206, rules.HAS_MAGIC_KEY), #SEARCH_Ashalam_House02_2F_BOOKSHELF_0
    "[Asham] Pot in right house": Info(207), #SEARCH_Ashalam_House03_POT_0
    "[Asham] Storage in Hotel": Info(208), #SEARCH_Ashalam_Hotel_STORAGE_0
    "[Asham] Pot in Hotel": Info(209), #SEARCH_Ashalam_Hotel_POT_0
    "[Asham] Hidden Ground near bottom chair in Theather back room": Info(210, rules.HAS_MAGIC_KEY), #SEARCH_Ashalam_Theater_GROUND_0
    #"[Asham] Event": Info(211), #SEARCH_Ashalam_Theater_EVENT_0 # no items here
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
    "[Ibis] Sack in center locked house (night)": Info(223, rules.HAS_THIEF_KEY), #SEARCH_Isis_HouseB1F_SACK_0
    "[Ibis] Bookshelf in center locked house (night)": Info(224, rules.HAS_THIEF_KEY), #SEARCH_Isis_HouseB2F_BOOKSHELF_0
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
    "[Palace of Ibis] Drawer in the right room": Info(239, rules.HAS_THIEF_KEY), #SEARCH_Isis_Castle_1F_DRAWER_0
    "[Palace of Ibis] Bookshelf in the bottom right room": Info(240, rules.HAS_THIEF_KEY), #SEARCH_Isis_Castle_1F_BOOKSHELF_0
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
    "[Pyramid] Ripper of the Rift Boss Reward Chest 1": Info(264), #SEARCH_Pyramid_3F_TREASURE_NORMAL_0
    "[Pyramid] Ripper of the Rift Boss Reward Chest 2": Info(265), #SEARCH_Pyramid_3F_TREASURE_IMPORTANT_0
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
    "[Portoga] xxxxxxxxx": Info(307), #SEARCH_Portoga_Out_GROUND_2
    "[Portoga] xxxxxxxxx": Info(308), #SEARCH_Portoga_Out_EVENT_0
    "[Portoga] xxxxxxxxx": Info(309), #SEARCH_Portoga_Out_POT_0
    "[Portoga] xxxxxxxxx": Info(310), #SEARCH_Portoga_Out_POT_1
    "[Portoga] xxxxxxxxx": Info(311), #SEARCH_Portoga_Out_POT_2
    "[Portoga] xxxxxxxxx": Info(312), #SEARCH_Portoga_Out_POT_3
    "[Portoga] xxxxxxxxx": Info(313), #SEARCH_Portoga_Out_BARREL_0
    "[Portoga] xxxxxxxxx": Info(314), #SEARCH_Portoga_Out_BARREL_1
    "[Portoga] xxxxxxxxx": Info(315), #SEARCH_Portoga_Out_BARREL_2
    "[Portoga] xxxxxxxxx": Info(316), #SEARCH_Portoga_Inn_DRAWER_0
    "[Portoga] xxxxxxxxx": Info(317), #SEARCH_Portoga_Room01_1F_SACK_0
    "[Portoga] xxxxxxxxx": Info(318), #SEARCH_Portoga_Room02_B1F_POT_0
    "[Portoga] xxxxxxxxx": Info(319), #SEARCH_Portoga_Room02_B1F_BOOKSHELF_0
    # ----- Portoga Castle -----
    "[Portoga Castle] xxxxxxxxx": Info(320), #SEARCH_Portoga_Castle_1F_TREASURE_NORMAL_0
    "[Portoga Castle] xxxxxxxxx": Info(321), #SEARCH_Portoga_Castle_1F_TREASURE_NORMAL_1
    "[Portoga Castle] xxxxxxxxx": Info(322), #SEARCH_Portoga_Castle_1F_TREASURE_NORMAL_2
    "[Portoga Castle] xxxxxxxxx": Info(323), #SEARCH_Portoga_Castle_1F_DRAWER_0
    "[Portoga Castle] xxxxxxxxx": Info(324), #xxxxxxxxx
    "[Portoga Castle] xxxxxxxxx": Info(325), #xxxxxxxxx
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