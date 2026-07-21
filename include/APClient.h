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
    /// @brief Create APClient with logger reference, and AP data paths that will be created if it doesn't exist
    /// @param logger Logger instance
    /// @param itemPath Path to AP items data file
    /// @param locationPath Path to AP locations data file
    /// @param optionPath Path to AP options data file
    /// @param hostPath Path to AP host information data file
    APClient(
        Logger& logger,
        const std::string& itemPath,
        const std::string& locationPath,
        const std::string& optionPath,
        const std::string& hostPath
    );

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
    const std::string hostDataPath;

    std::filesystem::file_time_type locationDataLastCheckTime;
    std::string currentHost = "";

    //std::ofstream itemFile;
    //std::ifstream locationFile;

    // the following member variables are all received from client callback

    int option_victory_goal = -1;
    // wip

    /// @brief Create the specified AP data file if it doesn't exist,
    /// or clear it completely if it already exist (depending on parameters)
    /// @param filePath Path to the AP data file
    /// @param create Set to true to create the file, default to true
    /// @param clear Set to true to clear the file, default to true
    void CreateOrClearFile(const std::string& filePath, bool create = true, bool clear = true);

    /// @brief Write the current host value to AP host data file
    void SetLastHost();

    /// @brief Reads the host value from AP host data file and returns if it is the current host
    /// @return True if the latest host is also the current host
    bool IsKnownHost();
};
