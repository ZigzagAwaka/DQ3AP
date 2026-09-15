from __future__ import annotations

from BaseClasses import ItemClassification
from .data import ItemInfo as Info
from .data import ItemType as Type


# List every extra items (optional depending on options)
EXTRA_ITEMS: dict[str, Info] = {
    # SHINY SPOTS EXCLUSIVE ITEMS GENERATED FROM THE FILLER LIST
    "x2 Holy Waters": Info(377, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_HOLY_WATER
    "x3 Dazzle-me-nots": Info(378, type=Type.SHINY), #MULTIPLE_3_ITEM_USE_ITEM_DEDAZZLE_GRASS
    "x2 Medicinal Herbs": Info(379, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_MEDICAL_HERB
    "x2 Seeds of Luck": Info(380, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_SEED_OF_LUCK
    "350 Gold": Info(381), #GOLD_350
}