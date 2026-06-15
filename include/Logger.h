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

    /// @brief Log a message to console and file
    /// @param message Message to log
    void Log(const std::string& message);

    /// @brief Log an error message to console and file
    /// @param message Error message to log
    void LogError(const std::string& message);

    /// @brief Log a message to the console only
    /// @param message Message to log
    void LogInConsole(const std::string& message);

    /// @brief Log a message to the file only
    /// @param message Message to log
    void LogInFile(const std::string& message);

    /// @brief Close the logger file
    void Close();

private:
    std::ofstream logFile;

    /// @brief Format current time for log message
    /// @return Formatted timestamp
    static std::string GetTimestamp();
};
