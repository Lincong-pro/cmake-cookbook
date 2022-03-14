add_library(conversion "")

# 指定将target的cpp文件(PRIVATE)和头文件(PUBLIC)
target_sources(conversion
  PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/conversion.cpp
  PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/conversion.hpp
  )
# 包含当前文件夹作为当前目录
target_include_directories(conversion
  PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}
  )