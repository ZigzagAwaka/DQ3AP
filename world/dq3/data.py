from __future__ import annotations
from dataclasses import dataclass

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


@dataclass
class LocationInfo:
    """Contains the parameters of a location, such as its id and rule"""
    id: int
    rule: CollectionRule | Rule[Any] | None = None


@dataclass
class ItemInfo:
    """Contains the parameters of an item, such as its id, default classification and quantity"""
    id: int
    classification: ItemClassification = ItemClassification.filler
    quantity: int = 1