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
    ],
    "Reeve": [],
    "Shrine of the Plains": [
        Connect("Dreamer's Tower"),
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
    ],
    "Northwest Overworld": [
        Connect("Romaria"),
        Connect("Romarian Road"),
        Connect("Romarian Outpost"),
        Connect("Khoryv"),
        Connect("Norvik"),
        Connect("Faerie Village"),
        Connect("Underground Lake"),
        Connect("Skyfell Tower"),
        Connect("Great Desert Overworld"),
    ],
    "Romaria": [
        Connect("Romaria Castle"),
    ],
    "Romaria Castle": [],
    "Romarian Road": [],
    "Romarian Outpost": [
        Connect("Portoga Overworld", rules.HAS_MAGIC_KEY),
        Connect("Teleportal Shrine", rules.HAS_ULTIMATE_KEY | rules.HAS_SHIP),
    ],
    "Khoryv": [],
    "Norvik": [],
    "Faerie Village": [],
    "Underground Lake": [],
    "Skyfell Tower": [],
    # GREAT DESERT
    "Great Desert Overworld": [
        Connect("Nordy's Grotto", rules.HAS_THIEF_KEY),
        Connect("Asham"),
        Connect("Desert Shrine"),
        Connect("Ibis"),
        Connect("Pyramid"),
    ],
    "Nordy's Grotto": [
        Connect("Center Overworld", rules.HAS_ROYAL_MISSIVE | rules.HAS_ULTIMATE_KEY | rules.HAS_SHIP)
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
        Connect("Portoga"),
        Connect("Aliahan Overworld", rules.HAS_SHIP),
        Connect("Northwest Overworld", rules.HAS_SHIP),
        Connect("Great Desert Overworld", rules.HAS_SHIP),
        Connect("Center Overworld", rules.HAS_SHIP),
    ],
    "Portoga": [
        Connect("Portoga Castle"),
    ],
    "Portoga Castle": [],
    # CENTER
    "Center Overworld": [
        Connect("Olivia's Promontory"),
        Connect("Baharata"),
    ],
    "Olivia's Promontory": [
        Connect("Teleportal Shrine", rules.HAS_ULTIMATE_KEY),
        Connect("Wayfarer's Chapel", rules.HAS_ULTIMATE_KEY),
    ],
    "Baharata": [],

    # WIP
    "Teleportal Shrine": [],
    "Wayfarer's Chapel": [
        Connect("Teleportal Shrine", rules.HAS_ULTIMATE_KEY),
    ],
    "North Overworld?": [
        Connect("Teleportal Shrine", rules.HAS_SHIP),
    ],
    "Southeast Overworld?": [
        Connect("Wayfarer's Chapel"), #rules?
    ],
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
