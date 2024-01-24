//execute with -lm while compiling
#include "mpi.h"
#include <stdio.h>
#include <math.h>
int main(int argc, char *argv[])
{
	int rank,x=3;
	MPI_Init(&argc,&argv);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	printf("pow(3,rank) = %.2f\n",pow(x,rank));
	MPI_Finalize();
	return 0;
}