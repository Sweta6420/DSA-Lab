#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>

__global__ void oneDconv(int *a,int *k,int *r, int as,int ks)
{	
	int gtid = blockIdx.x*blockDim.x+threadIdx.x;
	int h = ks/2;
	if (gtid<as) 
	{
		int result = 0, i, ii;
		for(i=0; i<ks; i++)
		{
			ii=gtid-h+i;
			if(ii>=0 && ii<=as) result=result+a[ii]*k[i];
		}
		r[gtid]=result;
	}
}
int main(void)
{
	int a[10]={1,2,3,4,5,6,7,8,9,10},k[3]={1,2,1},r[10];
	int as=10,ks=3,size1=as*sizeof(int),size2=ks*sizeof(int);
	int *da,*dk,*dr;
	cudaMalloc((void **)&da,size1);
	cudaMalloc((void **)&dk,size2);
	cudaMalloc((void **)&dr,size1);
	cudaMemcpy(da,a,size1,cudaMemcpyHostToDevice);
	cudaMemcpy(dk,k,size2,cudaMemcpyHostToDevice);
	oneDconv<<<ceil(as/32.0),32>>>(da,dk,dr,as,ks);
	cudaMemcpy(&r,dr,size1,cudaMemcpyDeviceToHost);
	for(int i=0; i<as; i++) printf("%d ",r[i]);
	cudaFree(da);
	cudaFree(dk);
	cudaFree(dr);
	return 0;
}