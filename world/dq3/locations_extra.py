from __future__ import annotations

from . import rules
from .data import LocationInfo as Info
from .data import LocationType as Type


# List every extra locations (optional depending on options)
EXTRA_LOCATIONS: dict[str, Info] = {
    # ///////////////////////// SHINY SPOTS /////////////////////////
    # ----- Aliahan Overworld -----
    "[Aliahan Overworld] New extra loc": Info(1123, type=Type.SHINY), #SEARCH_Aliahan_Out_BARREL_0
    # ----- Northwest Overworld -----
    # ----- Great Desert Overworld -----
    # ----- Portoga Overworld -----
    # ----- Central Overworld -----
    # ----- Eastern Overworld -----
    # ----- Southern Mountains Overworld -----
    # ----- Manoza Overworld -----
    # ----- Ocean Overworld -----
    # ----- Alefgard Overworld -----
}