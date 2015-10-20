---
title: Tiled Matrix Multiplication
author: GPU Teaching Kit
---

# Objective

Implement a tiled dense matrix multiplication routine using shared memory.

# Prerequisites

Before starting this lab, make sure that:

* You have completed "Matrix Multiplication" Lab

* You have completed the required module lectures

# Instructions

Edit the code in the code tab to perform the following:

- allocate device memory
- copy host memory to device
- initialize thread block and kernel grid dimensions
- invoke CUDA kernel
- copy results from device to host
- deallocate device memory
- implement the matrix-matrix multiplication routine using shared memory and tiling

Instructions about where to place each part of the code is
demarcated by the `//@@` comment lines.

