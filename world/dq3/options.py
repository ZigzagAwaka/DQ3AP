from dataclasses import dataclass
from BaseClasses import Tutorial
from worlds.AutoWorld import WebWorld

from Options import Choice, OptionGroup, PerGameCommonOptions, Range, Toggle, DefaultOnToggle

# GAME OPTIONS

class VictoryGoal(Choice):
    """
    Choose the desired goal to mark the game as completed. Note that if you choose a goal that end the game before the postgame, then this will exclude every postgame locations. 
    - Zoma: Find a way to access Alefgard and defeat Zoma, the final boss of the game
    - Grand Dragon: Defeat Zoma to gain access to postgame areas then defeat the Grand Dragon, the final boss of the postgame
    - Medals: Find all 110 mini medals in the world to win
    - Medals postgame: Same as Medals but will also include postgame locations in the world
    - Baramos: Gain access to Baramos Castle then defeat Baramos, for shorter games
    """
    display_name = "Victory Goal"
    option_zoma = 0
    option_grand_dragon = 1
    option_medals = 2
    option_medals_postgame = 3
    option_baramos = 4
    default = 0

# LOCATIONS OPTIONS

class ContainerSanity(DefaultOnToggle):
    """
    Choose if all the containers in the game should be filled with random items (chests, barrels, pots, sacks, storages, ...).
    If disabled, then only the chests will be randomized, and other containers will be excluded (forced to contain filler items). This usually excludes 668 checks.
    Note that story related items not in chests will always be randomized.
    """
    display_name = "Container Sanity"

class HiddenGroundSanity(DefaultOnToggle):
    """
    Choose if "Hidden Ground" items should be randomized, those are items placed in pretty hard to find locations and are invisible unless you use the spell "Snoop".
    If disabled, then those items will be excluded and forced to have a filler item. This usually excludes 158 checks.
    If container_sanity is false, then this option will have no effect.
    """
    display_name = "Hidden Ground Sanity"

class SecretSpotsSanity(DefaultOnToggle):
    """
    Choose if containers in Secret Spots areas should be filled with random items, those are small hidden areas in the overworld.
    If disabled, then those areas will be excluded and forced to contain filler items. This usually excludes 202 checks.
    """
    display_name = "Secret Spots Sanity"

class OceanSecretSpotsSanity(DefaultOnToggle):
    """
    Choose if containers in Secret Spots areas located in the sea/ocean should be filled with random items, those are small hidden areas only accessible with the Ship.
    If disabled, then those areas will be excluded and forced to contain filler items. This usually excludes 39 checks.
    If secret_spots_sanity is false, then this option will have no effect.
    """
    display_name = "Ocean Secret Spots Sanity"

class ShinySpotsSanity(Choice):
    """
    Allows to choose how Shiny Spots locations are randomized, those are small shiny places in the overworld giving a pack of items when checked.
    - Vanilla: Shiny Spots in the overworld will not be randomized and will instead be vanilla
    - One check: Shiny Spots will contain 1 random item check. This adds around 344 more checks in the game.
    - Max checks: Shiny Spots will contain as many items checks as in vanilla (between 1 and 3). This adds around +1000 more checks in the game.
    """
    display_name = "Shiny Spots Sanity"
    option_vanilla = 0
    option_one_check = 1
    option_max_checks = 2
    default = 0

# ITEMS OPTIONS

class ShipSettings(Choice):
    """
    Allows to configure how the Ship is randomized.
    - Vanilla: The Ship will be rewarded by the Portoga King after giving him the Black Pepper item
    - Anywhere: The Ship will be randomized anywhere in the multiworld
    - Start with: You will start the game with the Ship already unlocked near Portoga, use the spell "Zoom" or a "Chimera Wing" item to teleport it near you
    """
    display_name = "Ship Settings"
    option_vanilla = 0
    option_anywhere = 1
    option_start_with = 2
    default = 0

