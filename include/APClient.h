#pragma once

#include "Logger.h"
#include "WorldData.h"

#include <string>
#include <filesystem>
#include <system_error>
#include <fstream>
#include <vector>
#include <unordered_map>
#include <tuple>


/// @brief Archipelago client wrapper using APCpp
class APClient
{
public:
    /// @brief Create APClient with logger reference, and AP data paths that will be created if it doesn't exist
    /// @param logger Logger instance
    /// @param itemPath Path to AP items data file
    /// @param locationPath Path to AP locations data file
    /// @param optionPath Path to AP options data file
    /// @param roomPath Path to AP current room informations data file
    /// @param medalsPath Path to AP stored medals data file
    APClient(
        Logger& logger,
        const std::string& itemPath,
        const std::string& locationPath,
        const std::string& optionPath,
        const std::string& roomPath,
        const std::string& medalsPath
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

    /// @brief Clear and reset AP related data files
    void ClearData();

    /// @brief Read AP room data file and gets the latest values in it
    /// @return A tuple for the saved host, player and password
    std::tuple<std::string, std::string, std::string> GetLatestRoomData();

    /// @brief Sync the previousHost's medals data to the current host's medals data
    /// @param previousHost Previous server host
    void SyncMedalsDataFromPreviousHost(const std::string& previousHost);

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
    const std::string roomDataPath;
    const std::string medalsDataPath;

    std::string currentHost = "";
    std::string currentPlayer = "";
    std::string currentPassword = "";

    std::filesystem::file_time_type locationDataLastCheckTime;
    bool triggerEventOnOptionReceived = false;
    std::unordered_map<std::string, int> hostToMedalsMap;

    /// @brief Read AP medals data and store its values in hostToMedalsMap
    void ReadMedalsData();

    /// @brief Override AP medals data with the current values of hostToMedalsMap
    /// @param amount Changes the amount to override from the default 1
    void WriteMedalsData(int amount = 1);

    /// @brief Register all AP client options callbacks
    void RegisterAllOptionsCallbacks();

    /// @brief Create the specified AP data file if it doesn't exist,
    /// or clear it completely if it already exist (depending on parameters)
    /// @param filePath Path to the AP data file
    /// @param create Set to true to create the file, default to true
    /// @param clear Set to true to clear the file, default to true
    void CreateOrClearFile(const std::string& filePath, bool create = true, bool clear = true);

    /// @brief Delete the specified AP data file
    /// @param filePath Path to the AP data file
    /// @return True if deleted or if it did not exist, of else false
    bool DeleteFile(const std::string& filePath);

    /// @brief Rename the specified AP data file to a given name
    /// @param filePath Path to the AP data file
    /// @param newName The new name to use
    /// @return True if renamed, or else false
    bool RenameFile(const std::string& filePath, const std::string& newName);

    /// @brief Write the current rooms values to AP room data file
    void SetLatestRoomData();

    /// @brief Checks if the latest host is also the current host
    /// @return True if the latest host is also the current host
    bool IsKnownHost();


    /// @brief Internal Options class to receive options from client callbacks
    class Options
    {
    public:
        Options() = delete;

        /// @brief Add or update the value for an option
        /// @param optionName Name of the option
        /// @param optionValue Int value of the option
        static void SetOption(const std::string& optionName, int optionValue)
        {
            auto it = allOptions.find(optionName);
            if (it != allOptions.end())
                allOptions[optionName] = optionValue;
            else
                allOptions.emplace(optionName, optionValue);
        }

        /// @brief Get the current option value
        /// @param optionName Name of the option
        /// @return Int value of the option, or -1 if the option was not set
        static int GetOption(const std::string& optionName)
        {
            auto it = allOptions.find(optionName);
            return it != allOptions.end() ? it->second : -1;
        }

        /// @brief Print all added options
        /// @return String text containing all options in the format "Name: Value"
        static std::string PrintOptions()
        {
            std::string result = "";
            for (const auto& [key, value] : allOptions)
            {
                result += key + ": " + std::to_string(value) + "\n";
            }
            return result;
        }

    private:
        static std::unordered_map<std::string, int> allOptions;
    };
};
