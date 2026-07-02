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
    "12 Gold": Info(12, quantity=2), #GOLD_12
    "6 Gold": Info(14, quantity=2), #GOLD_6
    "9 Gold": Info(17), #GOLD_9
    "7 Gold": Info(25, quantity=2), #GOLD_7
    "26 Gold": Info(28, quantity=2), #GOLD_26
    "500 Gold": Info(31), #GOLD_500
    "210 Gold": Info(34), #GOLD_210
    "33 Gold": Info(36, quantity=2), #GOLD_33
    "76 Gold": Info(41), #GOLD_76
    "113 Gold": Info(42, quantity=2), #GOLD_113
    "143 Gold": Info(49, quantity=2), #GOLD_143
    "17 Gold": Info(53), #GOLD_17
    "32 Gold": Info(55), #GOLD_32
    "162 Gold": Info(56), #GOLD_162
    "43 Gold": Info(59), #GOLD_43
    "135 Gold": Info(66), #GOLD_135
    "52 Gold": Info(69, quantity=2), #GOLD_52
    "14 Gold": Info(70, quantity=3), #GOLD_14
    "56 Gold": Info(78), #GOLD_56
    "47 Gold": Info(85), #GOLD_47
    "22 Gold": Info(86), #GOLD_22
    "66 Gold": Info(89), #GOLD_66
    "239 Gold": Info(91), #GOLD_239
    "621 Gold": Info(95), #GOLD_621
    "48 Gold": Info(100), #GOLD_48
    "1 Gold": Info(102), #GOLD_1
    "39 Gold": Info(108), #GOLD_39
    "28 Gold": Info(110), #GOLD_28
    "108 Gold": Info(112), #GOLD_108
    "172 Gold": Info(117), #GOLD_172
    "643 Gold": Info(119), #GOLD_643
    "38 Gold": Info(122), #GOLD_38
    "128 Gold": Info(128), #GOLD_128
    "244 Gold": Info(129), #GOLD_244
    "348 Gold": Info(135), #GOLD_348
    "1120 Gold": Info(136), #GOLD_1120
    "567 Gold": Info(138), #GOLD_567
    "710 Gold": Info(141), #GOLD_710
    "67 Gold": Info(144), #GOLD_67
    "369 Gold": Info(151), #GOLD_369
    "542 Gold": Info(154), #GOLD_542
    "484 Gold": Info(156), #GOLD_484
    "337 Gold": Info(158), #GOLD_337
    "1760 Gold": Info(161), #GOLD_1760
    "240 Gold": Info(162), #GOLD_240
    "15 Gold": Info(167), #GOLD_15
    "448 Gold": Info(171), #GOLD_448
    "351 Gold": Info(177), #GOLD_351
    # USABLE ITEMS
    "Holy Water": Info(1, quantity=6), #ITEM_USE_ITEM_HOLY_WATER
    "Chimera Wing": Info(3, quantity=11), #ITEM_USE_ITEM_CHIMERA_WING
    "Medical Herb": Info(4, quantity=12), #ITEM_USE_ITEM_MEDICAL_HERB
    "Antidotal Herb": Info(6, quantity=6), #ITEM_USE_ITEM_ANTIDOTAL_HERB
    "Magic Water": Info(10, quantity=9), #ITEM_USE_ITEM_MAGIC_WATER
    "Unsealant": Info(16, quantity=5), #ITEM_USE_ITEM_WHISPERING_NECTAR
    "Musk": Info(23, quantity=4), #ITEM_USE_ITEM_POUCH_OF_MUSK
    "Strong Medicine": Info(32, quantity=4), #ITEM_USE_ITEM_STRONG_MEDICINE
    "Moonwort Bulb": Info(61, quantity=3), #ITEM_USE_ITEM_MOONWORT_BULB
    "Tangleweb": Info(67), #ITEM_USE_ITEM_TANGLEWEB
    "Dazzle-me-not": Info(68, quantity=5), #ITEM_USE_ITEM_DEDAZZLE_GRASS
    "Special Medicine": Info(75, quantity=7), #ITEM_USE_ITEM_SPECIAL_MEDICINE
    "Coagulant": Info(76, quantity=5), #ITEM_USE_ITEM_COAGULANT
    "Angel Bell": Info(77, quantity=2), #ITEM_USE_ITEM_SKYBELL
    "Sage's Elixir": Info(88, quantity=3), #ITEM_USE_ITEM_SAGES_ELIXIR
    "Prayer Ring": Info(104, quantity=5), #ITEM_USE_ITEM_PRAYER_RING
    "Elfin Elixir": Info(133, quantity=2), #ITEM_USE_ITEM_ELFIN_ELIXIR
    "Yggdrasil Leaf": Info(139), #ITEM_USE_ITEM_YGGDRASIL_LEAF
    "Oomph Powder": Info(140, quantity=3), #ITEM_USE_ITEM_OOMPH_POWDER
    "Dieamend": Info(170), #ITEM_USE_ITEM_DIEAMEND
    "Night Light": Info(179, ItemClassification.useful), #ITEM_USE_ITEM_NIGHT_LIGHT
    # USABLE ITEMS SEEDS
    "Seed of Strength": Info(9, ItemClassification.useful, quantity=8), #ITEM_USE_ITEM_SEED_OF_STRENGTH
    "Seed of Life": Info(15, ItemClassification.useful, quantity=7), #ITEM_USE_ITEM_SEED_OF_LIFE
    "Seed of Agility": Info(19, ItemClassification.useful, quantity=6), #ITEM_USE_ITEM_SEED_OF_AGILITY
    "Seed of Magic": Info(24, ItemClassification.useful, quantity=5), #ITEM_USE_ITEM_SEED_OF_MAGIC
    "Seed of Defence": Info(33, ItemClassification.useful, quantity=7), #ITEM_USE_ITEM_SEED_OF_PROTECTION
    "Seed of Stamina": Info(37, ItemClassification.useful, quantity=4), #ITEM_USE_ITEM_SEED_OF_RESILIENCE
    "Seed of Wisdom": Info(39, ItemClassification.useful, quantity=5), #ITEM_USE_ITEM_SEED_OF_WISDOM
    "Seed of Luck": Info(60, ItemClassification.useful, quantity=6), #ITEM_USE_ITEM_SEED_OF_LUCK
    # USABLE ITEMS BOOKS
    "Book: Diary of a Hardman": Info(38), #ITEM_USE_ITEM_DIARY_OF_A_HARDMAN
    "Book: The Girl's Own Annual": Info(46, quantity=2), #ITEM_USE_ITEM_THE_GIRLS_OWN_ANNUAL
    "Book: Primm's Primer": Info(57), #ITEM_USE_ITEM_PRIMMS_PRIMER
    "Book: The Eureka Moment": Info(65, quantity=2), #ITEM_USE_ITEM_SMART_BOOK
    "Book: Would I Lie to You?": Info(71), #ITEM_USE_ITEM_CHEATER_BOOK
    "Book: The Saddest Story Ever Told": Info(87, quantity=2), #ITEM_USE_ITEM_THE_SADDEST_STORY_EVER_TOLD
    "Book: Look, No Pants!": Info(109), #ITEM_USE_ITEM_COMEDY_BOOK
    "Book: Leap before you Look": Info(120), #ITEM_USE_ITEM_LEAP_BEFORE_YOU_LOOK
    "Book: Fail is the Four-Letter Word": Info(121), #ITEM_USE_ITEM_FAIL_IS_A_FOUR_LETTER_WORD
    # MEDAL
    "Mini Medal": Info(11, ItemClassification.useful, quantity=42), #ITEM_SMALL_MEDAL
    # NOTHING
    "Nothing": Info(125, quantity=2), #None
    # BATTLES
    "Cannibox Trap": Info(126, ItemClassification.trap, quantity=3), #BATTLE_EVENT_PYRAMID_MANEATERBOX_1
    "Cannibox lvl.2 Trap": Info(155, ItemClassification.trap, quantity=2), #BATTLE_EVENT_BAHARATAEASTCAVE_MANEATERBOX_2
    # WEAPONS
    "Rune Staff": Info(18), #ITEM_EQUIP_WEAPON_RUNE_STAFF
    "Oaken Club": Info(35, quantity=2), #ITEM_EQUIP_WEAPON_OAKEN_CLUB
    "Boomerang": Info(45, quantity=2), #ITEM_EQUIP_WEAPON_BOOMERANG
    "Chain Sickle": Info(54, quantity=2), #ITEM_EQUIP_WEAPON_CHAIN_SICKLE
    "Cypress Stick": Info(58, quantity=2), #ITEM_EQUIP_WEAPON_CYPRESS_STICK
    "Assassin's Dagger": Info(73), #ITEM_EQUIP_WEAPON_ASSASSINS_DAGGER
    "Poison Needle": Info(78, quantity=2), #ITEM_EQUIP_WEAPON_POISON_NEEDLE
    "Wizard's Staff": Info(83, quantity=2), #ITEM_EQUIP_WEAPON_WIZARDS_STAFF
    "Iron Lance": Info(92), #ITEM_EQUIP_WEAPON_IRON_LANCE
    "Snooze Stick": Info(96), #ITEM_EQUIP_WEAPON_SNOOZE_STICK
    "Steel Broadsword": Info(99), #ITEM_EQUIP_WEAPON_STEEL_BROADSWORD
    "Bronze Knife": Info(115), #ITEM_EQUIP_WEAPON_BRONZE_KNIFE
    "Knuckledusters": Info(127), #ITEM_EQUIP_WEAPON_KNUCKLEDUSTERS
    "Holy Lance": Info(132), #ITEM_EQUIP_WEAPON_HOLY_LANCE
    "Golden Claws": Info(143, ItemClassification.useful), #ITEM_EQUIP_WEAPON_GOLDEN_CLAWS
    "Edged Boomerang": Info(146), #ITEM_EQUIP_WEAPON_EDGED_BOOMERANG
    "Staff of Antimagic": Info(147), #ITEM_EQUIP_WEAPON_STAFF_OF_ANTIMAGIC
    "Siren Sword": Info(148), #ITEM_EQUIP_WEAPON_SIREN_SWORD
    "Thorn Whip": Info(153), #ITEM_EQUIP_WEAPON_THORN_WHIP
    "Iron Axe": Info(160), #ITEM_EQUIP_WEAPON_IRON_AXE
    "Battle Fork": Info(172), #ITEM_EQUIP_WEAPON_BATTLE_FORK
    "Somatic Staff": Info(174), #ITEM_EQUIP_WEAPON_SOMATIC_STAFF
    "Battle-Axe": Info(175), #ITEM_EQUIP_WEAPON_BATTLEAXE
    "Beast Claws": Info(176), #ITEM_EQUIP_WEAPON_BEAST_CLAWS
    # SHIELDS
    "Pot Lid": Info(27), #ITEM_EQUIP_SHIELD_POT_LID
    "Leather Shield": Info(44), #ITEM_EQUIP_SHIELD_LEATHER_SHIELD
    "Tempest Shield": Info(74), #ITEM_EQUIP_SHIELD_TEMPEST_SHIELD
    "Bronze Shield": Info(101), #ITEM_EQUIP_SHIELD_BRONZE_SHIELD
    # EQUIPMENT HELMETS
    "Leather Hat": Info(13, quantity=2), #ITEM_EQUIP_HELMET_LEATHER_HAT
    "Hardwood Headwear": Info(43), #ITEM_EQUIP_HELMET_HARDWOOD_HEADWEAR
    "Turban": Info(63, quantity=2), #ITEM_EQUIP_HELMET_TURBAN
    "Fur Hood": Info(80), #ITEM_EQUIP_HELMET_FUR_HOOD
    "King's Crown": Info(103, ItemClassification.useful), #ITEM_EQUIP_HELMET_KINGS_CROWN
    "Iron Helmet": Info(157), #ITEM_EQUIP_HELMET_IRON_HELMET
    "Ortega's Helm": Info(165, ItemClassification.useful), #ITEM_EQUIP_HELMET_ORTEGAS_HELM
    "Silver Tiara": Info(169), #ITEM_EQUIP_HELMET_SILVER_TIARA
    "Hermes' Hat": Info(173), #ITEM_EQUIP_HELMET_HERMES_HAT
    "Black Bandana": Info(178), #ITEM_EQUIP_HELMET_BLACK_BANDANA
    "Pointy Hat": Info(180), #ITEM_EQUIP_HELMET_POINTY_HAT
    # EQUIPMENT ARMORS
    "Training Togs": Info(5, quantity=3), #ITEM_EQUIP_ARMOR_TRAINING_TOGS
    "Wayfarer's Clothes": Info(29, quantity=4), #ITEM_EQUIP_ARMOR_WAYFARERS_CLOTHES
    "Tortoise Shell": Info(52), #ITEM_EQUIP_ARMOR_TORTOISE_SHELL
    "Leather Armor": Info(62), #ITEM_EQUIP_ARMOR_LEATHER_ARMOUR
    "Leather Cape": Info(72), #ITEM_EQUIP_ARMOR_LEATHER_CAPE
    "Boxer Shorts": Info(79, quantity=2), #ITEM_EQUIP_ARMOR_BOXER_SHORTS
    "Plain Clothes": Info(82), #ITEM_EQUIP_ARMOR_PLAIN_CLOTHES
    "Leather Kilt": Info(84, quantity=2), #ITEM_EQUIP_ARMOR_LEATHER_KILT
    "Cloak of Evasion": Info(94), #ITEM_EQUIP_ARMOR_CLOAK_OF_EVASION
    "Leather Dress": Info(114), #ITEM_EQUIP_ARMOR_LEATHER_DRESS
    "Silk Robe": Info(116), #ITEM_EQUIP_ARMOR_SILK_ROBE
    "Magical Skirt": Info(134), #ITEM_EQUIP_ARMOR_MAGICAL_SKIRT
    "Fizzle-Retardant Suit": Info(142), #ITEM_EQUIP_ARMOR_FIZZLE_RETARDANT_SUIT
    "Sparring Suit": Info(145, quantity=2), #ITEM_EQUIP_ARMOR_SPARRING_SUIT
    "Full Plate Armor": Info(159), #ITEM_EQUIP_ARMOR_FULL_PLATE_ARMOUR
    # EQUIPMENT ACCESSORIES
    "Dragon Scales": Info(7), #ITEM_EQUIP_ACCESSORY_DRAGON_SCALES
    "Wind Earrings": Info(20), #ITEM_EQUIP_ACCESSORY_WIND_EARRINGS
    "Ring of Reason": Info(21), #ITEM_EQUIP_ACCESSORY_RING_OF_REASON
    "Mighty Armlet": Info(22), #ITEM_EQUIP_ACCESSORY_MIGHTY_ARMLET
    "Rousing Ring": Info(26, quantity=3), #ITEM_EQUIP_ACCESSORY_ALARM_RING
    "Rabbit Tail": Info(50, quantity=2), #ITEM_EQUIP_ACCESSORY_BUNNY_TAIL
    "Cower Ring": Info(51), #ITEM_EQUIP_ACCESSORY_COWER_RING
    "Restless Heart": Info(64), #ITEM_EQUIP_ACCESSORY_RESTLESS_HEART
    "Necklace of Immunity": Info(81), #ITEM_EQUIP_ACCESSORY_POISON_RESISTANCE_NECKLACE
    "Care Riviere": Info(93, quantity=3), #ITEM_EQUIP_ACCESSORY_SEALING_RESISTANCE_NECKLACE
    "Silver Rosary": Info(97), #ITEM_EQUIP_ACCESSORY_GOLD_ROSARY
    "Skull Ring": Info(105), #ITEM_EQUIP_ACCESSORY_SKULL_RING
    "Ruby Wristband": Info(106), #ITEM_EQUIP_ACCESSORY_RUBY_WRISTBAND
    "Leg Warmers": Info(107), #ITEM_EQUIP_ACCESSORY_LEG_WARMERS
    "Tough Guy Tatoo": Info(111, quantity=2), #ITEM_EQUIP_ACCESSORY_TOUGH_GUY_TATTOO
    "Gold Chain": Info(113, quantity=2), #ITEM_EQUIP_ACCESSORY_GOLD_CHAIN
    "Golden Tiara": Info(118), #ITEM_EQUIP_ACCESSORY_GOLDEN_TIARA
    "Recovery Ring": Info(123), #ITEM_EQUIP_ACCESSORY_RECOVERY_RING
    "Meteorite Bracer": Info(124, ItemClassification.useful), #ITEM_EQUIP_ACCESSORY_METEORITE_BRACER
    "Banishing Bell": Info(130), #ITEM_EQUIP_ACCESSORY_AMULET_BELL
    "Care Ring": Info(131, quantity=2), #ITEM_EQUIP_ACCESSORY_CARE_RING
    "Ten Ton Toupee": Info(137), #ITEM_EQUIP_ACCESSORY_TEN_TON_TOUPEE
    "Holy Talisman": Info(152), #ITEM_EQUIP_ACCESSORY_HOLY_SYMBOL_OF_AMULET
    "Torc of Truth": Info(163), #ITEM_EQUIP_ACCESSORY_PHANTOM_RESISTANCE_NECKLACE
    "Asbestos Earrings": Info(166), #ITEM_EQUIP_ACCESSORY_ICE_EARRINGS
    # IMPORTANT
    "Wrecking Ball": Info(40, ItemClassification.progression), #ITEM_IMPORTANT_WRECKING_BALL
    "Progressive Key": Info(47, ItemClassification.progression | ItemClassification.useful, quantity=2), #ITEM_IMPORTANT_PROGRESSIVE_KEY (ITEM_IMPORTANT_THIEFS_KEY, ITEM_IMPORTANT_MAGIC_KEY)
    #"World Map": Info(48, ItemClassification.useful), #ITEM_IMPORTANT_ADVENTURERS_MAP # not randomized
    "Wakey Dust": Info(90, ItemClassification.useful), #ITEM_IMPORTANT_WAKEY_DUST
    "Dreamstone": Info(98, ItemClassification.progression), #ITEM_IMPORTANT_DREAMSTONE
    "Royal Missive": Info(149, ItemClassification.progression), #ITEM_IMPORTANT_ROYAL_MISSIVE
    "Ship": Info(150, ItemClassification.progression | ItemClassification.useful), #ITEM_IMPORTANT_SHIP
    "Black Pepper": Info(164, ItemClassification.progression), #ITEM_IMPORTANT_BLACK_PEPPER
    "Words of Wisdom": Info(168, ItemClassification.useful), #ITEM_IMPORTANT_WORDS_OF_WISDOM
    "Green Orb": Info(181, ItemClassification.progression), #ITEM_IMPORTANT_GREEN_ORB
    "Ramia": Info(182, ItemClassification.progression | ItemClassification.useful), #ITEM_IMPORTANT_RAMIA
    #orb
    #orb
    #orb
    #orb
    #orb
    #WIP "Ultimate Key": Info(xx, ItemClassification.progression), #ITEM_IMPORTANT_ULTIMATE_KEY
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