class RamiaSettings(Choice):
    """
    Allows to configure how Ramia (the bird) is randomized.
    - Vanilla: Ramia will be obtained by offering the 6 Orbs to the altars in the Shrine of the Everbird
    - Anywhere: Ramia will be randomized anywhere in the multiworld
    - Start with: You will start the game with Ramia already unlocked near Alltrades Abbey, use the spell "Zoom" or a "Chimera Wing" item to teleport it near you
    """
    display_name = "Ramia Settings"
    option_vanilla = 0
    option_anywhere = 1
    option_start_with = 2
    default = 0

class RainbowDropShuffle(Toggle):
    """
    The Rainbow Drop is an important item that allows you to create the rainbow bridge to Zoma's Castle, where the final boss of the game resides.
    Enable this option to have it be randomized anywhere in the multiworld.
    If disabled, it will instead be placed in it's vanilla location, which is the reward from Sanctum's priest after giving him the Sacred Amulet, the Staff of Rain and the Sunstone.
    """
    display_name = "Shuffle Rainbow Drop"

# TRAPS OPTIONS

class ShuffleCanniboxTraps(DefaultOnToggle):
    """
    Enable this option to shuffle 7 Cannibox Traps in the item pool.
    If disabled, it will replace those with random filler items.
    """
    display_name = "Shuffle Cannibox Traps"

class ShuffleMimicTraps(DefaultOnToggle):
    """
    Enable this option to shuffle 19 Mimic Traps in the item pool.
    If disabled, it will replace those with random filler items.
    """
    display_name = "Shuffle Mimic Traps"

class ShufflePandoraBoxTraps(DefaultOnToggle):
    """
    Enable this option to shuffle 10 Pandora's Box Traps in the item pool.
    If disabled, it will replace those with random filler items.
    """
    display_name = "Shuffle Pandora's Box Traps"

# MISC OPTIONS

class AliahanKingSpecialGifts(DefaultOnToggle):
    """
    Allows the scene with the Aliahan King at the start of the game to give you additionnal gifts:
    - A pack of x10 "Chimera Wings" items for easier early game progression
    - The main World Map if not already obtained
    - The story flag that will allow you to change the Hero's hair color in Alltrades Abbey
    """
    display_name = "Aliahan King's special gifts"

# Put all options in a dataclass
@dataclass
class DQ3Options(PerGameCommonOptions):
    victory_goal: VictoryGoal
    container_sanity: ContainerSanity
    hidden_ground_sanity: HiddenGroundSanity
    secret_spots_sanity: SecretSpotsSanity
    ocean_secret_spots_sanity: OceanSecretSpotsSanity
    shiny_spots_sanity: ShinySpotsSanity
    ship_settings: ShipSettings
    ramia_settings: RamiaSettings
    shuffle_rainbow_drop: RainbowDropShuffle
    shuffle_cannibox: ShuffleCanniboxTraps
    shuffle_mimic: ShuffleMimicTraps
    shuffle_pandorabox: ShufflePandoraBoxTraps
    aliahan_king_special_gifts: AliahanKingSpecialGifts


# Group options by similar type (options not in a group will be displayed under the "Game Options" default group)
groups = [
    OptionGroup(
        "Locations Options",
        [ContainerSanity, HiddenGroundSanity, SecretSpotsSanity, OceanSecretSpotsSanity, ShinySpotsSanity],
    ),
    OptionGroup(
        "Items Options",
        [ShipSettings, RamiaSettings, RainbowDropShuffle],
    ),
    OptionGroup(
        "Traps Options",
        [ShuffleCanniboxTraps, ShuffleMimicTraps, ShufflePandoraBoxTraps],
    ),
    OptionGroup(
        "Misc Options",
        [AliahanKingSpecialGifts],
    ),
]


# Class to display options on the website (not used for this game)
class DQ3WebWorld(WebWorld):
    game = "Dragon Quest III HD-2D Remake"
    theme = "grassFlowers"
    option_groups = groups
