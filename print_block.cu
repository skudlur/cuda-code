#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

__global__ void print_threadIds()
{
    printf("threadIdx.x : %d, threadIdx.y : %d, threadIdx.z : %d \n",
   	 threadIdx.x, threadIdx.y, threadIdx.z);
}

__global__ void print_block()
{
    printf("blockIdx.x : %d, blockIdx.y : %d, blockIdx.z : %d, blockDim.x : %d, blockDim.y : %d, blockDim.z : %d, gridDim.x : %d, gridDim.y : %d, gridDim.z, %d \n",
   	 blockIdx.x, blockIdx.y, blockIdx.z, blockDim.x, blockDim.y, blockDim.z, gridDim.x, gridDim.y, gridDim.z);
}

int main()
{
    int nx, ny;
    nx = 16;
    ny = 16;

    dim3 block(8, 8);
    dim3 grid(nx / block.x, ny / block.y);

    print_block << <grid, block >> > ();
    cudaDeviceSynchronize(); //we wait till our kernel has finished its execution.
    cudaDeviceReset();
    return 0;
}
