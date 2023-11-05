
/* this show a more complex shape of the cuda thread */
#include <cuda_runtime.h>
#include <stdio.h>
__global__ void checkIndex(void)
{
    printf("threadIdx:(%d,%d,%d) blockIdx:(%d,%d,%d) blockDim:(%d,%d,%d) gridDim(%d,%d,%d)\n",threadIdx.x,threadIdx.y,threadIdx.z,
           blockIdx.x,blockIdx.y,blockIdx.z,blockDim.x,blockDim.y,blockDim.z,
           gridDim.x,gridDim.y,gridDim.z);
}

void complexShape(){
    int nElem = 48;
    dim3 block(3,2,2);
    dim3 grid(2,2);
    printf("grid.x %d grid.y %d grid.z %d\n",grid.x,grid.y,grid.z);
    printf("block.x %d block.y %d block.z %d\n",block.x,block.y,block.z);
    checkIndex<<<grid,block>>>();
    cudaDeviceSynchronize();
}

int main(int argc,char **argv)
{
    /* define two blocks and each block has three threads */
    int nElem=6;
    dim3 block(3);
    dim3 grid((nElem+block.x-1)/block.x);
    printf("grid.x %d grid.y %d grid.z %d\n",grid.x,grid.y,grid.z);
    printf("block.x %d block.y %d block.z %d\n",block.x,block.y,block.z);
    checkIndex<<<grid,block>>>();
    cudaDeviceReset();
    complexShape(); /* a more complex shape trans */
    return 0;
}