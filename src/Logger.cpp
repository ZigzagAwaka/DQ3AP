#include "Logger.h"

#include <cstdio>
#include <chrono>
#include <ctime>
#include <sstream>
#include <iomanip>


Logger::Logger(const std::string& logPath)
{
    logFile.open(logPath, std::ios::app);
    /*FILE* freopen_result = freopen(logPath.c_str(), "a", stdout);
    if (freopen_result)
    {
        setvbuf(stdout, nullptr, _IONBF, 0);
    }*/
}

void Logger::Log(const std::string& message, bool inFile)
{
    std::string line = message + "\n";
    printf(line.c_str());

    if (inFile && logFile.is_open())
    {
        logFile << GetTimestamp() << line;
        logFile.flush();
    }
    // printf("%s%s\n", GetTimestamp().c_str(), message.c_str());
}

void Logger::LogError(const std::string& message)
{
    Log("[ERROR] " + message);
}

void Logger::Close()
{
    if (logFile.is_open())
    {
        logFile.close();
    }
}

std::string Logger::GetTimestamp()
{
    auto now = std::chrono::system_clock::now();
    std::time_t now_time = std::chrono::system_clock::to_time_t(now);

    std::tm local_time{};
#ifdef _WIN32
    localtime_s(&local_time, &now_time);
#else
    localtime_r(&now_time, &local_time);
#endif

    std::ostringstream oss;
    oss << std::put_time(&local_time, "[%d/%m/%Y %H:%M:%S] ");
    return oss.str();
}
