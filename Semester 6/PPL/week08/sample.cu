#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#define N 1024
__global__ void countA(char *A,int *d_count)
{	
	int gtid = threadIdx.x;
	if(A[gtid]=='a') atomicAdd(d_count,1);
}

int main(void)
{
	char A[N], *d_A;
	int count=0, *d_count;
	printf("Enter a string: "); scanf("%s",A);
	cudaEvent_t start,stop;
	cudaEventCreate(&start); cudaEventCreate(&stop);
	cudaEventRecord(start,0);
	cudaMalloc((void **)&d_A,strlen(A)*sizeof(char));
	cudaMalloc((void **)&d_count,sizeof(int));
	cudaMemcpy(d_A,A,strlen(A)*sizeof(char),cudaMemcpyHostToDevice);
	cudaMemcpy(d_count,&count,sizeof(int), cudaMemcpyHostToDevice);
	countA<<<1,strlen(A)>>>(d_A,d_count);
	cudaEventRecord(stop,0);
	cudaEventSynchronize(stop);
	float elapsedTime;
	cudaEventElapsedTime(&elapsedTime,start,stop);
	cudaMemcpy(&count,d_count,sizeof(int),cudaMemcpyDeviceToHost);
	printf("A occurences: %d\n",count);
	printf("Time taken: %f",elapsedTime);
	cudaFree(d_A);
	cudaFree(d_count);
	return 0;
}