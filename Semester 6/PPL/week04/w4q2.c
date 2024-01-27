#include "mpi.h"
#include <stdio.h>
#include <stdlib.h>
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
	int rank,size,N,i;
	double sum,h,x,pival;
	MPI_Init(&argc,&argv);
	MPI_Errhandler_set(MPI_COMM_WORLD,MPI_ERRORS_RETURN);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	MPI_Comm_size(MPI_COMM_WORLD,&size);
	if(rank==0)
	{
		printf("Enter #terms in series: ");
		scanf("%d",&N);
	}
	MPI_Bcast(&N,1,MPI_INT,0,MPI_COMM_WORLD);
	//broadcast N - number of terms (intervals) in the series. 
	if(N==0) 
	{
		if(rank==0)printf("Zero terms in series. Exiting.\n");
		exit(0);
	}
	h=(double)1/N;
	for(i=rank+1;i<=N; i=i+size) 
	{
		x=(double)h*4/(i+0.5);
		sum=sum+(double)4/(1+x*x);
		// printf("%d - %lf",i,sum);
	}
	sum=sum*h;
	int ecode = MPI_Reduce(&sum,&pival,1,MPI_DOUBLE,MPI_SUM,0,MPI_COMM_WORLD);
	ErrorHandler(ecode);
	if(rank==0)printf("Pi Value - %lf\n",pival);
	MPI_Finalize();
}