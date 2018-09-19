# *  @Copyright (c) 2016-2017 DJI
# *
# * Permission is hereby granted, free of charge, to any person obtaining a copy
# * of this software and associated documentation files (the "Software"), to deal
# * in the Software without restriction, including without limitation the rights
# * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# * copies of the Software, and to permit persons to whom the Software is
# * furnished to do so, subject to the following conditions:
# *
# * The above copyright notice and this permission notice shall be included in
# * all copies or substantial portions of the Software.
# *
# * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# * SOFTWARE.
# *
# *



cmake_minimum_required(VERSION 2.8)
project(onboardsdk)



set(CMAKE_VERBOSE_MAKEFILE OFF)

set(DJIOSDK 0)
set(DJIOSDK_MINOR_VERSION 1)
set(DJIOSDK_PATCH_VERSION 0)
set(DJIOSDK_VERSION
  ${DJIOSDK_MAJOR_VERSION}.${DJIOSDK_MINOR_VERSION}.${DJIOSDK_PATCH_VERSION})

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/libs)

if (ADVANCED_SENSING)
  add_definitions(-DADVANCED_SENSING)
endif()

add_definitions(-DQT_DEPRECATED_WARNINGS)
add_subdirectory(osdk-core)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")

set(DJI_ROOT "/home/daryll/hsfl-dji/Onboard-SDK-3.6.1")

# ----------- MY CODE
#1. my headers

#2. my sources
add_executable(${PROJECT_NAME} "main.cpp")

# -------- EXTERNAL LIBRARIES
#3.external headers
#set(HEADERS
#    ${DJI_ROOT}/osdk-core/api/inc/*.hpp
#    ${DJI_ROOT}/osdk-core/protocol/inc/*.hpp
#    ${DJI_ROOT}/osdk-core/hal/inc/*.hpp
#    ${DJI_ROOT}/osdk-core/utility/inc/*.hpp
#    ${DJI_ROOT}/osdk-core/platform/linux/inc/*.hpp
#    ${DJI_ROOT}/osdk-core/platform/default/inc/*.hpp
#    ${DJI_ROOT}/sample/linux/common/*.hpp
#    ${DJI_ROOT}/sample/linux/flight-control/flight_control_sample.hpp
#    )

#4. extenral sources
set(SOURCES
    ${DJI_ROOT}/osdk-core/api/src/*.cpp
    ${DJI_ROOT}/osdk-core/protocol/src/*.cpp
    ${DJI_ROOT}/osdk-core/hal/src/*.cpp
    ${DJI_ROOT}/osdk-core/utility/src/*.cpp
    ${DJI_ROOT}/osdk-core/platform/linux/src/*.cpp
    ${DJI_ROOT}/osdk-core/platform/default/src/*.cpp
    ${DJI_ROOT}/sample/linux/common/*.cpp
    ${DJI_ROOT}/sample/linux/flight-control/flight_control_sample.cpp
    )

#5. inlcude files for your code
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/osdk-core/api/inc"
    "${CMAKE_CURRENT_SOURCE_DIR}/osdk-core/protocol/inc"
    "${CMAKE_CURRENT_SOURCE_DIR}/osdk-core/hal/inc"
    "${CMAKE_CURRENT_SOURCE_DIR}/osdk-core/utility/inc"
    "${CMAKE_CURRENT_SOURCE_DIR}/osdk-core/platform/linux/inc"
    "${CMAKE_CURRENT_SOURCE_DIR}/osdk-core/platform/default/inc"
    "${CMAKE_CURRENT_SOURCE_DIR}/sample/linux/common"
    "${CMAKE_CURRENT_SOURCE_DIR}/sample/linux/flight-control"
    )

FILE(GLOB SOURCES ${SOURCES})
FILE(GLOB INCLUDES ${HEADERS})

FILE(GLOB INCLUDES ${DJI_ROOT}/osdk-core/api/inc/*.hpp)
FILE(GLOB INCLUDES ${DJI_ROOT}/osdk-core/protocol/inc/*.hpp)
FILE(GLOB INCLUDES ${DJI_ROOT}/osdk-core/hal/inc/*.hpp)
FILE(GLOB INCLUDES ${DJI_ROOT}/osdk-core/utility/inc/*.hpp)
FILE(GLOB INCLUDES ${DJI_ROOT}/osdk-core/platform/linux/inc/*.hpp)
FILE(GLOB INCLUDES ${DJI_ROOT}/osdk-core/platform/default/inc/*.hpp)
FILE(GLOB INCLUDES ${DJI_ROOT}/sample/linux/common/*.hpp)
FILE(GLOB INCLUDES ${DJI_ROOT}/sample/linux/flight-control/flight_control_sample.hpp)

add_library(DJIlib STATIC ${SOURCES} ${HEADERS})

target_link_libraries(${PROJECT_NAME} DJIlib pthread)

if (${CMAKE_SYSTEM_NAME} MATCHES Linux)
  add_subdirectory(sample/linux)
endif()
