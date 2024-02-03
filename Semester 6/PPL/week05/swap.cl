__kernel void swap(__global int *A)
{
	int idx = get_global_id(0);
	int digit;
	int binnum=A[idx];
	if(idx%2==0)
	{
		digit=A[idx];
		A[idx]=A[idx+1];
		A[idx+1]=digit;
	}
}