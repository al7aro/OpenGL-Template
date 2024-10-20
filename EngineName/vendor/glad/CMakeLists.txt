cmake_minimum_required(VERSION 3.4...3.28 FATAL_ERROR)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${GLAD_OUTPUT_DIR})

project(glad
    LANGUAGES C
)

file(GLOB_RECURSE source_files
    "./glad/src/glad.c"
    "./glad/include/glad/glad.h"
    "./glad/include/KHR/khrplatform.h"
)

add_library(glad
    ${source_files}
)

target_include_directories(glad PRIVATE "./glad/include/KHR")
target_include_directories(glad PUBLIC "./glad/include")
