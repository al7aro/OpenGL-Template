cmake_minimum_required(VERSION 3.4...3.28 FATAL_ERROR)

include("common.cmake")

project(${WORKSPACE_NAME})

add_subdirectory(${ENGINE_NAME})
add_subdirectory(${APP_NAME})