#include <stdio.h>

double add(double a[100], int n)
{
	int i;
	double sum=0;
	for (i=0; i<n; i++)
	{
		sum+=a[i];
	}
	return sum;
}
int main()
{
	int n, i;
	double a[100], sum;
	printf("Enter number of elements: ");
	scanf("%d", &n);
	printf("Enter elements: ");
	for (i=0; i<n; i++)
	{
		scanf("%lf", &a[i]);
	}	
	sum = add(a,n);
	printf("Sum of elements: %lf", sum);
return 0;
}