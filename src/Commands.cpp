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
    loggerPtr->LogInFile(command);
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
    else if (command.rfind("/connect", 0) == 0)
    {
        std::string input = command.substr(8);
        while (!input.empty() && std::isspace(static_cast<unsigned char>(input[0])))
        {
            input.erase(input.begin()); // remove every spaces between "/connect" and the first argument in the input
        }

        const std::vector<std::string> arguments = ParseCommandInput(input);
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

    for (const char ch : input)
    {
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
    loggerPtr->LogInConsole(" /status                             - Show Archipelago connection status");
    loggerPtr->LogInConsole(" /help                               - Show this message");
    loggerPtr->LogInConsole(" /clear                              - Clear console");
    loggerPtr->LogInConsole("--------------------------------------------------------------------------------------------------------------");
}
