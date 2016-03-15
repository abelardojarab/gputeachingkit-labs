---
title: Thrust Histogram Sort
author: GPU Teaching Kit -- Accelerated Computing
module: 7
---

# Objective
The purpose of this lab is to implement a histogramming algorithm for an input array of integers. This approach composes several distinct algorithmic steps to compute a histogram, which makes Thrust a valuable tools for its implementation.

# Problem Setup
Consider the dataset

```{.cpp}
input = [2 1 0 0 2 2 1 1 1 1 4]
```

A resulting histogram would be

```{.cpp}
histogram = [2 5 3 0 1]
```

reflecting 2 zeros, 5 ones, 3 twos, 0 threes, and one 4 in the input dataset.

Note that the number of bins is equal to

```{.cpp}
max(input) + 1
```

# Histogram Sort Approach
First, sort the input data using `thrust::sort`. Continuing with the original example:

```
sorted = [0 0 1 1 1 1 1 2 2 2 4]
```

Determine the number of bins by inspecting the last element of the list and adding 1:

```
num_bins = sorted.back() + 1
```

To compute the histogram, we can compute the culumative histogram and then work backwards. To do this in Thrust, use `thrust::upper_bound`. `upper_bound` takes an input data range (the sorted input) and a set of search values, and for each search value will report the largest index in the input range that the search value could be inserted into without changing the sorted order of the inputs. For example,

```
[2 8 11 11 12] = thrust::upper_bound([0 0 1 1 1 1 1 2 2 2 4], // input
                                     [0 1 2 3 4])             // search
```

By carefully crafting the search data, `thrust::upper_bound` will produce a cumulative histogram. The search data must be a range `[0,num_bins)`.

Once the cumulative histogram is produced, use `thrust::adjacent_different` to compute the histogram.

```
[2 5 3 0 1] = thrust::adjacent_difference([2 8 11 11 12])
```

Check the thrust documentation for details of how to use `upper_bound` and `adjacent_difference`. Instead of constructing the search array in device memory, you may be able to use `thrust::counting_iterator`.

# Prerequisites
Before starting this lab, make sure that you have completed all of the Module 7 lecture videos.

# Instructions
Edit the code in the code tab to perform the following:
- allocate space for input on the GPU
- copy host memory to device
- invoke thrust functions
- copy results from device to host

Instructions about where to place each part of the code is demarcated by the `//@@` comment lines.

# Local Setup Instructions
The most recent version of source code for this lab along with the build-scripts can be found on the [Bitbucket repository](LINKTOLAB). A description on how to use the [CMake](https://cmake.org/) tool in along with how to build the labs for local development found in the [README](LINKTOREADME) document in the root of the repository.

The executable generated as a result of compiling the lab can be run using the following command:

```
./ThrustHistogramSort_Template -e <expected.raw> \
  -i <input.raw> -o <output.raw> -t integral_vector
```

where `<expected.raw>` is the expected output, `<input.raw>` is the input dataset, and `<output.raw>` is an optional path to store the results. The datasets can be generated using the dataset generator built as part of the compilation process.

# Attribution
This is a simplified version of the material presented in the Thrust repository [here](https://github.com/thrust/thrust/blob/master/examples/histogram.cu).
