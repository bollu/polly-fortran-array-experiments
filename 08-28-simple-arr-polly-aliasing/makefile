#  gfortran_dragonegg=/users/siddhart/dragonegg/gcc-install/bin/gfortran -fplugin=/users/siddhart/dragonegg/dragonegg-src/dragonegg.so -fplugin-arg-dragonegg-llvm-ir-optimize=0 -fplugin-arg-dragonegg-llvm-codegen-optimize=0 -flto
gfortran_dragonegg=/users/siddhart/dragonegg-from-source-install/bin/gfortran -fplugin=/users/siddhart/dragonegg/dragonegg-src/dragonegg.so -fplugin-arg-dragonegg-llvm-ir-optimize=0 -fplugin-arg-dragonegg-llvm-codegen-optimize=0 -flto
OLD_OPT=/users/siddhart/dragonegg/llvm-install/bin/opt

#MODERN_LLVM_BIN_PATH=/users/siddhart/llvm-install/bin
NEW_OPT=$(MODERN_LLVM_BIN_PATH)/opt
NEW_LLC=$(MODERN_LLVM_BIN_PATH)/llc
NEW_LLVM_LINK=$(MODERN_LLVM_BIN_PATH)/llvm-link

all-noignore-inbounds: build-noignore-inbounds runexec
build-noignore-inbounds: clean make-new-ll runpolly

all-ignore-inbounds: clean make-new-ll runpolly-forkernel runexec

clean:
	-rm *.prof
	-rm *.ll *.out 
	-rm m.mod

make-new-ll:
	$(gfortran_dragonegg) --version
	$(gfortran_dragonegg) m.f90 -S -c
	$(gfortran_dragonegg) program.f90 -S -c
	$(OLD_OPT) m.s -o m.bc
	rm m.s
	$(NEW_OPT) m.bc -S -o m.ll
	rm m.bc
	$(OLD_OPT) program.s -o program.bc
	rm program.s
	$(NEW_OPT) program.bc -S -o program.ll
	rm program.bc
	$(NEW_LLVM_LINK) program.ll m.ll -S -o linked.ll
	$(NEW_OPT) -polly-canonicalize linked.ll -S  -o linked.canonicalized.ll
	rm linked.ll

runpolly:
	$(NEW_OPT) -polly-process-unprofitable \
		-polly-precise-inbounds \
		-polly-acc-use-shared \
		-polly-use-llvm-names \
		-polly-rtc-max-parameters=1000 \
		-polly-rtc-max-arrays-per-group=1000 \
		-polly-ignore-integer-wrapping \
		-polly-ignore-parameter-bounds \
		-polly-invariant-load-hoisting \
		-polly-detect-fortran-arrays \
		-polly-codegen-ppcg \
		-polly-scops \
		-debug-only=polly-detect,polly-scops,polly-codegen-ppcg \
		-polly-acc-mincompute=0 \
		-polly-only-func=__m_MOD_outer\
       -polly-acc-rewrite-managed-memory \
	   -polly-acc-codegen-managed-memory \
        -polly-acc-rewrite-allocas \
        -polly-acc-rewrite-ignore-linkage-for-globals \
		-polly-remarks-minimal \
		-polly-codegen-emit-rtc-print \
		-polly-rtc-max-parameters=9000000 \
		-polly-rtc-max-arrays-per-group=10000 \
		linked.canonicalized.ll -S -o linked.optimised.ll
	$(NEW_LLC) linked.optimised.ll -o object.o -filetype=obj
	gcc object.o -ldl -lgfortran -lm \
		-lstdc++ -lGPURuntime -L$(MODERN_LLVM_BIN_PATH)/../lib -lcudart \
		-L/opt/nvidia/cudatoolkit8.0/8.0.54_2.2.8_ga620558-2.1/lib64/ -o a.out

runpolly-forkernel:
	$(NEW_OPT) -polly-process-unprofitable -polly-canonicalize \
		-polly-precise-inbounds \
		-polly-ignore-inbounds \
		-polly-acc-use-shared \
		-polly-use-llvm-names \
		-polly-detect-fortran-arrays \
		-polly-rtc-max-parameters=1000 \
		-polly-rtc-max-arrays-per-group=1000 \
		-polly-ignore-integer-wrapping \
		-polly-ignore-parameter-bounds \
		-polly-invariant-load-hoisting \
		-polly-codegen-ppcg \
		-debug-only=polly-scops,polly-codegen-ppcg \
		-polly-acc-mincompute=0 \
       -polly-acc-rewrite-managed-memory \
	   -polly-acc-codegen-managed-memory \
        -polly-acc-rewrite-allocas \
        -polly-acc-rewrite-ignore-linkage-for-globals \
		-polly-remarks-minimal \
		-polly-codegen-emit-rtc-print \
		-polly-rtc-max-parameters=9000000 \
		-polly-rtc-max-arrays-per-group=10000 \
		-polly-only-func=__m_MOD_outer \
		linked.canonicalized.ll -S -o linked.optimised.ll
	$(NEW_LLC) linked.optimised.ll -o object.o -filetype=obj
	gcc object.o -ldl -lgfortran -lm \
		-lstdc++ -lGPURuntime -L$(MODERN_LLVM_BIN_PATH)/../lib -lcudart \
		-L/opt/nvidia/cudatoolkit8.0/8.0.54_2.2.8_ga620558-2.1/lib64/ -o a.out

runexec: 
	srun --partition=debug -n 1 -C  gpu nvprof -f --export-profile nvprof.prof  ./a.out 2>&1
	nvprof -i nvprof.prof
	srun --partition=debug -n 1 -C  gpu cuda-memcheck ./a.out 2>&1
	



