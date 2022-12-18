cmake_minimum_required(VERSION 3.16)
project(permutations)

add_executable(main main.c)
add_executable(twoline twoline.c)
add_executable(cycle cycle.c)
target_link_libraries(main m)
target_link_libraries(cycle m)
target_link_libraries(twoline m)
