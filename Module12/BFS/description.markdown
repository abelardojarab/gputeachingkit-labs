---
title: Breadth-First Search
author: GPU Teaching Kit -- Accelerated Computing
module: 12
---

## Objective

The purpose of this lab is to understand hierarchical queuing in the context of the breadth first search algorithm as an example. You will implement a single iteration of breadth first search that takes a set of nodes in the current level (also called wave-front) as input and outputs the set of nodes belonging to the next level.

## Dataset Information

* Datasets `0`, `1`, and `2` perform the computation using `gpu_global_queueing_kernel`
* Datasets `3`, `4`, and `5` perform the computation using `gpu_block_queuing_kernel`
* Datasets `6`, `7`, and `8` perform the computation using `gpu_warp_queueing_kernel`

## Instructions

* Edit the kernel `gpu_global_queuing_kernel` in the file to implement the algorithm using just a global queue. Compile and test the code for datasets `0`, `1`, and `2`.
* Edit the kernel `gpu_block_queuing_kernel` in the file to implement the algorithm using block and global queuing. Compile and test the code for datasets `3`, `4`, and `5`.
* Edit the kernel `gpu_warp_queueing_kernel` in the file to implement the algorithm using warp, block, and global queuing. Compile and test the code for datasets  `6`, `7`, and `8`.


Try running all four implementations using varying input sizes. Compare the performance and scalability of each implementation. Think about why you think each implementation performs better or worse than the one before it.


Instructions about where to place each part of the code is
demarcated by the `//@@` comment lines.
