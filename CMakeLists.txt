cmake_minimum_required(VERSION 3.15.0)

set(PROJECT "QtCMakeExample")
project(${PROJECT})

# Set the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "release")
endif()

# Set the compiler flags
if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -DQTCMAKEEXAMPLE_DEBUG -g")
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -DQTCMAKEEXAMPLE_RELEASE -O3")
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /DQTCMAKEEXAMPLE_DEBUG /DEBUG")
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /DDQTCMAKEEXAMPLE_RELEASE /O2")
endif()

string(TOLOWER ${CMAKE_BUILD_TYPE} build_type)
if (build_type STREQUAL "debug")
    message(STATUS "CMAKE_CXX_FLAGS: " ${CMAKE_CXX_FLAGS} " " ${CMAKE_CXX_FLAGS_DEBUG})
elseif (build_type STREQUAL "release")
    message(STATUS "CMAKE_CXX_FLAGS: " ${CMAKE_CXX_FLAGS} " " ${CMAKE_CXX_FLAGS_RELEASE})
endif()

# Set the binary location
set(CMAKE_BINARY_DIR "/bin")
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}${CMAKE_BINARY_DIR})

# Handle Qt specific files automatically
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

# If CMAKE_PREFIX_PATH is not set, we assume that we are running
# in a Command Prompt because Qt Creator's kits automatically set it.
if(NOT CMAKE_PREFIX_PATH)
    if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        set(QT_HOME $ENV{QT_MINGW_HOME})
    elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        set(QT_HOME $ENV{QT_MSVC_HOME})
    endif()

    # Verify that the QT_XXX_HOME environment variable is set.
    if(${QT_HOME} STREQUAL "")
        if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
            message(FATAL_ERROR "QT_MINGW_HOME is not set!")
        elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
            message(FATAL_ERROR "QT_MSVC_HOME is not set!")
        endif()
    endif()

    message(STATUS "Using Qt from: " ${QT_HOME})
    set(CMAKE_PREFIX_PATH ${QT_HOME}/lib/cmake)
endif()

add_subdirectory(src)
