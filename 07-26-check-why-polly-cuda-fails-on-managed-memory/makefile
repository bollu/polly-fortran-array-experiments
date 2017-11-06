PROGRAM=polly
LLVM_INSTALL_PATH=/users/siddhart/llvm-install
LLVM_BIN_PATH=$(LLVM_INSTALL_PATH)/bin
LLVM_LIB_PATH=$(LLVM_INSTALL_PATH)/lib
CC=$(LLVM_BIN_PATH)/clang

compile:
	$(CC) $(PROGRAM).cpp -o $(PROGRAM).out -lcudart -lcuda -ldl -lstdc++ \
		-L/opt/nvidia/cudatoolkit8.0/default/lib64/ \
		-L/opt/nvidia/cudatoolkit8.0/default/lib64/stubs/ \
		-L/users/siddhart/llvm-install/lib/ \
		-I/opt/nvidia/cudatoolkit8.0/default/include

run:
	srun --partition=debug -n 1 -C gpu nvprof $(PROGRAM).out
