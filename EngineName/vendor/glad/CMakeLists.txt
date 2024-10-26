cmake_minimum_required(VERSION 3.4...3.28 FATAL_ERROR)

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

set_target_properties(glad PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${GLAD_OUTPUT_DIRECTORY_DEBUG}
    LIBRARY_OUTPUT_DIRECTORY_DEBUG ${GLAD_OUTPUT_DIRECTORY_DEBUG}
    RUNTIME_OUTPUT_DIRECTORY_DEBUG ${GLAD_OUTPUT_DIRECTORY_DEBUG}

    ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${GLAD_OUTPUT_DIRECTORY_RELEASE}
    LIBRARY_OUTPUT_DIRECTORY_RELEASE ${GLAD_OUTPUT_DIRECTORY_RELEASE}
    RUNTIME_OUTPUT_DIRECTORY_RELEASE ${GLAD_OUTPUT_DIRECTORY_RELEASE}
)

target_include_directories(glad PRIVATE "./glad/include/KHR")
target_include_directories(glad PUBLIC "./glad/include")
