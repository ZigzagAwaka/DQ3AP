#pragma once

#include <string>
#include <fstream>

/// @brief Console and file logger
class Logger
{
public:
    /// @brief Create the logger with given file path
    /// @param logPath Path to log file, will be created if it doesn't exist
    Logger(const std::string& logPath);

    /// @brief Log a message to console and file is specified
    /// @param message Message to log
    /// @param inFile Also log the message in the log file
    void Log(const std::string& message, bool inFile = true);

    void LogError(const std::string& message);

    /// @brief Close the logger file
    void Close();

private:
    std::ofstream logFile;

    /// @brief Format current time for log message
    /// @return Formatted timestamp
    static std::string GetTimestamp();
};
