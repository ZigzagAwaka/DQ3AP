#pragma once

#include "Logger.h"
#include "APClient.h"

#include <string>
#include <queue>
#include <mutex>
#include <cctype>
#include <vector>

/// @brief User command processing class
class Commands
{
public:
    Commands() = delete;

    /// @brief Initialize the command system with AP client and logger references
    /// @param apClient Reference to APClient
    /// @param logger Reference to Logger
    static void Initialize(APClient& apClient, Logger& logger);

    /// @brief Queue a command for processing
    /// @param command Str command to queue
    static void Queue(const std::string& command);

    /// @brief Process all queued commands
    static void ProcessQueue();

    /// @brief Process a specific command from user input
    /// @param command Str command to process
    static void Process(const std::string& command);

    /// @brief Check if there are queued commands
    /// @return True if there are pending commands, false otherwise
    static bool HasPendingCommands();

private:
    static std::queue<std::string> commandQueue;
    static std::mutex queueMutex;

    static APClient* apClientPtr;
    static Logger* loggerPtr;

    /// @brief Parse the given command input and returns all valid arguments
    /// @param input The input string to be parsed
    /// @return A vector of string representing all arguments parsed in the input
    static std::vector<std::string> ParseCommandInput(const std::string& input);

    /// @brief Print available commands
    static void PrintHelp();
};
