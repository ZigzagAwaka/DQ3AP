#pragma once

#include "Logger.h"

#include <string>
#include <filesystem>
#include <fstream>
#include <winsock2.h>
#include <ws2tcpip.h>


/// @brief Archipelago client wrapper using APCpp
class APClient
{
public:
    /// @brief Create APClient with logger reference
    /// @param logger Logger instance
    /// @param itemPath
    /// @param locationPath
    APClient(Logger& logger, const std::string& itemPath, const std::string& locationPath);

    /// @brief Connect to Archipelago
    /// @param host Server host
    /// @param player Player name
    /// @param password Server password (optional)
    void Connect(const std::string& host, const std::string& player, const std::string& password = "");
        
    /// @brief Update the client (is called periodically)
    void Update();

    /// @brief Disconnect from Archipelago
    /// @param shouldCloseSocket Also close AP socket
    void Disconnect(bool shouldCloseSocket = false);

    /// @brief Check if client is connected
    /// @return True if connected
    bool IsConnected();

private:
    /*std::string ap_host;
    std::string ap_game;
    std::string ap_player;
    std::string ap_password;*/
    Logger& logger;

    const std::string itemPath;
    const std::string locationPath;
    std::ofstream itemFile;
    //std::ifstream locationFile;

    SOCKET socketServer;
    SOCKET socketClient;

    /// @brief Initialize local socket
    void InitSocket();

    /// @brief Check if there is new data available from the local socket
    void CheckSocket();

    /// @brief Close local socket
    void CloseSocket();
};
