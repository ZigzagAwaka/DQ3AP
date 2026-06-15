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
    APClient(Logger& logger, const std::string& itemPath, const std::string& locationPath);

    /// @brief Connect to Archipelago
    /// @param host Server host
    /// @param player Player name
    /// @param password Server password (optional)
    void Connect(const std::string& host, const std::string& player, const std::string& password = "");
        
    /// @brief Update the client (is called periodically) to process any new AP messages
    /// and recently checked ingame locations
    void Update();

    /// @brief Receive a location from Archipelago (not checked ingame, but forced checked by the server)
    /// @param locationId The Id of the received location
    void ReceiveCheckedLocation(int64_t locationId);

    /// @brief Receive an item from Archipelago
    /// @param itemId The Id of the received item
    void ReceiveItem(int64_t itemId);

    /// @brief Clear and reset AP data files
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
    //std::ofstream itemFile;
    //std::ifstream locationFile;
};
