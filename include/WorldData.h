#pragma once

#include <unordered_map>
#include <cstdint>
#include <set>
#include <string>
#include <iostream>


/// @brief Data class for AP specific items/locations
class WorldData
{
public:
    WorldData() = delete;

    /// @brief Returns the corresponding location id from the given location name
    /// @param locationName Name of the searched location
    /// @return Location id, or -1 if not found
    static int GetLocationId(const std::string& locationName)
    {
        auto it = locations.find(locationName);
        return it != locations.end() ? it->second : -1;
    }

    /// @brief Returns the corresponding item name from the given item id
    /// @param itemId Id of the searched item
    /// @return Item name, or empty string if not found
    static std::string GetItemName(int itemId)
    {
        auto it = items.find(itemId);
        return it != items.end() ? it->second : std::string();
    }

    /// @brief Checks if the given location name is a victory location
    /// @param locationName Name of the searched location
    /// @return The id of the victory location, or -1 if it's not a victory location
    static int IsLocationVictory(const std::string& locationName)
    {
        auto it = victory_locations.find(locationName);
        return it != victory_locations.end() ? it->second : -1;
    }

    /// @brief Returns the set of hints ids from the given check name
    /// @param checkName Name of the check to hint
    /// @return The ids of the hints corresponding to that check, or an empty set if the check has no associated ids
    static std::set<int64_t> GetHintIds(const std::string& checkName)
    {
        auto it = hints.find(checkName);
        return it != hints.end() ? it->second : std::set<int64_t>();
    }

    /// @brief Returns the corresponding location name from the given location id
    /// @param locationId Id of the searched location
    /// @return Location name, or empty string if not found
    static std::string GetLocationName(int locationId)
    {
        if (rev_locations.empty()) SetupRevLocationsMap();
        auto it = rev_locations.find(locationId);
        return it != rev_locations.end() ? it->second : std::string();
    }

private:
    /// @brief Associate ingame locations names to their AP specific unique ID
    static const std::unordered_map<std::string, int> locations;

    /// @brief Associate items AP specific unique IDs to their respective ingame name
    static const std::unordered_map<int, std::string> items;

    /// @brief Contains every locations names that when received will send the victory event to AP
    static const std::unordered_map<std::string, int> victory_locations;

    /// @brief Contains every hints string ids associated to one or multiple location AP IDs
    static const std::unordered_map<std::string, std::set<int64_t>> hints;

    /// @brief Associate locations AP specific unique IDs to their respective ingame name
    /// (basically, the reverse of std::unordered_map<std::string, int> locations)
    static std::unordered_map<int, std::string> rev_locations;

    /// @brief Lazy fillup of rev_locations based on locations
    static void SetupRevLocationsMap()
    {
        for (const auto& [key, value] : locations)
        {
            rev_locations[value] = key;
        }
    }
};
