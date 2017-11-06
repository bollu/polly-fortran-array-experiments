#CREATELL="/home/bollu/llvm/llvm/tools/polly/test/create_ll.sh"
CREATELL="./create_ll.sh"
PROGNAME=program
LLC=/users/siddhart/llvm-install/bin/llc
CLANG=/users/siddhart/llvm-install/bin/clang
OPT=/users/siddhart/llvm-install/bin/opt

build: clean
	$(OPT) -S -polly-canonicalize -polly-process-unprofitable -polly-invariant-load-hoisting -polly-codegen-ppcg \
		-polly-acc-mincompute=0 $(PROGNAME).ll -o $(PROGNAME).optimised.ll
	$(LLC) $(PROGNAME).optimised.ll -o $(PROGNAME).s
	$(CLANG) $(PROGNAME).s  -lcudart -lGPURuntime -ldl -lOpenCL -lgfortran -lstdc++ -o $(PROGNAME).out -L/opt/nvidia/cudatoolkit8.0/8.0.54_2.2.8_ga620558-2.1/lib64/

runbatch: build
	export POLLY_DEBUG=1
	POLLY_DEBUG=1 srun -n 1 -Cgpu --partition=debug nvprof ./program.out

runlocal: build
	@echo "running $(PROGNAME).out..."
	./$(PROGNAME).out

clean:
	-rm *.optimised.ll
	-rm *.out
	-rm *.bench
	-rm *.s
