cmake_minimum_required(VERSION 3.26)
project(Cuda CUDA)

set(CMAKE_CUDA_STANDARD 11)

add_executable(Cuda Introduce/hello.cu)

set_target_properties(Cuda PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)
