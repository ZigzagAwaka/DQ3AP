from dataclasses import dataclass
from BaseClasses import Tutorial
from worlds.AutoWorld import WebWorld

from Options import Choice, OptionGroup, PerGameCommonOptions, Range, Toggle, DefaultOnToggle


class ContainerSanity(DefaultOnToggle):
    """
    Choose whether to have all the containers in the game to be filled with random items.
    If this option is false, then only the chests will be randomized.
    """

    display_name = "Container Sanity"


# Put all options in a dataclass
@dataclass
class DQ3Options(PerGameCommonOptions):
    container_sanity: ContainerSanity


# Class to display options on the website (not used for this game)
class DQ3WebWorld(WebWorld):
    game = "Dragon Quest III HD-2D Remake"

    theme = "grassFlowers"
