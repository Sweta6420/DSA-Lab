#include "mpi.h"
#include <stdio.h>

int main(int argc,char * argv[])
{
	int rank,size,a[4][4],b[4],target,total[4];
	MPI_Init(&argc,&argv);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	MPI_Comm_size(MPI_COMM_WORLD,&size);
	if(rank==0)
	{
		printf("Enter matrix values: ");
		for(int i=0; i<4; i++)
		{
			for(int j=0; j<4; j++)scanf("%d",&a[i][j]);
		}
    	printf("Input matrix:\n");
    	for (int i = 0; i < 4; i++)
        {
            for (int j = 0; j < 4; j++) printf("%d ",a[i][j]);
            printf("\n");
        }
	}
	MPI_Scatter(a,4,MPI_INT,b,4,MPI_INT,0,MPI_COMM_WORLD);
    MPI_Scan(b,total,4,MPI_INT,MPI_SUM,MPI_COMM_WORLD);
    MPI_Gather(total,4,MPI_INT,a,4,MPI_INT,0,MPI_COMM_WORLD);
	if (rank == 0)
    {	
    	printf("Output matrix:\n");
        for (int i = 0; i < 4; i++)
        {
            for (int j = 0; j < 4; j++) printf("%d ",a[i][j]);
            printf("\n");
        }
    }
	MPI_Finalize();
}