---
title: CUDA Thrust Vector Add
author: GPU Teaching Kit - Accelerated Computing
---

# Objective

The purpose of this lab is to get you familiar with using the NVIDA Thrust library by implementing a simple vector addition operation and its associated setup code.

# Prerequisites

Before starting this lab, make sure that:

* You have completed all of Module 1 and 2 in the teaching kit

* You have completed "Device Query" lab


Local Setup Instruction

Edit the code in the code tab to perform the following:

* Generate a `thrust::dev_ptr<float>` for host input arrays

* Copy host memory to device

* Invoke `thrust::transform()`

* Copy results from device to host

Instructions about where to place each part of the code is
demarcated by the `//@@` comment lines.

# Local Setup Instruction

The most recent version of source code for this lab along with the build-scripts can be found on the [Bitbucket repository](LINKTOLAB). Descriptions on how to use the repository is found in the [README](LINKTOREADME) document in the root of the repository..

To run the lab locally run the following command `./ThrustVectorAdd_Template -e <expected.raw> -i <input1.raw>,<input2.raw> -o <output.raw> -t vector`.
