add_lab("Histogram")
add_lab_template("Histogram" ${CMAKE_CURRENT_LIST_DIR}/template.cu)
add_lab_solution("Histogram" ${CMAKE_CURRENT_LIST_DIR}/solution.cu)
add_generator("Histogram" ${CMAKE_CURRENT_LIST_DIR}/dataset_generator.c)
