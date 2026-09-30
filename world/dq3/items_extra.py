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
    "x3 Musks": Info(424, type=Type.SHINY), #MULTIPLE_3_ITEM_USE_ITEM_POUCH_OF_MUSK
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
    "x2 Musks": Info(436, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_POUCH_OF_MUSK
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
    "x2 Tanglewebs": Info(453, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_TANGLEWEB
    "x4 Dazzle-me-nots": Info(454, type=Type.SHINY), #MULTIPLE_4_ITEM_USE_ITEM_DEDAZZLE_GRASS
    "464 Gold": Info(455, type=Type.SHINY), #GOLD_464
    # see items.py 456
    # see items.py 457
    "1276 Gold": Info(458, type=Type.SHINY), #GOLD_1276
    # see items.py 459
    "x2 Coagulants": Info(460, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_COAGULANT
    "465 Gold": Info(461, type=Type.SHINY), #GOLD_465
    "845 Gold": Info(462, type=Type.SHINY), #GOLD_845
    "2214 Gold": Info(463, type=Type.SHINY), #GOLD_2214
    "x2 Fading Jennies": Info(464, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_FADING_JENNY
    "x2 Dieamends": Info(465, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_DIEAMEND
    "x2 Plain Clothes": Info(466, type=Type.SHINY), #MULTIPLE_2_ITEM_EQUIP_ARMOR_PLAIN_CLOTHES
    "x2 Oaken Clubs": Info(467, type=Type.SHINY), #MULTIPLE_2_ITEM_EQUIP_WEAPON_OAKEN_CLUB
    "x2 Oomph Powders": Info(468, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_OOMPH_POWDER
    # see items.py 469
    "326 Gold": Info(470, type=Type.SHINY), #GOLD_326
    "227 Gold": Info(471, type=Type.SHINY), #GOLD_227
    "1060 Gold": Info(472, type=Type.SHINY), #GOLD_1060
    "x3 Magic Waters": Info(473, type=Type.SHINY), #MULTIPLE_3_ITEM_USE_ITEM_MAGIC_WATER
    "357 Gold": Info(474, type=Type.SHINY), #GOLD_357
    "984 Gold": Info(475, type=Type.SHINY), #GOLD_984
    "732 Gold": Info(476, type=Type.SHINY), #GOLD_732
    "834 Gold": Info(477, type=Type.SHINY), #GOLD_834
    "137 Gold": Info(478, type=Type.SHINY), #GOLD_137
    "2180 Gold": Info(479, type=Type.SHINY), #GOLD_2180
    "x2 Chain Sickles": Info(480, type=Type.SHINY), #MULTIPLE_2_ITEM_EQUIP_WEAPON_CHAIN_SICKLE
    "x2 Iron Helmets": Info(481, type=Type.SHINY), #MULTIPLE_2_ITEM_EQUIP_HELMET_IRON_HELMET
    # see items.py 482
    "x2 Sage's Elixir": Info(483, type=Type.SHINY), #MULTIPLE_2_ITEM_USE_ITEM_SAGES_ELIXIR
    # see items.py 484
    "1258 Gold": Info(485, type=Type.SHINY), #GOLD_1258
    "x4 Musks": Info(486, type=Type.SHINY), #MULTIPLE_4_ITEM_USE_ITEM_POUCH_OF_MUSK
    "x2 Wayfarer's Clothes": Info(487, type=Type.SHINY), #MULTIPLE_2_ITEM_EQUIP_ARMOR_WAYFARERS_CLOTHES
    "378 Gold": Info(488, type=Type.SHINY), #GOLD_378
    "515 Gold": Info(489, type=Type.SHINY), #GOLD_515
    "441 Gold": Info(490, type=Type.SHINY), #GOLD_441
    "2137 Gold": Info(491, type=Type.SHINY), #GOLD_2137
    "272 Gold": Info(492, type=Type.SHINY), #GOLD_272
    "249 Gold": Info(493, type=Type.SHINY), #GOLD_249
    "431 Gold": Info(494, type=Type.SHINY), #GOLD_431
    "116 Gold": Info(495, type=Type.SHINY), #GOLD_116
    "x2 Turbans": Info(496, type=Type.SHINY), #MULTIPLE_2_ITEM_EQUIP_HELMET_TURBAN
    "578 Gold": Info(497, type=Type.SHINY), #GOLD_578
    "896 Gold": Info(498, type=Type.SHINY), #GOLD_896
    "654 Gold": Info(499, type=Type.SHINY), #GOLD_654
    "1289 Gold": Info(500, type=Type.SHINY), #GOLD_1289
    "x4 Magic Waters": Info(501, type=Type.SHINY), #MULTIPLE_4_ITEM_USE_ITEM_MAGIC_WATER
    # see items.py 502
    "x2 Torcs of Truth": Info(503, type=Type.SHINY), #MULTIPLE_2_ITEM_EQUIP_ACCESSORY_PHANTOM_RESISTANCE_NECKLACE
    "x3 Chimera Wings": Info(504, type=Type.SHINY), #MULTIPLE_3_ITEM_USE_ITEM_CHIMERA_WING
    "483 Gold": Info(505, type=Type.SHINY), #GOLD_483
    "224 Gold": Info(506, type=Type.SHINY), #GOLD_224
    "x3 Plain Clothes": Info(507, type=Type.SHINY), #MULTIPLE_3_ITEM_EQUIP_ARMOR_PLAIN_CLOTHES
    "3370 Gold": Info(508, type=Type.SHINY), #GOLD_3370
    "1260 Gold": Info(509, type=Type.SHINY), #GOLD_1260
    "961 Gold": Info(510, type=Type.SHINY), #GOLD_961
    # see items.py 511
    "1812 Gold": Info(512, type=Type.SHINY), #GOLD_1812
    "3319 Gold": Info(513, type=Type.SHINY), #GOLD_3319
    "233 Gold": Info(514, type=Type.SHINY), #GOLD_233
    "2774 Gold": Info(515, type=Type.SHINY), #GOLD_2774
    "5831 Gold": Info(516, type=Type.SHINY), #GOLD_5831
    # see items.py 517
    "617 Gold": Info(518, type=Type.SHINY), #GOLD_617
    "487 Gold": Info(519, type=Type.SHINY), #GOLD_487
    "655 Gold": Info(520, type=Type.SHINY), #GOLD_655
    "1757 Gold": Info(521, type=Type.SHINY), #GOLD_1757
    "782 Gold": Info(522, type=Type.SHINY), #GOLD_782
    # see items.py 523
    # see items.py 524
    "657 Gold": Info(525, type=Type.SHINY), #GOLD_657
    # see items.py 526
    "426 Gold": Info(527, type=Type.SHINY), #GOLD_426
}