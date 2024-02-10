__kernel void wordrev(__global char *A,__global int *n,__global int *B)
{
	int i = get_global_id(0);
	for(int j=0; j<(*n); j++) B[i*(*n)+j]=A[j];
}