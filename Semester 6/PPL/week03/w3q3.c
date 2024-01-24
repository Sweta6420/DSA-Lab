#include "mpi.h"
#include <stdio.h>
#include <string.h>
int findnonvowels(char str[],int m)
{	
	int count=0;
	for(int i=0; i<m; i++)
	{
		if(str[i]=='A'||str[i]=='E'||str[i]=='I'||str[i]=='O'||str[i]=='U'||str[i]=='a'||str[i]=='e'||str[i]=='i'||str[i]=='o'||str[i]=='u')
			count++;
	}
	return m-count;
}
int main(int argc, char * argv[])
{
	int rank,size,m,nonvow,nonvowcounts[10],sum=0;
	char str[100],a[10],n;
	MPI_Init(&argc,&argv);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	MPI_Comm_size(MPI_COMM_WORLD,&size);
	if(rank==0)
	{	
		printf("Enter string: ");
		scanf("%s",str);
		n = strlen(str);
		m = n/size;
	}
	MPI_Bcast(&m,1,MPI_INT,0,MPI_COMM_WORLD);
	MPI_Scatter(str,m,MPI_CHAR,a,m,MPI_CHAR,0,MPI_COMM_WORLD);
	nonvow  = findnonvowels(a,m);
	MPI_Gather(&nonvow,1,MPI_INT,nonvowcounts,1,MPI_INT,0,MPI_COMM_WORLD);
	if(rank==0)
	{	
		for(int i=0;i<size;i++)
		{	
			printf("%d - %d\n",i,nonvowcounts[i]);
			sum += nonvowcounts[i];
		}
		printf("Total Non-Vowels = %d\n",sum);
	}
	MPI_Finalize();
}