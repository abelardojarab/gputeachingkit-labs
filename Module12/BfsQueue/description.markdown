# GPU Breadth-First Search

The purpose of this lab is to understand hierarchical queuing in the context of the breadth first search algorithm as an example. You will implement a single iteration of breadth first search that takes a set of nodes in the current level (also called wave-front) as input and outputs the set of nodes belonging to the next level. You will implement two kernels:
* A simple version with global queuing
* An optimized version that uses shared-memory queuing.

The graph structure is stored in the following way:

* `numNodes` - the total number of nodes in the graph
* `nodePtrs` - an array of length `numNodes`. Each entry is a pointer into
 `numNeighbors`, described below.
* `nodeNeighbors` - an array whose length is the total number of neighbors each
node has. `nodeNeighbors[nodePtrs[node]]` to `nodeNeighbors[nodePtrs[node+1]]`
describes the neighbors of node `node`.

The kernels take these structures as inputs, as well as a list of nodes in the current level, for which all of the neighbors must be visited.

* `currLevelNodes` - an array of nodes for which neighbors must be visited
* `numCurrLevelNodes` - the size of the previous array
* `visitedNodes` - an array that describes which nodes have already been visited in the BFS

The kernels will need to produce the following outputs

* `nextLevelNodes` - an array of neighbor nodes.
* `numNextLevelNodes` - the number of neighbors
* `visitedNodes` - the nodes that have been visited by the end of the iteration. Note that this is the same array as the input. This is the output value that WebGPU will compare for correctness of your implementation.

Sequential pseudocode for the kernel is:

    // Loop over all nodes in the current level
    for idx = 0..numCurrLevelNodes
      node = currLevelNodes[idx];
      // Loop over all neighbors of the node
      for(nbrIdx = nodePtrs[node]..nodePtrs[node + 1];
        neighbor = nodeNeighbors[nbrIdx];
        // If the neighbor hasn't been visited yet
        if !nodeVisited[neighbor]
          // Mark it and add it to the queue
          nodeVisited[neighbor] = 1;
          nextLevelNodes[*numNextLevelNodes] = neighbor;
          ++(*numNextLevelNodes);


An empty stub for the kernels is provided. All you need to do is correctly implement the kernel code.

## Local Development

Use the dataset generator, and the following example command to check for correctness.

./bfs-queuing -e BfsQueue/Dataset/0/output.raw -i BfsQueue/Dataset/0/input0.raw,BfsQueue/Dataset/0/input1.raw,BfsQueue/Dataset/0/input2.raw,BfsQueue/Dataset/0/input3.raw,BfsQueue/Dataset/0/input4.raw -t integral_vector
