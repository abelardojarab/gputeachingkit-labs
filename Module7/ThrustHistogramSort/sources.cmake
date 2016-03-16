add_lab("ThrustHistogramSort")
add_lab_template("ThrustHistogramSort" ${CMAKE_CURRENT_LIST_DIR}/template.cu)
add_lab_solution("ThrustHistogramSort" ${CMAKE_CURRENT_LIST_DIR}/solution.cu)
add_generator("ThrustHistogramSort" ${CMAKE_CURRENT_LIST_DIR}/dataset_generator.cpp)
