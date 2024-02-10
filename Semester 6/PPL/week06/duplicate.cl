__kernel void duplicate(__global char *A,__global int *n,__global char *B)
{
	int i = get_global_id(0);
	for(int j=0; j<(*n); j++) B[i*(*n)+j]=A[j];
}