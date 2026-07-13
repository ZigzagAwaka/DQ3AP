from dataclasses import dataclass
from BaseClasses import Tutorial
from worlds.AutoWorld import WebWorld

from Options import Choice, OptionGroup, PerGameCommonOptions, Range, Toggle, DefaultOnToggle


class VictoryGoal(Choice):
    """
    Choose the desired goal to mark the game as completed.
    - Zoma: Find a way to access Alefgard and defeat Zoma, the final boss of the game (choosing this option will exclude every postgame locations)
    - Grand Dragon: Defeat Zoma to gain access to postgame areas then defeat the Grand Dragon, the final boss of the postgame
    - Medals: Find all 110 mini medals in the world to win (choosing this option will exclude every postgame locations)
    - Medals postgame: Same as Medals but will also include postgame locations in the world
    """
    display_name = "Victory Goal"
    option_zoma = 0
    option_grand_dragon = 1
    option_medals = 0 #wip, defaults to zoma, not finished
    option_medals_postgame = 0 #wip, defaults to zoma, not finished
    default = 0


class ContainerSanity(DefaultOnToggle):
    """
    Choose whether to have all the containers in the game to be filled with random items.
    If this option is false, then only the chests will be randomized.
    """
    display_name = "Container Sanity"


# Put all options in a dataclass
@dataclass
class DQ3Options(PerGameCommonOptions):
    victory_goal: VictoryGoal
    container_sanity: ContainerSanity


# Class to display options on the website (not used for this game)
class DQ3WebWorld(WebWorld):
    game = "Dragon Quest III HD-2D Remake"
    theme = "grassFlowers"
