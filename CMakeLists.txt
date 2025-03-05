cmake_minimum_required(VERSION 3.4...3.28 FATAL_ERROR)

set(CMAKE_CXX_STANDARD 23) # Or 14, 20, 23, etc.
set(CMAKE_CXX_STANDARD_REQUIRED ON) # Optional, but recommended

include("common.cmake")

project(${WORKSPACE_NAME})

if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    message(STATUS "Building on macOS")
    set(GLAD_VERSION "4.1")
    add_compile_definitions(PLATFORM_MACOS)
    set(PLATFORM_MACOS TRUE)
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    message(STATUS "Building on Linux")
    set(PLATFORM_LINUX TRUE)
    set(GLAD_VERSION "4.6")
    add_compile_definitions(PLATFORM_LINUX)
elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    message(STATUS "Building on Windows")
    set(GLAD_VERSION "4.6")
    set(PLATFORM_WINDOWS TRUE)
    add_compile_definitions(PLATFORM_WINDOWS)
else()
    message(STATUS "Building on an unknown system: ${CMAKE_SYSTEM_NAME}")
endif()

add_compile_definitions(SANDBOX_ASSETS_DIRECTORY=\"${PROJECT_SOURCE_DIR}/AppName/assets\")
add_compile_definitions(DEFAULT_ASSETS_DIRECTORY=\"${PROJECT_SOURCE_DIR}/EngineName/default_assets\")

add_subdirectory(${ENGINE_NAME})
add_subdirectory(${APP_NAME})
