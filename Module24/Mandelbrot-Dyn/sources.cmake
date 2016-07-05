
add_lab("Mandelbrot-Dyn")
add_lab_template("Mandelbrot-Dyn" ${CMAKE_CURRENT_LIST_DIR}/template.cu)
add_lab_solution("Mandelbrot-Dyn" ${CMAKE_CURRENT_LIST_DIR}/solution.cu)
add_generator("Mandelbrot-Dyn" ${CMAKE_CURRENT_LIST_DIR}/dataset_generator.cpp)
