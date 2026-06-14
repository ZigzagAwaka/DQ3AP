from __future__ import annotations

from typing import TYPE_CHECKING

from BaseClasses import Entrance, Region

if TYPE_CHECKING:
    from .world import DQ3World

# A region is a container for locations ("checks"), which connects to other regions via "Entrance" objects

def create_and_connect_regions(world: DQ3World) -> None:
    create_all_regions(world)
    connect_regions(world)


def create_all_regions(world: DQ3World) -> None:
    def region(name: str) -> Region:
        return Region(name, world.player, world.multiworld)
    
    aliahan = region("Aliahan")
    overworld = region("Overworld")

    regions = [aliahan, overworld]

    # Add all regions to multiworld.regions so that AP knows about their existence
    world.multiworld.regions += regions


def connect_regions(world: DQ3World) -> None:
    aliahan = world.get_region("Aliahan")
    overworld = world.get_region("Overworld")

    aliahan.connect(overworld, "Aliahan to Overworld")
