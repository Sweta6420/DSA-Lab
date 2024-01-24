#include "mpi.h"
#include <stdio.h>
int main(int argc, char *argv[])
{
	int rank, size,data[argc-1];
	MPI_Init(&argc,&argv);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	MPI_Comm_size(MPI_COMM_WORLD,&size);
	MPI_Status st;
	if(rank==0)
	{
		for(int i=0; i<size-1; i++) scanf("%d",&data[i]);
		for(int i=1,j=0; i<size; i++,j++)
			MPI_Send(&data[j],1,MPI_INT,i,1,MPI_COMM_WORLD);
	}
	else 
	{	
		int d;
		MPI_Recv(&d,1,MPI_INT,0,1,MPI_COMM_WORLD,&st);
		fprintf(stdout, "Received %d in process %d\n",d,rank);
		fflush(stdout);
	}
	MPI_Finalize();
	return 0;
}