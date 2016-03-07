add_lab("Reduction")
add_lab_template("ReductionThrust" ${CMAKE_CURRENT_LIST_DIR}/template.cu)
add_lab_solution("ReductionThrust" ${CMAKE_CURRENT_LIST_DIR}/solution.cu)
add_generator("ReductionThrust" ${CMAKE_CURRENT_LIST_DIR}/dataset_generator.c)

