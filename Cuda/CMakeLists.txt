cmake_minimum_required(VERSION 3.26)
project(Cuda CUDA)

set(CMAKE_CUDA_STANDARD 11)

include_directories(./common)

add_executable(hello Introduce/hello.cu)
add_executable(dimension Introduce/dimension.cu)
add_executable(checkIt Introduce/checkIt.cu)
add_executable(memory Introduce/memory.cu)

set_target_properties(hello PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)
