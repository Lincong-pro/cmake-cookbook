cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

# 仅仅只是cmake脚本测试，不需要任何语言
project(recipe-02 LANGUAGES NONE)
# 添加模块路径
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# 添加colors模块
include(colors)
# 定义颜色
define_colors()

message(STATUS "This is a normal message")
message(STATUS "${Red}This is a red${ColourReset}")
message(STATUS "${BoldRed}This is a bold red${ColourReset}")
message(STATUS "${Green}This is a green${ColourReset}")
message(STATUS "${BoldMagenta}This is bold${ColourReset}")
