add_lab("Mandelbrot_Dynamic")
add_lab_template("Mandelbrot_Dynamic" ${CMAKE_CURRENT_LIST_DIR}/template.cu)
add_lab_solution("Mandelbrot_Dynamic" ${CMAKE_CURRENT_LIST_DIR}/solution.cu)
add_generator("Mandelbrot_Dynamic" ${CMAKE_CURRENT_LIST_DIR}/dataset_generator.cpp)


set(LINK_LIBRARIES "${LINK_LIBRARIES} -lcudadevrt")

