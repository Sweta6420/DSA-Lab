#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include <stdlib.h>
__global__ void matadd(int *a, int *b, int *t,int n)
{
	int m=threadIdx.x;
	for(int i=0; i<n; i++)
	{
		t[m*n+i] = a[m*n+i]+b[m*n+i];
	}
}
int main(void)
{
	int *a, *b,*t, m,n;
	int *d_a,*d_b,*d_t;
	printf("m value: "); scanf("%d",&m);
	printf("n value: "); scanf("%d",&n);
	int size = sizeof(int)*m*n;
	a = (int *) malloc(size);
	b = (int *) malloc(size);
	t = (int *) malloc(size);
	printf("Enter matrix A: ");
	for(int i=0; i<m*n; i++) scanf("%d",&a[i]);
	printf("Enter matrix B: ");
	for(int i=0; i<m*n; i++) scanf("%d",&b[i]);
	cudaMalloc((void **) &d_a,size);
	cudaMalloc((void **) &d_b,size);
	cudaMalloc((void **) &d_t,size);
	cudaMemcpy(d_a,a,size,cudaMemcpyHostToDevice);
	cudaMemcpy(d_b,b,size,cudaMemcpyHostToDevice);
	matadd<<<1,m>>>(d_a,d_b,d_t,n);
	cudaMemcpy(t,d_t,size,cudaMemcpyDeviceToHost);
	printf("Result vector:\n");
	for(int i=0; i<m; i++)
	{
		for(int j=0; j<n; j++) printf("%d ",t[i*n+j]);
		printf("\n");
	}
	cudaFree(d_a);
	cudaFree(d_t);
	return 0;	
}