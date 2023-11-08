#include <stdio.h>

/* here should understand more details in c++ */

/* return the value to the add*/
__device__ double add1(const double x , const double y){
    return (x + y);
}

__global__ void vecaddUse1(double *x, double *y, double *z,const int N){
    const int n = blockDim.x * blockIdx.x + threadIdx.x;
    if(n < N) { z[n] = add1(x[n],y[n]);}
}

/* use the pointer in the device */
__device__ void add2(double x , double y , double *z){
    *z = x + y;
}

__global__ void vecaddUse2(double *x, double *y, double *z,const int N){
    const int n = blockDim.x * blockIdx.x + threadIdx.x;
    if(n < N) {
        add2(x[n],y[n],&z[n]);
    }
}

/* use the ref in the device */
__device__ void add3(double x , double y , double &z){
    z = x + y;
}

__global__ void vecaddUse3(double *x, double *y, double *z,const int N){
    const int n = blockDim.x * blockIdx.x + threadIdx.x;
    if(n < N) {
        add3(x[n],y[n],z[n]);
    }
}
