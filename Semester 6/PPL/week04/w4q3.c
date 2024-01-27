#include "mpi.h"
#include <stdio.h>
void ErrorHandler(int ecode)
{
	if(ecode!=MPI_SUCCESS)
	{
		char err_str[BUFSIZ];
		int strlen,err_class;
		MPI_Error_class(ecode,&err_class);
		MPI_Error_string(ecode,err_str,&strlen);
		printf("The error is %s\n",err_str);
	}
}
int main(int argc, char * argv[])
{
	int rank,size,a[3][3],b[3],target,rowcount=0,count=0;
	MPI_Init(&argc,&argv);
	MPI_Errhandler_set(MPI_COMM_WORLD,MPI_ERRORS_RETURN);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	MPI_Comm_size(MPI_COMM_WORLD,&size);
	if(rank==0)
	{
		printf("Enter matrix values: ");
		for(int i=0; i<3; i++)
		{
			for(int j=0; j<3; j++)scanf("%d",&a[i][j]);
		}
		printf("Enter value to search: ");scanf("%d",&target);
	}
	MPI_Scatter(a,3,MPI_INT,b,3,MPI_INT,0,MPI_COMM_WORLD);
	MPI_Bcast(&target,1,MPI_INT,0,MPI_COMM_WORLD);
	for(int i=0; i<3; i++) if(b[i]==target) rowcount++;
	int ecode = MPI_Reduce(&rowcount,&count,1,MPI_INT,MPI_SUM,0,MPI_COMM_WORLD);
	ErrorHandler(ecode);
	if(rank==0)printf("Occurences of %d - %d\n",target,count);
	MPI_Finalize();
}