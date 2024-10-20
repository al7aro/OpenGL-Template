cmake_minimum_required(VERSION 3.4...3.28 FATAL_ERROR)

set(WORKSPACE_NAME "WorkspaceName")
set(APP_NAME "AppName")
set(ENGINE_NAME "EngineName")

project(${WORKSPACE_NAME})

add_subdirectory(${ENGINE_NAME})
add_subdirectory(${APP_NAME})