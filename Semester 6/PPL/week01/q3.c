#include "mpi.h"
#include <stdio.h>
int main(int argc, char *argv[])
{
	int rank, x=4, y=2;
	MPI_Init(&argc,&argv);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	switch(rank)
	{
		case 0:
			printf("x+y = %d\n",x+y);
			break;
		case 1:
			printf("x-y = %d\n",x-y);
			break;
		case 2:
			printf("x/y = %d\n",x/y);
			break;
		case 3:
			printf("x*y = %d\n",x*y);
			break;
	}
	MPI_Finalize();
	return 0;
}