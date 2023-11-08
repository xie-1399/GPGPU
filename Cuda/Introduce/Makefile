
# use the make file ro compile the cu code

Apps = checkIt hello memory dimension
INCLUDES = -I /home/dell/home/dell/GPGPU/Cuda/common/ # here may be should not using absolute path

all: ${Apps}

checkIt:checkIt.cu
	nvcc -o checkIt checkIt.cu

hello:hello.cu
	nvcc -o hello hello.cu

memory:memory.cu
	nvcc ${INCLUDES} -o memory memory.cu

dimension:dimension.cu
	nvcc -o dimension dimension.cu

clean:
	rm -rf ${Apps}