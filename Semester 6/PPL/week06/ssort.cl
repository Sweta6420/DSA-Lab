__kernel void ssort(__global int *A,__global int *B,__global int *n)
{
	int i = get_global_id(0);
	int num = A[i];
	int pos=0;
	for(int j=0; j<(*n); j++)
	{
		if(A[j]<num || (i>j && A[j]==A[i])) pos++;
	}
	B[pos]=num;
}