__kernel void wordrev(__global char *S, __global int *p)
{
	int idx = get_global_id(0);
	int start = p[idx*2];
	int stop = p[idx*2+1];

	char temp;
	for(int i=start,j=stop;i<j;i++,j--)
	{
		temp = S[i];
		S[i] = S[j];
		S[j] = temp;
	}
}
