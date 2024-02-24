#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include <math.h>

__global__ void sine(float *a,float *b,int n)
{	
	int gtid = blockIdx.x*blockDim.x+threadIdx.x;
	//printf("a[%d] = %.2f\n",gtid,a[gtid]);
	if (gtid<n) b[gtid] = sinf(a[gtid]);
}

int main(void)
{
	float a[10]={1.56,6.0,3.4,5.7,8.7,4.5,9.3,2.4,1.3,8.5},b[10];
	int n=10,size = sizeof(int)*n;
	float *da,*db;
	cudaMalloc((void **)&da,size);
	cudaMalloc((void **)&db,size);
	cudaMemcpy(da,a,size,cudaMemcpyHostToDevice);
	sine<<<ceil(n/256.0),256>>>(da,db,n);
	cudaMemcpy(&b,db,size,cudaMemcpyDeviceToHost);
	for(int i=0; i<n; i++) printf("%.2f ",b[i]);
	cudaFree(da);
	cudaFree(db);
	return 0;
}