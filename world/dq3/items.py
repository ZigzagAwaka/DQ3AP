from __future__ import annotations

from typing import TYPE_CHECKING

from BaseClasses import Item, ItemClassification

if TYPE_CHECKING:
    from .world import DQ3World


# Every item must have a unique integer ID associated with it,
# as well as a default classification and default quantity
# format: "item name": (id, classification, quantity)
ALL_ITEMS = {
    # GOLD
    "31 Gold": (2, ItemClassification.filler, 1),
    "50 Gold": (8, ItemClassification.filler, 1),
    "12 Gold": (12, ItemClassification.filler, 1),
    "6 Gold": (14, ItemClassification.filler, 2),
    "9 Gold": (17, ItemClassification.filler, 1),
    "7 Gold": (25, ItemClassification.filler, 1),
    "26 Gold": (28, ItemClassification.filler, 1),
    "500 Gold": (31, ItemClassification.filler, 1),
    # USABLE ITEMS
    "Holy Water": (1, ItemClassification.filler, 2),
    "Chimera Wing": (3, ItemClassification.filler, 2),
    "Medical Herb": (4, ItemClassification.filler, 7),
    "Antidotal Herb": (6, ItemClassification.filler, 2),
    "Magic Water": (10, ItemClassification.filler, 1),
    "Whispering Nectar": (16, ItemClassification.filler, 1),
    "Pouch of Musk": (23, ItemClassification.filler, 1),
    "Strong Medicine": (32, ItemClassification.filler, 1),
    "Seed of Strength": (9, ItemClassification.useful, 3),
    "Seed of Life": (15, ItemClassification.useful, 1),
    "Seed of Agility": (19, ItemClassification.useful, 1),
    "Seed of Magic": (24, ItemClassification.useful, 1),
    "Seed of Protection": (33, ItemClassification.useful, 1),
    # MEDAL
    "Mini Medal": (11, ItemClassification.useful, 2), #progression?
    # WEAPONS
    "Rune Staff": (18, ItemClassification.filler, 1),
    # SHIELDS
    "Pot Lid": (27, ItemClassification.filler, 1),
    # EQUIPMENT HELMETS
    "Leather Hat": (13, ItemClassification.filler, 1),
    # EQUIPMENT ARMORS
    "Training Togs": (5, ItemClassification.filler, 1),
    "Wayfarer's Clothes": (29, ItemClassification.filler, 1),
    # EQUIPMENT ACCESSORIES
    "Dragon Scales": (7, ItemClassification.filler, 1),
    "Wind Earrings": (20, ItemClassification.filler, 1),
    "Ring of Reason": (21, ItemClassification.filler, 1),
    "Mighty Armlet": (22, ItemClassification.filler, 1),
    "Alarm Ring": (26, ItemClassification.filler, 1),
}


ITEM_NAME_TO_ID = {item_name: item_id for item_name, (item_id, classification, quantity) in ALL_ITEMS.items()}


FILLER_ITEMS_NAMES = [item_name for item_name, (item_id, classification, quantity) in ALL_ITEMS.items()
                     if classification == ItemClassification.filler]


class DQ3Item(Item):
    game = "Dragon Quest III HD-2D Remake"


# Returns a random filler item name
def get_random_filler_item_name(world: DQ3World) -> str:
    return world.random.choice(FILLER_ITEMS_NAMES)


# Creates the given item by name with the correct classification
def create_item_with_correct_classification(world: DQ3World, name: str) -> DQ3Item:
    return DQ3Item(name, ALL_ITEMS[name][1], ALL_ITEMS[name][0], world.player)


# Create and submit the itempool of all items in the game
def create_all_items(world: DQ3World) -> None:
    itempool: list[Item] = []

    # Create mandatory items
    for item_name, (item_id, classification, quantity) in ALL_ITEMS.items():
        for _ in range(quantity):
            itempool.append(world.create_item(item_name))
    
        number_of_items = len(itempool)

    # Fill the rest of the itempool with filler items
    number_of_unfilled_locations = len(world.multiworld.get_unfilled_locations(world.player))
    needed_number_of_filler_items = number_of_unfilled_locations - number_of_items
    itempool += [world.create_filler() for _ in range(needed_number_of_filler_items)]

    # Submit the itempool to the multiworld itempool
    world.multiworld.itempool += itempool