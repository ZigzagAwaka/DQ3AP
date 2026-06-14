cmake_minimum_required(VERSION 3.5)
project(DQ3AP)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_library(DQ3AP SHARED
    src/dllmain.cpp
    src/Logger.cpp
    src/APClient.cpp
    src/Commands.cpp
)

# Include directories and link APCpp

target_include_directories(DQ3AP PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    external/APCpp
)

target_link_directories(DQ3AP PRIVATE
    external/APCpp/build
)

target_link_libraries(DQ3AP PRIVATE
    libAPCpp
)

# Include ws2_32

target_link_libraries(DQ3AP PRIVATE
    ws2_32
)

# Output name and extension

set_target_properties(DQ3AP PROPERTIES
    PREFIX ""
    SUFFIX ".asi"
)

#target_compile_features(DQ3AP PUBLIC cxx_std_17)
