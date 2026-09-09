from __future__ import annotations

from typing import (Any, TYPE_CHECKING)

from rule_builder.options import OptionFilter
from rule_builder.rules import Has, HasAll, Rule

from . import locations
from .options import ShipSettings, RamiaSettings, RainbowDropShuffle

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
HAS_ALL_ORBS = HasAll("Green Orb", "Red Orb", "Purple Orb", "Yellow Orb", "Silver Orb", "Blue Orb")
HAS_SHIP = Has("Ship")
HAS_BIRD = Has("Ramia")
HAS_MOD_ROD = Has("Mod Rod")
HAS_BOATMANS_BONE = Has("Boatman's Bone")
HAS_RAS_MIRROR = Has("Ra's Mirror")
HAS_BOTTOMLESS_POT = Has("Bottomless Pot")
HAS_LOVERS_LOCKET = Has("Lovers' Locket")
HAS_MOUNTAINCLEAVER = Has("Mountaincleaver")
HAS_SPHERE_OF_LIGHT = Has("Sphere of Light")
HAS_WRECKING_BALL_2 = Has("Wrecking Ball", count=2)
HAS_ZENITHIUM = Has("Zenithium")
HAS_ORTEGAS_HELM = Has("Ortega's Helm")
HAS_ORICHALCUM = Has("Orichalcum")
HAS_BROKEN_BLADE = Has("Broken Blade")
HAS_FORGING_HAMMER = Has("Forging Hammer")
HAS_FAERIE_FLUTE = Has("Faerie Flute")
HAS_SACRED_AMULET = Has("Sacred Amulet")
HAS_STAFF_OF_RAIN = Has("Staff of Rain")
HAS_SUNSTONE = Has("Sunstone")
HAS_RAINBOW_DROP = Has("Rainbow Drop")
HAS_SWORD_OF_KINGS = Has("Sword of Kings")
HAS_AURORAL_HELM = Has("Auroral Helm")
HAS_GRINGHAM_WHIP = Has("Gringham Whip")
#HAS_MOD_ROD_2 = Has("") #non randomized, wip
HAS_ALL_MEDALS = Has("Mini Medal", count=110)

CAN_ACCESS_ZOMA = HAS_BIRD & HAS_SPHERE_OF_LIGHT & HAS_SHIP & HAS_RAINBOW_DROP & HAS_THIEF_KEY
CAN_ACCESS_GRAND_DRAGON = CAN_ACCESS_ZOMA & HAS_MAGIC_KEY & HAS_ULTIMATE_KEY & HAS_AURORAL_HELM & HAS_SWORD_OF_KINGS & HAS_GRINGHAM_WHIP


def set_all_rules(world: DQ3World) -> None:
    set_all_entrance_rules(world)
    set_all_location_rules(world)
    set_completion_condition(world)


def set_all_entrance_rules(world: DQ3World) -> None:
    # Already done in regions.connect_regions
    pass


def set_all_location_rules(world: DQ3World) -> None:
    _, completion_event_name, _ = get_completion_event_parameters(world)
    # Create all registered locations rules based of Info values in ALL_LOCATIONS if a rule is specified
    for location in world.get_locations():
        if location.name != completion_event_name:
            rule = locations.ALL_LOCATIONS[location.name].rule
            if rule is not None:
                world.set_rule(world.get_location(location.name), rule)


# Helper method that returns the current completion event region, name and rule based on option values
def get_completion_event_parameters(world: DQ3World) -> tuple[str, str, CollectionRule | Rule[Any] | None]:
    if world.options.victory_goal == "zoma":
        return "Zoma's Citadel", "[Zoma's Citadel] Zoma defeated", CAN_ACCESS_ZOMA
    elif world.options.victory_goal == "grand_dragon":
        return "Temple of Trials", "[Temple of Trials] Grand Dragon defeated", CAN_ACCESS_GRAND_DRAGON
    elif world.options.victory_goal == "baramos":
        return "Baramos' Lair", "[Baramos' Lair] Baramos defeated", HAS_BIRD
    elif world.options.victory_goal == "medals" or world.options.victory_goal == "medals_postgame":
        return "Aliahan", "All medals collected", HAS_ALL_MEDALS
    return "Aliahan", "Unknown victory", CAN_ACCESS_ZOMA

def set_completion_condition(world: DQ3World) -> None:
    _, completion_event_name, completion_event_rule = get_completion_event_parameters(world)
    world.set_rule(world.get_location(completion_event_name), completion_event_rule)
    world.set_completion_rule(Has("Victory"))