cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(recipe-03 LANGUAGES C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_C_STANDARD_REQUIRED ON)

set_property(DIRECTORY PROPERTY EP_BASE ${CMAKE_BINARY_DIR}/subprojects)

set(STAGED_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/stage)
message(STATUS "${PROJECT_NAME} staged install: ${STAGED_INSTALL_PREFIX}")

add_subdirectory(external/upstream)

include(ExternalProject)
 
ExternalProject_Add(${PROJECT_NAME}_core              # name
  DEPENDS                                             # depends
    fftw3_external
  SOURCE_DIR                                          # project_source_dir
    ${CMAKE_CURRENT_LIST_DIR}/src         
  CMAKE_ARGS                                          # specified options like build.bat
    -DFFTW3_DIR=${FFTW3_DIR}
    -DCMAKE_C_STANDARD=${CMAKE_C_STANDARD}
    -DCMAKE_C_EXTENSIONS=${CMAKE_C_EXTENSIONS}
    -DCMAKE_C_STANDARD_REQUIRED=${CMAKE_C_STANDARD_REQUIRED}
  CMAKE_CACHE_ARGS
    -DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}
    -DCMAKE_PREFIX_PATH:PATH=${CMAKE_PREFIX_PATH}
  BUILD_ALWAYS
    1                                                 
  INSTALL_COMMAND
    ""
  )
