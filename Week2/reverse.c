//Reverse an array using pointers

#include <stdio.h>

void reverse(int *p, int n)
{
	int i, temp;
	for (i=0; i<n/2; i++)
	{
		temp = *(p+i);
		*(p+i)=*(p+n-i-1);
		*(p+n-i-1)=temp;
	}
}

int main()
{
	int n, a[100],i;
	printf("Enter Number of elements: ");
	scanf("%d", &n);
	printf("Enter elements: ");
	for (i=0; i<n; i++)
	{
		scanf("%d", &a[i]);
	}
	reverse(&a[0], n);
	for (i=0; i<n; i++)
	{
		printf("%d ", a[i]);
	}
return 0;
}