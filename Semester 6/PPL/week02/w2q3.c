#include "mpi.h"
#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[])
{
	int rank, size,buffer_size, *buffer,i,data[argc-1];
	MPI_Init(&argc,&argv);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	MPI_Comm_size(MPI_COMM_WORLD,&size);
	MPI_Status st;
	if(rank==0)
	{
		buffer_size = MPI_BSEND_OVERHEAD + sizeof(int);
		buffer = malloc(buffer_size);
		for(int i=0; i<size-1; i++) scanf("%d",&data[i]);
		MPI_Buffer_attach(buffer,buffer_size);
		for(int i=1,j=0; i<size; i++,j++)
			MPI_Bsend((data+j),1,MPI_INT,i,1,MPI_COMM_WORLD);
		MPI_Buffer_detach(buffer,&buffer_size);
	}
	else 
	{	
		int d,res;
		MPI_Recv(&d,1,MPI_INT,0,1,MPI_COMM_WORLD,&st);
		if (rank%2==0) res=d*d;
		else res=d*d*d;
		printf("Process %d computed %d\n",rank,res);
	}
	MPI_Finalize();
	return 0;
}