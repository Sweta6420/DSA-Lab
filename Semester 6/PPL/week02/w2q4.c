#include "mpi.h"
#include <stdio.h>
int main(int argc, char *argv[])
{
	int rank, size,a;
	MPI_Init(&argc,&argv);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	MPI_Comm_size(MPI_COMM_WORLD,&size);
	MPI_Status st;
	if(rank==0)
	{
		scanf("%d",&a);
		MPI_Send(&a,1,MPI_INT,1,1,MPI_COMM_WORLD);
		MPI_Recv(&a,1,MPI_INT,size-1,1,MPI_COMM_WORLD,&st);
		printf("Received %d from P%d in P0",a,size-1);
	}
	else 
	{	
		int d;
		MPI_Recv(&d,1,MPI_INT,rank-1,1,MPI_COMM_WORLD,&st);
		printf("Received %d from P%d in P%d\n",d,rank-1,rank);
		d++;
		if(rank!=size-1)MPI_Send(&d,1,MPI_INT,rank+1,1,MPI_COMM_WORLD);
		else MPI_Send(&d,1,MPI_INT,0,1,MPI_COMM_WORLD);
	}
	MPI_Finalize();
	return 0;
}