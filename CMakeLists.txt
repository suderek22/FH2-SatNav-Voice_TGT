cmake_minimum_required(VERSION 3.20)
project(SatNavVoice LANGUAGES CXX)

set(FH2MOD_INCLUDE_DIR
    "${CMAKE_CURRENT_SOURCE_DIR}/../FH2-Mod-Platform-v2.7.1/include")
if(NOT EXISTS "${FH2MOD_INCLUDE_DIR}/fh2mod.h")
    message(FATAL_ERROR
        "FH2-Mod-Platform-v2.7.1/include/fh2mod.h was not found beside this project.")
endif()

add_library(SatNavVoice SHARED SatNavVoice.cpp)
target_compile_features(SatNavVoice PRIVATE cxx_std_17)
target_include_directories(SatNavVoice PRIVATE "${FH2MOD_INCLUDE_DIR}")
target_compile_definitions(SatNavVoice PRIVATE WIN32_LEAN_AND_MEAN NOMINMAX)

set(FH2MOD_DIST_DIR "${CMAKE_CURRENT_SOURCE_DIR}/dist")
set_target_properties(SatNavVoice PROPERTIES
    PREFIX ""
    OUTPUT_NAME "SatNavVoice"
    RUNTIME_OUTPUT_DIRECTORY "${FH2MOD_DIST_DIR}"
    LIBRARY_OUTPUT_DIRECTORY "${FH2MOD_DIST_DIR}")

foreach(config Debug Release RelWithDebInfo MinSizeRel)
    string(TOUPPER "${config}" config_upper)
    set_target_properties(SatNavVoice PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY_${config_upper} "${FH2MOD_DIST_DIR}"
        LIBRARY_OUTPUT_DIRECTORY_${config_upper} "${FH2MOD_DIST_DIR}")
endforeach()
