OLD_OPT=/users/siddhart/dragonegg/llvm-install/bin/opt
NEW_OPT=/scratch/snx1600/siddhart/siddhart/llvm-install/bin/opt
NEW_LLC=/scratch/snx1600/siddhart/siddhart/llvm-install/bin/llc
GPURUNTIME_LIB_PATH=/scratch/snx1600/siddhart/siddhart/llvm-install/lib
# Library to expand calls to polly_fortran_array_index
EXPANDER_LIB_PATH=/users/siddhart/polly-fortran-array-experiments/fortran-array-index-function-call-expander
POLLY_OPTIONS=-polly-process-unprofitable \
			  -polly-invariant-load-hoisting  \
			  -polly-on-isl-error-abort=false \
			  -polly-acc-mincompute=0 \
			  -polly-use-llvm-names  \
			  -polly-ignore-integer-wrapping \
			  -polly-ignore-parameter-bounds  \
			  -polly-rtc-max-parameters=9000  \
			  -polly-rtc-max-arrays-per-group=10000  \
			  -polly-overflow-tracking=never \
			  -polly-detect-fortran-arrays 

# GCC (vanilla)
# gfortran_dragonegg=/scratch/snx1600/siddhart/siddhart/dragonegg-vanilla-gcc/dragonegg/gcc-install/bin/gcc -fplugin=/scratch/snx1600/siddhart/siddhart/dragonegg-vanilla-gcc/dragonegg/dragonegg-src/dragonegg.so -fplugin-arg-dragonegg-llvm-ir-optimize=0 -fplugin-arg-dragonegg-llvm-codegen-optimize=0 -flto



# GCC + polly stuff
gfortran_dragonegg=/users/siddhart/gcc-from-source-install/bin/gfortran -fplugin=/users/siddhart/dragonegg/dragonegg-src/dragonegg.so -fplugin-arg-dragonegg-llvm-ir-optimize=0 -fplugin-arg-dragonegg-llvm-codegen-optimize=0 -flto
all: clean build polly link
run:
	export LD_LIBRARY_PATH=$(EXPANDER_LIB_PATH):$(GPURUNTIME_LIB_PATH):$LD_LIBRARY_PATH
	export POLLY_DEBUG
	srun -n1 -Cgpu --partition=debug ./a.out

clean:
	-rm ./m.f90.004t.gimple
	-rm ./m.f90.003t.original
	-rm *.ll
	-rm *.dot
	-rm *.out

build:
	$(gfortran_dragonegg) m.f90 -S -c -fdump-tree-gimple -fdump-tree-original
	#@echo "ORIGINAL:"
	#cat m.f90.003t.original
	#@echo "GIMPLE:"
	$(OLD_OPT) m.s -o m.bc
	rm m.s
	$(NEW_OPT) m.bc -S -o m.ll
	rm m.bc
	$(NEW_OPT) -S -polly-canonicalize m.ll -o m.canonical.ll
	sed "s-declare i64 @_gfortran_polly_array_index_1(i64, i64, i64)-declare i64 @_gfortran_polly_array_index_1\(i64, i64, i64\) \#2-g" -i m.canonical.ll
	sed "s-declare i64 @_gfortran_polly_array_index_2(i64, i64, i64, i64, i64)-declare i64 @_gfortran_polly_array_index_2\(i64, i64, i64, i64, i64\) \#2-g" -i m.canonical.ll
	echo "attributes #2 = { readnone }" >> m.canonical.ll
	$(NEW_OPT) -analyze $(POLLY_OPTIONS) -polly-use-llvm-names -polly-scops m.canonical.ll -dot-scops -polly-remarks-minimal  -pass-remarks=polly -debug-only=polly-scops

# -debug-only=polly-scops,polly-codegen-ppcg \


polly:
	$(NEW_OPT) m.canonical.ll -S -polly-only-func=__m_MOD_f -polly-codegen-ppcg  \
			-debug-only=polly-codegen-ppcg \
			-polly-acc-fail-on-verify-module-failure \
		-polly-acc-codegen-managed-memory \
		-polly-acc-dump-kernel-ir \
		$(POLLY_OPTIONS) -o m.optimised.ll
	$(NEW_OPT) -S -polly-acc-rewrite-managed-memory m.optimised.ll \
        -polly-acc-rewrite-allocas \
        -polly-acc-rewrite-ignore-linkage-for-globals \
		-o m.optimised.managedmem.ll

link:
	$(NEW_LLC) m.optimised.managedmem.ll -o linked.o -filetype=obj
	gcc linked.o -ldl -lgfortran -lm  -lstdc++  \
		-L/opt/cray/pe/mpt/7.5.0/gni/mpich-gnu/5.1/lib  \
		-lmpich -lmpichf90  \
		-o a.out  -lGPURuntime \
		-L$(GPURUNTIME_LIB_PATH) \
		-L$(EXPANDER_LIB_PATH) -lexpander \
		-lcudart -L/opt/nvidia/cudatoolkit8.0/8.0.54_2.2.8_ga620558-2.1/lib64/



