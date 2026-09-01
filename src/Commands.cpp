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
    std::string commandWord = command;
    const std::size_t firstSpace = command.find(' ');

    if (firstSpace != std::string::npos) {
        commandWord = commandWord.substr(0, firstSpace);
    }
    loggerPtr->LogInFile(commandWord);

    if (commandWord == "/help")
    {
        PrintHelp();
    }
    else if (commandWord == "/status")
    {
        bool connected = apClientPtr->IsConnected();
        loggerPtr->Log(std::string("Archipelago status: ") + (connected ? "Connected" : "Not connected"));
    }
    else if (commandWord == "/clear")
    {
        system("cls");
    }
    else if (commandWord == "/disconnect")
    {
        apClientPtr->Disconnect();
    }
    else if (commandWord == "/connect")
    {
        const std::vector<std::string> arguments = ParseCommandInput(command.substr(8));
        std::string host, player, password;

        if (arguments.size() >= 2)
        {
            host = arguments[0];
            player = arguments[1];
        }

        if (arguments.size() >= 3)
        {
            password = arguments[2];
        }

        if (host.empty() || player.empty())
        {
            loggerPtr->LogError("Cannot connect to Archipelago: Host and player must be set");
            PrintHelp();
            return;
        }

        apClientPtr->Connect(host, player, password);
    }
    else if (commandWord == "/reconnect")
    {
        const auto [host, player, password] = apClientPtr->GetLatestRoomData();

        if (host.empty() || player.empty())
        {
            loggerPtr->LogError("Was not able to reconnect to Archipelago: Latest saved room informations were not valid, try /connect instead");
            PrintHelp();
            return;
        }

        apClientPtr->Connect(host, player, password);
    }
    else if (commandWord == "/syncmedals")
    {
        const std::vector<std::string> arguments = ParseCommandInput(command.substr(11));
        std::string oldHost;

        if (arguments.size() >= 1)
        {
            oldHost = arguments[0];
        }

        if (oldHost.empty())
        {
            loggerPtr->LogError("Medals sync failed: The previous host name must be set");
            PrintHelp();
            return;
        }

        apClientPtr->SyncMedalsDataFromPreviousHost(oldHost);
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

std::vector<std::string> Commands::ParseCommandInput(const std::string& input)
{
    std::vector<std::string> allArguments; // return value, contains all parsed arguments
    std::string argument; // the currently worked on argument
    bool inQuotesMode = false; // define if quotes are used for the current argument and ignore spaces parsing if yes

    std::size_t index = 0;
    while (index < input.size() && std::isspace(static_cast<unsigned char>(input[index])))
    {
        ++index; // remove every spaces between input command word and the first argument
    }

    for (; index < input.size(); ++index)
    {
        const char ch = input[index];

        if (ch == '"')
        {
            inQuotesMode = !inQuotesMode;
            continue;
        }

        if (std::isspace(static_cast<unsigned char>(ch)) && !inQuotesMode)
        {
            if (!argument.empty())
            {
                allArguments.push_back(argument);
                argument.clear();
            }
            continue;
        }

        argument.push_back(ch);
    }

    if (!argument.empty())
    {
        allArguments.push_back(argument);
    }

    return allArguments;
}

void Commands::PrintHelp()
{
    loggerPtr->LogInConsole("--------------------------------------------- Available Commands ---------------------------------------------");
    loggerPtr->LogInConsole(" /connect <host> <player> [password] - Connect to Archipelago (example: /connect archipelago.gg:67676 Player1)");
    loggerPtr->LogInConsole(" /disconnect                         - Disconnect from Archipelago");
    loggerPtr->LogInConsole(" /reconnect                          - Try to reconnect to the latest valid connection made with /connect");
    loggerPtr->LogInConsole(" /status                             - Show Archipelago connection status");
    loggerPtr->LogInConsole(" /syncmedals <old_host>              - Transfer medals data from a previous server host to the current host");
    loggerPtr->LogInConsole(" /help                               - Show this message");
    loggerPtr->LogInConsole(" /clear                              - Clear console");
    loggerPtr->LogInConsole("--------------------------------------------------------------------------------------------------------------");
}
