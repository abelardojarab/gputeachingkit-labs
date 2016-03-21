#include <thrust/device_vector.h>
#include <thrust/host_vector.h>
#include <wb.h>

int main(int argc, char **argv) {
  wbArg_t args;
  float *hostInput, *hostOutput; // The input 1D list
  int num_elements;              // number of elements in the input list

  args = wbArg_read(argc, argv);

  wbTime_start(Generic, "Importing data and creating memory on host");
  hostInput =
      (float *)wbImport(wbArg_getInputFile(args, 0), &num_elements);
  wbTime_stop(Generic, "Importing data and creating memory on host");

  wbLog(TRACE, "The number of input elements in the input is ",
        num_elements);

  // Declare and allocate the host output array
  //@@ Insert code here

  // Declare and allocate thrust device input and output vectors
  wbTime_start(GPU, "Allocating GPU memory.");
  //@@ Insert code here
  wbTime_stop(GPU, "Allocating GPU memory.");

  // Execute vector addition
  wbTime_start(
      Compute,
      "Doing the computation on the GPU and copying data back to host");
  //@@ Insert Code here
  wbTime_stop(Compute, "Doing the computation on the GPU");

  wbSolution(args, hostOutput, num_elements);

  // Free Host Memory
  free(hostInput);
  //@@ Insert code here

  return 0;
}
