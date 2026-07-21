#include "APClient.h"
#include "Archipelago.h"


APClient::APClient(Logger& logger, const std::string& itemPath, const std::string& locationPath,
                   const std::string& optionPath, const std::string& hostPath)
    : logger(logger),
    itemDataPath(itemPath),
    locationDataPath(locationPath),
    optionDataPath(optionPath),
    hostDataPath(hostPath)
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

        AP_RegisterSlotDataIntCallback("victory_goal", [this](int value) {
            logger.LogInFile("Receive option victory_goal: " + std::to_string(value));
            option_victory_goal = value;
        });

        currentHost = host;
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
    }
    else
    {
        logger.Log("Unknown item Id: " + itemId);
    }
}


bool APClient::CheckVictoryLocation(const std::string& locationName)
{
    int victoryId = WorldData::IsLocationVictory(locationName);
    if (victoryId == -1 || option_victory_goal == -1)
    {
        return false;
    }
    return (
        option_victory_goal <= 2 && victoryId == option_victory_goal ||
        option_victory_goal == 3 && victoryId == 2
    );
}


void APClient::WriteOptionData()
{
    if (option_victory_goal == -1)
    {
        return;
    }
    CreateOrClearFile(optionDataPath);
    std::ofstream file;
    file.open(optionDataPath, std::ios::app);
    file << "victory_goal: " << std::to_string(option_victory_goal) << '\n';
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
