cmake_minimum_required(VERSION 3.26)
project(Cuda)


enable_language(CUDA)  # open the cuda support
set(CMAKE_CUDA_STANDARD 11)
set(CMAKE_CXX_STANDARD 11)

include_directories(./common)  # add the include header file

add_executable(hello Introduce/hello.cu)
add_executable(dimension Introduce/dimension.cu)
add_executable(checkIt Introduce/checkIt.cu)
add_executable(memory Introduce/memory.cu)
add_executable(vec_add Excute/vec_Add_cuda.cu)
add_executable(ptr Introduce/Ptr.cpp)


add_executable(add Excute/vec_Add.cpp)
add_executable(errorCheck Excute/errorCheck.cu)
add_executable(useage Excute/Useage.cu)
