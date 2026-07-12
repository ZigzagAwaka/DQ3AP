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
    world.set_completion_rule(HAS_BIRD & HAS_SPHERE_OF_LIGHT & HAS_SHIP & HAS_RAINBOW_DROP & HAS_THIEF_KEY)
    
    # postgame completion rule
    #world.set_completion_rule(HAS_BIRD & HAS_SPHERE_OF_LIGHT & HAS_SHIP & HAS_RAINBOW_DROP & HAS_THIEF_KEY & HAS_MAGIC_KEY & HAS_ULTIMATE_KEY & HAS_AURORAL_HELM & HAS_SWORD_OF_KINGS & HAS_GRINGHAM_WHIP)