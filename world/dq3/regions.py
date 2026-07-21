from __future__ import annotations
from dataclasses import dataclass

from typing import (Any, TYPE_CHECKING)

from BaseClasses import Entrance, Region
from rule_builder.rules import Rule

from . import rules

if TYPE_CHECKING:
    from .world import DQ3World
    from BaseClasses import CollectionRule


# Describe possible region connections
@dataclass
class Connect:
    name: str
    rule: CollectionRule | Rule[Any] | None = None


# A region is a container for locations ("checks"), which connects to other regions via "Entrance" objects
# Every region can connect to other regions with an optional connection rule if needed
ALL_REGIONS: dict[str, list[Connect]] = {
    # ALIAHAN
    "Aliahan": [
        Connect("Aliahan Overworld"),
        Connect("Aliahan Castle"),
    ],
    "Aliahan Castle": [
        Connect("Dreamer's Tower", rules.HAS_THIEF_KEY),
    ],
    "Aliahan Overworld": [
        Connect("Reeve"),
        Connect("Shrine of the Plains"),
        Connect("Promontory Passage"),
        Connect("Little Shrine", rules.HAS_THIEF_KEY),
        Connect("Path of Promise", rules.HAS_WRECKING_BALL),
        Connect("Northwest Overworld", rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Great Desert Overworld", rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Portoga Overworld", rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Central Overworld", rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Eastern Overworld", rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Southern Mountains Overworld", rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Manoza Overworld", rules.HAS_BIRD),
        Connect("Ocean Overworld", rules.HAS_SHIP | rules.HAS_BIRD),
    ],
    "Reeve": [],
    "Shrine of the Plains": [
        Connect("Dreamer's Tower"),
        Connect("Portoga Lighthouse", rules.HAS_ULTIMATE_KEY),
    ],
    "Promontory Passage": [
        Connect("Dreamer's Tower"),
    ],
    "Dreamer's Tower": [],
    "Little Shrine": [],
    "Path of Promise": [
        Connect("Shrine of Promise", rules.HAS_THIEF_KEY),
    ],
    # NORTHWEST
    "Shrine of Promise": [
        Connect("Northwest Overworld"),
        Connect("Path of Promise", rules.HAS_THIEF_KEY),
    ],
    "Northwest Overworld": [
        Connect("Shrine of Promise"),
        Connect("Romaria"),
        Connect("Romarian Road"),
        Connect("Romarian Outpost"),
        Connect("Khoryv"),
        Connect("Norvik"),
        Connect("Faerie Village"),
        Connect("Underground Lake"),
        Connect("Skyfell Tower"),
        Connect("Great Desert Overworld"),
        Connect("Edina Castle", rules.HAS_SHIP | rules.HAS_BIRD),
    ],
    "Romaria": [
        Connect("Romaria Castle"),
    ],
    "Romaria Castle": [],
    "Romarian Road": [],
    "Romarian Outpost": [
        Connect("Northwest Overworld"),
        Connect("Portoga Overworld", rules.HAS_MAGIC_KEY),
        Connect("Teleportal Shrine", rules.HAS_ULTIMATE_KEY | rules.HAS_SHIP | rules.HAS_BIRD),
    ],
    "Khoryv": [],
    "Norvik": [],
    "Faerie Village": [],
    "Underground Lake": [],
    "Skyfell Tower": [],
    "Edina Castle": [],
    # GREAT DESERT
    "Great Desert Overworld": [
        Connect("Nordy's Grotto", rules.HAS_THIEF_KEY),
        Connect("Asham"),
        Connect("Desert Shrine"),
        Connect("Ibis"),
        Connect("Pyramid"),
    ],
    "Nordy's Grotto": [
        Connect("Central Overworld", rules.HAS_ROYAL_MISSIVE | rules.HAS_ULTIMATE_KEY | rules.HAS_SHIP | rules.HAS_BIRD)
    ],
    "Asham": [],
    "Desert Shrine": [],
    "Ibis": [
        Connect("Palace of Ibis"),
    ],
    "Palace of Ibis": [],
    "Pyramid": [],
    # PORTOGA
    "Portoga Overworld": [
        Connect("Romarian Outpost", rules.HAS_MAGIC_KEY),
        Connect("Portoga"),
        Connect("Portoga Lighthouse", rules.HAS_SHIP | rules.HAS_BIRD),
    ],
    "Portoga": [
        Connect("Portoga Castle"),
    ],
    "Portoga Castle": [],
    "Portoga Lighthouse": [
        Connect("Portoga Overworld", rules.HAS_SHIP | rules.HAS_BIRD),
    ],
    # CENTRAL
    "Central Overworld": [
        Connect("Nordy's Grotto"),
        Connect("Olivia's Promontory"),
        Connect("Baharata"),
        Connect("Kidnapper's Cave"),
        Connect("Alltrades Abbey"),
        Connect("Wayfarer's Inn", rules.HAS_THIEF_KEY),
        Connect("Mur"),
        Connect("Tower of Transcendence"),
        Connect("Shrine of the Dwarf", rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Jipang", rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Orochi's Lair", rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Castle of the Dragon Queen", rules.HAS_BIRD & rules.HAS_MAGIC_KEY),
    ],
    "Olivia's Promontory": [
        Connect("Teleportal Shrine", rules.HAS_ULTIMATE_KEY),
        Connect("Wayfarer's Chapel", rules.HAS_ULTIMATE_KEY),
        Connect("Central Overworld"),
    ],
    "Baharata": [],
    "Kidnapper's Cave": [],
    "Alltrades Abbey": [],
    "Wayfarer's Inn": [
        Connect("Wayfarer's Shrine", rules.HAS_ULTIMATE_KEY),
        Connect("Central Overworld"),
    ],
    "Mur": [],
    "Tower of Transcendence": [],
    "Shrine of the Dwarf": [],
    "Jipang": [
        Connect("Pimiko's Palace"),
    ],
    "Pimiko's Palace": [],
    "Orochi's Lair": [],
    "Castle of the Dragon Queen": [
        Connect("???", rules.CAN_ACCESS_ZOMA),
    ],
    "???": [
        Connect("Cloudsgate Citadel", rules.HAS_ULTIMATE_KEY),
    ],
    "Cloudsgate Citadel": [
        Connect("Citadel Tower"),
    ],
    "Citadel Tower": [],
    # EASTERN
    "Eastern Overworld": [
        Connect("Teleportal Shrine", rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Persistence", rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Spirit Spring"),
        Connect("Fifer's Spire", rules.HAS_THIEF_KEY),
        Connect("Merchantburg", rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Pirates' Den"),
    ],
    "Teleportal Shrine": [
        Connect("Wayfarer's Chapel", rules.HAS_ULTIMATE_KEY),
        Connect("Olivia's Promontory", rules.HAS_ULTIMATE_KEY),
        Connect("Romarian Outpost", rules.HAS_ULTIMATE_KEY | rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Eastern Overworld", rules.HAS_SHIP | rules.HAS_BIRD),
    ],
    "Persistence": [],
    "Spirit Spring": [],
    "Fifer's Spire": [],
    "Merchantburg": [],
    "Pirates' Den": [],
    # SOUTHERN MOUNTAINS
    "Southern Mountains Overworld": [
        Connect("Wayfarer's Shrine"),
        Connect("Theddon"),
        Connect("Mt. Necrogond", rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Maw of the Necrogond", (rules.HAS_SHIP & rules.HAS_MOUNTAINCLEAVER) | rules.HAS_BIRD),
        Connect("Necrogond Shrine", (rules.HAS_SHIP & rules.HAS_MOUNTAINCLEAVER) | rules.HAS_BIRD),
        Connect("Pit of Giaga", rules.HAS_BIRD),
        Connect("Baramos' Lair", rules.HAS_BIRD),
    ],
    "Wayfarer's Shrine": [
        Connect("Wayfarer's Inn", rules.HAS_ULTIMATE_KEY),
    ],
    "Theddon": [],
    "Mt. Necrogond": [],
    "Maw of the Necrogond": [],
    "Necrogond Shrine": [],
    "Pit of Giaga": [
        Connect("West Tantegel Harbour", rules.HAS_BIRD & rules.HAS_SPHERE_OF_LIGHT),
    ],
    "Baramos' Lair": [],
    # MANOZA
    "Wayfarer's Chapel": [
        Connect("Teleportal Shrine", rules.HAS_ULTIMATE_KEY),
        Connect("Olivia's Promontory", rules.HAS_ULTIMATE_KEY),
        Connect("Manoza Overworld"),
    ],
    "Manoza Overworld": [
        Connect("Wayfarer's Chapel"),
        Connect("Manoza"),
        Connect("Manoza Cave"),
    ],
    "Manoza": [
        Connect("Manoza Castle"),
    ],
    "Manoza Castle": [],
    "Manoza Cave": [],
    # OCEAN
    "Ocean Overworld": [
        Connect("Shrine of the Everbird", rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Grimland", rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Lozamii", rules.HAS_SHIP),
        Connect("Lanson", rules.HAS_SHIP | rules.HAS_BIRD),
        Connect("Gaia's Navel", rules.HAS_BIRD),
        Connect("Shallows Shrine", rules.HAS_SHIP & rules.HAS_BOTTOMLESS_POT),
        Connect("Ghost Ship", rules.HAS_SHIP & rules.HAS_BOATMANS_BONE),
        Connect("Shrine of Shackles", ((rules.HAS_SHIP & rules.HAS_LOVERS_LOCKET) | rules.HAS_BIRD) & rules.HAS_ULTIMATE_KEY),
        Connect("Temple of Trials", rules.HAS_BIRD & rules.HAS_SPHERE_OF_LIGHT & rules.HAS_SHIP & rules.HAS_RAINBOW_DROP & rules.HAS_THIEF_KEY & rules.HAS_MAGIC_KEY & rules.HAS_ULTIMATE_KEY),
    ],
    "Shrine of the Everbird": [],
    "Grimland": [],
    "Lozamii": [],
    "Lanson": [
        Connect("Gaia's Navel", rules.HAS_ULTIMATE_KEY),
    ],
    "Gaia's Navel": [],
    "Shallows Shrine": [],
    "Ghost Ship": [],
    "Shrine of Shackles": [],
    "Temple of Trials": [],
    # ALEFGARD
    "West Tantegel Harbour": [
        Connect("Alefgard Overworld", rules.HAS_SHIP),
    ],
    "Alefgard Overworld": [
        Connect("Tantegel"),
        Connect("Galen's House"),
        Connect("Talontear Tunnel"),
        Connect("Tower of Rubiss", rules.HAS_SHIP & rules.HAS_THIEF_KEY),
        Connect("Kol", rules.HAS_SHIP),
        Connect("Quagmire Cave", rules.HAS_SHIP),
        Connect("Craggy Cave"),
        Connect("Damdara"),
        Connect("Sanctum", rules.HAS_SHIP),
        Connect("Cantlin"),
        Connect("Shrine of the Spirit"),
        Connect("Rimuldar"),
        Connect("Zoma's Citadel", rules.HAS_RAINBOW_DROP & rules.HAS_THIEF_KEY),
    ],
    "Tantegel": [
        Connect("Tantegel Castle"),
    ],
    "Tantegel Castle": [],
    "Galen's House": [],
    "Talontear Tunnel": [],
    "Tower of Rubiss": [],
    "Kol": [],
    "Quagmire Cave": [],
    "Craggy Cave": [],
    "Damdara": [],
    "Sanctum": [],
    "Cantlin": [],
    "Shrine of the Spirit": [],
    "Rimuldar": [],
    "Zoma's Citadel": [],
}


def create_and_connect_regions(world: DQ3World) -> None:
    create_all_regions(world)
    connect_regions(world)


def create_all_regions(world: DQ3World) -> None:
    regions: list[Region] = []

    # Create all regions here
    for region_name in ALL_REGIONS:
        regions.append(Region(region_name, world.player, world.multiworld))

    # Add all regions to multiworld.regions so that AP knows about their existence
    world.multiworld.regions += regions


def connect_regions(world: DQ3World) -> None:
    # Create all connections based of Connect values in ALL_REGIONS with specified rule if any
    for region_name, connections in ALL_REGIONS.items():

        if len(connections) != 0:
            region = world.get_region(region_name)

            # Connect every connections of the given region
            for connection in connections:
                region.connect(world.get_region(connection.name), region_name + " to " + connection.name, connection.rule)
