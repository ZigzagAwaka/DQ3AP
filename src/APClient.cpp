#include "APClient.h"
#include "Archipelago.h"


APClient::APClient(Logger& logger, const std::string& itemPath, const std::string& locationPath) : logger(logger), itemDataPath(itemPath), locationDataPath(locationPath)
{
    ClearData(); // maybe not needed?
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
            ReceiveItem(itemId);
        });

        AP_SetLocationCheckedCallback([this](int64_t locationId) {
            ReceiveCheckedLocation(locationId);
        });

        AP_RegisterSlotDataIntCallback("container_sanity", [this](int value) {
            logger.Log("Container Sanity: " + std::to_string(value));
        });

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

    std::ifstream file(locationDataPath);
    std::string line;
    bool hasContent = false;

    while (std::getline(file, line))
    {
        if (line.empty()) continue;
        hasContent = true;
        int locationId = WorldData::GetLocationId(line);
        if (locationId != -1)
        {
            logger.Log("Location checked: " + line);
            AP_SendItem(locationId);
        }
        else
        {
            logger.LogError("Unknown location: " + line);
        }
    }
    file.close();

    if (hasContent)
    {
        std::ofstream clearFile(locationDataPath, std::ios::trunc);
        clearFile.close();
    }
}


void APClient::ReceiveCheckedLocation(int64_t locationId)
{
    std::string locationName = WorldData::GetLocationName(locationId);
    if (!locationName.empty())
    {
        logger.Log("Location checked by server: " + locationName);
    }
    else
    {
        logger.LogError("Unknown location Id: " + locationId);
    }
}


void APClient::ReceiveItem(int64_t itemId)
{
    std::string itemName = WorldData::GetItemName(itemId);
    if (!itemName.empty())
    {
        logger.Log("Item received: " + itemName);
    }
    else
    {
        logger.LogError("Unknown item Id: " + itemId);
    }
}


void APClient::ClearData()
{
    if (!std::filesystem::exists(itemDataPath))
    {
        std::ofstream(itemDataPath).close();
    }
    else
    {
        std::ofstream clearFile(itemDataPath, std::ios::trunc);
        clearFile.close();
    }
    if (!std::filesystem::exists(locationDataPath))
    {
        std::ofstream(locationDataPath).close();
    }
    else
    {
        std::ofstream clearFile(locationDataPath, std::ios::trunc);
        clearFile.close();
    }
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
