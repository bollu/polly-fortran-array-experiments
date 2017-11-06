#CREATELL="/home/bollu/llvm/llvm/tools/polly/test/create_ll.sh"
CREATELL="./create_ll.sh"
PROGNAME=program
LLVM_INSTALL_PATH=/users/siddhart/llvm-install/bin
LLC=$(LLVM_INSTALL_PATH)/llc
CLANG=$(LLVM_INSTALL_PATH)/clang
OPT=$(LLVM_INSTALL_PATH)/opt


build-cpp: gen-ll build-ll

gen-ll:
	PATH=$(LLVM_INSTALL_PATH):$(PATH) ./create_ll.sh $(PROGNAME).cpp

build-ll: clean
	$(OPT) -S  -polly-process-unprofitable  -polly-codegen-ppcg \
		-polly-acc-mincompute=0 $(PROGNAME).ll -o $(PROGNAME).optimised.ll \
		-polly-acc-dump-kernel-ir  -polly-acc-codegen-managed-memory
	$(LLC) $(PROGNAME).optimised.ll -o $(PROGNAME).s


	LD_LIBRARY_PATH=/users/siddhart/llvm-install/lib $(CLANG) $(PROGNAME).s  -lcudart -lGPURuntime -ldl  -lstdc++ -o $(PROGNAME).out -L/opt/nvidia/cudatoolkit8.0/default/lib64/ -L/users/siddhart/llvm-install/lib/

runlocal: build
	@echo "running $(PROGNAME).out..."
	./$(PROGNAME).out

run:
	@echo "running $(PROGNAME).out... on debug queue"
	POLLY_DEBUG=1 srun -n 1 -Cgpu --partition=debug nvprof ./program.out 

clean:
	-rm *.optimised.ll
	-rm *.out
	-rm *.bench
	-rm *.s
