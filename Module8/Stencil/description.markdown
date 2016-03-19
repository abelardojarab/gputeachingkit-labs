---
title: Stencil
author: GPU Teaching Kit -- Accelerated Computing
module: 8
---

# Objective

The purpose of this lab is to perform shared-memory tiling by implementing a 7-point stencil.

# Instructions

- Edit the code to implement a 7-point stencil.
- Edit the code to launch the kernel you implemented. The function should launch 2D CUDA grid and blocks.
- Answer the questions found in the questions tab.

# Algorithm

You will be implementing a 7-point stencil without having to deal with boundary conditions. The result is clamped so the range is between the values of `0` and `255`.

```{.ruby}
for i from 1 to height-1:   # notice the ranges exclude the boundary
    for j from 1 to width-1:  # this is done for simplification
        for k from 1 to depth-1:# the output is set to 0 along the boundary
            res = in(i, j, k + 1) + in(i, j, k - 1) + in(i, j + 1, k) +
                  in(i, j - 1, k) + in(i + 1, j, k) + in(i - 1, j, k) -
                  6 * in(i, j, k)
            out(i, j, k) = Clamp(res, 0, 255)
        end
    end
end
```

With `Clamp` defined as

```{.ruby}
def Clamp(val, start, end):
    return Max(Min(val, end), start)
end
```

And `in(i, j, k)` and `out(i, j, k)` are helper functions defined as

```{.cpp}
#define value(arry, i, j, k) arry[(( i )*width + (j)) * depth + (k)]
#define in(i, j, k)   value(input_array, i, j, k)
#define out(i, j, k)  value(output_array, i, j, k)
```
