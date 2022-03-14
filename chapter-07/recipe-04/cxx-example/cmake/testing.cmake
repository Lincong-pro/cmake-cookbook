# 此处使用函数代替macro模块
function(add_catch_test)
  set(options)                                        # ???这一步的作用是什么，有一点类似于打开开关的作用
  set(oneValueArgs NAME COST)                         # 设置集合，通过cmake_parse_argumnets获取 NAME COST紧跟的参数
  set(multiValueArgs LABELS DEPENDS REFERENCE_FILES)  # 设置集合，通过cmake_parse_argumnets获取LABLES DEPENDS参数
  # 约束函数按照 options oneValueArgs multiValueArgs 解析参数 
  cmake_parse_arguments(add_catch_test
    "${options}"
    "${oneValueArgs}"
    "${multiValueArgs}"
    ${ARGN}
    )
  
  message(STATUS "defining a test ...")
  message(STATUS "    NAME: ${add_catch_test_NAME}")
  message(STATUS "    LABELS: ${add_catch_test_LABELS}")
  message(STATUS "    COST: ${add_catch_test_COST}")
  message(STATUS "    REFERENCE_FILES: ${add_catch_test_REFERENCE_FILES}")

  add_test(
    NAME
      ${add_catch_test_NAME}
    COMMAND
      $<TARGET_FILE:cpp_test>  # ???
      [${add_catch_test_NAME}] --success --out
      ${PROJECT_BINARY_DIR}/tests/${add_catch_test_NAME}.log --durations yes
    WORKING_DIRECTORY
      ${CMAKE_CURRENT_BINARY_DIR}
    )
  # 设置 LABELS 参数
  set_tests_properties(${add_catch_test_NAME}
    PROPERTIES
      LABELS "${add_catch_test_LABELS}"
    )
  # 设置 COST 参数
  if(add_catch_test_COST)
    set_tests_properties(${add_catch_test_NAME}
      PROPERTIES
        COST ${add_catch_test_COST}
      )
  endif()
  # 设置 DEPENDS参数
  if(add_catch_test_DEPENDS)
    set_tests_properties(${add_catch_test_NAME}
      PROPERTIES
        DEPENDS ${add_catch_test_DEPENDS}
      )
  endif()
  # 设置 REFERENCE_FILES 参数
  if(add_catch_test_REFERENCE_FILES)
    file(
      COPY
        ${add_catch_test_REFERENCE_FILES}
      DESTINATION
        ${CMAKE_CURRENT_BINARY_DIR}
      )
  endif()
endfunction()
