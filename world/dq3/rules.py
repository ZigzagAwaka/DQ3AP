from __future__ import annotations

from typing import (Any, TYPE_CHECKING)

from rule_builder.options import OptionFilter
from rule_builder.rules import Has, HasAll, Rule

from . import locations

if TYPE_CHECKING:
    from .world import DQ3World
    from BaseClasses import CollectionRule


HAS_WRECKING_BALL = Has("Wrecking Ball")
HAS_THIEF_KEY = Has("Progressive Key", count=1)
HAS_MAGIC_KEY = Has("Progressive Key", count=2)
HAS_ULTIMATE_KEY = Has("Progressive Key", count=3)
HAS_DREAMSTONE = Has("Dreamstone")
HAS_ROYAL_MISSIVE = Has("Royal Missive")
HAS_BLACK_PEPPER = Has("Black Pepper")
HAS_SHIP = Has("Ship")
HAS_ALL_ORBS = HasAll("Green Orb", "Red Orb", "Purple Orb", "Yellow Orb", "Silver Orb", "Blue Orb")
HAS_BIRD = Has("Ramia")
BARAMOS_TMP = Has("Baramos") # TMP
RIDDLE_TMP = Has("Riddle hint") # TMP
XENION_TMP = Has("Xenion wish") # TMP


def set_all_rules(world: DQ3World) -> None:
    set_all_entrance_rules(world)
    set_all_location_rules(world)
    set_completion_condition(world)


def set_all_entrance_rules(world: DQ3World) -> None:
    # Already done in regions.connect_regions
    pass


def set_all_location_rules(world: DQ3World) -> None:
    # Create all locations rules based of Info values in ALL_LOCATIONS if a rule is specified
    for location_name, info in locations.ALL_LOCATIONS.items():
        if info.rule is not None:
            world.set_rule(world.get_location(location_name), info.rule)


def set_completion_condition(world: DQ3World) -> None:
    pass