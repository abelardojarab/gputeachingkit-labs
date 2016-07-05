set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -rdc=true -lcudadevrt")
set(LINK_LIBRARIES "${LINK_LIBRARIES} -lcudadevrt")
include(${CMAKE_CURRENT_LIST_DIR}/Mandelbrot-Dyn/sources.cmake)
