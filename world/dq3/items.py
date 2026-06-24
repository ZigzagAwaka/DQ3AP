from __future__ import annotations
from dataclasses import dataclass

from typing import TYPE_CHECKING

from BaseClasses import Item, ItemClassification

if TYPE_CHECKING:
    from .world import DQ3World


# Describe item informations
@dataclass
class Info:
    id: int
    classification: ItemClassification = ItemClassification.filler
    quantity: int = 1


# Every item must have a unique integer ID associated with it,
# as well as a default classification and default quantity
# format: "Item name": (id, classification, quantity)
ALL_ITEMS: dict[str, Info] = {
    # GOLD
    "31 Gold": Info(2), #GOLD_31
    "50 Gold": Info(8), #GOLD_50
    "12 Gold": Info(12), #GOLD_12
    "6 Gold": Info(14, quantity=2), #GOLD_6
    "9 Gold": Info(17), #GOLD_9
    "7 Gold": Info(25), #GOLD_7
    "26 Gold": Info(28), #GOLD_26
    "500 Gold": Info(31), #GOLD_500
    # USABLE ITEMS
    "Holy Water": Info(1, quantity=2), #ITEM_USE_ITEM_HOLY_WATER
    "Chimera Wing": Info(3, quantity=2), #ITEM_USE_ITEM_CHIMERA_WING
    "Medical Herb": Info(4, quantity=7), #ITEM_USE_ITEM_MEDICAL_HERB
    "Antidotal Herb": Info(6, quantity=2), #ITEM_USE_ITEM_ANTIDOTAL_HERB
    "Magic Water": Info(10), #ITEM_USE_ITEM_MAGIC_WATER
    "Whispering Nectar": Info(16), #ITEM_USE_ITEM_WHISPERING_NECTAR
    "Pouch of Musk": Info(23), #ITEM_USE_ITEM_POUCH_OF_MUSK
    "Strong Medicine": Info(32), #ITEM_USE_ITEM_STRONG_MEDICINE
    "Seed of Strength": Info(9, ItemClassification.useful, 3), #ITEM_USE_ITEM_SEED_OF_STRENGTH
    "Seed of Life": Info(15, ItemClassification.useful), #ITEM_USE_ITEM_SEED_OF_LIFE
    "Seed of Agility": Info(19, ItemClassification.useful), #ITEM_USE_ITEM_SEED_OF_AGILITY
    "Seed of Magic": Info(24, ItemClassification.useful), #ITEM_USE_ITEM_SEED_OF_MAGIC
    "Seed of Protection": Info(33, ItemClassification.useful), #ITEM_USE_ITEM_SEED_OF_PROTECTION
    # MEDAL
    "Mini Medal": Info(11, ItemClassification.useful, 2), #ITEM_SMALL_MEDAL # progression?
    # WEAPONS
    "Rune Staff": Info(18), #ITEM_EQUIP_WEAPON_RUNE_STAFF
    # SHIELDS
    "Pot Lid": Info(27), #ITEM_EQUIP_SHIELD_POT_LID
    # EQUIPMENT HELMETS
    "Leather Hat": Info(13), #ITEM_EQUIP_HELMET_LEATHER_HAT
    # EQUIPMENT ARMORS
    "Training Togs": Info(5), #ITEM_EQUIP_ARMOR_TRAINING_TOGS
    "Wayfarer's Clothes": Info(29), #ITEM_EQUIP_ARMOR_WAYFARERS_CLOTHES
    # EQUIPMENT ACCESSORIES
    "Dragon Scales": Info(7), #ITEM_EQUIP_ACCESSORY_DRAGON_SCALES
    "Wind Earrings": Info(20), #ITEM_EQUIP_ACCESSORY_WIND_EARRINGS
    "Ring of Reason": Info(21), #ITEM_EQUIP_ACCESSORY_RING_OF_REASON
    "Mighty Armlet": Info(22), #ITEM_EQUIP_ACCESSORY_MIGHTY_ARMLET
    "Alarm Ring": Info(26), #ITEM_EQUIP_ACCESSORY_ALARM_RING
    # IMPORTANT
    #"Thief's Key": Info(34, ItemClassification.progression), #ITEM_IMPORTANT_THIEFS_KEY
    #"Magic Key": Info(35, ItemClassification.progression), #ITEM_IMPORTANT_MAGIC_KEY
    #"Ultimate Key": Info(36, ItemClassification.progression), #ITEM_IMPORTANT_ULTIMATE_KEY
}


ITEM_NAME_TO_ID = {item_name: info.id for item_name, info in ALL_ITEMS.items()}


FILLER_ITEMS_NAMES = [item_name for item_name, info in ALL_ITEMS.items()
                     if info.classification == ItemClassification.filler]


class DQ3Item(Item):
    game = "Dragon Quest III HD-2D Remake"


# Returns a random filler item name
def get_random_filler_item_name(world: DQ3World) -> str:
    return world.random.choice(FILLER_ITEMS_NAMES)


# Creates the given item by name with the correct classification
def create_item_with_correct_classification(world: DQ3World, name: str) -> DQ3Item:
    return DQ3Item(name, ALL_ITEMS[name].classification, ALL_ITEMS[name].id, world.player)


# Create and submit the itempool of all items in the game
def create_all_items(world: DQ3World) -> None:
    itempool: list[Item] = []

    # Create mandatory items (to be improved)
    for item_name, info in ALL_ITEMS.items():
        for _ in range(info.quantity):
            itempool.append(world.create_item(item_name))
    
    number_of_items = len(itempool)

    # Fill the rest of the itempool with filler items
    number_of_unfilled_locations = len(world.multiworld.get_unfilled_locations(world.player))
    needed_number_of_filler_items = number_of_unfilled_locations - number_of_items
    itempool += [world.create_filler() for _ in range(needed_number_of_filler_items)]

    # Submit the itempool to the multiworld itempool
    world.multiworld.itempool += itempool