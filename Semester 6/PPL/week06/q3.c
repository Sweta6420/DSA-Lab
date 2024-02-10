#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <CL/cl.h>

#define MAX_SOURCE_SIZE 1000

int main() {
    int n; 
     const char *programSource;
    FILE* f=fopen("oesort.cl","r");
    programSource = (char *) malloc(MAX_SOURCE_SIZE);
    int source_size = fread(programSource,1,MAX_SOURCE_SIZE,f);
    puts(programSource); 
    int *A = NULL;
    fprintf(stdout,"Enter number of elements in array: "); scanf("%d",&n);
    size_t datasize=(n*sizeof(int));
    A=(int *)malloc(datasize);

    printf("enter n elements: ");
    for(int i=0;i<n;i++) scanf("%d",&A[i]);

    cl_int status;

    // STEP 1: Discover and initialize the platforms
    cl_uint numPlatforms = 0;
    cl_platform_id *platforms = NULL;
    status = clGetPlatformIDs(0, NULL, &numPlatforms);
    printf("%d platform success %d\n",status,numPlatforms); 
    platforms = (cl_platform_id*)malloc(numPlatforms*sizeof(cl_platform_id));
    status = clGetPlatformIDs(numPlatforms, platforms, NULL);

    // STEP 2: Discover and initialize the devices
    cl_uint numDevices = 0;
    cl_device_id *devices = NULL;
    status=clGetDeviceIDs(platforms[0],CL_DEVICE_TYPE_GPU,0,NULL,&numDevices);
    devices = (cl_device_id*)malloc(numDevices*sizeof(cl_device_id));
    status = clGetDeviceIDs(platforms[0],CL_DEVICE_TYPE_GPU,numDevices,devices,NULL);
    printf("%d Device success %d\n",status,numDevices); 

    // STEP 3: Create a context
    cl_context context = NULL;
    context = clCreateContext(NULL,numDevices,devices,NULL,NULL,&status);
    printf("%d context success %d\n",status,numDevices); 

    // STEP 4: Create a command queue
    cl_command_queue cmdQueue,cmdQueue1;
    cmdQueue = clCreateCommandQueue(context, devices[0], 0, &status);
    printf("%d CQ success %d\n",status,numDevices); 

    // STEP 5: Create device buffers
    cl_mem bufferA= clCreateBuffer(context,CL_MEM_READ_WRITE,datasize,NULL,&status);
    printf("buffer success %d\n",status); 

    // STEP 6: Write host data to device buffers
    status = clEnqueueWriteBuffer(cmdQueue,bufferA,CL_TRUE,0,datasize,A,0,NULL,NULL);
    printf("write success %d\n",status);

    // STEP 7: Create and compile the program
    cl_program program = clCreateProgramWithSource(context,1,(const char**)&programSource,(const size_t *)&source_size,&status);
    printf("prog success %d\n",status);
    status = clBuildProgram(program,numDevices,devices,NULL,NULL,NULL);
    printf("build success %d\n",status);

    // STEP 8: Create the kernel
    cl_kernel kernel1 = NULL, kernel2=NULL;
    kernel1 = clCreateKernel(program,"odd", &status);
    kernel2 = clCreateKernel(program,"even", &status);
    printf("kernel created %d\n",status);

    // STEP 9: Set the kernel arguments
    status = clSetKernelArg(kernel1,0,sizeof(cl_mem),&bufferA);
    status = clSetKernelArg(kernel2,0,sizeof(cl_mem),&bufferA);

    // STEP 10: Configure the work-item structure
    size_t globalWorkSize[1];
    globalWorkSize[0] = n;

    // STEP 11: Enqueue the kernel for execution
    status = clEnqueueNDRangeKernel(cmdQueue,kernel1,1,NULL,globalWorkSize,NULL,0,NULL,NULL);
    status = clEnqueueNDRangeKernel(cmdQueue,kernel2,1,NULL,globalWorkSize,NULL,0,NULL,NULL);
    printf("kernel execution: %d\n",status);
    // STEP 12: Read the output buffer back to the host
    clEnqueueReadBuffer(cmdQueue,bufferA,CL_TRUE,0,datasize,A,0,NULL,NULL);
    printf("Sorted: ");
    for(int i=0;i<n;i++) printf("%d ",A[i]);

    // STEP 13: Release OpenCL resources
    clReleaseKernel(kernel1);
    clReleaseKernel(kernel2);
    clReleaseProgram(program);
    clReleaseCommandQueue(cmdQueue);
    clReleaseMemObject(bufferA);
    clReleaseContext(context);
    // Free host resources
    free(A);
    free(platforms);
    free(devices);
}
