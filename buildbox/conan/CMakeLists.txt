cmake_minimum_required(VERSION 3.7)

project(poco_server)

if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
    message(STATUS "CMAKE_BUILD_TYPE is not specified. Using default: ${CMAKE_BUILD_TYPE}")
endif()

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

if (MSVC)
    add_compile_options("/W3")
else()
    add_compile_options("-Wall" "-Wextra")
    set(CMAKE_VERBOSE_MAKEFILE TRUE)
endif()

# местоположение зависимостей
list(APPEND CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR})
list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})

# поиск зависимостей
find_package(Poco REQUIRED COMPONENTS Foundation Net Util)

include_directories(${CMAKE_SOURCE_DIR}
                    ${CMAKE_BINARY_DIR}
                    ${Poco_INCLUDE_DIR})

# включение тестов
enable_testing()

# сборка исходников
add_subdirectory(server)
