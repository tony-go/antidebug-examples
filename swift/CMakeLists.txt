cmake_minimum_required(VERSION 3.22)

project(anti_debug LANGUAGES Swift)

add_executable(anti_debug main.swift AppDelegate.swift PIDWindOw.swift)

set(CMAKE_BUILD_TYPE Release)
