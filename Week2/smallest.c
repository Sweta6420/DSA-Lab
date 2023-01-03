//Smallest in an array

#include <stdio.h>
#include <stdlib.h>

void smallest(int *p, int n, int *s)
{
	*s = *p;
	int i;
	for (int i=0; i<n; i++)
	{
		if (*(p+i)<*s) *s = *(p+i);
	}
}

int main()
{
	int i,n,*p, small;
	printf("Enter Number of elements: ");
	scanf("%d", &n);
	printf("Enter elements: ");
	p = (int *) malloc (n*sizeof(int));
	for (i=0; i<n; i++)
	{
		scanf("%d", p+i);
	}
	smallest(p,n,&small);
	printf("Smallest: %d", small);

return 0;
}