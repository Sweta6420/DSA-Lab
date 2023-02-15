#include <stdio.h>

int seclargest (int a[100], int n)
{
	int i, large, large2;
	large = (a[0]>a[1])?a[0]:a[1];
	large2 =  (a[0]<a[1])?a[0]:a[1];
	for (i=2; i<n; i++)
	{
		if (a[i]>large)
		{
			large2 = large;
			large = a[i];
		}
	}
	return large2;
}

int main()
{
	int i, n, a[100], large2;
	printf("Enter number of elements: ");
	scanf("%d", &n);
	printf("Enter elements: ");
	for (i=0; i<n; i++)
	{
		scanf("%d", &a[i]);
	}	
	large2 = seclargest(a,n);
	printf("Second largest element in array: %d\n", large2);
return 0;
}