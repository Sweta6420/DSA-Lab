#include "mpi.h"
#include <stdio.h>
int main(int argc, char *argv[])
{
	int rank, size, x;
	MPI_Init(&argc,&argv);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	MPI_Comm_size(MPI_COMM_WORLD,&size);
	MPI_Status st;
	if(rank==0)
	{
		printf("Enter a value in master process: ");
		scanf("%d",&x);
		MPI_Send(&x,1,MPI_INT,1,1,MPI_COMM_WORLD);
		fprintf(stdout, "Sent %d from process 0\n",x);
		fflush(stdout);
	}
	else 
	{
		MPI_Recv(&x,1,MPI_INT,0,1,MPI_COMM_WORLD,&st);
		fprintf(stdout, "Received %d in process 1\n",x);
		fflush(stdout);
	}
	MPI_Finalize();
	return 0;
}