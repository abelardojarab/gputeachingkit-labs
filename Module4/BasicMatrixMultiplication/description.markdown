---
title: Basic Matrix Multiplication
author: GPU Teaching Kit -- Accelerated Computing
---

# Objective

Implement a basic dense matrix multiplication routine. Optimizations such
as tiling and usage of shared memory are not required for this lab.

# Prerequisites

Before starting this lab, make sure that:

* You have completed "Vector Addition" Lab

* You have completed the required teaching kit modules

# Instructions

Edit the code in the code tab to perform the following:

- allocate device memory
- copy host memory to device
- initialize thread block and kernel grid dimensions
- invoke CUDA kernel
- copy results from device to host
- deallocate device memory

Instructions about where to place each part of the code is
demarcated by the `//@@` comment lines.

# Local Setup Instruction

The most recent version of source code for this lab along with the build-scripts can be found on the [Bitbucket repository](LINKTOLAB). Descriptions on how to use the repository is found in the [README](LINKTOREADME) document in the root of the repository..

To run the lab locally run the following command `./MatrixMultiplication_Template -e <expected.raw> -i <input0.raw>,<input1.raw> -o <output.raw> -t matrix`.
