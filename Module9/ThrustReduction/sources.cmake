add_lab("ThrustReduction")
add_lab_template("ThrustReduction" ${CMAKE_CURRENT_LIST_DIR}/template.cu)
add_lab_solution("ThrustReduction" ${CMAKE_CURRENT_LIST_DIR}/solution.cu)
add_generator("ThrustReduction" ${CMAKE_CURRENT_LIST_DIR}/dataset_generator.c)

