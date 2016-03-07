#include <wb.h>
#include <thrust/host_vector.h>
#include <thrust/device_vector.h>

int main(int argc, char **argv) {
  wbArg_t args;
  float *hostInput, *hostOutput; // The input 1D list
  int num_elements; // number of elements in the input list

  args = wbArg_read(argc, argv);

  wbTime_start(Generic, "Importing data and creating memory on host");
  hostInput =
      (float *)wbImport(wbArg_getInputFile(args, 0), &num_elements);
  wbTime_stop(Generic, "Importing data and creating memory on host");

  wbLog(TRACE, "The number of input elements in the input is ",
        num_elements);

  // Declare and allocate the host output array
  //@@ Insert code here
  hostOutput = (float *) malloc(num_elements * sizeof(float));

  // Declare and allocate thrust device input and output vectors
  wbTime_start(GPU, "Allocating GPU memory.");
  //@@ Insert code here
  thrust::device_vector<float> deviceInput(num_elements);
  thrust::device_vector<float> deviceOutput(num_elements);
  thrust::copy(hostInput, hostInput + num_elements, deviceInput.begin());
  wbTime_stop(GPU, "Allocating GPU memory.");

  // Execute vector addition
  wbTime_start(Compute, "Doing the computation on the GPU and copying data back to host");
  //@@ Insert Code here
  thrust::inclusive_scan(deviceInput.begin(), 
                         deviceInput.end(), 
                         deviceOutput.begin());
  thrust::copy(deviceOutput.begin(), deviceOutput.end(), hostOutput);

  wbTime_stop(Compute, "Doing the computation on the GPU");


  wbSolution(args, hostOutput, num_elements);

  free(hostInput);
  free(hostOutput);

  return 0;
}
