from test.bases import WorldTestBase

from ..world import DQ3World


# Testing using WorldTestBase (perform generic tests)
# And then perform custom tests in this folder
class DQ3TestBase(WorldTestBase):
    game = "Dragon Quest III HD-2D Remake"
    world: DQ3World
