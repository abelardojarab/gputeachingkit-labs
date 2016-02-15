add_lab("ListScan")
add_lab_template("ListScan" ${CMAKE_CURRENT_LIST_DIR}/template.cu)
add_lab_solution("ListScan" ${CMAKE_CURRENT_LIST_DIR}/solution.cu)
add_generator("ListScan" ${CMAKE_CURRENT_LIST_DIR}/dataset_generator.c)
