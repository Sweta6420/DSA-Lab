#include <stdio.h>

int lsearch(int value, int a[100], int n)
{
	int i;
	for (i=0; i<n; i++)
	{
		if (a[i]==value) 
		{
			return i;
		}
	}
	return -1;
}

int main()
{
	int i, n, a[100], index, value;
	printf("Enter number of elements: ");
	scanf("%d", &n);
	printf("Enter elements: ");
	for (i=0; i<n; i++)
	{
		scanf("%d", &a[i]);
	}	
	printf("Enter value to be searched: ");
	scanf("%d", &value);
	index = lsearch(value, a, n);
	printf("%d is at index %d", value, index);
}