add_lab("ListReduction")
add_lab_template("ListReduction" ${CMAKE_CURRENT_LIST_DIR}/template.cu)
add_lab_solution("ListReduction" ${CMAKE_CURRENT_LIST_DIR}/solution.cu)
add_generator("ListReduction" ${CMAKE_CURRENT_LIST_DIR}/dataset_generator.c)
