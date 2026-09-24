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
    "350 Gold": Info(381, type=Type.SHINY), #GOLD_350
    "x2 Antidotal Herbs": Info(382, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_ANTIDOTAL_HERB
    "x3 Moonwort Bulbs": Info(383, type=Type.SHINY), #MULTIPLE_3_ITEM_USE_ITEM_MOONWORT_BULB
    "x2 Copper Swords": Info(384, type=Type.SHINY), #MULTIPLE_2_ITEM_EQUIP_WEAPON_COPPER_SWORD
    "x2 Leather Armors": Info(385, type=Type.SHINY), #MULTIPLE_2_ITEM_EQUIP_ARMOR_LEATHER_ARMOUR
    "x3 Antidotal Herbs": Info(386, type=Type.SHINY), #MULTIPLE_3_ITEM_USE_ITEM_ANTIDOTAL_HERB
    "x4 Antidotal Herbs": Info(387, type=Type.SHINY), #MULTIPLE_4_ITEM_USE_ITEM_ANTIDOTAL_HERB
    # see items.py 388
    "x3 Coagulants": Info(389, type=Type.SHINY), #MULTIPLE_3_ITEM_USE_ITEM_COAGULANT
    "x2 Seeds of Wisdom": Info(390, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_SEED_OF_WISDOM
    "x3 Seeds of Stamina": Info(391, type=Type.SHINY), #MULTIPLE_3_ITEM_USE_ITEM_SEED_OF_RESILIENCE
    "x3 Holy Waters": Info(392, type=Type.SHINY), #MULTIPLE_3_ITEM_USE_ITEM_HOLY_WATER
    "374 Gold": Info(393, type=Type.SHINY), #GOLD_374
    "x2 Moonwort Bulbs": Info(394, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_MOONWORT_BULB
    "x3 Strong Medicine": Info(395, type=Type.SHINY), #MULTIPLE_3_ITEM_USE_ITEM_STRONG_MEDICINE
    "x2 Strong Medicine": Info(396, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_STRONG_MEDICINE
    "x2 Unsealants": Info(397, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_WHISPERING_NECTAR
    "x2 Seeds of Agility": Info(398, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_SEED_OF_AGILITY
    # see items.py 399
    "x3 Medicinal Herbs": Info(400, type=Type.SHINY), #MULTIPLE_3_ITEM_USE_ITEM_MEDICAL_HERB
    "x3 Special Medicine": Info(401, type=Type.SHINY), #MULTIPLE_3_ITEM_USE_ITEM_SPECIAL_MEDICINE
    "x2 Dazzle-me-nots": Info(402, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_DEDAZZLE_GRASS
    "x2 Seeds of Strength": Info(403, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_SEED_OF_STRENGTH
    "x2 Chimera Wings": Info(404, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_CHIMERA_WING
    "x2 Feathered Caps": Info(405, type=Type.SHINY), #MULTIPLE_2_ITEM_EQUIP_HELMET_FEATHERED_CAP
    "x4 Turbans": Info(406, type=Type.SHINY), #MULTIPLE_4_ITEM_EQUIP_HELMET_TURBAN
    "x2 Boxer Shorts": Info(407, type=Type.SHINY), #MULTIPLE_2_ITEM_EQUIP_ARMOR_BOXER_SHORTS
    "300 Gold": Info(408, type=Type.SHINY), #GOLD_300
    "x3 Copper Swords": Info(409, type=Type.SHINY), #MULTIPLE_3_ITEM_EQUIP_WEAPON_COPPER_SWORD
    "x2 Scale Shields": Info(410, type=Type.SHINY), #MULTIPLE_2_ITEM_EQUIP_SHIELD_SCALE_SHIELD
    "774 Gold": Info(411, type=Type.SHINY), #GOLD_774
    "343 Gold": Info(412, type=Type.SHINY), #GOLD_343
    "228 Gold": Info(413, type=Type.SHINY), #GOLD_228
    "520 Gold": Info(414, type=Type.SHINY), #GOLD_520
    "1560 Gold": Info(415, type=Type.SHINY), #GOLD_1560
    "x3 Bronze Knives": Info(416, type=Type.SHINY), #MULTIPLE_3_ITEM_EQUIP_WEAPON_BRONZE_KNIFE
    "x4 Moonwort Bulbs": Info(417, type=Type.SHINY), #MULTIPLE_4_ITEM_USE_ITEM_MOONWORT_BULB
    # see items.py 418
    "422 Gold": Info(419, type=Type.SHINY), #GOLD_422
    "x3 Angel Bells": Info(420, type=Type.SHINY), #MULTIPLE_3_ITEM_USE_ITEM_SKYBELL
    "532 Gold": Info(421, type=Type.SHINY), #GOLD_532
    "321 Gold": Info(422, type=Type.SHINY), #GOLD_321
    "x2 Angel Bells": Info(423, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_SKYBELL
    "x3 Musk": Info(424, type=Type.SHINY), #MULTIPLE_3_ITEM_USE_ITEM_POUCH_OF_MUSK
    "x2 Special Medicine": Info(425, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_SPECIAL_MEDICINE
    "772 Gold": Info(426, type=Type.SHINY), #GOLD_772
    "x2 Divine Daggers": Info(427, type=Type.SHINY), #MULTIPLE_2_ITEM_EQUIP_WEAPON_DIVINE_DAGGER
    "x2 Bronze Knives": Info(428, type=Type.SHINY), #MULTIPLE_2_ITEM_EQUIP_WEAPON_BRONZE_KNIFE
    "x4 Medicinal Herbs": Info(429, type=Type.SHINY), #MULTIPLE_4_ITEM_USE_ITEM_MEDICAL_HERB
    "x5 Antidotal Herbs": Info(430, type=Type.SHINY), #MULTIPLE_5_ITEM_USE_ITEM_ANTIDOTAL_HERB
    "x2 Seeds of Defence": Info(431, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_SEED_OF_PROTECTION
    "429 Gold": Info(432, type=Type.SHINY), #GOLD_429
    "x6 Holy Waters": Info(433, type=Type.SHINY), #MULTIPLE_6_ITEM_USE_ITEM_HOLY_WATER
    "3014 Gold": Info(434, type=Type.SHINY), #GOLD_3014
    "x3 Cypress Sticks": Info(435, type=Type.SHINY), #MULTIPLE_3_ITEM_EQUIP_WEAPON_CYPRESS_STICK
    "x2 Musk": Info(436, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_POUCH_OF_MUSK
    "x2 Boomerangs": Info(437, type=Type.SHINY), #MULTIPLE_2_ITEM_EQUIP_WEAPON_BOOMERANG
    "245 Gold": Info(438, type=Type.SHINY), #GOLD_245
    "798 Gold": Info(439, type=Type.SHINY), #GOLD_798
    # see items.py 440
    "x3 Tanglewebs": Info(441, type=Type.SHINY), #MULTIPLE_3_ITEM_USE_ITEM_TANGLEWEB
    "122 Gold": Info(442, type=Type.SHINY), #GOLD_122
    # see items.py 443
    # see items.py 444
    "x3 Unsealants": Info(445, type=Type.SHINY), #MULTIPLE_3_ITEM_USE_ITEM_WHISPERING_NECTAR
    "x2 Seeds of Life": Info(446, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_SEED_OF_LIFE
    "x2 Magic Waters": Info(447, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_MAGIC_WATER
    # see items.py 448
    # see items.py 449
    "132 Gold": Info(450, type=Type.SHINY), #GOLD_132
    "468 Gold": Info(451, type=Type.SHINY), #GOLD_468
    "x2 Seeds of Stamina": Info(452, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_SEED_OF_RESILIENCE
}