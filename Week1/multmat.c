#include <stdio.h>

int main()
{
	int i, j, k, r1, c1, r2, c2;
	printf("Enter dimensions of first matrix: ");
	scanf("%d %d", &r1, &c1);
	int a[r1][c1];
	printf("Enter array elements: ");
	for (i=0; i<r1; i++)
	{
		for (j=0; j<c1; j++)
		{
			scanf("%d", &a[i][j]);
		}
	}
	printf("Enter dimensions of second matrix: ");
	scanf("%d %d", &r2, &c2);
	int b[r2][c2];
	printf("Enter array elements: ");
	for (i=0; i<r2; i++)
	{
		for (j=0; j<c2; j++)
		{
			scanf("%d", &b[i][j]);
		}
	}
	int c[r1][c2];
	if (c1!=r2)
	{
		printf("Not able to multiply");
		return 0;
	}
	else 
	{
		for (i=0; i<r1; i++)
		{
			for (j=0; j<c2; j++)
			{
				int sum =0;
				for (k=0; k<c1; k++)
				{
					sum+=a[i][k]*b[k][j];
				}
				c[i][j]=sum;
			}
		}
	}
	printf("Resultant Matrix: ");
	for (i=0; i<r1; i++)
	{
		for (j=0; j<c2; j++)
		{
			printf("%d ", c[i][j]);
		}
		printf("\n");
	}
}