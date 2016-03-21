add_lab("ThrustListScan")
add_lab_template("ThrustListScan" ${CMAKE_CURRENT_LIST_DIR}/template.cu)
add_lab_solution("ThrustListScan" ${CMAKE_CURRENT_LIST_DIR}/solution.cu)
add_generator("ThrustListScan" ${CMAKE_CURRENT_LIST_DIR}/dataset_generator.cpp)
