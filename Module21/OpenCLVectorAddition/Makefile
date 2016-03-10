NVCC=nvcc
INCLUDE= -I../../support
LIBWB= -L../../build -lwb
LIBS= -lOpenCL $(LIBWB)

all: template

template:
	$(NVCC) -std=c++11 -x c++ template.c $(INCLUDE) $(LIBS)

solution:
	$(NVCC) solution.c $(INCLUDE)
clean:
	
