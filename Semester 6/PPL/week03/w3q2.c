#include "mpi.h"
#include <stdio.h>
int main(int argc, char * argv[])
{
	int rank,size,m,arr[100];
	MPI_Init(&argc,&argv);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	MPI_Comm_size(MPI_COMM_WORLD,&size);
	float arravg[size],avg=0,sum=0;
	if(rank==0)
	{	
		printf("Enter no. of values in each process: ");
		scanf("%d",&m);
		printf("Enter %d values: ",size*m);
		for(int i=0;i<size*m;i++) scanf("%d",&arr[i]);
	}
	MPI_Bcast(&m,1,MPI_INT,0,MPI_COMM_WORLD);
	int	a[m];
	MPI_Scatter(arr,m,MPI_INT,a,m,MPI_INT,0,MPI_COMM_WORLD);
	for(int i=0; i<m; i++) avg += a[i];
	avg = avg/m;
	printf("Average in rank %d = %f\n",rank,avg);
	MPI_Gather(&avg,1,MPI_FLOAT,arravg,1,MPI_FLOAT,0,MPI_COMM_WORLD);
	if(rank==0)
	{	
		for(int i=0;i<size;i++)sum += arravg[i];
		printf("Average of given values = %f\n",(float)sum/size);
	}
	MPI_Finalize();
	return 0;
}