#include "mpi.h"
#include <stdio.h>
int main(int argc, char *argv[])
{
	int rank;
	char str[4] = "HeYo";
	MPI_Init(&argc,&argv);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	if(str[rank]>='A' && str[rank]<='Z') str[rank]+=32;
	else str[rank]-=32;
	MPI_Finalize();
	printf("Modified string for rank - %d - %s\n",rank,str);
	return 0;
}