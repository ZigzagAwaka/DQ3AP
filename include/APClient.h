#pragma once

#include "Logger.h"
#include "WorldData.h"

#include <string>
#include <filesystem>
#include <fstream>


/// @brief Archipelago client wrapper using APCpp
class APClient
{
public:
    /// @brief Create APClient with logger reference, and AP data paths
    /// @param logger Logger instance
    /// @param itemPath Path to AP items data file, will be created if it doesn't exist
    /// @param locationPath Path to AP locations data file, will be created if it doesn't exist
    /// @param optionPath Path to AP options data file, will be created if it doesn't exist
    APClient(Logger& logger, const std::string& itemPath, const std::string& locationPath, const std::string& optionPath);

    /// @brief Connect to Archipelago
    /// @param host Server host
    /// @param player Player name
    /// @param password Server password (optional)
    void Connect(const std::string& host, const std::string& player, const std::string& password = "");

    /// @brief Update the client (is called periodically) to process any new AP messages
    /// and recently checked ingame locations
    void Update();

    /// @brief Receive a location from Archipelago
    /// @param locationId The Id of the received location
    void ReceiveCheckedLocation(int64_t locationId);

    /// @brief Receive an item from Archipelago
    /// @param itemId The Id of the received item
    /// @param notify False if the item has already been notified/collected
    void ReceiveItem(int64_t itemId, bool notify);

    /// @brief Checks if the given location name is a victory event
    /// @param locationName The name of the given location to check
    /// @return True if the location is the correct configured victory or else false
    bool CheckVictoryLocation(const std::string& locationName);

    /// @brief When connected, write options to AP options data file, overriding previous content
    void WriteOptionData();

    /// @brief Clear and reset AP items and locations data files
    void ClearData();

    /// @brief Disconnect from Archipelago
    void Disconnect();

    /// @brief Check if client is connected
    /// @return True if connected
    bool IsConnected();

private:
    Logger& logger;

    const std::string itemDataPath;
    const std::string locationDataPath;
    const std::string optionDataPath;

    std::filesystem::file_time_type locationDataLastCheckTime;

    //std::ofstream itemFile;
    //std::ifstream locationFile;

    bool hasWroteOptions = false;
    int option_victory_goal = -1;

    /// @brief Create the specified AP data file if it doesn't exist,
    /// or clear it completely if it already exist
    /// @param filePath Path to the AP data file
    /// @param clearOnly Set to true to ignore file existing check and only clear the file, default to false
    void CreateOrClearFile(const std::string& filePath, bool clearOnly = false);
};
