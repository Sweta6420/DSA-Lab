#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include <stdlib.h>
__global__ void transpose(int *a, int *t)
{
	int n = threadIdx.x, m=blockIdx.x, size=blockDim.x, size1=gridDim.x;
	t[n*size1+m] = a[m*size+n];
}
int main(void)
{
	int *a, *t, m,n;
	int *d_a,*d_t;
	printf("m value: "); scanf("%d",&m);
	printf("n value: "); scanf("%d",&n);
	int size = sizeof(int)*m*n;
	a = (int *) malloc(size);
	t = (int *) malloc(size);
	printf("Enter matrix: ");
	for(int i=0; i<m*n; i++) scanf("%d",&a[i]);
	cudaMalloc((void **) &d_a,size);
	cudaMalloc((void **) &d_t,size);
	cudaMemcpy(d_a,a,size,cudaMemcpyHostToDevice);
	transpose<<<m,n>>>(d_a,d_t);
	cudaMemcpy(t,d_t,size,cudaMemcpyDeviceToHost);
	printf("Result vector:\n");
	for(int i=0; i<n; i++)
	{
		for(int j=0; j<m; j++) printf("%d ",t[i*m+j]);
		printf("\n");
	}
	cudaFree(d_a);
	cudaFree(d_t);
	return 0;	
}