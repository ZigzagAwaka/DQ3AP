from __future__ import annotations

from . import rules
from .data import LocationInfo as Info
from .data import LocationType as Type


# List every extra locations (optional depending on options)
EXTRA_LOCATIONS: dict[str, Info] = {
    # ///////////////////////// SHINY SPOTS /////////////////////////
    # ----- Aliahan Overworld -----
    # 001 002 003 004 005 006 007 008 009 010 141
    "[Aliahan Overworld] Shiny Spot near Aliahan: Item 1": Info(1123, type=Type.SHINY), #SHINE_SEARCH_FG000_1
    "[Aliahan Overworld] Shiny Spot near Aliahan: Item 2": Info(1124, type=Type.SHINY_MAX), #SHINE_SEARCH_FG000_2
    "[Aliahan Overworld] Shiny Spot near Aliahan: Item 3": Info(1125, type=Type.SHINY_MAX), #SHINE_SEARCH_FG000_3
    "[Aliahan Overworld] Shiny Spot south-west of Aliahan: Item 1": Info(1126, type=Type.SHINY), #SHINE_SEARCH_FG114_1
    "[Aliahan Overworld] Shiny Spot south-west of Aliahan: Item 2": Info(1127, type=Type.SHINY_MAX), #SHINE_SEARCH_FG114_2
    "[Aliahan Overworld] Shiny Spot south of Shrine of the Plains: Item 1": Info(1128, type=Type.SHINY), #SHINE_SEARCH_FG001_1
    "[Aliahan Overworld] Shiny Spot south of Shrine of the Plains: Item 2": Info(1129, type=Type.SHINY_MAX), #SHINE_SEARCH_FG001_2
    "[Aliahan Overworld] Shiny Spot south of Shrine of the Plains: Item 3": Info(1130, type=Type.SHINY_MAX), #SHINE_SEARCH_FG001_3
    "[Aliahan Overworld] Shiny Spot north of Promontory Passage: Item 1": Info(1131, type=Type.SHINY), #SHINE_SEARCH_FG120_1
    "[Aliahan Overworld] Shiny Spot north of Promontory Passage: Item 2": Info(1132, type=Type.SHINY_MAX), #SHINE_SEARCH_FG120_2
    "[Aliahan Overworld] Shiny Spot north of Promontory Passage: Item 3": Info(1133, type=Type.SHINY_MAX), #SHINE_SEARCH_FG120_3
    "[Aliahan Overworld] Shiny Spot north-west of Promontory Passage: Item 1": Info(1134, type=Type.SHINY), #SHINE_SEARCH_FG115_1
    "[Aliahan Overworld] Shiny Spot north-west of Promontory Passage: Item 2": Info(1135, type=Type.SHINY_MAX), #SHINE_SEARCH_FG115_2
    "[Aliahan Overworld] Shiny Spot north-west of Promontory Passage: Item 3": Info(1136, type=Type.SHINY_MAX), #SHINE_SEARCH_FG115_3
    "[Aliahan Overworld] Shiny Spot on the west coast of the mountain west of Aliahan: Item 1": Info(1137, type=Type.SHINY), #SHINE_SEARCH_FG116_1
    "[Aliahan Overworld] Shiny Spot on the west coast of the mountain west of Aliahan: Item 2": Info(1138, type=Type.SHINY_MAX), #SHINE_SEARCH_FG116_2
    "[Aliahan Overworld] Shiny Spot on the west coast of the mountain west of Aliahan: Item 3": Info(1139, type=Type.SHINY_MAX), #SHINE_SEARCH_FG116_3
    "[Aliahan Overworld] Shiny Spot south-west of Reeve: Item 1": Info(1140, type=Type.SHINY), #SHINE_SEARCH_FG117_1
    "[Aliahan Overworld] Shiny Spot south-west of Reeve: Item 2": Info(1141, type=Type.SHINY_MAX), #SHINE_SEARCH_FG117_2
    "[Aliahan Overworld] Shiny Spot south-west of Reeve: Item 3": Info(1142, type=Type.SHINY_MAX), #SHINE_SEARCH_FG117_3
    "[Aliahan Overworld] Shiny Spot east of Reeve: Item 1": Info(1143, type=Type.SHINY), #SHINE_SEARCH_FG118_1
    "[Aliahan Overworld] Shiny Spot east of Reeve: Item 2": Info(1144, type=Type.SHINY_MAX), #SHINE_SEARCH_FG118_2
    "[Aliahan Overworld] Shiny Spot near the river north-west of Little Shrine: Item 1": Info(1145, type=Type.SHINY), #SHINE_SEARCH_FG003_1
    "[Aliahan Overworld] Shiny Spot near the river north-west of Little Shrine: Item 2": Info(1146, type=Type.SHINY_MAX), #SHINE_SEARCH_FG003_2
    "[Aliahan Overworld] Shiny Spot near the river north-west of Little Shrine: Item 3": Info(1147, type=Type.SHINY_MAX), #SHINE_SEARCH_FG003_3
    "[Aliahan Overworld] Shiny Spot near Little Shrine: Item 1": Info(1148, type=Type.SHINY), #SHINE_SEARCH_FG119_1
    "[Aliahan Overworld] Shiny Spot near Little Shrine: Item 2": Info(1149, type=Type.SHINY_MAX), #SHINE_SEARCH_FG119_2
    "[Aliahan Overworld] Shiny Spot on a small coast north of Path of Promise: Item 1": Info(1150, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG002_1
    "[Aliahan Overworld] Shiny Spot on a small coast north of Path of Promise: Item 2": Info(1151, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG002_2
    "[Aliahan Overworld] Shiny Spot on a small coast north of Path of Promise: Item 3": Info(1152, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG002_3
    # ----- Northwest Overworld -----
    # 
    # ----- Great Desert Overworld -----
    # 
    # ----- Portoga Overworld -----
    # 
    # ----- Central Overworld -----
    # 
    # ----- Eastern Overworld -----
    # 
    # ----- Southern Mountains Overworld -----
    # 
    # ----- Manoza Overworld -----
    # 
    # ----- Ocean Overworld -----
    # 
    # ----- Alefgard Overworld -----
    # 
}