cmake_minimum_required(VERSION 3.4...3.28 FATAL_ERROR)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${STB_OUTPUT_DIR})

project(stb
    LANGUAGES C
)

file(GLOB_RECURSE source_files
    "./stb/stb_image.c"
)

add_library(stb
    ${source_files}
)

target_include_directories(stb PUBLIC "./stb/include/glad")