#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>

__global__ void vecadd(int *a,int *b,int *c, int n)
{	
	int gtid = blockIdx.x*blockDim.x+threadIdx.x;
	printf("a[%d] = %d, b[%d]= %d\n",gtid,a[gtid],gtid,b[gtid]);
	if (gtid<n) c[gtid] = a[gtid] + b[gtid];
}

int main(void)
{
	int a[100],b[100],c[100],n;
	printf("Enter n: ");
	scanf("%d",&n);
	printf("Enter A values: ");
	for(int i=0; i<n; i++) scanf("%d",&a[i]);
	printf("Enter B values: ");
	for(int i=0; i<n; i++) scanf("%d",&b[i]);
	int size = sizeof(int)*n;
	int *da,*db,*dc;
	cudaMalloc((void **)&da,size);
	cudaMalloc((void **)&db,size);
	cudaMalloc((void **)&dc,size);
	cudaMemcpy(da,a,size,cudaMemcpyHostToDevice);
	cudaMemcpy(db,b,size,cudaMemcpyHostToDevice);
	vecadd<<<1,n>>>(da,db,dc,n);
	cudaMemcpy(&c,dc,size,cudaMemcpyDeviceToHost);
	for(int i=0; i<n; i++) printf("%d ",c[i]);
	cudaFree(da);
	cudaFree(db);
	cudaFree(dc);
	return 0;
}