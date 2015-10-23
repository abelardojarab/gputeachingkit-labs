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

The most recent version of source code for this lab along with the build-scripts can be found on the [Bitbucket repository](LINKTOLAB). A description on how to use the [CMake](https://cmake.org/) tool in along with how to build the labs for local development found in the [README](LINKTOREADME) document in the root of the repository.

The executable generated as a result of compiling the lab can be run using the following command:

~~~
./ThrustVectorAdd_Template -e <expected.raw> -i <input1.raw>,<input2.raw> -o <output.raw> -t vector
~~~

Where `expected` is the expected output, `input#` is the input dataset, and `output` is an optional path to store the results. The datasets can be generated using the dataset generator built as part of the compilation process.
