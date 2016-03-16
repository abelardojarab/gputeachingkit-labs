---
title: Thrust List Reduction
author: GPU Teaching Kit -- Accelerated Computing
module: 10
---

# Objective
Implement a kernel to perform an inclusive prefix scan on a 1D list using [Thrust](https://thrust.github.io/).

Given an input

```{.cpp}
x = [x0, x1, x2, ...]
```

Produce an output

```{.cpp}
y = [y0, y1, y2, ...]
```

where

```{.cpp}
y[0] = 0
y[1] = 0 + x[0]
y[2] = 0 + x[0] + x[1]
y[i] = y[i-1] + x[i-1]
```

The prefix scan should produce `y` given `x` and use the `thrust::inclusive_scan` function. The input and output will both be `float` arrays of equal length.

# Prerequisites
Before starting this lab, make sure that:
- You have completed the required course modules
- You have completed the Thrust vector addition lab

# Instructions
Edit the code in the code tab to perform the following:
- Generate a `thrust::dev_ptr<float>` for host input arrays
- Copy host memory to device
- Invoke `thrust::inclusive_scan`
- Copy results from device to host

Instructions about where to place each part of the code is demarcated by the `//@@` comment lines.

# Local Setup Instructions
The most recent version of source code for this lab along with the build-scripts can be found on the [Bitbucket repository](LINKTOLAB). A description on how to use the [CMake](https://cmake.org/) tool in along with how to build the labs for local development found in the [README](LINKTOREADME) document in the root of the repository.

The executable generated as a result of compiling the lab can be run using the following command:

```{.bash}
./ThrustListScan_Template -e <expected.raw> \
  -i <input.raw> -o <output.raw> -t vector
```

where `<expected.raw>` is the expected output, `<input.raw>` is the input dataset, and `<output.raw>` is an optional path to store the results. The datasets can be generated using the dataset generator built as part of the compilation process.
