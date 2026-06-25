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
    "[Path of Promise] Chest in the bottom B3 Hole": Info(91), #SEARCH_IzanaiCave_B3FB_TREASURE_NORMAL_0
    "[Path of Promise] Pot 1 in the top left B3 Hole": Info(92), #SEARCH_IzanaiCave_B3FB_POT_0
    "[Path of Promise] Pot 2 in the top right B3 Hole": Info(93), #SEARCH_IzanaiCave_B3FB_POT_1
    # ----- Shrine of Promise -----
    "[Shrine of Promise] Hidden Ground in the bottom left corner": Info(94), #SEARCH_IzanaiShrine_1F_GROUND_0
    "[Shrine of Promise] Pot near stairs": Info(95), #SEARCH_IzanaiShrine_1F_POT_0
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