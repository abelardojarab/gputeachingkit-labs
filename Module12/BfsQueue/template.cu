
#include <stdio.h>
#include <wb.h>

#define BLOCK_SIZE 512
// Maximum number of elements that can be inserted into a block queue
#define BQ_CAPACITY 2048

#define FATAL(msg, ...) \
    do {\
        fprintf(stderr, "[%s:%d] ", msg, "\n", __FILE__, __LINE__, ##__VA_ARGS__);\
        exit(-1);\
    } while(0)

#if __BYTE_ORDER != __LITTLE_ENDIAN
# error "File I/O is not implemented for this system: wrong endianness."
#endif


// Global queuing stub
__global__ void gpu_global_queuing_kernel(
  int *nodePtrs,
  int *nodeNeighbors,
  int *nodeVisited,
  int *currLevelNodes,
  int *nextLevelNodes,
  const unsigned int numCurrLevelNodes,
  int *numNextLevelNodes) {


  //@@ Insert global queuing code here

  // Loop over all nodes in the curent level
  // Loop over all neighbors of the node
  // If the neighbor hasn't been visited yet
  // Add it to the global queue (already marked in the exchange)

}

// Block queuing stub
__global__ void gpu_block_queuing_kernel(
  int *nodePtrs,
  int *nodeNeighbors,
  int *nodeVisited,
  int *currLevelNodes,
  int *nextLevelNodes,
  const unsigned int numCurrLevelNodes,
  int *numNextLevelNodes) {

  //@@ Insert block queuing code here

  // Initialize shared memory queue
  // Loop over all nodes in the curent level
  // Loop over all neighbors of the node
  // If the neighbor hasn't been visited yet
  // Add it to the block queue
  // If full, add it to the global queue
  // Allocate space for block queue to go into global queue
  // Store block queue in global queue

}

// Host function for global queuing invocation
void gpu_global_queuing(
  int *nodePtrs,
  int *nodeNeighbors,
  int *nodeVisited,
  int *currLevelNodes,
  int *nextLevelNodes,
  unsigned int numCurrLevelNodes,
  int *numNextLevelNodes) {

  const unsigned int numBlocks = 45;
  gpu_global_queuing_kernel <<< numBlocks , BLOCK_SIZE >>> (nodePtrs,
    nodeNeighbors, nodeVisited, currLevelNodes, nextLevelNodes,
    numCurrLevelNodes, numNextLevelNodes);

}

// Host function for block queuing kernel invocation
void gpu_block_queuing(
  int *nodePtrs,
  int *nodeNeighbors,
  int *nodeVisited,
  int *currLevelNodes,
  int *nextLevelNodes,
  unsigned int numCurrLevelNodes,
  int *numNextLevelNodes) {

  const unsigned int numBlocks = 45;
  gpu_block_queuing_kernel <<< numBlocks , BLOCK_SIZE >>> (nodePtrs,
    nodeNeighbors, nodeVisited, currLevelNodes, nextLevelNodes,
    numCurrLevelNodes, numNextLevelNodes);

}



int main(int argc, char* argv[])
{
    // Variables
    int numNodes;
    int *nodePtrs_h;
    int *nodeNeighbors_h;
    int *nodeVisited_h;
    int numTotalNeighbors_h;
    int *currLevelNodes_h;
    int *nextLevelNodes_h;
    int numCurrLevelNodes;
    int numNextLevelNodes_h;
    int *nodePtrs_d;
    int *nodeNeighbors_d;
    int *nodeVisited_d;
    int *currLevelNodes_d;
    int *nextLevelNodes_d;
    int *numNextLevelNodes_d;
    cudaError_t cuda_ret;

    enum Mode {GPU_GLOBAL_QUEUE = 2, GPU_BLOCK_QUEUE};


    wbArg_t args = wbArg_read(argc, argv);
    Mode mode = (Mode)wbImport_flag(wbArg_getInputFile(args, 0));

    nodePtrs_h = (int *)wbImport(wbArg_getInputFile(args, 1), &numNodes, "Integer");
    nodeNeighbors_h = (int *)wbImport(wbArg_getInputFile(args, 2), &numTotalNeighbors_h, "Integer");
   

    nodeVisited_h = (int *)wbImport(wbArg_getInputFile(args, 3), &numNodes, "Integer");
    currLevelNodes_h = (int *)wbImport(wbArg_getInputFile(args, 4), &numCurrLevelNodes, "Integer");

    // (do not modify) Datasets should be consistent 
    assert(nodePtrs_h[numNodes] == numTotalNeighbors_h);

    // (do not modify) Prepare next level containers (i.e. output variables)
    numNextLevelNodes_h = 0;
    nextLevelNodes_h = (int*) malloc((numNodes)*sizeof(int));

    printf("# Mode = %u\n", mode);
    printf("# Nodes = %u\n", numNodes);
    printf("# Total Neighbors = %d\n", numTotalNeighbors_h);
    printf("# Current Level Nodes = %d\n", numCurrLevelNodes);

    // (do not modify) Allocate device variables --------------------------

    printf("Allocating device variables..."); fflush(stdout);

    cuda_ret = cudaMalloc((void**)&nodePtrs_d,
      (numNodes + 1)*sizeof(int));
    if(cuda_ret != cudaSuccess) FATAL("Unable to allocate device memory");

    cuda_ret = cudaMalloc((void**)&nodeVisited_d, numNodes*sizeof(int));
    if(cuda_ret!=cudaSuccess) FATAL("Unable to allocate device memory");

    cuda_ret = cudaMalloc((void**)&nodeNeighbors_d,
      nodePtrs_h[numNodes]*sizeof(int));
    if(cuda_ret!=cudaSuccess) FATAL("Unable to allocate device memory");

    cuda_ret = cudaMalloc((void**)&currLevelNodes_d,
      numCurrLevelNodes*sizeof(int));
    if(cuda_ret!=cudaSuccess) FATAL("Unable to allocate device memory");

    cuda_ret = cudaMalloc((void**)&numNextLevelNodes_d,
      sizeof(int));
    if(cuda_ret!=cudaSuccess) FATAL("Unable to allocate device memory");

    cuda_ret = cudaMalloc((void**)&nextLevelNodes_d,
      (numNodes)*sizeof(int));
    if(cuda_ret!=cudaSuccess) FATAL("Unable to allocate device memory");

    cudaDeviceSynchronize();

    // (do not modify) Copy host variables to device --------------------

    printf("Copying data from host to device..."); fflush(stdout);

    cuda_ret = cudaMemcpy(nodePtrs_d, nodePtrs_h,
      (numNodes + 1)*sizeof(int), cudaMemcpyHostToDevice);
    if(cuda_ret != cudaSuccess) {
      FATAL("Unable to copy memory to the device");
    }

    cuda_ret = cudaMemcpy(nodeVisited_d, nodeVisited_h,
      numNodes*sizeof(int), cudaMemcpyHostToDevice);
    if(cuda_ret != cudaSuccess) {
      FATAL("Unable to copy memory to the device");
    }

    cuda_ret = cudaMemcpy(nodeNeighbors_d, nodeNeighbors_h,
      nodePtrs_h[numNodes]*sizeof(int), cudaMemcpyHostToDevice);
    if(cuda_ret != cudaSuccess) {
      FATAL("Unable to copy memory to the device");
    }

    cuda_ret = cudaMemcpy(currLevelNodes_d, currLevelNodes_h,
      numCurrLevelNodes*sizeof(int), cudaMemcpyHostToDevice);
    if(cuda_ret != cudaSuccess) {
      FATAL("Unable to copy memory to the device");
    }

    cuda_ret = cudaMemset(numNextLevelNodes_d, 0, sizeof(int));
    if(cuda_ret != cudaSuccess) {
      FATAL("Unable to copy memory to the device");
    }

    cudaDeviceSynchronize();

    // (do not modify) Launch kernel ----------------------------------------

    printf("Launching kernel ");

    if(mode == GPU_GLOBAL_QUEUE) {
        printf("(GPU with global queuing)...");fflush(stdout);
        gpu_global_queuing(nodePtrs_d, nodeNeighbors_d, nodeVisited_d,
          currLevelNodes_d, nextLevelNodes_d, numCurrLevelNodes,
          numNextLevelNodes_d);
        cuda_ret = cudaDeviceSynchronize();
        if(cuda_ret != cudaSuccess) FATAL("Unable to launch/execute kernel");
    } else if(mode == GPU_BLOCK_QUEUE) {
        printf("(GPU with block and global queuing)...");fflush(stdout);
        gpu_block_queuing(nodePtrs_d, nodeNeighbors_d, nodeVisited_d,
          currLevelNodes_d, nextLevelNodes_d, numCurrLevelNodes,
          numNextLevelNodes_d);
        cuda_ret = cudaDeviceSynchronize();
        if(cuda_ret != cudaSuccess) FATAL("Unable to launch/execute kernel");
    } else {
        printf("Invalid mode!\n");
        exit(0);
    }


    // (do not modify) Copy device variables from host ----------------------

    printf("Copying data from device to host..."); fflush(stdout);

    cuda_ret = cudaMemcpy(&numNextLevelNodes_h, numNextLevelNodes_d,
      sizeof(int), cudaMemcpyDeviceToHost);
    if(cuda_ret != cudaSuccess) FATAL("Unable to copy memory to host");

    cuda_ret = cudaMemcpy(nextLevelNodes_h, nextLevelNodes_d,
      numNodes*sizeof(int), cudaMemcpyDeviceToHost);
    if(cuda_ret != cudaSuccess) FATAL("Unable to copy memory to host");

    cuda_ret = cudaMemcpy(nodeVisited_h, nodeVisited_d,
      numNodes*sizeof(int), cudaMemcpyDeviceToHost);
    if(cuda_ret != cudaSuccess) FATAL("Unable to copy memory to host");

    cudaDeviceSynchronize();


    // (do not modify) Verify correctness -------------------------------------
    // Only check that the visited nodes match the reference implementation

    wbSolution(args, nodeVisited_h, numNodes);

    // (do not modify) Free memory ------------------------------------------------------------
    free(nodePtrs_h);
    free(nodeVisited_h);
    free(nodeNeighbors_h);
    free(currLevelNodes_h);
    free(nextLevelNodes_h);
    cudaFree(nodePtrs_d);
    cudaFree(nodeVisited_d);
    cudaFree(nodeNeighbors_d);
    cudaFree(currLevelNodes_d);
    cudaFree(numNextLevelNodes_d);
    cudaFree(nextLevelNodes_d);

    return 0;
}

