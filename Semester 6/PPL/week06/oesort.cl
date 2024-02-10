__kernel void even (__global int *A) 
{
	int idx = get_global_id(0);
	int size = get_global_size(0);
	int temp;
	if ((idx % 2 == 0) && ((idx + 1) < size)) {
		if (A[idx] > A[idx+1]) {
			temp = A[idx];
			A[idx] = A[idx+1];
			A[idx+1] = temp;
		}
	}
}
__kernel void odd (__global int *A) 
{
	int idx = get_global_id(0);
	int size = get_global_size(0);
	int temp;
	if ((idx % 2 != 0) && ((idx + 1) < size)) {
		if(A[idx] > A[idx+1]) {
			temp = A[idx];
			A[idx] = A[idx+1];
			A[idx+1] = temp;
		}
	}
}