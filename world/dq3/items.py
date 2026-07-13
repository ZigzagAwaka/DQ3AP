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
    "38 Gold": Info(122, quantity=2), #GOLD_38
    "128 Gold": Info(128), #GOLD_128
    "244 Gold": Info(129), #GOLD_244
    "348 Gold": Info(135), #GOLD_348
    "1120 Gold": Info(136), #GOLD_1120
    "567 Gold": Info(138), #GOLD_567
    "710 Gold": Info(141), #GOLD_710
    "67 Gold": Info(144, quantity=2), #GOLD_67
    "369 Gold": Info(151), #GOLD_369
    "542 Gold": Info(154), #GOLD_542
    "484 Gold": Info(156), #GOLD_484
    "337 Gold": Info(158), #GOLD_337
    "1760 Gold": Info(161), #GOLD_1760
    "240 Gold": Info(162), #GOLD_240
    "15 Gold": Info(167), #GOLD_15
    "448 Gold": Info(171), #GOLD_448
    "351 Gold": Info(177), #GOLD_351
    "600 Gold": Info(183), #GOLD_600
    "3260 Gold": Info(195), #GOLD_3260
    "319 Gold": Info(198), #GOLD_319
    "629 Gold": Info(199), #GOLD_629
    "10000 Gold": Info(203, ItemClassification.useful), #GOLD_10000
    "434 Gold": Info(208), #GOLD_434
    "675 Gold": Info(209), #GOLD_675
    "853 Gold": Info(210), #GOLD_853
    "41 Gold": Info(212), #GOLD_41
    "101 Gold": Info(213), #GOLD_101
    "3640 Gold": Info(215), #GOLD_3640
    "23 Gold": Info(221, quantity=2), #GOLD_23
    "912 Gold": Info(231), #GOLD_912
    "610 Gold": Info(232), #GOLD_610
    "140 Gold": Info(233), #GOLD_140
    "1084 Gold": Info(238), #GOLD_1084
    "7921 Gold": Info(240), #GOLD_7921
    "3190 Gold": Info(247), #GOLD_3190
    "4 Gold": Info(248), #GOLD_4
    "3024 Gold": Info(253), #GOLD_3024
    "1223 Gold": Info(268), #GOLD_1223
    "254 Gold": Info(274), #GOLD_254
    "1620 Gold": Info(276), #GOLD_1620
    "214 Gold": Info(279), #GOLD_214
    "384 Gold": Info(281), #GOLD_384
    "311 Gold": Info(283), #GOLD_311
    "75 Gold": Info(286), #GOLD_75
    "2205 Gold": Info(292), #GOLD_2205
    "2016 Gold": Info(296), #GOLD_2016
    "4989 Gold": Info(303), #GOLD_4989
    "4530 Gold": Info(310), #GOLD_4530
    "120 Gold": Info(320), #GOLD_120
    "5 Gold": Info(323), #GOLD_5
    # USABLE ITEMS
    "Holy Water": Info(1, quantity=9), #ITEM_USE_ITEM_HOLY_WATER
    "Chimera Wing": Info(3, quantity=13), #ITEM_USE_ITEM_CHIMERA_WING
    "Medical Herb": Info(4, quantity=14), #ITEM_USE_ITEM_MEDICAL_HERB
    "Antidotal Herb": Info(6, quantity=9), #ITEM_USE_ITEM_ANTIDOTAL_HERB
    "Magic Water": Info(10, quantity=20), #ITEM_USE_ITEM_MAGIC_WATER
    "Unsealant": Info(16, quantity=8), #ITEM_USE_ITEM_WHISPERING_NECTAR
    "Musk": Info(23, quantity=8), #ITEM_USE_ITEM_POUCH_OF_MUSK
    "Strong Medicine": Info(32, quantity=7), #ITEM_USE_ITEM_STRONG_MEDICINE
    "Moonwort Bulb": Info(61, quantity=6), #ITEM_USE_ITEM_MOONWORT_BULB
    "Tangleweb": Info(67), #ITEM_USE_ITEM_TANGLEWEB
    "Dazzle-me-not": Info(68, quantity=6), #ITEM_USE_ITEM_DEDAZZLE_GRASS
    "Special Medicine": Info(75, quantity=10), #ITEM_USE_ITEM_SPECIAL_MEDICINE
    "Coagulant": Info(76, quantity=8), #ITEM_USE_ITEM_COAGULANT
    "Angel Bell": Info(77, quantity=4), #ITEM_USE_ITEM_SKYBELL
    "Sage's Elixir": Info(88, quantity=9), #ITEM_USE_ITEM_SAGES_ELIXIR
    "Prayer Ring": Info(104, quantity=12), #ITEM_USE_ITEM_PRAYER_RING
    "Elfin Elixir": Info(133, quantity=8), #ITEM_USE_ITEM_ELFIN_ELIXIR
    "Yggdrasil Leaf": Info(139, quantity=6), #ITEM_USE_ITEM_YGGDRASIL_LEAF
    "Oomph Powder": Info(140, quantity=5), #ITEM_USE_ITEM_OOMPH_POWDER
    "Dieamend": Info(170, quantity=8), #ITEM_USE_ITEM_DIEAMEND
    "Night Light": Info(179, ItemClassification.useful), #ITEM_USE_ITEM_NIGHT_LIGHT
    "Sage's Stone": Info(205, ItemClassification.useful, quantity=3), #ITEM_USE_ITEM_SAGES_STONE
    "Fading Jenny": Info(217, quantity=4), #ITEM_USE_ITEM_FADING_JENNY
    "Sphere of Light": Info(263, ItemClassification.progression | ItemClassification.useful), #ITEM_USE_ITEM_SPHERE_OF_LIGHT
    "Lyre of Ire": Info(266, ItemClassification.useful), #ITEM_USE_ITEM_LYRE_OF_IRE
    "War Drum": Info(322, ItemClassification.useful), #ITEM_USE_ITEM_WAR_DRUM
    # USABLE ITEMS SEEDS
    "Seed of Strength": Info(9, quantity=15), #ITEM_USE_ITEM_SEED_OF_STRENGTH
    "Seed of Life": Info(15, quantity=14), #ITEM_USE_ITEM_SEED_OF_LIFE
    "Seed of Agility": Info(19, quantity=10), #ITEM_USE_ITEM_SEED_OF_AGILITY
    "Seed of Magic": Info(24, quantity=15), #ITEM_USE_ITEM_SEED_OF_MAGIC
    "Seed of Defence": Info(33, quantity=10), #ITEM_USE_ITEM_SEED_OF_PROTECTION
    "Seed of Stamina": Info(37, quantity=6), #ITEM_USE_ITEM_SEED_OF_RESILIENCE
    "Seed of Wisdom": Info(39, quantity=9), #ITEM_USE_ITEM_SEED_OF_WISDOM
    "Seed of Luck": Info(60, quantity=13), #ITEM_USE_ITEM_SEED_OF_LUCK
    # USABLE ITEMS BOOKS
    "Book: Diary of a Hardman": Info(38), #ITEM_USE_ITEM_DIARY_OF_A_HARDMAN
    "Book: The Girl's Own Annual": Info(46, quantity=3), #ITEM_USE_ITEM_THE_GIRLS_OWN_ANNUAL
    "Book: Primm's Primer": Info(57, quantity=3), #ITEM_USE_ITEM_PRIMMS_PRIMER
    "Book: The Eureka Moment": Info(65, quantity=3), #ITEM_USE_ITEM_SMART_BOOK
    "Book: Would I Lie to You?": Info(71, quantity=3), #ITEM_USE_ITEM_CHEATER_BOOK
    "Book: The Saddest Story Ever Told": Info(87, quantity=2), #ITEM_USE_ITEM_THE_SADDEST_STORY_EVER_TOLD
    "Book: Look, No Pants!": Info(109, quantity=2), #ITEM_USE_ITEM_COMEDY_BOOK
    "Book: Leap before you Look": Info(120, quantity=2), #ITEM_USE_ITEM_LEAP_BEFORE_YOU_LOOK
    "Book: Fail is a Four-Letter Word": Info(121, quantity=3), #ITEM_USE_ITEM_FAIL_IS_A_FOUR_LETTER_WORD
    "Book: The Champion's Code": Info(202, quantity=3), #ITEM_USE_ITEM_THE_CHAMPIONS_CODE
    "Book: Loving Living: A Grinner's Guide": Info(207, quantity=2), #ITEM_USE_ITEM_LOVING_LIVING_A_GRINNERS_GUIDE
    "Book: Tears before Bedtime": Info(270), #ITEM_USE_ITEM_TEARS_BEFORE_BEDTIME
    "Book: Being a Better Person": Info(280), #ITEM_USE_ITEM_BENICE_BOOK
    "Book: Guns N' Buns": Info(317, ItemClassification.useful), #ITEM_USE_ITEM_NAUGHTY_BOOK
    # MEDAL
    "Mini Medal": Info(11, ItemClassification.useful, quantity=93), #ITEM_SMALL_MEDAL
    # NOTHING
    "Nothing": Info(125, quantity=2), #None
    # BATTLES
    "Cannibox Trap": Info(126, ItemClassification.trap, quantity=7), #BATTLE_EVENT_CANNIBOX
    "Mimic Trap": Info(236, ItemClassification.trap, quantity=19), #BATTLE_EVENT_MIMIC
    "Pandora's Box Trap": Info(326, ItemClassification.trap, quantity=10), #BATTLE_EVENT_PANDORABOX
    # WEAPONS
    "Rune Staff": Info(18), #ITEM_EQUIP_WEAPON_RUNE_STAFF
    "Oaken Club": Info(35, quantity=4), #ITEM_EQUIP_WEAPON_OAKEN_CLUB
    "Boomerang": Info(45, quantity=3), #ITEM_EQUIP_WEAPON_BOOMERANG
    "Chain Sickle": Info(54, quantity=2), #ITEM_EQUIP_WEAPON_CHAIN_SICKLE
    "Cypress Stick": Info(58, quantity=2), #ITEM_EQUIP_WEAPON_CYPRESS_STICK
    "Assassin's Dagger": Info(73, quantity=2), #ITEM_EQUIP_WEAPON_ASSASSINS_DAGGER
    "Poison Needle": Info(78, quantity=3), #ITEM_EQUIP_WEAPON_POISON_NEEDLE
    "Wizard's Staff": Info(83, quantity=3), #ITEM_EQUIP_WEAPON_WIZARDS_STAFF
    "Iron Lance": Info(92, quantity=2), #ITEM_EQUIP_WEAPON_IRON_LANCE
    "Snooze Stick": Info(96, quantity=2), #ITEM_EQUIP_WEAPON_SNOOZE_STICK
    "Steel Broadsword": Info(99, quantity=2), #ITEM_EQUIP_WEAPON_STEEL_BROADSWORD
    "Bronze Knife": Info(115), #ITEM_EQUIP_WEAPON_BRONZE_KNIFE
    "Knuckledusters": Info(127), #ITEM_EQUIP_WEAPON_KNUCKLEDUSTERS
    "Holy Lance": Info(132), #ITEM_EQUIP_WEAPON_HOLY_LANCE
    "Golden Claws": Info(143, ItemClassification.useful), #ITEM_EQUIP_WEAPON_GOLDEN_CLAWS
    "Edged Boomerang": Info(146, quantity=2), #ITEM_EQUIP_WEAPON_EDGED_BOOMERANG
    "Staff of Antimagic": Info(147), #ITEM_EQUIP_WEAPON_STAFF_OF_ANTIMAGIC
    "Siren Sword": Info(148), #ITEM_EQUIP_WEAPON_SIREN_SWORD
    "Thorn Whip": Info(153, quantity=2), #ITEM_EQUIP_WEAPON_THORN_WHIP
    "Iron Axe": Info(160, quantity=4), #ITEM_EQUIP_WEAPON_IRON_AXE
    "Battle Fork": Info(172, quantity=2), #ITEM_EQUIP_WEAPON_BATTLE_FORK
    "Somatic Staff": Info(174), #ITEM_EQUIP_WEAPON_SOMATIC_STAFF
    "Battle-Axe": Info(175), #ITEM_EQUIP_WEAPON_BATTLEAXE
    "Beast Claws": Info(176, ItemClassification.useful), #ITEM_EQUIP_WEAPON_BEAST_CLAWS
    "Divine Dagger": Info(185, quantity=3), #ITEM_EQUIP_WEAPON_DIVINE_DAGGER
    "Lightning Staff": Info(193), #ITEM_EQUIP_WEAPON_LIGHTNING_STAFF
    "Iron Claws": Info(214, quantity=2), #ITEM_EQUIP_WEAPON_IRON_CLAWS
    "Shallowtail": Info(229), #ITEM_EQUIP_WEAPON_SWALLOWTAIL
    "Spiked Steel Whip": Info(230, quantity=2), #ITEM_EQUIP_WEAPON_SPIKED_STEEL_WHIP
    "Zombiesbane": Info(241, quantity=2), #ITEM_EQUIP_WEAPON_ZOMBIESBANE
    "Sizeable Scissors": Info(245), #ITEM_EQUIP_WEAPON_SIZEABLE_SCISSORS
    "Mountaincleaver": Info(250, ItemClassification.progression, quantity=2), #ITEM_EQUIP_WEAPON_MOUNTAINCLEAVER
    "Thunderbolt Blade": Info(252), #ITEM_EQUIP_WEAPON_THUNDERBOLT_BLADE
    "Headsman's Axe": Info(260), #ITEM_EQUIP_WEAPON_HEADSMANS_AXE
    "Staff of Rain": Info(282, ItemClassification.progression), #ITEM_EQUIP_WEAPON_STAFF_OF_RAIN
    "Sword of Kings": Info(287, ItemClassification.progression | ItemClassification.useful), #ITEM_EQUIP_WEAPON_SWORD_OF_KINGS
    "Sword of Ruin": Info(288), #ITEM_EQUIP_WEAPON_SWORD_OF_RUIN
    "Demon Spear": Info(290), #ITEM_EQUIP_WEAPON_DEMON_SPEAR
    "Blizzard Blade": Info(293, quantity=2), #ITEM_EQUIP_WEAPON_BLIZZARD_BLADE
    "Staff of Sentencing": Info(297), #ITEM_EQUIP_WEAPON_STAFF_OF_SENTENCING
    "Stormlord's Sword": Info(299), #ITEM_EQUIP_WEAPON_STORMLORDS_SWORD
    "Scourge Whip": Info(302), #ITEM_EQUIP_WEAPON_SCOURGE_WHIP
    "Double-Edged Sword": Info(304), #ITEM_EQUIP_WEAPON_DOUBLE-EDGED_SWORD
    "Bastard Sword": Info(306), #ITEM_EQUIP_WEAPON_BASTARD_SWORD
    "Staff of Strife": Info(308), #ITEM_EQUIP_WEAPON_STAFF_OF_STRIFE
    "Empress' Whip": Info(309), #ITEM_EQUIP_WEAPON_EMPRESSS_WHIP
    "Poker": Info(314), #ITEM_EQUIP_WEAPON_GODLY_POKER
    "Destructiball": Info(316, ItemClassification.useful, quantity=2), #ITEM_EQUIP_WEAPON_DESTRUCTIBALL
    "Rubiss' Sword": Info(319, ItemClassification.useful), #ITEM_EQUIP_WEAPON_RUBISSS_SWORD
    "Dragontail Whip": Info(321), #ITEM_EQUIP_WEAPON_DRAGONTAIL_WHIP
    "Dragon Claws": Info(324, ItemClassification.useful), #ITEM_EQUIP_WEAPON_DRAGON_CLAWS
    "Conqueror's Axe": Info(328), #ITEM_EQUIP_WEAPON_CONQUERORS_AXE
    "Aurora Staff": Info(329), #ITEM_EQUIP_WEAPON_AURORA_STAFF
    "Gringham Whip": Info(332, ItemClassification.progression | ItemClassification.useful), #ITEM_EQUIP_WEAPON_GRINGHAM_WHIP
    # SHIELDS
    "Pot Lid": Info(27, quantity=2), #ITEM_EQUIP_SHIELD_POT_LID
    "Leather Shield": Info(44), #ITEM_EQUIP_SHIELD_LEATHER_SHIELD
    "Tempest Shield": Info(74), #ITEM_EQUIP_SHIELD_TEMPEST_SHIELD
    "Bronze Shield": Info(101), #ITEM_EQUIP_SHIELD_BRONZE_SHIELD
    "Scale Shield": Info(187), #ITEM_EQUIP_SHIELD_SCALE_SHIELD
    "Light Shield": Info(190), #ITEM_EQUIP_SHIELD_LIGHT_SHIELD
    "Silver Platter": Info(206), #ITEM_EQUIP_SHIELD_SILVER_PLATTER
    "Ice Shield": Info(239, quantity=2), #ITEM_EQUIP_SHIELD_ICE_SHIELD
    "Magic Shield": Info(255, quantity=2), #ITEM_EQUIP_SHIELD_MAGIC_SHIELD
    "Hero's Shield": Info(294, ItemClassification.useful), #ITEM_EQUIP_SHIELD_HEROS_SHIELD
    "Silver Shield": Info(298), #ITEM_EQUIP_SHIELD_SILVER_SHIELD
    "Shield of Shame": Info(312), #ITEM_EQUIP_SHIELD_SHIELD_OF_SHAME
    "Dragon Shield": Info(325), #ITEM_EQUIP_SHIELD_DRAGON_SHIELD
    "Goddess Shield": Info(327), #ITEM_EQUIP_SHIELD_GODDESS_SHIELD
    # EQUIPMENT HELMETS
    "Leather Hat": Info(13, quantity=3), #ITEM_EQUIP_HELMET_LEATHER_HAT
    "Hardwood Headwear": Info(43, quantity=2), #ITEM_EQUIP_HELMET_HARDWOOD_HEADWEAR
    "Turban": Info(63, quantity=2), #ITEM_EQUIP_HELMET_TURBAN
    "Fur Hood": Info(80), #ITEM_EQUIP_HELMET_FUR_HOOD
    "King's Crown": Info(103, ItemClassification.useful), #ITEM_EQUIP_HELMET_KINGS_CROWN
    "Iron Helmet": Info(157, quantity=2), #ITEM_EQUIP_HELMET_IRON_HELMET
    "Ortega's Helm": Info(165, ItemClassification.progression), #ITEM_EQUIP_HELMET_ORTEGAS_HELM
    "Silver Tiara": Info(169), #ITEM_EQUIP_HELMET_SILVER_TIARA
    "Hermes' Hat": Info(173), #ITEM_EQUIP_HELMET_HERMES_HAT
    "Black Bandana": Info(178, quantity=3), #ITEM_EQUIP_HELMET_BLACK_BANDANA
    "Pointy Hat": Info(180), #ITEM_EQUIP_HELMET_POINTY_HAT
    "Mask of Implacability": Info(188, ItemClassification.useful), #ITEM_EQUIP_HELMET_MASK_OF_IMPLACABILITY
    "Top Hat": Info(196), #ITEM_EQUIP_HELMET_TOP_HAT
    "Phantom Mask": Info(200), #ITEM_EQUIP_HELMET_PHANTOM_MASK
    "Scholar's Cap": Info(204, quantity=2), #ITEM_EQUIP_HELMET_SCHOLARS_CAP
    "Thief's Turban": Info(226, quantity=2), #ITEM_EQUIP_HELMET_THIEFS_TURBAN
    "Iron Mask": Info(237), #ITEM_EQUIP_HELMET_IRON_MASK
    "Mythril Helm": Info(254), #ITEM_EQUIP_HELMET_MYTHRIL_HELM
    "Thinking Cap": Info(257), #ITEM_EQUIP_HELMET_THINKING_CAP
    "Hapless Helm": Info(261, quantity=2), #ITEM_EQUIP_HELMET_HAPLESS_HELM
    "Rabbit Ears": Info(275), #ITEM_EQUIP_HELMET_BUNNY_EARS
    "Auroral Helm": Info(284, ItemClassification.progression | ItemClassification.useful), #ITEM_EQUIP_HELMET_LIGHT_HELM
    "Heavenly Helm": Info(313), #ITEM_EQUIP_HELMET_HEAVENLY_HELM
    "Duplic Hat": Info(330), #ITEM_EQUIP_HELMET_DUPLIC_HAT
    # EQUIPMENT ARMORS
    "Training Togs": Info(5, quantity=5), #ITEM_EQUIP_ARMOR_TRAINING_TOGS
    "Wayfarer's Clothes": Info(29, quantity=4), #ITEM_EQUIP_ARMOR_WAYFARERS_CLOTHES
    "Tortoise Shell": Info(52), #ITEM_EQUIP_ARMOR_TORTOISE_SHELL
    "Leather Armor": Info(62), #ITEM_EQUIP_ARMOR_LEATHER_ARMOUR
    "Leather Cape": Info(72), #ITEM_EQUIP_ARMOR_LEATHER_CAPE
    "Boxer Shorts": Info(79, quantity=5), #ITEM_EQUIP_ARMOR_BOXER_SHORTS
    "Plain Clothes": Info(82, quantity=3), #ITEM_EQUIP_ARMOR_PLAIN_CLOTHES
    "Leather Kilt": Info(84, quantity=3), #ITEM_EQUIP_ARMOR_LEATHER_KILT
    "Cloak of Evasion": Info(94), #ITEM_EQUIP_ARMOR_CLOAK_OF_EVASION
    "Leather Dress": Info(114), #ITEM_EQUIP_ARMOR_LEATHER_DRESS
    "Silk Robe": Info(116, quantity=3), #ITEM_EQUIP_ARMOR_SILK_ROBE
    "Magical Skirt": Info(134, quantity=2), #ITEM_EQUIP_ARMOR_MAGICAL_SKIRT
    "Fizzle-Retardant Suit": Info(142), #ITEM_EQUIP_ARMOR_FIZZLE_RETARDANT_SUIT
    "Sparring Suit": Info(145, quantity=2), #ITEM_EQUIP_ARMOR_SPARRING_SUIT
    "Full Plate Armor": Info(159), #ITEM_EQUIP_ARMOR_FULL_PLATE_ARMOUR
    "Black Pyjamas": Info(189), #ITEM_EQUIP_ARMOR_BLACK_PYJAMAS
    "Magic Armor": Info(194), #ITEM_EQUIP_ARMOR_MAGIC_ARMOUR
    "Earthenwear": Info(216, quantity=2), #ITEM_EQUIP_ARMOR_EARTHENWEAR
    "Smart Suit": Info(222), #ITEM_EQUIP_ARMOR_SMART_SUIT
    "Party Dress": Info(223, quantity=2), #ITEM_EQUIP_ARMOR_PARTY_DRESS
    "Agility Gilet": Info(227), #ITEM_EQUIP_ARMOR_AGILITY_GILET
    "Cat Suit": Info(242, quantity=2), #ITEM_EQUIP_ARMOR_CAT_SUIT
    "Spiked Armor": Info(251), #ITEM_EQUIP_ARMOR_SPIKED_ARMOUR
    "Magical Robes": Info(256, quantity=2), #ITEM_EQUIP_ARMOR_MAGICAL_ROBES
    "Flowing Dress": Info(259), #ITEM_EQUIP_ARMOR_FLOWING_DRESS
    "Dragon Mail": Info(262), #ITEM_EQUIP_ARMOR_DRAGON_MAIL
    "Chain Mail": Info(265), #ITEM_EQUIP_ARMOR_CHAIN_MAIL
    "Magic Bikini": Info(272), #ITEM_EQUIP_ARMOR_MAGIC_BIKINI
    "Dark Robe": Info(278, ItemClassification.useful), #ITEM_EQUIP_ARMOR_DARK_ROBE
    "Hate Mail": Info(289), #ITEM_EQUIP_ARMOR_INFERNAL_ARMOUR
    "Angel's Robe": Info(300), #ITEM_EQUIP_ARMOR_ANGELS_ROBE
    "Auroral Armor": Info(301, ItemClassification.useful), #ITEM_EQUIP_ARMOR_AURORAL_ARMOUR
    "Dragon Dojo Duds": Info(305, ItemClassification.useful), #ITEM_EQUIP_ARMOR_DRAGON_DOJO_DUDS
    "Shimmering Dress": Info(307, ItemClassification.useful), #ITEM_EQUIP_ARMOR_SHIMMERING_DRESS
    "Godbird Armor": Info(331), #ITEM_EQUIP_ARMOR_GODBIRD_ARMOUR
    # EQUIPMENT ACCESSORIES
    "Dragon Scales": Info(7, quantity=3), #ITEM_EQUIP_ACCESSORY_DRAGON_SCALES
    "Wind Earrings": Info(20), #ITEM_EQUIP_ACCESSORY_WIND_EARRINGS
    "Ring of Clarity": Info(21, quantity=2), #ITEM_EQUIP_ACCESSORY_RING_OF_REASON
    "Mighty Armlet": Info(22, quantity=2), #ITEM_EQUIP_ACCESSORY_MIGHTY_ARMLET
    "Rousing Ring": Info(26, quantity=4), #ITEM_EQUIP_ACCESSORY_ALARM_RING
    "Rabbit Tail": Info(50, quantity=3), #ITEM_EQUIP_ACCESSORY_BUNNY_TAIL
    "Cower Ring": Info(51, quantity=4), #ITEM_EQUIP_ACCESSORY_COWER_RING
    "Restless Heart": Info(64, quantity=2), #ITEM_EQUIP_ACCESSORY_RESTLESS_HEART
    "Necklace of Immunity": Info(81), #ITEM_EQUIP_ACCESSORY_POISON_RESISTANCE_NECKLACE
    "Care Riviere": Info(93, quantity=5), #ITEM_EQUIP_ACCESSORY_SEALING_RESISTANCE_NECKLACE
    "Silver Rosary": Info(97, quantity=4), #ITEM_EQUIP_ACCESSORY_GOLD_ROSARY
    "Skull Ring": Info(105, quantity=2), #ITEM_EQUIP_ACCESSORY_SKULL_RING
    "Ruby Wristband": Info(106), #ITEM_EQUIP_ACCESSORY_RUBY_WRISTBAND
    "Leg Warmers": Info(107, quantity=2), #ITEM_EQUIP_ACCESSORY_LEG_WARMERS
    "Tough Guy Tatoo": Info(111, quantity=2), #ITEM_EQUIP_ACCESSORY_TOUGH_GUY_TATTOO
    "Gold Chain": Info(113, quantity=2), #ITEM_EQUIP_ACCESSORY_GOLD_CHAIN
    "Golden Tiara": Info(118), #ITEM_EQUIP_ACCESSORY_GOLDEN_TIARA
    "Recovery Ring": Info(123, quantity=3), #ITEM_EQUIP_ACCESSORY_RECOVERY_RING
    "Meteorite Bracer": Info(124, ItemClassification.useful), #ITEM_EQUIP_ACCESSORY_METEORITE_BRACER
    "Banishing Bell": Info(130, quantity=3), #ITEM_EQUIP_ACCESSORY_AMULET_BELL
    "Care Ring": Info(131, quantity=4), #ITEM_EQUIP_ACCESSORY_CARE_RING
    "Ten Ton Toupee": Info(137, quantity=2), #ITEM_EQUIP_ACCESSORY_TEN_TON_TOUPEE
    "Holy Talisman": Info(152, quantity=2), #ITEM_EQUIP_ACCESSORY_HOLY_SYMBOL_OF_AMULET
    "Doh-hican": Info(155, quantity=2), #ITEM_EQUIP_ACCESSORY_DOH_HICAN
    "Torc of Truth": Info(163), #ITEM_EQUIP_ACCESSORY_PHANTOM_RESISTANCE_NECKLACE
    "Asbestos Earrings": Info(166), #ITEM_EQUIP_ACCESSORY_ICE_EARRINGS
    "Dummy": Info(186, quantity=4), #ITEM_EQUIP_ACCESSORY_PACIFIER
    "Agility Ring": Info(191, quantity=2), #ITEM_EQUIP_ACCESSORY_AGILITY_RING
    "Spirit Bracer": Info(218, quantity=3), #ITEM_EQUIP_ACCESSORY_FAIRY_BANGLE
    "Hen's Tooth": Info(228, quantity=2), #ITEM_EQUIP_ACCESSORY_HENS_TOOTH
    "Full Moon Ring": Info(235, quantity=4), #ITEM_EQUIP_ACCESSORY_MANGETSU_RING
    "Garter": Info(244), #ITEM_EQUIP_ACCESSORY_GARTER
    "Weightlifter's Belt": Info(249), #ITEM_EQUIP_ACCESSORY_TITAN_BELT
    "Slime Earrings": Info(269), #ITEM_EQUIP_ACCESSORY_SLIME_EARRINGS
    "Goddess Ring": Info(291, ItemClassification.useful), #ITEM_EQUIP_ACCESSORY_GODDESS_RING
    "Sacred Amulet": Info(295, ItemClassification.progression | ItemClassification.useful), #ITEM_EQUIP_ACCESSORY_SACRED_AMULET
    "Anti-Freeze Earrings": Info(311), #ITEM_EQUIP_ACCESSORY_FLAME_EARRINGS
    "Elevating Shoes": Info(315, ItemClassification.useful), #ITEM_EQUIP_ACCESSORY_ELEVATING_SHOES
    # IMPORTANT
    "Wrecking Ball": Info(40, ItemClassification.progression, quantity=2), #ITEM_IMPORTANT_WRECKING_BALL
    "Progressive Key": Info(47, ItemClassification.progression | ItemClassification.useful, quantity=3), #ITEM_IMPORTANT_PROGRESSIVE_KEY (ITEM_IMPORTANT_THIEFS_KEY, ITEM_IMPORTANT_MAGIC_KEY, ITEM_IMPORTANT_ULTIMATE_KEY)
    #"World Map": Info(48, ItemClassification.useful), #ITEM_IMPORTANT_ADVENTURERS_MAP # not randomized
    "Wakey Dust": Info(90, ItemClassification.useful), #ITEM_IMPORTANT_WAKEY_DUST
    "Dreamstone": Info(98, ItemClassification.progression), #ITEM_IMPORTANT_DREAMSTONE
    "Royal Missive": Info(149, ItemClassification.progression), #ITEM_IMPORTANT_ROYAL_MISSIVE
    "Ship": Info(150, ItemClassification.progression | ItemClassification.useful), #ITEM_IMPORTANT_SHIP
    "Black Pepper": Info(164, ItemClassification.progression), #ITEM_IMPORTANT_BLACK_PEPPER
    "Words of Wisdom": Info(168, ItemClassification.useful, quantity=2), #ITEM_IMPORTANT_WORDS_OF_WISDOM
    "Green Orb": Info(181, ItemClassification.progression), #ITEM_IMPORTANT_GREEN_ORB
    "Ramia": Info(182, ItemClassification.progression | ItemClassification.useful), #ITEM_IMPORTANT_RAMIA
    "Forging Hammer": Info(184, ItemClassification.progression), #ITEM_IMPORTANT_HAMMER_OF_GAIA
    "Purple Orb": Info(192, ItemClassification.progression), #ITEM_IMPORTANT_PURPLE_ORB
    "Boatman's Bone": Info(197, ItemClassification.progression), #ITEM_IMPORTANT_BOATMANS_BONE
    "Red Orb": Info(201, ItemClassification.progression), #ITEM_IMPORTANT_RED_ORB
    "Yellow Orb": Info(211, ItemClassification.progression), #ITEM_IMPORTANT_YELLOW_ORB
    "Blue Orb": Info(219, ItemClassification.progression), #ITEM_IMPORTANT_BLUE_ORB
    "Zenithium": Info(220, ItemClassification.progression), #ITEM_IMPORTANT_BLUE_METAL
    "Bottomless Pot": Info(224, ItemClassification.progression), #ITEM_IMPORTANT_BOTTOMLESS_POT
    "Echo Flute": Info(225, ItemClassification.useful), #ITEM_IMPORTANT_ECHO_FLUTE
    "Mod Rod": Info(234, ItemClassification.progression), #ITEM_IMPORTANT_MOD_ROD
    "Ra's Mirror": Info(243, ItemClassification.progression), #ITEM_IMPORTANT_RAS_MIRROR
    "Lovers' Locket": Info(246, ItemClassification.progression), #ITEM_IMPORTANT_LOVERS_LOCKET
    "Silver Orb": Info(258, ItemClassification.progression), #ITEM_IMPORTANT_SILVER_ORB
    #"Alefgard Map": Info(264, ItemClassification.useful), #ITEM_IMPORTANT_FAERIE_MAP # not randomized
    "Rainbow Drop": Info(267, ItemClassification.progression), #ITEM_IMPORTANT_RAINBOW_DROP
    "Sunstone": Info(271, ItemClassification.progression), #ITEM_IMPORTANT_SUNSTONE
    "Orichalcum": Info(273, ItemClassification.progression), #ITEM_IMPORTANT_ORICHALCUM
    "Broken Blade": Info(277, ItemClassification.progression), #ITEM_IMPORTANT_BROKEN_SWORD
    "Faerie Flute": Info(285, ItemClassification.progression), #ITEM_IMPORTANT_FAERIE_FLUTE
    "More Buns N' Guns": Info(318, ItemClassification.useful), #ITEM_IMPORTANT_VERY_NAUGHTY_BOOK
    "Grand Medal": Info(333, ItemClassification.useful), #ITEM_IMPORTANT_GOLDEN_MEDAL
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
    classification = ALL_ITEMS[name].classification

    if name in {"Sword of Kings", "Gringham Whip", "Auroral Helm"} and not (world.options.victory_goal == "grand_dragon" or world.options.victory_goal == "medals_postgame"):
        classification = ItemClassification.useful

    return DQ3Item(name, classification, ALL_ITEMS[name].id, world.player)


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