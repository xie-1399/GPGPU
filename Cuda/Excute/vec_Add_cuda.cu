/* the vec add with cuda version */
#include <stdio.h>
#include <math.h>
#include "excute.cuh"
#include <iostream>
using namespace std;
const float diff = 1.0e-15;
const float a_value = 1.03f;
const float b_value = 1.02f;
const float c_value = 2.05f;

/* the kernel function to cal the vec add value  */
__global__ void vec_add(float* a,float* b,float* c,const int N){
    const int n = blockDim.x * blockIdx.x + threadIdx.x;
    if(n > N) return;  /* can use the return to avoid some logic errors */
    c[n] = a[n] + b[n];
}

void check(const float *z,const int N){
    bool has_error = false;
    for(int i = 0; i < N;i++){
        if(fabs(z[i] - c_value) > diff){
            cout << (z[i] - c_value) << endl;
            has_error = true;
        }
    }
    printf("%s\n",has_error ? "Has Error": "Right ");
}

int main(){

    const int N = 10000;
    const int size = sizeof (float) * N;
    float *x_h = (float *) malloc(size);
    float *y_h = (float *) malloc(size);
    float *z_h = (float *) malloc(size);
    for(int i = 0;i < N; i++){
        x_h[i] = a_value;
        y_h[i] = b_value;
    }

    /* set init device memory  */
    float *x_d,*y_d,*z_d;
    cudaMalloc(&x_d,size); /* here change the ptr position,  so should pass the ptr address */
    cudaMalloc((void **) &y_d,size);
    cudaMalloc((void **) &z_d,size);

    /* copy the host data to the cuda device */
    cudaMemcpy(x_d,x_h,size,cudaMemcpyHostToDevice);
    cudaMemcpy(y_d,y_h,size,cudaMemcpyHostToDevice);

    /* calculate on the device should be dived */
    const int block_size = 128;
    const int grid_size = (N-1) / block_size + 1; /* the common type of grid size  */
    vec_add<<<grid_size,block_size>>>(x_d,y_d,z_d,N);

    /* move the device result to the host */
    cudaMemcpy(z_h,z_d,size,cudaMemcpyDeviceToHost);
    check(z_h,N);

    free(x_h);
    free(y_h);
    free(z_h);

    cudaFree(x_d);
    cudaFree(y_d);
    cudaFree(z_d);
    return 0;
}