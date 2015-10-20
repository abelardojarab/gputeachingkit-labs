#include <wb.h>
#include <thrust/host_vector.h>
#include <thrust/device_vector.h>

int main(int argc, char *argv[]) {
  wbArg_t args;
  float *hostInput1;
  float *hostInput2;
  int inputLength;

  args = wbArg_read(argc, argv); /* parse the input arguments */

  wbTime_start(Generic, "Importing data to host");
  hostInput1 =
      (float *)wbImport(wbArg_getInputFile(args, 0), &inputLength);
  hostInput2 =
      (float *)wbImport(wbArg_getInputFile(args, 1), &inputLength);
  wbTime_stop(Generic, "Importing data to host");

  // Build thrust datastructures
  thrust::host_vector<float> hostOutput(inputLength);

  wbTime_start(GPU, "Doing GPU Computation (memory + compute)");

  // Declare and allocate device data
  wbTime_start(GPU, "Doing GPU memory allocation");
  thrust::device_vector<float> deviceInput1(inputLength);
  thrust::device_vector<float> deviceInput2(inputLength);
  thrust::device_vector<float> deviceOutput(inputLength);
  wbTime_stop(GPU, "Doing GPU memory allocation");

  // Copy to device
  wbTime_start(Copy, "Copying data to the GPU");
  thrust::copy(hostInput1, hostInput1 + inputLength, deviceInput1.begin());
  thrust::copy(hostInput2, hostInput2 + inputLength, deviceInput2.begin());
  wbTime_stop(Copy, "Copying data to the GPU");

  // Execute vector addition
  wbTime_start(Compute, "Doing the computation on the GPU");
  //@@ Insert Code here
  thrust::transform(deviceInput1.begin(), deviceInput1.end(),
                    deviceInput2.begin(),
                    deviceOutput.begin(),
                    thrust::plus<float>());
  wbTime_stop(Compute, "Doing the computation on the GPU");
  /////////////////////////////////////////////////////////
  
  // Copy data back to host
  wbTime_start(Copy, "Copying data from the GPU");
  thrust::copy(deviceOutput.begin(), deviceOutput.end(), hostOutput.begin());
  wbTime_stop(Copy, "Copying data from the GPU");

  wbTime_stop(GPU, "Doing GPU Computation (memory + compute)");

  wbSolution(args, hostOutput.data(), inputLength);

  free(hostInput1);
  free(hostInput2);
  return 0;
}
