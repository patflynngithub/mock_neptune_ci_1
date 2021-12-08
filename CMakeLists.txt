project (HELLO)
enable_testing()

if(PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
  message(FATAL_ERROR "In-source builds are not allowed")
endif()

add_test(NAME main_1
         COMMAND ./bin/main_1 succeed
         WORKING_DIRECTORY ${PROJECT_BINARY_DIR})


