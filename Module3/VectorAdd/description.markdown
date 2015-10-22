---
title: CUDA Vector Add
author: GPU Teaching Kit: Accelerated Computing
---

## Objective

The purpose of this lab is to get you familiar with using the CUDA API by implementing a simple vector addition kernel and its associated setup code.

## Prerequisites

Before starting this lab, make sure that:

* You have completed all of Module 1 in the teaching kit

* You have completed "Device Query" lab

* You have looked over the [tutorial](/help) document.

* Chapter 3 of the text book would also be helpful

## Instruction

Edit the code in the code tab to perform the following:

* Allocate device memory

* Copy host memory to device

* Initialize thread block and kernel grid dimensions

* Invoke CUDA kernel

* Copy results from device to host

* Free device memory

* Write the CUDA kernel

Instructions about where to place each part of the code is
demarcated by the `//@@` comment lines.

## Running Locally

Run `./VectorAdd_Template -e <expected.raw> -i <intput1.raw>,<input2.raw> -o <output.raw> -t vector`.
