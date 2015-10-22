---
title: List Scan
author: GPU Teaching Kit -- Accelerated Computing
---

## Objective

Implement a kernel to perform a parallel scan on a 1D list.
The scan operator will be the addition (plus) operator.
You should implement the work efficient kernel in Lecture 4.6.
Your kernel should be able to handle input lists of arbitrary length.
However, for simplicity, you can assume that the input list will be at most 2048 * 65,535 elements so that it can be handled by only one kernel launch.
The boundary condition can be handled by filling "identity value (0 for sum)" into the shared memory of the last block when the length is not a multiple of the thread block size.

## Prerequisites

Before starting this lab, make sure that:

* You have completed the required course modules

## Instructions

Edit the code in the code tab to perform the following:

- allocate device memory
- copy host memory to device
- initialize thread block and kernel grid dimensions
- invoke CUDA kernel
- copy results from device to host
- deallocate device memory
- implement the work efficient scan routine
- use shared memory to reduce the number of global memory accesses, handle the boundary conditions when loading input list elements into the shared memory

Instructions about where to place each part of the code is
demarcated by the `//@@` comment lines.

## Running Locally

Run `./ListScan_Template -e <expected.raw> -i <input.raw> -o <output.raw> -t vector`.
