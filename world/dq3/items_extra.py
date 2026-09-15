from __future__ import annotations

from BaseClasses import ItemClassification
from .data import ItemInfo as Info
from .data import ItemType as Type


# List every extra items (optional depending on options)
EXTRA_ITEMS: dict[str, Info] = {
    # GOLD
    "New item test": Info(377, type=Type.SHINY), #GOLD_31
}