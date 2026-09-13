from __future__ import annotations
from dataclasses import dataclass

from enum import IntEnum, IntFlag
from typing import (Any, TYPE_CHECKING)

from rule_builder.rules import Rule
from BaseClasses import ItemClassification

if TYPE_CHECKING:
    from BaseClasses import CollectionRule


@dataclass
class RegionConnect:
    """Describe how a region connect to another region with the specified rule"""
    name: str
    rule: CollectionRule | Rule[Any] | None = None


class LocationType(IntEnum):
    """A possible location type, either normal if always present or another type if it is optional"""
    DEFAULT = 1 # always present in locations list
    SHINY = 2 # only present in the list if shiny spots are randomized to 1
    SHINY_MAX = 3 # only present in the list if shiny spots are randomized to max


@dataclass
class LocationInfo:
    """Contains the parameters of a location, such as its id, rule and type"""
    id: int
    rule: CollectionRule | Rule[Any] | None = None
    type: LocationType = LocationType.DEFAULT


class ItemType(IntEnum):
    """A possible item type, either normal if always present or another type if it is optional"""
    DEFAULT = 1 # always in the itempool
    SHINY = 2 # never in the itempool but can be randomly generated from the filler list


@dataclass
class ItemInfo:
    """Contains the parameters of an item, such as its id, default classification and quantities"""
    id: int
    classification: ItemClassification = ItemClassification.filler
    quantity: int = 1
    shiny_quantity: int = 0
    type: ItemType = ItemType.DEFAULT