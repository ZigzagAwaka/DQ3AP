#include "APClient.h"
#include "Archipelago.h"


APClient::APClient(Logger& logger, const std::string& itemPath, const std::string& locationPath) : logger(logger), itemPath(itemPath), locationPath(locationPath)
{
    itemFile.open(itemPath, std::ios::app);

    if (!std::filesystem::exists(locationPath))
    {
        std::ofstream(locationPath).close();
    }
    //InitSocket();
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
    //CheckSocket();

    std::ifstream file(locationPath);
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
        std::ofstream clearFile(locationPath, std::ios::trunc);
        clearFile.close();
    }
}


void APClient::Disconnect(bool shouldCloseSocket)
{
    AP_Shutdown();
    logger.Log("Disconnected from Archipelago");

    if (shouldCloseSocket)
    {
        //CloseSocket();
        if (itemFile.is_open())
        {
            itemFile.close();
        }
    }
}


bool APClient::IsConnected()
{
    return AP_GetConnectionStatus() == AP_ConnectionStatus::Authenticated;
}


void APClient::InitSocket()
{
    WSADATA wsa;
    WSAStartup(MAKEWORD(2, 2), &wsa);

    socketServer = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

    u_long mode = 1;
    ioctlsocket(socketServer, FIONBIO, &mode); // set server to non blocking

    sockaddr_in address{};
    address.sin_family = AF_INET;
    address.sin_port = htons(38281);
    address.sin_addr.s_addr = inet_addr("127.0.0.1");

    bind(socketServer, (sockaddr*)&address, sizeof(address));
    listen(socketServer, 1);
}


void APClient::CheckSocket()
{
    if (socketClient == INVALID_SOCKET)
    {
        socketClient = accept(socketServer, nullptr, nullptr); // search for valid client

        if (socketClient != INVALID_SOCKET)
        {
            u_long mode = 1;
            ioctlsocket(socketClient, FIONBIO, &mode); // set recv to non blocking
        }
        else
        {
            int err = WSAGetLastError();

            if (err != WSAEWOULDBLOCK)
            {
                logger.LogError(std::string("Socket client accept error. Code: ") + std::to_string(err));
            }
        }
    }
    else
    {
        char buffer[1024];
        int read_bytes = recv(socketClient, buffer, sizeof(buffer) - 1, 0); // check for new message from client

        if (read_bytes > 0)
        {
            buffer[read_bytes] = '\0';
            logger.Log("RECEIVE LOCATION: " + std::string(buffer));
        }
        else if (read_bytes == SOCKET_ERROR)
        {
            int err = WSAGetLastError();

            if (err != WSAEWOULDBLOCK)
            {
                logger.LogError(std::string("Socket client recv error. Code: ") + std::to_string(err));
            }
        }
    }
}


void APClient::CloseSocket()
{
    if (socketClient != INVALID_SOCKET)
    {
        shutdown(socketClient, SD_BOTH);
        closesocket(socketClient);
        socketClient = INVALID_SOCKET;
    }
    if (socketServer != INVALID_SOCKET)
    {
        closesocket(socketServer);
        socketServer = INVALID_SOCKET;
    }
    WSACleanup();
}