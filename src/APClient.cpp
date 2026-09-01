#include "APClient.h"
#include "Archipelago.h"


APClient::APClient(Logger& logger, const std::string& itemPath, const std::string& locationPath,
                   const std::string& optionPath, const std::string& hostPath, const std::string& medalsPath)
    : logger(logger),
    itemDataPath(itemPath),
    locationDataPath(locationPath),
    optionDataPath(optionPath),
    roomDataPath(hostPath),
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
        currentPlayer = player;
        currentPassword = password;
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
    // Manage newly received AP messages
    if (AP_IsMessagePending())
    {
        AP_Message* message = AP_GetLatestMessage();
        logger.Log(message->text);
        AP_ClearLatestMessage();
    }

    // Initialize options and medals data upon receiving an option from client callback
    if (triggerEventOnOptionReceived)
    {
        WriteOptionData();
        ReadMedalsData();
        triggerEventOnOptionReceived = false;
    }

    // Manage newly checked locations
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
    int victoryOption = Options::GetOption("victory_goal");
    if (victoryOption != 2 && victoryOption != 3)
    {
        return;
    }

    CreateOrClearFile(medalsDataPath, true, false);
    hostToMedalsMap.clear();

    std::ifstream file(medalsDataPath);
    std::string line;

    std::function<std::string(std::string)> trim = [](std::string value) {
        const std::size_t first = value.find_first_not_of(" \t\r\n");
        if (first == std::string::npos)
        {
            return std::string();
        }
        const std::size_t last = value.find_last_not_of(" \t\r\n");
        return value.substr(first, last - first + 1);
    };

    // Get every lines and save their values in hostToMedalsMap
    while (std::getline(file, line))
    {
        if (line.empty()) continue;
        const std::size_t equalPos = line.find('=');
        if (equalPos == std::string::npos) continue;

        std::string hostName = trim(line.substr(0, equalPos));
        std::string medalsAmountStr = trim(line.substr(equalPos + 1));
        int medalsAmount;

        try
        {
            medalsAmount = std::stoi(medalsAmountStr);
        }
        catch (const std::exception&)
        {
            medalsAmount = 1;
        }

        hostToMedalsMap.emplace(hostName, medalsAmount);
    }
    file.close();
}


void APClient::WriteMedalsData(int amount)
{
    int victoryOption = Options::GetOption("victory_goal");
    if ((victoryOption != 2 && victoryOption != 3) || currentHost.empty())
    {
        return;
    }

    // If the current host exist, increment by 1, else build a new entry with given amount (or 1 if not given)
    auto it = hostToMedalsMap.find(currentHost);
    if (it != hostToMedalsMap.end())
        hostToMedalsMap[currentHost]++;
    else
        hostToMedalsMap.emplace(currentHost, amount);
    
    // Then, send medals victory event if amount is >= 110 (collected all medals)
    if (hostToMedalsMap[currentHost] >= 110)
    {
        logger.LogInFile("Victory got for mini medals");
        hostToMedalsMap.erase(currentHost);
        AP_StoryComplete();
    }

    // Finally, re-write medals data
    std::ofstream file(medalsDataPath, std::ios::trunc);
    for (const auto& [host, amount] : hostToMedalsMap)
    {
        file << host << " = " << std::to_string(amount) << '\n';
    }
    file.flush();
    file.close();
}


void APClient::SyncMedalsDataFromPreviousHost(const std::string& previousHost)
{
    if (!IsConnected() || currentHost.empty())
    {
        logger.LogError("Medals sync failed: Not connected to Archipelago, please use '/connect' first");
        return;
    }

    int victoryOption = Options::GetOption("victory_goal");
    if ((victoryOption != 2 && victoryOption != 3))
    {
        logger.LogError("Medals sync failed: The current room is not configured with any of the mini medals victory goal");
        return;
    }

    auto itPrev = hostToMedalsMap.find(previousHost);
    if (itPrev == hostToMedalsMap.end())
    {
        logger.LogError("Medals sync failed: The previous server host must be known to have collected some mini medals, the given previous host is either unknown or does not have any medals data available");
        return;
    }

    int previousAmount = hostToMedalsMap[previousHost];

    auto itCurr = hostToMedalsMap.find(currentHost);
    if (itCurr != hostToMedalsMap.end())
        hostToMedalsMap.erase(currentHost);

    WriteMedalsData(previousAmount);
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
            triggerEventOnOptionReceived = true;
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
    if (!currentHost.empty())
    {
        // Only clear item data if connected to an unknown host or if the file does not exist
        CreateOrClearFile(itemDataPath, true, !IsKnownHost());
        // Then set the latest room data to be the current room data
        SetLatestRoomData();
    }
    // Always clear location data
    CreateOrClearFile(locationDataPath);
    locationDataLastCheckTime = std::filesystem::last_write_time(locationDataPath);
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


std::tuple<std::string, std::string, std::string> APClient::GetLatestRoomData()
{
    if (!std::filesystem::exists(roomDataPath))
    {
        return std::make_tuple("", "", "");
    }
    std::ifstream file(roomDataPath);
    std::string line, host, player, password;
    if (std::getline(file, line) && !line.empty())
    {
        host = line;
    }
    if (std::getline(file, line) && !line.empty())
    {
        player = line;
    }
    if (std::getline(file, line) && !line.empty())
    {
        password = line;
    }
    file.close();
    return std::make_tuple(host, player, password);
}


void APClient::SetLatestRoomData()
{
    if (currentHost.empty() || currentPlayer.empty())
    {
        return;
    }
    CreateOrClearFile(roomDataPath);
    std::ofstream file;
    file.open(roomDataPath, std::ios::app);
    file << currentHost << '\n' << currentPlayer << '\n' << currentPassword << '\n';
    file.flush();
    file.close();
}


bool APClient::IsKnownHost()
{
    std::string lastHost = std::get<0>(GetLatestRoomData());
    if (lastHost.empty())
        return false;
    return lastHost == currentHost;
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
