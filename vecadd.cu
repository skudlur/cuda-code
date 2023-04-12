#include <cuda_runtime.h>
#include <device_launch_parameters.h>

#include <stdio.h>

__global__ void Vecadd()
{
    printf("Hello from GPU \n");
}

int main()
{
    int N = 10;
    //Kernel invocation with N threads
    Vecadd << <1, N >> > ();

    return 0;
}
