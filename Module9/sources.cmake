include(${CMAKE_CURRENT_LIST_DIR}/Reduction/sources.cmake)
if (NOT BUILD_USING_DOCKER)
include(${CMAKE_CURRENT_LIST_DIR}/ThrustReduction/sources.cmake)
endif (NOT BUILD_USING_DOCKER)
