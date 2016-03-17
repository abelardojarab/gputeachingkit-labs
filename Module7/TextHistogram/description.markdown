---
title: Text Histogram
author: GPU Teaching Kit -- Accelerated Computing
module: 7
---

# Objective
The purpose of this lab is to implement an efficient histogram algorithm for an input array of ASCII characters. There are 128 ASCII characters and each character will map into its own bin for a fixed total of 128 bins. The histogram bins will be unsigned 32-bit counters that do not saturate. Use the approach of creating a privitized histogram in shared memory for each thread block, then atomically modifying the global histogram.

# Instructions
Edit the code in the code tab to perform the following:
- allocate device memory
- copy host memory to device
- initialize thread block and kernel grid dimensions
- invoke CUDA kernel
- copy results from device to host
- deallocate device memory

Instructions about where to place each part of the code is demarcated by the `//@@` comment lines.

# Local Setup Instructions
The most recent version of source code for this lab along with the build-scripts can be found on the [Bitbucket repository](LINKTOLAB). A description on how to use the [CMake](https://cmake.org/) tool in along with how to build the labs for local development found in the [README](LINKTOREADME) document in the root of the repository.

The executable generated as a result of compiling the lab can be run using the following command:

```
./Histogram_Template -e <expected.raw> \
  -i <input.txt> -o <output.raw> -t integral_vector
```

where `<expected.raw>` is the expected output, `<input.txt>` is the input dataset, and `<output.raw>` is an optional path to store the results. The datasets can be generated using the dataset generator built as part of the compilation process.
