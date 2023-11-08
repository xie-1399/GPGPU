

/* this show the simple vector add programing with cc
 * some little program for the c++ */

#include <math.h>
#include <stdio.h>

const float diff = 1.0e-15;
const float a_value = 1.03f;
const float b_value = 1.02f;
const float c_value = 2.05f;

void add(float* a,float* b,float* c, const int N){
    for(int i = 0;i<N;i++){
        c[i] = a[i] + b[i];
    }
}

void check(const float *z,const int N){
    bool has_error = false;
    for(int i = 0; i < N;i++){
        if(fabs(z[i] - c_value) > diff){
            has_error = true;
        }
    }
    printf("%s\n",has_error ? "Has Error": "Right ");
}

int main(){

    /* if malloc notice to free  */

    const int N = 10000;
    const int size = sizeof (float) * N;

    float *x = (float *) malloc(size);
    float *y = (float *) malloc(size);
    float *z = (float *) malloc(size);
    for(int i = 0;i < N; i++){
        x[i] = a_value;
        y[i] = b_value;
    }
    add(x,y,z,N);
    check(z,N);
    free(x);
    free(y);
    free(z);

    return 0;
}
