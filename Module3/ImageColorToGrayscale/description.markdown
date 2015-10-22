---
title: Module 3 Lab - CUDA Image Color to Grayscale
author: GPU Teaching Kit - Accelerated Computing
---
# Objective

The purpose of this lab is to implement an efficient histogramming equalization
	algorithm for an input image.
Like the image convolution MP, the image is represented as `RGB float` values.
You will convert that to `GrayScale unsigned char` values.
A pseudo-code version of the algorithm is shown bellow:

	for ii from 0 to height do
		for jj from 0 to width do
			idx = ii * width + jj
			# here channels is 3
			r = ucharImage[3*idx]
			g = ucharImage[3*idx + 1]
			b = ucharImage[3*idx + 2]
			grayImage[idx] = (unsigned char) (0.21*r + 0.71*g + 0.07*b)
		end
	end

# Prerequisites

Before starting this lab, make sure that:

* You have completed the required module videos

# Image Format

For people who are developing on their own system.
The images are stored in PPM (`P6`) format, this means that you can (if you want) create your own input images.
The easiest way to create image is via external tools. You can use tools such as `bmptoppm`.

# Running Locally

Run `./ImageColorToGrayscale_Template -e <expected.ppm> -i <input.ppm> -o <output.ppm> -t image`.
