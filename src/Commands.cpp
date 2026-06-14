#include "Commands.h"

#include <sstream>


std::queue<std::string> Commands::commandQueue;
std::mutex Commands::queueMutex;
APClient* Commands::apClientPtr;
Logger* Commands::loggerPtr;

void Commands::Initialize(APClient& apClient, Logger& logger)
{
    apClientPtr = &apClient;
    loggerPtr = &logger;
}

void Commands::Queue(const std::string& command)
{
    std::lock_guard<std::mutex> lock(queueMutex);
    commandQueue.push(command);
}

void Commands::ProcessQueue()
{
    std::lock_guard<std::mutex> lock(queueMutex);
    while (!commandQueue.empty())
    {
        std::string command = commandQueue.front();
        commandQueue.pop();
        Process(command);
    }
}

void Commands::Process(const std::string& command)
{
    if (command == "/help")
    {
        PrintHelp();
    }
    else if (command == "/status")
    {
        bool connected = apClientPtr->IsConnected();
        loggerPtr->Log(std::string("Archipelago status: ") + (connected ? "Connected" : "Not connected"));
    }
    else if (command == "/clear")
    {
        system("cls");
    }
    else if (command == "/disconnect")
    {
        apClientPtr->Disconnect();
    }
    else if (command.substr(0, 8) == "/connect")
    {
        std::istringstream iss(command);
        std::string cmd, host, player, password = "";
        
        iss >> cmd >> host >> player;  // Parsing command
        iss >> password;  // Optional password, will be empty if not provided
        
        if (host.empty() || player.empty())
        {
            loggerPtr->LogError("Cannot connect to Archipelago: Host and player must be set");
            PrintHelp();
            return;
        }

        apClientPtr->Connect(host, player, password);
    }
    else if (!command.empty())
    {
        loggerPtr->Log("Unknown command: " + command + " (type '/help' for available commands)");
    }
}

bool Commands::HasPendingCommands()
{
    std::lock_guard<std::mutex> lock(queueMutex);
    return !commandQueue.empty();
}

void Commands::PrintHelp()
{
    loggerPtr->Log("--------------------------------------------- Available Commands ---------------------------------------------");
    loggerPtr->Log(" /connect <host> <player> [password] - Connect to Archipelago (example: /connect archipelago.gg:67676 Player1)");
    loggerPtr->Log(" /disconnect                         - Disconnect from Archipelago");
    loggerPtr->Log(" /status                             - Show Archipelago connection status");
    loggerPtr->Log(" /help                               - Show this message");
    loggerPtr->Log(" /clear                              - Clear console");
    loggerPtr->Log("--------------------------------------------------------------------------------------------------------------");
}
