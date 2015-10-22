---
title: CUDA Thrust Vector Add
author: GPU Teaching Kit
---

# Objective

The purpose of this lab is to get you familiar with using the NVIDA Thrust library by implementing a simple vector addition operation and its associated setup code.

# Prerequisites

Before starting this lab, make sure that:

* You have completed all of Module 1 and 2 in the teaching kit

* You have completed "Device Query" lab

* You have looked over the [tutorial](/help) document.

* Chapter 3 of the text book would also be helpful

# Instruction

Edit the code in the code tab to perform the following:

* Generate a `thrust::dev_ptr<float> for host input arrays

* Copy host memory to device

* Invoke thrust::transform()

* Copy results from device to host

Instructions about where to place each part of the code is
demarcated by the `//@@` comment lines.

