cmake_minimum_required(VERSION 3.4...3.28 FATAL_ERROR)

project(${APP_NAME}
    LANGUAGES CXX
)

file(GLOB_RECURSE source_files
    "./src/main.cpp"
)

add_executable(${APP_NAME}
    ${source_files}
)

set_target_properties(${APP_NAME} PROPERTIES
    CXX_STANDARD 11
    CXX_EXTENSIONS off
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE}/${APP_NAME}
)

target_link_libraries(${APP_NAME} EngineName)
target_include_directories(${APP_NAME} PRIVATE src)