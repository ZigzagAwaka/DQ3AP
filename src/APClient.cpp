#include "APClient.h"
#include "Archipelago.h"


APClient::APClient(Logger& logger, const std::string& itemPath, const std::string& locationPath,
                   const std::string& optionPath, const std::string& hostPath, const std::string& medalsPath)
    : logger(logger),
    itemDataPath(itemPath),
    locationDataPath(locationPath),
    optionDataPath(optionPath),
    hostDataPath(hostPath),
    medalsDataPath(medalsPath)
{
    ClearData();
}


void APClient::Connect(const std::string& host, const std::string& player, const std::string& password)
{
    if (IsConnected())
    {
        logger.Log("Already connected to Archipelago");
        return;
    }
    try
    {
        AP_Init(host.c_str(), "Dragon Quest III HD-2D Remake", player.c_str(), password.c_str());

        AP_SetItemClearCallback([this]() {
            ClearData();
        });

        AP_SetItemRecvCallback([this](int64_t itemId, bool notify) {
            ReceiveItem(itemId, notify);
        });

        AP_SetLocationCheckedCallback([this](int64_t locationId) {
            ReceiveCheckedLocation(locationId);
        });

        currentHost = host;
        RegisterAllOptionsCallbacks();
        AP_EnableQueueItemRecvMsgs(true);
        AP_Start();
    }
    catch (const std::exception& e)
    {
        logger.LogError(std::string("Failed to connect to Archipelago: ") + e.what());
    }
}


void APClient::Update()
{
    if (AP_IsMessagePending())
    {
        AP_Message* message = AP_GetLatestMessage();
        logger.Log(message->text);
        AP_ClearLatestMessage();
    }

    std::filesystem::file_time_type lastCheck = std::filesystem::last_write_time(locationDataPath);

    if (lastCheck > locationDataLastCheckTime)
    {
        locationDataLastCheckTime = lastCheck;

        std::ifstream file(locationDataPath);
        std::string line;
        bool hasContent = false;

        while (std::getline(file, line))
        {
            if (line.empty()) continue;
            hasContent = true;
            if (CheckVictoryLocation(line))
            {
                logger.LogInFile("Victory got for location: " + line);
                AP_StoryComplete();
                continue;
            }
            int locationId = WorldData::GetLocationId(line);
            if (locationId != -1)
            {
                logger.LogInFile("Location checked: " + line);
                AP_SendItem(locationId);
            }
            else
            {
                logger.Log("Unknown location: " + line);
            }
        }
        file.close();

        if (hasContent)
        {
            CreateOrClearFile(locationDataPath, false, true);
        }
    }
}


void APClient::ReceiveCheckedLocation(int64_t locationId)
{
    /*std::string locationName = WorldData::GetLocationName(locationId);
    if (!locationName.empty())
    {
        logger.Log("Location checked by server: " + locationName);
    }
    else
    {
        logger.Log("Unknown location Id: " + locationId);
    }*/
}


void APClient::ReceiveItem(int64_t itemId, bool notify)
{
    if (!notify)
    {
        return;
    }

    std::string itemName = WorldData::GetItemName(itemId);

    if (!itemName.empty())
    {
        std::ofstream file;
        file.open(itemDataPath, std::ios::app);
        file << itemName << '\n';
        file.flush();
        file.close();
        logger.LogInFile("Item received: " + itemName);

        if (itemId == 11) // if the received item is a mini medal
        {
            WriteMedalsData();
        }
    }
    else
    {
        logger.Log("Unknown item Id: " + itemId);
    }
}

