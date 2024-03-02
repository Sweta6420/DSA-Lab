#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include <stdlib.h>
#define MAX 1024
__global__ void modifyStr(char *A,char *B,int n)
{	
	int i = threadIdx.x;
	int start = n*(n+1)/2 - (i+1)*(i+2)/2;
	for(int j=0; j<=i; j++) 
	{	
		printf("%d %c %d\n",i,A[j],j+start);	
		B[j+start] = A[j];
	}
}

int main(void)
{
	char A[100],B[MAX],*d_A,*d_B;
	printf("Enter A: "); scanf("%s",A);
	int n = strlen(A);
	cudaMalloc((void **)&d_A,strlen(A)*sizeof(char));
	cudaMalloc((void **)&d_B,strlen(B)*sizeof(char));
	cudaMemcpy(d_A,A,n*sizeof(char),cudaMemcpyHostToDevice);
	modifyStr<<<1,n>>>(d_A,d_B,n);
	cudaMemcpy(B,d_B,MAX*sizeof(char),cudaMemcpyDeviceToHost);
	B[n*(n+1)/2]='\0';
	puts(B);
	cudaFree(d_A);
	cudaFree(d_B);
	return 0;
}