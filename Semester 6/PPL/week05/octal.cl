__kernel void octal(__global int *A, __global int *B) {  
    int idx = get_global_id(0);
    int quotient,octalNumber[100], i = 1, j;
    quotient = A[idx];
    B[idx]=0;
    while (quotient != 0)
    {
        octalNumber[i++] = quotient % 8;
        quotient = quotient / 8;
    }
    for (j = i - 1; j > 0; j--) B[idx] = B[idx]*10 + octalNumber[j];
}