---
title: OpenACC CUDA Vector Add
author: GPU Teaching Kit -- Accelerated Computing
---

# Objective

Implement a vector addition using OpenACC directives.

# Local Setup Instructions

The most recent version of source code for this lab along with the build-scripts can be found on the [Bitbucket repository](LINKTOLAB). A description on how to use the [CMake](https://cmake.org/) tool in along with how to build the labs for local development found in the [README](LINKTOREADME) document in the root of the repository.

The executable generated as a result of compiling the lab can be run using the following command:

~~~
./OpenAccVectorAdd_Template -e <expected.raw> -i <input0.raw>,<input1.raw> -o <output.raw> -t vector
~~~

Where `expected` is the expected output, `input#` is the input dataset, and `output` is an optional path to store the results. The datasets can be generated using the dataset generator built as part of the compilation process.
