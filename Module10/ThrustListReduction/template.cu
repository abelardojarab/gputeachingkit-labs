#include <wb.h>
#include <thrust/host_vector.h>
#include <thrust/device_vector.h>

int main(int argc, char **argv) {
  wbArg_t args;
  float total;
  float *hostInput; // The input 1D list
  int numInputElements; // number of elements in the input list

  args = wbArg_read(argc, argv);

  wbTime_start(Generic, "Importing data and creating memory on host");
  hostInput =
      (float *)wbImport(wbArg_getInputFile(args, 0), &numInputElements);
  wbTime_stop(Generic, "Importing data and creating memory on host");

  wbLog(TRACE, "The number of input elements in the input is ",
        numInputElements);

  // Declare and allocate thrust device input and output vectors
  wbTime_start(GPU, "Allocating GPU memory.");
  //@@ Insert code here

  wbTime_stop(GPU, "Allocating GPU memory.");

  // Execute vector addition
  wbTime_start(Compute, "Doing the computation on the GPU");
  //@@ Insert Code here
  
  wbTime_stop(Compute, "Doing the computation on the GPU");

  wbSolution(args, &total, 1);

  free(hostInput);

  return 0;
}
