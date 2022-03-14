add_executable(cpp_test test.cpp)
target_link_libraries(cpp_test sum_integers)

macro(add_catch_test _name _cost)
  # C语言性质的 ARGC(参数的个数) 
  # ARGV(所有的参数) 
  # ARGN(macro需要的必要参数以外的参数)
  math(EXPR num_macro_calls "${num_macro_calls} + 1")
  message(STATUS "add_catch_test called with ${ARGC} arguments: ${ARGV}")

  set(_argn "${ARGN}")
  if(_argn)
    message(STATUS "oops - macro received argument(s) we did not expect: ${ARGN}")
  endif()
  # 添加测试
  add_test(
    NAME
      ${_name}
    COMMAND
      $<TARGET_FILE:cpp_test>
      [${_name}] --success --out
      ${PROJECT_BINARY_DIR}/tests/${_name}.log --durations yes
    WORKING_DIRECTORY
      ${CMAKE_CURRENT_BINARY_DIR}
    )
  # 设置 cmake 测试代价
  set_tests_properties(
    ${_name}
    PROPERTIES
      COST ${_cost}
    )
endmacro()

set(num_macro_calls 0)

add_catch_test(short 1.5)
add_catch_test(long 2.5 extra_argument)

message(STATUS "in total there were ${num_macro_calls} calls to add_catch_test")
