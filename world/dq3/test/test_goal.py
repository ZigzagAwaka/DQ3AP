from .bases import DQ3TestBase

from BaseClasses import ItemClassification, LocationProgressType


class TestVictoryZoma(DQ3TestBase):
    options = {
        "victory_goal": "zoma",
    }

    def test_postgame_excluded(self) -> None:
        """
        Tests if postgame locations are excluded for Zoma victory goal
        """
        for location in self.world.get_locations():

            region = location.name.split("]")[0][1:]

            if region in {"???", "Cloudsgate Citadel", "Citadel Tower", "Temple of Trials"}:
                self.assertTrue(location.progress_type == LocationProgressType.EXCLUDED)

            elif region in {"Cantlin", "Lozamii", "Jipang", "Theddon"} and location.name in {
                "[Cantlin] Hidden Ground near flowers of left house",
                "[Lozamii] Hidden Ground near the telescope in right house",
                "[Jipang] Pot near stairs in Monster Arena",
                "[Jipang] Barrel on the back right side of the Monster Arena",
                "[Theddon] Hidden Ground on the cross in the bottom right area"}:
                self.assertTrue(location.progress_type == LocationProgressType.EXCLUDED)

            else:
                self.assertTrue(location.progress_type == LocationProgressType.DEFAULT)



class TestVictoryBaramos(DQ3TestBase):
    options = {
        "victory_goal": "baramos",
    }

    def test_postbaramaos_excluded(self) -> None:
        """
        Tests if post-baramos locations are excluded for Baramos victory goal
        """
        for location in self.world.get_locations():

            region = location.name.split("]")[0][1:]

            if region in {"???", "Cloudsgate Citadel", "Citadel Tower", "Temple of Trials", 
                          "Castle of the Dragon Queen", "West Tantegel Harbour", "Galen's House", "Sanctum",
                          "Tantegel", "Tantegel Castle", "Damdara", "Cantlin", "Shrine of the Spirit", "Rimuldar",
                          "Quagmire Cave", "Kol", "Craggy Cave", "Talontear Tunnel", "Tower of Rubiss", "Zoma's Citadel", "Alefgard Overworld"}:
                self.assertTrue(location.progress_type == LocationProgressType.EXCLUDED)

            elif region in {"Cantlin", "Lozamii", "Jipang", "Theddon", "Portoga", "Reeve", "Asham"} and location.name in {
                "[Cantlin] Hidden Ground near flowers of left house",
                "[Lozamii] Hidden Ground near the telescope in right house",
                "[Jipang] Pot near stairs in Monster Arena",
                "[Jipang] Barrel on the back right side of the Monster Arena",
                "[Theddon] Hidden Ground on the cross in the bottom right area",
                "[Portoga] Gift from woman in the bottom right area after defeating Baramos",
                "[Reeve] Second gift from Old Man in top right house after talking to the man in Quagmire Cave",
                "[Asham] Gift from Theather manager after talking to the girl in Damdara's Inn",
                "[Jipang] On ground in top left house after talking to Kol's blacksmith"}:
                self.assertTrue(location.progress_type == LocationProgressType.EXCLUDED)

            else:
                self.assertTrue(location.progress_type == LocationProgressType.DEFAULT)



class TestVictoryMedals(DQ3TestBase):
    options = {
        "victory_goal": "medals",
    }

    def test_postgame_excluded(self) -> None:
        """
        Tests if postgame locations are excluded for Medals victory goal
        """
        TestVictoryZoma.test_postgame_excluded(self)

    def test_medals_classification(self) -> None:
        """
        Tests if Mini Medals items are considered progression for Medals victory goal
        """
        medals = self.get_items_by_name("Mini Medal")

        self.assertEqual(len(medals), 110)
        self.assertTrue(all(medal.useful for medal in medals))
        self.assertTrue(all(medal.skip_in_prog_balancing for medal in medals))



class TestVictoryMedalsPostgame(DQ3TestBase):
    options = {
        "victory_goal": "medals_postgame",
    }

    def test_medals_classification(self) -> None:
        TestVictoryMedals.test_medals_classification(self)