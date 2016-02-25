---
title: Histogram
author: GPU Teaching Kit -- Accelerated Computing
---

# Objective

Implement a histogram of an input array
with per-threadblock privitization.

# Prerequisites

Before starting this lab, make sure that:

* Requirement 1

* Requirement 2

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

# Local Setup Instructions

The most recent version of source code for this lab along with the build-scripts can be found on the [Bitbucket repository](LINKTOLAB). A description on how to use the [CMake](https://cmake.org/) tool in along with how to build the labs for local development found in the [README](LINKTOREADME) document in the root of the repository.

The executable generated as a result of compiling the lab can be run using the following command:

~~~
./Histogram_Template -e <expected.raw> \
  -i <input.raw> -o <output.raw> -t vector
~~~

where `<expected.raw>` is the expected output, `<input.raw>` is the input dataset, and `<output.raw>` is an optional path to store the results. The datasets can be generated using the dataset generator built as part of the compilation process.
