cmake_minimum_required(VERSION 3.10)

project(MacOSAntiDebug)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED True)

# Add the executable
add_executable(antidebug antidebug.c)

