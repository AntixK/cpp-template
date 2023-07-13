cmake_minimum_required(VERSION 3.26 FATAL_ERROR)

set(CMAKE_COLOR_MAKEFILE ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED YES)

project(
  cpp-template
  VERSION 0.1.0
  LANGUAGES CXX
)

# ---- Sanity check for approprioate build dir ---- #
if(PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
  message(FATAL_ERROR "In-source builds not allowed. Please make a new directory (called a build directory) and run CMake from there.\n")
endif()


# ---- Add dependencies via CPM ---- #
include(dependencies.cmake)
find_package(OpenMP REQUIRED)


# ---- Add compile options ---- #
## GCC
if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    add_compile_options(-Wall -Wextra -Wpedantic -Wunreachable-code -Wstrict-aliasing)
## Clang
elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    add_compile_options(-Wall -Wextra -Wpedantic -Wunreachable-code -Wstrict-aliasing)
endif()

add_executable(${PROJECT_NAME} src/main.cpp)

message(STATUS ${DEP_LIBS})
# Link dependencies
target_link_libraries(${PROJECT_NAME} PUBLIC ${DEP_LIBS})
