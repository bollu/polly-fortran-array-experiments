#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <cuda.h>
#include <cuda_runtime.h>
void f(int *A, int *B) {
    for(int i = 0; i < 5; i++) A[i] = 10;
}


#define CHECK(r) {_check((r), __LINE__);}

void _check(cudaError_t r, int line) {
    if (r != cudaSuccess) {
        printf("CUDA error on line %d: %s\n", line, cudaGetErrorString(r));
        exit(0);
    }
}

void print_arr(int *A) {
    for(int i = 0; i < 5; i++)
        printf("%d := %d\n", i, A[i]);
}
int main() {
    int *A = NULL; int *B = NULL;

    const int ManagedMemory = 1;
    printf("*** ManagedMemory: %d\n", ManagedMemory);

    if (ManagedMemory) {
        printf("CudaMallocManaged-allocating A & B...\n");
        CHECK(cudaMallocManaged(&A, sizeof(int) * 5, cudaMemAttachGlobal));
        printf("A allocated...\n");
        CHECK(cudaMallocManaged(&B, sizeof(int) * 5, cudaMemAttachGlobal));
        printf("B allocated...\n");
    }  else {
        A = (int *)malloc(sizeof(int) * 5);
        B = (int *)malloc(sizeof(int) * 5);
    }

    assert(A != NULL);
    assert(B != NULL);

    for(int i = 0; i < 5; i++) { B[i] = i + 1; A[i] = -42; }


    printf("launching kernel...\n");
    f(A, B);
    cudaDeviceSynchronize();

    printf("printing A...\n");
    print_arr(A);
    return 0;
}
