#include "mpi.h"
#include <stdio.h>
int main(int argc, char *argv[])
{
	int rank, size,n,a,sum=0;
	MPI_Init(&argc,&argv);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	MPI_Comm_size(MPI_COMM_WORLD,&size);
	MPI_Status st;
	if(rank==0)
	{	
		printf("size %d\n",size);

		for(int i=2,j=1; i<=size; i++,j++)
			MPI_Send(&i,1,MPI_INT,j,1,MPI_COMM_WORLD);
		for(int i=1; i<size; i++)
		{
			MPI_Recv(&a,1,MPI_INT,i,2,MPI_COMM_WORLD,&st);
			sum+=a;
		}
		printf("Computed Result - %d",sum+1);
	}
	else 
	{	
		int d,res=1;
		MPI_Recv(&d,1,MPI_INT,rank-1,1,MPI_COMM_WORLD,&st);
		printf("Received %d from P0",d);
		if(d%2==0) res=d*(d+1)/2;
		else 
			for(int i=2; i<=d; i++) res*=i;
		MPI_Send(&res,1,MPI_INT,0,2,MPI_COMM_WORLD);
	}
	MPI_Finalize();
	return 0;
}