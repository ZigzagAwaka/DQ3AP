#include "Logger.h"
#include "APClient.h"
#include "Commands.h"

#include <Windows.h>
#include <thread>
#include <atomic>
#include <csignal>
#include <iostream>
#include <filesystem>

/// @brief Indicates the state of the main thread
std::atomic<bool> running{ false };

/// @brief Handles unexpected exit points of the game to stop the thread
static void ExitHandler(int signal)
{
    running = false;
}

/// @brief User inputs reader thread
static DWORD WINAPI InputThread(LPVOID)
{
    HANDLE hStdin = GetStdHandle(STD_INPUT_HANDLE);
    INPUT_RECORD irInBuf[128];
    DWORD dwRead;
    std::string currentInput;

    while (running)
    {
        // Check for console input
        if (GetNumberOfConsoleInputEvents(hStdin, &dwRead) && dwRead > 0 && ReadConsoleInput(hStdin, irInBuf, dwRead, &dwRead))
        {
            for (DWORD i = 0; i < dwRead; i++)
            {
                if (irInBuf[i].EventType == KEY_EVENT && irInBuf[i].Event.KeyEvent.bKeyDown)
                {
                    char ch = irInBuf[i].Event.KeyEvent.uChar.AsciiChar;
                    
                    if (ch == '\r')  // Enter key
                    {
                        std::cout << "\n";
                        std::cout.flush();
                        
                        if (!currentInput.empty() && currentInput[0] == '/')
                        {
                            Commands::Queue(currentInput);
                        }
                        
                        currentInput.clear();
                    }
                    else if (ch == '\b')  // Backspace
                    {
                        if (!currentInput.empty())
                        {
                            currentInput.pop_back();
                            std::cout << "\b \b";
                            std::cout.flush();
                        }
                    }
                    else if (ch >= 32 && ch < 127)  // Print characters
                    {
                        currentInput += ch;
                        std::cout << ch;
                        std::cout.flush();
                    }
                }
            }
        }

        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
    return 0;
}

/// @brief Main thread, initializes console, logger, AP connection and runs the main loop
static DWORD WINAPI MainThread(LPVOID)
{
    // Open console
    AllocConsole();
    FILE* fp;
    freopen_s(&fp, "CONOUT$", "w", stdout);
    std::signal(SIGINT, ExitHandler);
    std::signal(SIGTERM, ExitHandler);

    // Initialize logger
    std::filesystem::create_directories("Archipelago");
    Logger logger("Archipelago/Client.log");

    // Create Archipelago client and initialize command system
    APClient apClient(logger, "Archipelago/items.data", "Archipelago/locations.data");
    Commands::Initialize(apClient, logger);

    // Create input thread
    HANDLE inputThreadHandle = CreateThread(nullptr, 0, InputThread, nullptr, 0, nullptr);

    logger.Log("DQ3AP loaded!");
    logger.Log("Type '/help' for available commands", false);

    try
    {
        // Main loop
        while (running)
        {
            // Process queued commands
            if (Commands::HasPendingCommands())
            {
                Commands::ProcessQueue();
            }

            // Update AP client
            if (apClient.IsConnected())
            {
                apClient.Update();
            }

            std::this_thread::sleep_for(std::chrono::milliseconds(1000));
        }

        // Cleanup after at max 2 seconds
        apClient.Disconnect(true);
        WaitForSingleObject(inputThreadHandle, 2000);
        CloseHandle(inputThreadHandle);
    }
    catch (const std::exception& e)
    {
        logger.LogError(e.what());
    }

    logger.Close();
    
    return 0;
}

/// @brief Starting point of the dll
BOOL APIENTRY DllMain(HMODULE hModule, DWORD reason, LPVOID reserved)
{
    switch (reason)
    {
        case DLL_PROCESS_ATTACH:
            running = true;
            DisableThreadLibraryCalls(hModule);
            CreateThread(nullptr, 0, MainThread, nullptr, 0, nullptr);
            //MessageBoxA(NULL, "Mod Loaded", "AP test", MB_OK);  // pop up message
            break;
        case DLL_PROCESS_DETACH:
            running = false;
            break;
        default:
            break;
    }
    return TRUE;
}
