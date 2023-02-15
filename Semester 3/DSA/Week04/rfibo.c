#include <stdio.h>
int recfibo(int n)
{
	if (n==0 || n==1) return n;
	else return recfibo(n-1) + recfibo(n-2);
}
int main()
{
	int n;
	printf("Enter number of values: ");
	scanf("%d", &n);
	for (int i=0; i<n; i++) printf("%d ",recfibo(i));
	return 0;
}