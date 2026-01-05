cmake_minimum_required(VERSION 3.15)
project(tapas_0 CXX)

add_executable(tapas_0 
  src/main.cpp
  src/print_info.cpp)

install(TARGETS tapas_0 DESTINATION "."
        RUNTIME DESTINATION bin
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        )
