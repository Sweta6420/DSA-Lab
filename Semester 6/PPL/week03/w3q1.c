#include "mpi.h"
#include <stdio.h>
#include <math.h>
int fact(int n)
{
	int ans = 1;
	for(int i=2; i<=n; i++) ans*=i;
	return ans;
}
int main(int argc, char *argv[])
{
	int rank,n,a[10],b[10],size,c;
	MPI_Init(&argc,&argv);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	MPI_Comm_size(MPI_COMM_WORLD,&size);
	if(rank==0)
	{
		n = size;
		printf("Enter %d values: ",n);
		for(int i=0; i<n; i++) scanf("%d",&a[i]);
	}
	MPI_Scatter(a,1,MPI_INT,&c,1,MPI_INT,0,MPI_COMM_WORLD);
	// printf("Received %d in %d\n",c,rank);
	c = fact(c);
	MPI_Gather(&c,1,MPI_INT,b,1,MPI_INT,0,MPI_COMM_WORLD);
	if(rank==0)
	{
		printf("Result in root: \n");
		int sum=0;
		for(int i=0; i<n; i++) sum+=b[i];
		printf("%d",sum);
	}
	MPI_Finalize();
	return 0;
}