/*
void APClient::ManageMedalsData()
{
    int victoryOption = Options::GetOption("victory_goal");
    if ((victoryOption == 2 || victoryOption == 3) && !currentHost.empty())
    {
        CreateOrClearFile(medalsDataPath, true, false);

        std::ifstream inputFile(medalsDataPath);
        std::vector<std::string> updatedLines;
        std::string line;
        bool foundHost = false;

        std::function<std::string(std::string)> trim = [](std::string value) {
            const std::size_t first = value.find_first_not_of(" \t\r\n");
            if (first == std::string::npos)
            {
                return std::string();
            }
            const std::size_t last = value.find_last_not_of(" \t\r\n");
            return value.substr(first, last - first + 1);
        };

        while (std::getline(inputFile, line))
        {
            if (line.empty())
            {
                continue;
            }

            const auto separator = line.find(':');
            if (separator == std::string::npos)
            {
                updatedLines.push_back(line);
                continue;
            }

            std::string hostName = trim(line.substr(0, separator));
            std::string valueText = trim(line.substr(separator + 1));

            if (hostName == currentHost)
            {
                int value = 1;
                try
                {
                    value = std::stoi(valueText);
                }
                catch (const std::exception&)
                {
                    value = 1;
                }

                updatedLines.push_back(hostName + " : " + std::to_string(value + 1));
                foundHost = true;
            }
            else
            {
                updatedLines.push_back(line);
            }
        }
        inputFile.close();

        if (!foundHost)
        {
            updatedLines.push_back(currentHost + " : 1");
        }

        std::ofstream outputFile(medalsDataPath, std::ios::trunc);
        for (const std::string& updatedLine : updatedLines)
        {
            outputFile << updatedLine << '\n';
        }
        outputFile.flush();
        outputFile.close();
    }
}
*/

bool APClient::CheckVictoryLocation(const std::string& locationName)
{
    int victoryId = WorldData::IsLocationVictory(locationName);
    int victoryOption = Options::GetOption("victory_goal");
    if (victoryId == -1 || victoryOption == -1)
    {
        return false;
    }
    return victoryId == victoryOption;
}


void APClient::ReadMedalsData()
{

}


void APClient::WriteMedalsData()
{

}


std::unordered_map<std::string, int> APClient::Options::allOptions;

void APClient::RegisterAllOptionsCallbacks()
{
    // All options that will be registered needs to be added in this vector
    const std::vector<std::string> optionNames = {"victory_goal"};

    for (int i = 0; i < optionNames.size(); i++)
    {
        std::string name = optionNames[i];
        AP_RegisterSlotDataIntCallback(name, [this, name](int value) {
            logger.LogInFile("Receive option " + name + ": " + std::to_string(value));
            Options::SetOption(name, value);
        });
    }
}


void APClient::WriteOptionData()
{
    CreateOrClearFile(optionDataPath);
    std::ofstream file;
    file.open(optionDataPath, std::ios::app);
    file << Options::PrintOptions();
    file.flush();
    file.close();
}


void APClient::ClearData()
{
    // Only clear item data if connected to an unknown host or if the file does not exist
    if (!currentHost.empty())
    {
        CreateOrClearFile(itemDataPath, true, !IsKnownHost());
        // Then initialize current host data and client options
        SetLastHost();
        WriteOptionData();
    }
    // Always clear location data
    CreateOrClearFile(locationDataPath);
    locationDataLastCheckTime = std::filesystem::last_write_time(locationDataPath);
    // Always read and reset medals data
    ReadMedalsData();
}


void APClient::CreateOrClearFile(const std::string& filePath, bool create, bool clear)
{
    if (create && !std::filesystem::exists(filePath))
    {
        std::ofstream(filePath).close();
    }
    else if (clear)
    {
        std::ofstream clearFile(filePath, std::ios::trunc);
        clearFile.close();
    }
}


void APClient::SetLastHost()
{
    if (currentHost.empty())
    {
        return;
    }
    CreateOrClearFile(hostDataPath);
    std::ofstream file;
    file.open(hostDataPath, std::ios::app);
    file << currentHost << '\n';
    file.flush();
    file.close();
}


bool APClient::IsKnownHost()
{
    if (!std::filesystem::exists(hostDataPath))
    {
        return false;
    }
    std::ifstream file(hostDataPath);
    std::string line;
    std::string result;
    if (std::getline(file, line) && !line.empty())
    {
        result = line;
    }
    file.close();
    return result == currentHost;
}


void APClient::Disconnect()
{
    AP_Shutdown();
    logger.Log("Disconnected from Archipelago");
}


bool APClient::IsConnected()
{
    return AP_GetConnectionStatus() == AP_ConnectionStatus::Authenticated;
}
