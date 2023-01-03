
//Product of 2 matrices using functions and dynamic memory allocation

#include <stdio.h>
#include <stdlib.h>

void read(int *p, int r, int c)
{
	int i, j;
	for (i=0; i<r; i++)
	{
		for (j=0; j<c; j++)
		{
			scanf("%d", (p+i*c)+j);
}}}

void display(int *p, int r, int c)
{
	int i, j;
	for (i=0; i<r; i++)
	{
		for (j=0; j<c; j++)
		{
			printf("%d ", *((p+i*c)+j));
		}
		printf("\n");
}}

void multiply(int *p1, int r1, int c1, int *p2, int r2, int c2, int *p3)
{
	int i,j,k;
	for (i=0; i<r1; i++)
	{
		for (j=0; j<c2; j++)
		{
			int sum =0;
			for (k=0; k<c1; k++)
			{
				sum+=*((p1+i*c1)+k)**((p2+k*c2)+j);
			}
			*((p3+i*c2)+j)=sum;
}}}

int main()
{
	int r1, r2, c1, c2, *a, *b, *c;
	printf("Enter dimensions of first matrix: ");
	scanf("%d %d", &r1, &c1);
	printf("Enter elements: ");
	a = (int *) malloc (r1*c1*sizeof(int)); //Dynamic Allocation
	read(a, r1, c1);
	printf("Enter dimensions of second matrix: ");
	scanf("%d %d", &r2, &c2);
	b = (int *) malloc (r2*c2*sizeof(int));
	printf("Enter elements: ");
	read(b,r2,c2);
	printf("First matrix:\n");
	display(a,r1,c1);
	printf("Second matrix:\n");
	display(b,r2,c2);
	c = (int *) malloc (r1*c2*sizeof(int));
	if (r2!=c1)
	{
		printf("Cannot Multiply");
		return 0;
	}
	else
	{
		multiply(a,r1,c1,b,r2,c2,c);
		printf("Resultant Matrix:\n");
		display(c,r1,c2);
	}
return 0;
}