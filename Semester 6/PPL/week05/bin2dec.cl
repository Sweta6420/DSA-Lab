__kernel void bin2dec(__global int *A, __global int *B) {  
   int idx = get_global_id(0);
   int n = A[idx],dec=0,rem,i=0;
   while (n != 0) 
   {
      rem = n % 10;
      n /= 10;
      int power = 1<<i;
      dec += rem * power;
      i++;
   }
   B[idx]=dec;
}