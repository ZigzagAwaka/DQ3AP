#include "WorldData.h"

// Static member initialization
const std::unordered_map<std::string, int> WorldData::locations =
{
    {"SEARCH_Aliahan_Out_BARREL_0", 1},
};

const std::unordered_map<int, std::string> WorldData::items =
{
    {},
};

/*

    auto it = dict.find(key);
    if (it != dict.end())
    {
        int value = it->second;
        std::cout << value << '\n'; // 2
    }

*/