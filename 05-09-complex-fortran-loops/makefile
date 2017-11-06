gfortran_dragonegg=/users/siddhart/gcc-from-source-install/bin/gfortran -fplugin=/users/siddhart/dragonegg/dragonegg-src/dragonegg.so -fplugin-arg-dragonegg-llvm-ir-optimize=0 -fplugin-arg-dragonegg-llvm-codegen-optimize=0 -flto
OLD_OPT=/users/siddhart/dragonegg/llvm-install/bin/opt
NEW_OPT=/scratch/snx1600/siddhart/siddhart/llvm-install/bin/opt
NEW_LLC=/scratch/snx1600/siddhart/siddhart/llvm-install/bin/llc
GPURUNTIME_LIB_PATH=/scratch/snx1600/siddhart/siddhart/llvm-install/lib

POLLY_OPTIONS=-polly-process-unprofitable -polly-allow-nonaffine -polly-invariant-load-hoisting 

# GCC 4.6.3
# gfortran_dragonegg=/users/siddhart/dragonegg-from-source/install/bin/gcc


# GCC 4.6.4
# gfortran_dragonegg=/users/siddhart/gfortran-build-from-source/gcc-4.6.4-install/bin/gfortran
all: clean build polly link

clean:
	-rm ./m.f90.004t.gimple
	-rm ./m.f90.003t.original

build:
	$(gfortran_dragonegg) m.f90 -S -c -fdump-tree-gimple -fdump-tree-original
	@echo "ORIGINAL:"
	cat m.f90.003t.original
	@echo "GIMPLE:"
	$(OLD_OPT) m.s -o m.bc
	rm m.s
	$(NEW_OPT) m.bc -S -o m.ll
	rm m.bc
	$(NEW_OPT) -S -polly-canonicalize m.ll -o m.canonical.ll
	sed "s-declare i64 @_gfortran_polly_array_index_2(i64, i64, i64, i64)-declare i64 @_gfortran_polly_array_index_2\(i64, i64, i64, i64\) \#2-g" -i m.canonical.ll
	echo "attributes #2 = { readnone }" >> m.canonical.ll
	$(NEW_OPT) -analyze $(POLLY_OPTIONS) -polly-scops m.canonical.ll -debug

# -debug-only=polly-scops,polly-codegen-ppcg \

polly:
	$(NEW_OPT) m.canonical.ll -S -polly-codegen-ppcg  \
		-polly-acc-codegen-managed-memory \
		$(POLLY_OPTIONS) -o m.optimised.ll
	$(NEW_OPT) -S -polly-acc-rewrite-managed-memory m.optimised.ll \
		-o m.optimised.managedmem.ll

link:
	$(NEW_LLC) m.optimised.managedmem.ll -o linked.o -filetype=obj
	gcc linked.o -ldl -lgfortran -lm  -lstdc++  \
		-L/opt/cray/pe/mpt/7.5.0/gni/mpich-gnu/5.1/lib  \
		-lmpich -lmpichf90  \
		-o a.out  -lGPURuntime \
		-L$(GPURUNTIME_LIB_PATH) \
		-lcudart -L/opt/nvidia/cudatoolkit8.0/8.0.54_2.2.8_ga620558-2.1/lib64/


