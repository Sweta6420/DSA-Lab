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
		printf("%d %s\n",err_class,err_str);
	}
}
int main(int argc, char * argv[])
{
	int rank,size,fact=1,factsum,i;
	MPI_Init(&argc,&argv);
	MPI_Errhandler_set(MPI_COMM_WORLD,MPI_ERRORS_RETURN);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	MPI_Comm_size(MPI_COMM_WORLD,&size);
	for(i=1; i<=rank+1; i++) fact *=i;
	int ecode = MPI_Scan(&fact,&factsum,1,MPI_INT,MPI_SUM,MPI_COMM_WORLD);
	ErrorHandler(ecode);
	printf("Sum of all factorial: %d\n",factsum);
	MPI_Finalize();
}