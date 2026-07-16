cmake_minimum_required(VERSION 3.5)
project(DQ3AP)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_library(DQ3AP SHARED
    src/dllmain.cpp
    src/Logger.cpp
    src/APClient.cpp
    src/Commands.cpp
    src/WorldData.cpp
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

# Copy runtime dlls to build folder

if(MINGW)
    get_filename_component(MINGW_BIN_DIR "${CMAKE_CXX_COMPILER}" DIRECTORY)

    set(MINGW_RUNTIME_DLLS
        "${MINGW_BIN_DIR}/libstdc++-6.dll"
        "${MINGW_BIN_DIR}/libgcc_s_seh-1.dll"
        "${MINGW_BIN_DIR}/libwinpthread-1.dll"
    )

    foreach(runtime_dll IN LISTS MINGW_RUNTIME_DLLS)
        if(EXISTS "${runtime_dll}")
            add_custom_command(TARGET DQ3AP POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E copy_if_different
                    "${runtime_dll}" "$<TARGET_FILE_DIR:DQ3AP>"
            )
        endif()
    endforeach()
endif()

# Output name and extension

set_target_properties(DQ3AP PROPERTIES
    PREFIX ""
    SUFFIX ".asi"
)

#target_compile_features(DQ3AP PUBLIC cxx_std_17)
