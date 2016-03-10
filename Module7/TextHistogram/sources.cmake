add_lab("TextHistogram")
add_lab_template("TextHistogram" ${CMAKE_CURRENT_LIST_DIR}/template.cu)
add_lab_solution("TextHistogram" ${CMAKE_CURRENT_LIST_DIR}/solution.cu)
add_generator("TextHistogram" ${CMAKE_CURRENT_LIST_DIR}/dataset_generator.c)
