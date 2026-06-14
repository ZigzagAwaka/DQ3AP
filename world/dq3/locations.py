from __future__ import annotations

from typing import TYPE_CHECKING

from BaseClasses import ItemClassification, Location

from . import items

if TYPE_CHECKING:
    from .world import DQ3World


# Every location must have a unique integer ID associated with it
LOCATION_NAME_TO_ID = {
    "[Aliahan] Barrel 0": 1,
    "[Aliahan] Barrel 1": 2,
    "[Aliahan] Pot 0": 3,
    "[Aliahan] Pot 1": 4,
    "[Aliahan] Ground 0": 5,
    "[Aliahan] Ground 1": 6,
    "[Aliahan] Ground 2": 7,
    "[Aliahan] Ground 3": 8,
    "[Aliahan] Chest": 9,
    "[Aliahan] House Barrel": 10,
    "[Aliahan] House Drawer 0": 11,
    "[Aliahan] House Drawer 1": 12,
    "[Aliahan] House Pot": 13,
    "[Aliahan] House Drawer 2": 14,
    #"[Aliahan] House Bookshelf": 15, # no items here
    "[Aliahan] Inn Sack 0": 16,
    "[Aliahan] Inn Sack 1": 17,
    "[Aliahan] Inn Storage": 18,
    "[Aliahan] Inn Pot 0": 19,
    "[Aliahan] Inn Pot 1": 20,
    "[Aliahan] Tavern Barrel": 21,
    "[Aliahan] Tavern Pot": 22,
    "[Aliahan Castle] 1F Barrel 0": 23,
    "[Aliahan Castle] 1F Barrel 1": 24,
    "[Aliahan Castle] 1F Barrel 2": 25,
    "[Aliahan Castle] 1F Barrel 3": 26,
    "[Aliahan Castle] 1F Chest 0": 27,
    "[Aliahan Castle] 1F Chest 1": 28,
    "[Aliahan Castle] 1F Chest 2": 29,
    "[Aliahan Castle] 1F Chest 3": 30,
    "[Aliahan Castle] 1F Chest 4": 31,
    "[Aliahan Castle] 1F Chest 5": 32,
    "[Aliahan Castle] 1F Pot 0": 33,
    "[Aliahan Castle] 1F Pot 1": 34,
    "[Aliahan Castle] 1F Ground 0": 35,
    "[Aliahan Castle] 1F Ground 1": 36,
    "[Aliahan Castle] 1F Drawer": 37,
    "[Aliahan Castle] 1F Barrel 4": 38,
    "[Aliahan Castle] 1F Pot 2": 39,
    "[Aliahan Castle] 2F Storage": 40,
    "[Aliahan Castle] 2F Ground": 41,
    "[Aliahan Castle] 1F Pot 3": 42,
    "[Aliahan Castle] 1F Pot 4": 43,
    "[Aliahan Castle] 1F Barrel 5": 44,
    "[Aliahan Castle] 1F Pot 5": 45,
    "[Aliahan Castle] 1F Barrel 6": 46,
}


class DQ3Location(Location):
    game = "Dragon Quest III HD-2D Remake"


# Helper method that takes a list of location names and returns them as a dict with their IDs
def get_location_names_with_ids(location_names: list[str]) -> dict[str, int | None]:
    return {location_name: LOCATION_NAME_TO_ID[location_name] for location_name in location_names}

# Helper method that returns a list of location names whose prefix exactly matches the given prefix
# or any of the optional other given prefixes
def get_locations_by_prefix(prefix: str, *other_prefixes: str) -> list[str]:
    prefixes = {prefix, *other_prefixes}
    return [location_name for location_name in LOCATION_NAME_TO_ID.keys() 
            if location_name.split("]")[0][1:] in prefixes]


def create_all_locations(world: DQ3World) -> None:
    create_regular_locations(world)
    create_events(world)


def create_regular_locations(world: DQ3World) -> None:
    aliahan = world.get_region("Aliahan")

    aliahan_locations = get_location_names_with_ids(get_locations_by_prefix("Aliahan", "Aliahan Castle"))
    aliahan.add_locations(aliahan_locations, DQ3Location)


def create_events(world: DQ3World) -> None:
    pass