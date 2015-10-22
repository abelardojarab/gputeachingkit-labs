---
title: CUDA Dense Matrix-Matrix Multiply
author: GPU Teaching Kit -- Accelerated Computing
---

## Objective

Implement a basic dense matrix multiplication routine. Optimizations such
as tiling and usage of shared memory are not required for this lab.

## Prerequisites

Before starting this lab, make sure that:

* You have completed "Vector Addition" Lab

* You have completed the required teaching kit modules

## Instructions

Edit the code in the code tab to perform the following:

- allocate device memory
- copy host memory to device
- initialize thread block and kernel grid dimensions
- invoke CUDA kernel
- copy results from device to host
- deallocate device memory

Instructions about where to place each part of the code is
demarcated by the `//@@` comment lines.

## Running Locally

Run `./MatrixMultiplication_Template -e <expected.raw> -i <input0.raw>,<input1.raw> -o <output.raw> -t matrix`.
