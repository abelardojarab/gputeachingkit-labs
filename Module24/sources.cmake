set(CUDA_SEPARABLE_COMPILATION ON)
#set(LINK_LIBRARIES "${LINK_LIBRARIES} /usr/local/cuda/lib64/libcudadevrt.a")
include(${CMAKE_CURRENT_LIST_DIR}/Mandelbrot-Dyn/sources.cmake)
