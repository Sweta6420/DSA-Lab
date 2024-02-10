#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <CL/cl.h>
#include <time.h>
#define MAX_SOURCE_SIZE 0x100000

int main() {
    start = clock();
    int n, total_str_len=0;
    printf("Enter number of strings: "); scanf("%d",&n);
    char str[n][100],strlens[n];
    for(int i=0; i<n; i++) 
    {
        scanf("%s",str[i]);
        strlens[i]=strlen(str[i]);
        total_str_len+=strlens[i];
    }
    FILE *f = fopen("wordrev.cl","r");
    char *progSource = (char *)malloc (MAX_SOURCE_SIZE);
    size_t progSize = fread(progSource,1,MAX_SOURCE_SIZE,f);
    puts(progSource); 

    cl_int status;

    // STEP 1: Discover and initialize the platforms
    cl_uint numPlatforms;
    cl_platform_id platform_id = NULL;
    status = clGetPlatformIDs(1,&platform_id, &numPlatforms);
    printf("%d platform success %d ",status,numPlatforms); 
    
    // STEP 2: Discover and initialize the devices
    cl_uint numDevices;
    cl_device_id device_id = NULL;
    status=clGetDeviceIDs(platform_id,CL_DEVICE_TYPE_GPU,1,&device_id,&numDevices);
    printf("%d device success %d ",status,numDevices); 

    // STEP 3: Create a context
    cl_context context = clCreateContext(NULL,1,&device_id,NULL,NULL,&status);
    printf("%d context success %d ",status,numDevices); 

    // STEP 4: Create a command queue
    cl_command_queue cmdQueue = clCreateCommandQueue(context, device_id, CL_QUEUE_PROFILING_ENABLE, &status);
    printf("%d CQ success %d ",status,numDevices); 

    // STEP 5: Create device buffers
    cl_mem bufferA = clCreateBuffer(context,CL_MEM_READ_WRITE,total_str_len*sizeof(char),NULL,&status);
    cl_mem bufferB = clCreateBuffer(context,CL_MEM_READ_ONLY,sizeof(cl_int),NULL,&status);
    cl_mem bufferC = clCreateBuffer(context,CL_MEM_READ_ONLY,sizeof(cl_int)*n,NULL,&status);
    printf("buffer success %d\n",status);

    // STEP 6: Write host data to device buffers
    status = clEnqueueWriteBuffer(cmdQueue,bufferA,CL_TRUE,0,total_str_len*sizeof(char),str,0,NULL,NULL);
    status = clEnqueueWriteBuffer(cmdQueue,bufferB,CL_TRUE,0,sizeof(cl_int),&n,0,NULL,NULL);
    status = clEnqueueWriteBuffer(cmdQueue,bufferC,CL_TRUE,0,sizeof(cl_int)*n,strlens,0,NULL,NULL);
    printf("WRITE success %d \n",status); 

    // STEP 7: Create and compile the program
    cl_program program = clCreateProgramWithSource(context,1,(const char**)&progSource,(const size_t *)&progSize,&status);
    printf("Prog source success %d\n",status);
    status = clBuildProgram(program,1,&device_id,NULL,NULL,NULL);
    printf("Build success %d \n",status);

    // STEP 8: Create the kernel
    cl_kernel kernel = clCreateKernel(program, "wordrev", &status);
    printf("kernel created %d ",status);

    // STEP 9: Set the kernel arguments
    status = clSetKernelArg(kernel,0,sizeof(cl_mem),&bufferA);
    status = clSetKernelArg(kernel,1,sizeof(cl_mem),&bufferB);
    status = clSetKernelArg(kernel,2,sizeof(cl_mem),&bufferC);

    // STEP 10: Configure the work-item structure
    size_t globalWorkSize = 3;
    size_t localItemSize = 1;

    // STEP 11: Enqueue the kernel for execution
    cl_event event;
    status = clEnqueueNDRangeKernel(cmdQueue,kernel,1,NULL,&globalWorkSize,&localItemSize,0,NULL,&event);
    printf("enqueue %d",status);
    // STEP 12: Read the output buffer back to the host
    char *strres = (char *) malloc(sizeof(char)*len*3+1);
    status = clEnqueueReadBuffer(cmdQueue,bufferB,CL_TRUE,0,1+3*len*sizeof(char),strres,0,NULL,NULL);
    printf("read %d",status);   
    printf("DONE\n");
    strres[len*3]='\0';
    printf("%s",strres);

    // STEP 13: Release OpenCL resources
    clReleaseKernel(kernel);
    clReleaseProgram(program);
    clReleaseCommandQueue(cmdQueue);
    clReleaseMemObject(bufferA);
    clReleaseMemObject(bufferB);
    clReleaseContext(context);
    
    // Free host resources
    free(strres);
    free(platform_id);
    free(device_id);
    return 0;
}
