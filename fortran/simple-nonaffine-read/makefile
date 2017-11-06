
NAME=program
DRAGONEGG=/users/siddhart/cosmo-self-installation/dragonegg/gcc-install/bin/gcc -fplugin=/users/siddhart/cosmo-self-installation/dragonegg/dragonegg-src/dragonegg.so -lgfortran
LLVM_AS=/users/siddhart/cosmo-self-installation/dragonegg/llvm-install/bin/llvm-as
POLLY_INVOKE=lldb opt -- -polly-acc-dump-code -polly-acc-dump-kernel-ir -S -polly -polly-detect-fortran-arrays -polly-process-unprofitable   \
    -polly-allow-nonaffine  -polly-ignore-aliasing \
   -polly-target=gpu -polly-acc-mincompute=0 -polly-codegen-ppcg 

build-optimise-with-polly:
	$(POLLY_INVOKE) $(NAME).ll -o $(NAME).optimised.ll
build: build-dragonegg build-modernize-opt build-optimise-with-polly build-gen-binary

build-dragonegg:
	$(DRAGONEGG)  -O0 -fno-tree-vectorize -fplugin-arg-dragonegg-llvm-ir-optimize=0 -fplugin-arg-dragonegg-llvm-codegen-optimize=0 -S -flto -c $(NAME).f90  -o $(NAME).s

build-modernize-opt:
	$(LLVM_AS) $(NAME).s -o $(NAME).bc
	opt $(NAME).bc -S -polly-canonicalize -o $(NAME).ll
	rm $(NAME).bc



build-gen-binary:
	clang $(NAME).optimised.ll  -lcudart -lGPURuntime -ldl -lOpenCL -lgfortran -lstdc++ -o $(NAME).out

clean:
	- rm *.ll *.s
