cmake_minimum_required(VERSION 3.4...3.28 FATAL_ERROR)

project(${ENGINE_NAME}
    LANGUAGES CXX
)

set(PROJECT_DIR ${CMAKE_SOURCE_DIR}/${ENGINE_NAME})
set(VENDOR_DIR ${PROJECT_DIR}/vendor)

# GLAD
set(GLAD_OUTPUT_DIR ${CMAKE_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE}/${ENGINE_NAME}/vendor)
set(GLAD_CMAKE_DIR ${VENDOR_DIR}/glad)
add_subdirectory(${GLAD_CMAKE_DIR})

# GLFW
set(GLFW_OUTPUT_DIR ${CMAKE_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE}/${ENGINE_NAME}/vendor)
set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(GLFW_CMAKE_DIR ${VENDOR_DIR}/glfw)
add_subdirectory(${GLFW_CMAKE_DIR})

# GLM
set(GLM_OUTPUT_DIR ${CMAKE_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE}/${ENGINE_NAME}/vendor)
set(GLM_CMAKE_DIR ${VENDOR_DIR}/glm)
add_subdirectory(${GLM_CMAKE_DIR})

# IMGUI
set(IMGUI_OUTPUT_DIR ${CMAKE_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE}/${ENGINE_NAME}/vendor)
set(IMGUI_CMAKE_DIR ${VENDOR_DIR}/imgui)
add_subdirectory(${IMGUI_CMAKE_DIR})

# STB
set(STB_OUTPUT_DIR ${CMAKE_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE}/${ENGINE_NAME}/vendor)
set(STB_CMAKE_DIR ${VENDOR_DIR}/stb)
add_subdirectory(${STB_CMAKE_DIR})

# OpenGL
find_package(OpenGL REQUIRED)

file(GLOB_RECURSE source_files
    "./src/Engine.cpp"
    "./src/Engine.hpp"
)

add_library(${ENGINE_NAME}
    STATIC
    ${source_files}
)

set_target_properties(${ENGINE_NAME} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE}/${ENGINE_NAME}
)

# Libraries
target_link_libraries(${ENGINE_NAME} glfw)
target_link_libraries(${ENGINE_NAME} glad)
target_link_libraries(${ENGINE_NAME} glm)
target_link_libraries(${ENGINE_NAME} imgui)
target_link_libraries(${ENGINE_NAME} stb)
target_link_libraries(${ENGINE_NAME} OpenGL::GL)

# Headers
target_include_directories(${ENGINE_NAME} PUBLIC "${PROJECT_DIR}/src/include")
target_include_directories(${ENGINE_NAME} PUBLIC "${IMGUI_CMAKE_DIR}/imgui")
target_include_directories(${ENGINE_NAME} PUBLIC "${GLM_CMAKE_DIR}/glm")
target_include_directories(${ENGINE_NAME} PUBLIC "${GLFW_CMAKE_DIR}/glfw/include")
target_include_directories(${ENGINE_NAME} PUBLIC "${GLAD_CMAKE_DIR}/glad/include")
target_include_directories(${ENGINE_NAME} PUBLIC "${STB_CMAKE_DIR}/stb/include")