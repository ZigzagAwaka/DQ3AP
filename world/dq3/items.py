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
    "31 Gold": Info(2), #GOLD_31 #when giving gold, check for amount in id then give gold amount
    "50 Gold": Info(8), #GOLD_50
    "12 Gold": Info(12, quantity=2), #GOLD_12
    "6 Gold": Info(14, quantity=2), #GOLD_6
    "9 Gold": Info(17), #GOLD_9
    "7 Gold": Info(25), #GOLD_7
    "26 Gold": Info(28), #GOLD_26
    "500 Gold": Info(31), #GOLD_500
    "210 Gold": Info(34), #GOLD_210
    "33 Gold": Info(36), #GOLD_33
    "76 Gold": Info(41), #GOLD_76
    "113 Gold": Info(42), #GOLD_113
    "143 Gold": Info(49), #GOLD_143
    "17 Gold": Info(53), #GOLD_17
    "32 Gold": Info(55), #GOLD_32
    "162 Gold": Info(56), #GOLD_162
    # USABLE ITEMS
    "Holy Water": Info(1, quantity=3), #ITEM_USE_ITEM_HOLY_WATER
    "Chimera Wing": Info(3, quantity=5), #ITEM_USE_ITEM_CHIMERA_WING
    "Medical Herb": Info(4, quantity=9), #ITEM_USE_ITEM_MEDICAL_HERB
    "Antidotal Herb": Info(6, quantity=4), #ITEM_USE_ITEM_ANTIDOTAL_HERB
    "Magic Water": Info(10, quantity=2), #ITEM_USE_ITEM_MAGIC_WATER
    "Whispering Nectar": Info(16), #ITEM_USE_ITEM_WHISPERING_NECTAR
    "Pouch of Musk": Info(23), #ITEM_USE_ITEM_POUCH_OF_MUSK
    "Strong Medicine": Info(32), #ITEM_USE_ITEM_STRONG_MEDICINE
    # USABLE ITEMS SEEDS
    "Seed of Strength": Info(9, ItemClassification.useful, quantity=3), #ITEM_USE_ITEM_SEED_OF_STRENGTH
    "Seed of Life": Info(15, ItemClassification.useful, quantity=2), #ITEM_USE_ITEM_SEED_OF_LIFE
    "Seed of Agility": Info(19, ItemClassification.useful, quantity=2), #ITEM_USE_ITEM_SEED_OF_AGILITY
    "Seed of Magic": Info(24, ItemClassification.useful, quantity=2), #ITEM_USE_ITEM_SEED_OF_MAGIC
    "Seed of Protection": Info(33, ItemClassification.useful, quantity=2), #ITEM_USE_ITEM_SEED_OF_PROTECTION
    "Seed of Resilience": Info(37, ItemClassification.useful), #ITEM_USE_ITEM_SEED_OF_RESILIENCE
    "Seed of Wisdom": Info(39, ItemClassification.useful, quantity=2), #ITEM_USE_ITEM_SEED_OF_WISDOM
    # USABLE ITEMS BOOKS
    "Book: Diary of a Hardman": Info(38), #ITEM_USE_ITEM_DIARY_OF_A_HARDMAN
    "Book: The Girl's Own Annual": Info(46), #ITEM_USE_ITEM_THE_GIRLS_OWN_ANNUAL
    # MEDAL
    "Mini Medal": Info(11, ItemClassification.useful, quantity=6), #ITEM_SMALL_MEDAL # progression?
    # WEAPONS
    "Rune Staff": Info(18), #ITEM_EQUIP_WEAPON_RUNE_STAFF
    "Oaken Club": Info(35), #ITEM_EQUIP_WEAPON_OAKEN_CLUB
    "Boomerang": Info(45, quantity=2), #ITEM_EQUIP_WEAPON_BOOMERANG
    "Chain Sickle": Info(54), #ITEM_EQUIP_WEAPON_CHAIN_SICKLE
    # SHIELDS
    "Pot Lid": Info(27), #ITEM_EQUIP_SHIELD_POT_LID
    "Leather Shield": Info(44), #ITEM_EQUIP_SHIELD_LEATHER_SHIELD
    # EQUIPMENT HELMETS
    "Leather Hat": Info(13, quantity=2), #ITEM_EQUIP_HELMET_LEATHER_HAT
    "Hardwood Headwear": Info(43), #ITEM_EQUIP_HELMET_HARDWOOD_HEADWEAR
    # EQUIPMENT ARMORS
    "Training Togs": Info(5), #ITEM_EQUIP_ARMOR_TRAINING_TOGS
    "Wayfarer's Clothes": Info(29, quantity=2), #ITEM_EQUIP_ARMOR_WAYFARERS_CLOTHES
    "Tortoise Shell": Info(52), #ITEM_EQUIP_ARMOR_TORTOISE_SHELL
    # EQUIPMENT ACCESSORIES
    "Dragon Scales": Info(7), #ITEM_EQUIP_ACCESSORY_DRAGON_SCALES
    "Wind Earrings": Info(20), #ITEM_EQUIP_ACCESSORY_WIND_EARRINGS
    "Ring of Reason": Info(21), #ITEM_EQUIP_ACCESSORY_RING_OF_REASON
    "Mighty Armlet": Info(22), #ITEM_EQUIP_ACCESSORY_MIGHTY_ARMLET
    "Alarm Ring": Info(26, quantity=2), #ITEM_EQUIP_ACCESSORY_ALARM_RING
    "Bunny Tail": Info(50), #ITEM_EQUIP_ACCESSORY_BUNNY_TAIL
    "Cower Ring": Info(51), #ITEM_EQUIP_ACCESSORY_COWER_RING
    # IMPORTANT
    "Wrecking Ball": Info(40, ItemClassification.progression), #ITEM_IMPORTANT_WRECKING_BALL #when giving this item, remember to set flag FE57 (EventScript_T01_Reeve_House2_2F.lua)
    "Thief's Key": Info(47, ItemClassification.progression), #ITEM_IMPORTANT_THIEFS_KEY #when giving this item, remember to set flag FE54 (EventScript_D02_NajimiTower_Penthouse.lua)
    #"World Map": Info(48, ItemClassification.useful), #ITEM_IMPORTANT_ADVENTURERS_MAP # not randomized
    #"Magic Key": Info(xx, ItemClassification.progression), #ITEM_IMPORTANT_MAGIC_KEY
    #"Ultimate Key": Info(xx, ItemClassification.progression), #ITEM_IMPORTANT_ULTIMATE_KEY
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