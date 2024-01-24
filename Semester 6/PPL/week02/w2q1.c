#include "mpi.h"
#include <stdio.h>
#include <string.h>
int main(int argc, char *argv[])
{
	int rank, size;
	char x[20];
	MPI_Init(&argc,&argv);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	MPI_Comm_size(MPI_COMM_WORLD,&size);
	MPI_Status st;
	if(rank==0)
	{
		printf("Enter a string in master process: ");
		scanf("%s",x);
		int n = strlen(x);
		MPI_Send(&n,1,MPI_INT,1,4,MPI_COMM_WORLD);
		MPI_Ssend(&x,n,MPI_CHAR,1,1,MPI_COMM_WORLD);
		fprintf(stdout, "Sent %s from process 0\n",x);
		fflush(stdout);
		MPI_Recv(&x,n,MPI_CHAR,1,2,MPI_COMM_WORLD,&st);
		fprintf(stdout, "Received %s in process 0\n",x);
		fflush(stdout);
	}
	else 
	{	
		int n;
		MPI_Recv(&n,1,MPI_INT,0,4,MPI_COMM_WORLD,&st);
		MPI_Recv(&x,n,MPI_CHAR,0,1,MPI_COMM_WORLD,&st);
		fprintf(stdout, "Received %s in process 1\n",x);
		for(int i=0; i<n; i++)
		{
			if(x[i]>='A' && x[i]<='Z') x[i]+=32;
			else x[i]-=32;
		}
		MPI_Ssend(&x,n,MPI_CHAR,0,2,MPI_COMM_WORLD);
		fflush(stdout);
		fprintf(stdout, "Sent %s from process 1\n",x);
		fflush(stdout);
	}
	MPI_Finalize();
	return 0;
}