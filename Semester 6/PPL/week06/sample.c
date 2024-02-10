#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <CL/cl.h>
#include <time.h>
#define MAX_SOURCE_SIZE 0x100000

int main() {
    time_t start, end;
    start = clock();
    char tempstr[204];
    for(int i=0; i<204; i++) tempstr[i]='A';
    tempstr[204]='\0';
    int len = strlen(tempstr)+1;
    char *str = (char *) malloc(sizeof(char)*len);
    strcpy(str,tempstr);
    FILE *f = fopen("toggle.cl","r");
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
    cl_mem bufferA = clCreateBuffer(context,CL_MEM_READ_ONLY,len*sizeof(char),NULL,&status);
    cl_mem bufferB = clCreateBuffer(context,CL_MEM_WRITE_ONLY,len*sizeof(char),NULL,&status);

    // STEP 6: Write host data to device buffers
    status = clEnqueueWriteBuffer(cmdQueue,bufferA,CL_TRUE,0,len*sizeof(char),str,0,NULL,NULL);
    printf("WRITE success %d \n",status); 

    // STEP 7: Create and compile the program
    cl_program program = clCreateProgramWithSource(context,1,(const char**)&progSource,(const size_t *)&progSize,&status);
    status = clBuildProgram(program,1,&device_id,NULL,NULL,NULL);
    printf("Build success %d \n",status);

    // STEP 8: Create the kernel
    cl_kernel kernel = clCreateKernel(program, "toggle", &status);
    printf("kernel created %d ",status);

    // STEP 9: Set the kernel arguments
    status = clSetKernelArg(kernel,0,sizeof(cl_mem),&bufferA);
    status = clSetKernelArg(kernel,1,sizeof(cl_mem),&bufferB);

    // STEP 10: Configure the work-item structure
    size_t globalWorkSize = len;
    size_t localItemSize = 1;

    // STEP 11: Enqueue the kernel for execution
    cl_event event;
    status = clEnqueueNDRangeKernel(cmdQueue,kernel,1,NULL,&globalWorkSize,&localItemSize,0,NULL,&event);
    time_t stime = clock();
    status = clFinish(cmdQueue);
    cl_ulong start_time,end_time;
    clGetEventProfilingInfo(event,CL_PROFILING_COMMAND_START,sizeof(start_time),&start_time,NULL);
    clGetEventProfilingInfo(event,CL_PROFILING_COMMAND_END,sizeof(end_time),&end_time,NULL);
    double total_time = (double)(end_time - start_time);
    
    // STEP 12: Read the output buffer back to the host
    char *strres = (char *) malloc(sizeof(char)*len);
    clEnqueueReadBuffer(cmdQueue,bufferB,CL_TRUE,0,len*sizeof(char),strres,0,NULL,NULL);
    printf("DONE\n");
    strres[len-1]='\0';
    printf("%s ",strres);
    // STEP 13: Release OpenCL resources
    clReleaseKernel(kernel);
    clReleaseProgram(program);
    clReleaseCommandQueue(cmdQueue);
    clReleaseMemObject(bufferA);
    clReleaseMemObject(bufferB);
    clReleaseContext(context);
    end = clock();
    printf("Time taken to exec kernel in ms: %0.3f ms\n",total_time/1000000);
    printf("Time taken to exec whole prog in s: %0.3f s\n",(end-start)/(double)CLOCKS_PER_SEC);
    
    // Free host resources
    free(str);
    free(strres);
    free(platform_id);
    free(device_id);
    return 0;
}
