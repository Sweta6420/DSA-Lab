__kernel void onesC(__global int *A, __global int *B) {  
   int idx = get_global_id(0);
   B[idx]=~A[idx];
}