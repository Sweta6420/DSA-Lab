#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <CL/cl.h>

#define MAX_SOURCE_SIZE 1000

int main() {
    int n; 
    const char *programSource = "__kernel void vecmul(__global int *A, __global int *B, __global int *C) {  int idx = get_global_id(0); C[idx] =A[idx] * B[idx];}";
    puts(programSource); 
    int *A = NULL, *B = NULL,*C = NULL;
    fprintf(stdout,"Enter number of elements in vector: ");
    scanf("%d",&n);
    size_t datasize=(n*sizeof(int));
    printf("size is datasize%d\n",datasize);
    size_t source_size=strlen(programSource);
    A=(int *)malloc(datasize);
    B=(int *)malloc(datasize);
    C=(int *)malloc(datasize);

    printf("enter the data for A\n");
    for(int i=0;i<n;i++) scanf("%d",&A[i]);
    printf("enter the data for B\n");
    for(int i=0;i<n;i++) scanf("%d",&B[i]);

    cl_int status;

    // STEP 1: Discover and initialize the platforms
    cl_uint numPlatforms = 0;
    cl_platform_id *platforms = NULL;
    status = clGetPlatformIDs(0, NULL, &numPlatforms);
    printf("%d platform success %d ",status,numPlatforms); 
    platforms = (cl_platform_id*)malloc(numPlatforms*sizeof(cl_platform_id));
    status = clGetPlatformIDs(numPlatforms, platforms, NULL);
    char pform_vendor[40];
    clGetPlatformInfo(platforms[0], CL_PLATFORM_NAME, sizeof(pform_vendor),&pform_vendor, NULL);
    printf(" the vendor %s",pform_vendor);

    // STEP 2: Discover and initialize the devices
    cl_uint numDevices = 0;
    cl_device_id *devices = NULL;
    status=clGetDeviceIDs(platforms[0],CL_DEVICE_TYPE_GPU,0,NULL,&numDevices);
    devices = (cl_device_id*)malloc(numDevices*sizeof(cl_device_id));
    status = clGetDeviceIDs(platforms[0],CL_DEVICE_TYPE_GPU,numDevices,devices,NULL);
    printf("%d Device success %d ",status,numDevices); 
    char name_data[100];
    int err = clGetDeviceInfo(devices[0], CL_DEVICE_NAME,sizeof(name_data), name_data, NULL);
    printf(" the device name %s",name_data);

    // STEP 3: Create a context
    cl_context context = NULL;
    context = clCreateContext(NULL,numDevices,devices,NULL,NULL,&status);
    printf("%d context success %d ",status,numDevices); 

    // STEP 4: Create a command queue
    cl_command_queue cmdQueue,cmdQueue1;
    cmdQueue = clCreateCommandQueue(context, devices[0], 0, &status);
    printf("%d CQ success %d ",status,numDevices); 

    // STEP 5: Create device buffers
    cl_mem bufferA,bufferB,bufferC;
    bufferA = clCreateBuffer(context,CL_MEM_READ_ONLY,datasize,NULL,&status);
    bufferB = clCreateBuffer(context,CL_MEM_READ_ONLY,datasize,NULL,&status);
    bufferC = clCreateBuffer(context,CL_MEM_WRITE_ONLY,datasize,NULL,&status);

    // STEP 6: Write host data to device buffers
    status = clEnqueueWriteBuffer(cmdQueue,bufferA,CL_TRUE,0,datasize,A,0,NULL,NULL);
    status = clEnqueueWriteBuffer(cmdQueue,bufferB,CL_TRUE,0,datasize,B,0,NULL,NULL);

    // STEP 7: Create and compile the program
    cl_program program = clCreateProgramWithSource(context,1,(const char**)&programSource,(const size_t *)&source_size,&status);
    status = clBuildProgram(program,numDevices,devices,NULL,NULL,NULL);

    // STEP 8: Create the kernel
    cl_kernel kernel = NULL;
    kernel = clCreateKernel(program, "vecmul", &status);
    printf("kernel created %d ",status);

    // STEP 9: Set the kernel arguments
    status = clSetKernelArg(kernel,0,sizeof(cl_mem),&bufferA);
    status = clSetKernelArg(kernel,1,sizeof(cl_mem),&bufferB);
    status |= clSetKernelArg(kernel,2,sizeof(cl_mem),&bufferC);

    // STEP 10: Configure the work-item structure
    size_t globalWorkSize[3];
    globalWorkSize[0] = n;

    // STEP 11: Enqueue the kernel for execution
    status = clEnqueueNDRangeKernel(cmdQueue,kernel,1,NULL,globalWorkSize,NULL,0,NULL,NULL);
    printf("kernel execution: %d\n",status);
    // STEP 12: Read the output buffer back to the host
    clEnqueueReadBuffer(cmdQueue,bufferC,CL_TRUE,0,datasize,C,0,NULL,NULL);
    printf("C:  \n");
    for(int i=0;i<n;i++) printf("%d ",C[i]);

    // STEP 13: Release OpenCL resources
    clReleaseKernel(kernel);
    clReleaseProgram(program);
    clReleaseCommandQueue(cmdQueue);
    clReleaseMemObject(bufferA);
    clReleaseMemObject(bufferB);
    clReleaseMemObject(bufferC);
    clReleaseContext(context);
    // Free host resources
    free(A);
    free(B);
    free(C);
    free(platforms);
    free(devices);
}
