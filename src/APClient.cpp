#include "APClient.h"
#include "Archipelago.h"


APClient::APClient(Logger& logger, const std::string& itemPath, const std::string& locationPath) : logger(logger), itemDataPath(itemPath), locationDataPath(locationPath)
{
    if (!std::filesystem::exists(itemDataPath))
    {
        std::ofstream(itemDataPath).close();
    }
    if (!std::filesystem::exists(locationDataPath))
    {
        std::ofstream(locationDataPath).close();
    }
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
        AP_SetItemClearCallback([]() {
            // Reset the game state (inventory or items structs if any)
            //logger.Log("Items cleared");
        });

        AP_SetItemRecvCallback([](int64_t itemId, bool notify) {
            //logger.Log("Received item: " + std::to_string(itemId));
            // Give item in the game
        });

        AP_SetLocationCheckedCallback([](int64_t locationId) {
            //logger.Log("Location checked: " + std::to_string(locationId));
            // Mark location as checked in the game
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
        logger.Log("RECEIVE LOCATION: " + line);
        AP_SendItem(2);
    }
    file.close();

    if (hasContent)
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
