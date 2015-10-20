
add_lab("MatrixMultiplication")
add_lab_template("MatrixMultiplication" ${CMAKE_CURRENT_LIST_DIR}/template.cu)
add_lab_solution("MatrixMultiplication" ${CMAKE_CURRENT_LIST_DIR}/solution.cu)
add_generator("MatrixMultiplication" ${CMAKE_CURRENT_LIST_DIR}/dataset_generator.c)
