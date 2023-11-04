

#include <stdio.h>
/* write the simple kernel function to print at GPU */

__global__ void helloFromGPU(void){
    printf("Hello World from GPU!\n");
}


int main(){
    printf("Hello World from CPU!\n");
    helloFromGPU<<<1,10>>>(); /* 10 threads are called to execute the func */
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