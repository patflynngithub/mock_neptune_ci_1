project (HELLO)
enable_testing()

add_executable (main main.cc)

add_test(NAME main_succeed 
         COMMAND ./main succeed
         WORKING_DIRECTORY ${PROJECT_BINARY_DIR})

add_test(NAME main_fail
         COMMAND ./main fail
         WORKING_DIRECTORY ${PROJECT_BINARY_DIR})

