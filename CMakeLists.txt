cmake_minimum_required(VERSION 3.19)
project(verelation C)

set(CMAKE_C_STANDARD 99)
SET(CMAKE_BUILD_TYPE "Debug")
SET(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -O0 -Wall -g")

set(CMAKE_INSTALL_PREFIX /usr/local/)


add_executable(verelation main.c token.c token.h AST.c AST.h common.h preprocess.c preprocess.h shell.c shell.h)

install(TARGETS verelation
        DESTINATION ${CMAKE_INSTALL_PREFIX}/bin/
        )