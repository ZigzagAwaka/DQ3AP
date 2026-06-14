from collections.abc import Mapping
from typing import Any

# Import base Archipelago modules
from worlds.AutoWorld import World

# Import local files
from . import items, locations, regions, rules
from . import options as dq3_options


# Main Apworld class
class DQ3World(World):
    """
    Dragon Quest III HD-2D Remake is a recreation of the classic 8-bit RPG and the starting point of the Elric trilogy.
    """

    game = "Dragon Quest III HD-2D Remake"

    web = dq3_options.DQ3WebWorld() #not used

    # Associate options
    options_dataclass = dq3_options.DQ3Options
    options: dq3_options.DQ3Options

    # Locations and items name to ID mappings
    location_name_to_id = locations.LOCATION_NAME_TO_ID
    item_name_to_id = items.ITEM_NAME_TO_ID

    # The starting region of the game
    origin_region_name = "Aliahan"

    # Below are the useful functions that the generator will call to create the world

    def create_regions(self) -> None:
        regions.create_and_connect_regions(self)
        locations.create_all_locations(self)

    def set_rules(self) -> None:
        rules.set_all_rules(self)

    def create_items(self) -> None:
        items.create_all_items(self)

    def create_item(self, name: str) -> items.DQ3Item:
        return items.create_item_with_correct_classification(self, name)
    
    def get_filler_item_name(self) -> str:
        return items.get_random_filler_item_name(self)
    
    def fill_slot_data(self) -> Mapping[str, Any]:
        return self.options.as_dict(
            "container_sanity",
        )