#pragma once

#include <unordered_map>
#include <string>
#include <iostream>


/// @brief Data class for AP specific items/locations
class WorldData
{
public:
    WorldData() = delete;

    /// @brief Returns the corresponding location id from the given location name
    /// @param locationName
    /// @return Location id
    static int GetLocationId(const std::string& locationName);

    /// @brief Returns the corresponding item name from the given item id
    /// @param itemId
    /// @return Item name
    static std::string GetItemName(int itemId);

private:
    /// @brief Associate ingame locations names to their AP specific unique ID
    static const std::unordered_map<std::string, int> locations;

    /// @brief Associate items AP specific unique IDs to their respective ingame name
    static const std::unordered_map<int, std::string> items;
};
