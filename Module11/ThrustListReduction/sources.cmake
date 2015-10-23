add_lab("ThrustListReduction")
add_lab_template("ThrustListReduction" ${CMAKE_CURRENT_LIST_DIR}/template.cu)
add_lab_solution("ThrustListReduction" ${CMAKE_CURRENT_LIST_DIR}/solution.cu)
add_generator("ThrustListReduction" ${CMAKE_CURRENT_LIST_DIR}/dataset_generator.c)
