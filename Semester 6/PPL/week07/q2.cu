#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>

__global__ void vecadd(int *a,int *b,int *c, int n)
{	
	int gtid = blockIdx.x*blockDim.x+threadIdx.x;
	if (gtid<n) c[gtid] = a[gtid] + b[gtid];
}

int main(void)
{
	int a[500],b[500],c[500],n=500;
	for(int i=0; i<n; i++) a[i]=i+1;
	for(int i=0; i<n; i++) b[i]=i+1;
	int size = sizeof(int)*n;
	int *da,*db,*dc;
	cudaMalloc((void **)&da,size);
	cudaMalloc((void **)&db,size);
	cudaMalloc((void **)&dc,size);
	cudaMemcpy(da,a,size,cudaMemcpyHostToDevice);
	cudaMemcpy(db,b,size,cudaMemcpyHostToDevice);
	vecadd<<<ceil(n/256.0),256>>>(da,db,dc,n);
	cudaMemcpy(&c,dc,size,cudaMemcpyDeviceToHost);
	for(int i=0; i<n; i++) printf("%d ",c[i]);
	cudaFree(da);
	cudaFree(db);
	cudaFree(dc);
	return 0;
}