

#include <stdio.h>
/* write the simple kernel function to print at GPU */

__global__ void helloFromGPU(void){
    /* the common block and thread representation */
    const int bid = blockIdx.z * gridDim.x * gridDim.y + blockIdx.y * gridDim.x + blockIdx.x;

    const int tid = threadIdx.z * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    printf("Hello World from GPU block %d and thread %d !\n",bid,tid);

}


int main(){
    printf("Hello World from CPU!\n");
    dim3 grid(2,2,3);
    dim3 block(2,2,3);
    helloFromGPU<<<grid,block>>>(); /* 10 threads are called to execute the func */
    cudaDeviceReset(); /* clear all resources about the Device */
    return 0;
}

/*
    Hello World from CPU!
    Hello World from GPU!
    Hello World from GPU!
    Hello World from GPU!
    Hello World from GPU!
    Hello World from GPU!
    Hello World from GPU!
    Hello World from GPU!
    Hello World from GPU!
    Hello World from GPU!
    Hello World from GPU!
 */