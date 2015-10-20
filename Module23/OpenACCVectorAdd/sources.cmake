
add_lab("OpenACCVectorAdd")
add_lab_template("OpenACCVectorAdd" ${CMAKE_CURRENT_LIST_DIR}/template.cu)
add_lab_solution("OpenACCVectorAdd" ${CMAKE_CURRENT_LIST_DIR}/solution.cu)
add_generator("OpenACCVectorAdd" ${CMAKE_CURRENT_LIST_DIR}/dataset_generator.c)
