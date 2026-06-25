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
    "Aliahan": [
        Connect("Aliahan Continent"),
        Connect("Aliahan Castle"),
    ],
    "Aliahan Castle": [
        Connect("Dreamer's Tower", rules.HAS_THIEF_KEY),
    ],
    "Aliahan Continent": [
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
    "Shrine of Promise": [
        Connect("Overworld"),
    ],
    "Overworld": [],
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
