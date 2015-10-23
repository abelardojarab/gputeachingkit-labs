---
title: Device Query
author: GPU Teaching Kit -- Accelerated Computing
---


# Objective

The purpose of this lab is to get you familiar with using the submission system for this course as well as the hardware used.

# Instructions

The code provided queries the GPU hardware on the system.
Do not concentrate on the API calls, but on functions starting with `wb`.

The `wbLog` function logs results, specifically we log the following hardware features:

* GPU card's name

* GPU computation capabilities

* Maximum number of block dimensions

* Maximum number of grid dimensions

* Maximum size of GPU memory

* Amount of constant and share memory

* Warp size

The details and meaning of these quantities will be explained in the
first few lectures of the teaching kit.

# Local Setup Instructions

The most recent version of source code for this lab along with the build-scripts can be found on the [Bitbucket repository](LINKTOLAB). A description on how to use the [CMake](https://cmake.org/) tool in along with how to build the labs for local development found in the [README](LINKTOREADME) document in the root of the repository.

The executable generated as a result of compiling the lab can be run using the following command:

~~~
./DeviceQuery_Template
~~~
