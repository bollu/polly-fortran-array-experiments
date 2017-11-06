OLD_OPT=/users/siddhart/dragonegg/llvm-install/bin/opt
NEW_OPT=/scratch/snx1600/siddhart/siddhart/llvm-install/bin/opt
NEW_LLC=/scratch/snx1600/siddhart/siddhart/llvm-install/bin/llc
NEW_LLVM_LINK=/scratch/snx1600/siddhart/siddhart/llvm-install/bin/llvm-link
GPURUNTIME_LIB_PATH=/scratch/snx1600/siddhart/siddhart/llvm-install/lib
# Library to expand calls to polly_fortran_array_index
EXPANDER_LIB_PATH=/users/siddhart/polly-fortran-array-experiments/fortran-array-index-function-call-expander
POLLY_OPTIONS=-polly-process-unprofitable \
			  -polly-invariant-load-hoisting  \
			  -polly-acc-mincompute=0 \
			  -polly-use-llvm-names  \
			  -polly-ignore-integer-wrapping \
			  -polly-ignore-parameter-bounds  \
			  -polly-rtc-max-parameters=9000  \
			  -polly-rtc-max-arrays-per-group=10000  \
			  -polly-overflow-tracking=never \
			  -polly-detect-fortran-arrays  \
			  -polly-acc-libdevice=/opt/nvidia/cudatoolkit8.0/default/nvvm/libdevice/libdevice.compute_20.10.bc



# GCC (vanilla)
# gfortran_dragonegg=/scratch/snx1600/siddhart/siddhart/dragonegg-vanilla-gcc/dragonegg/gcc-install/bin/gcc -fplugin=/scratch/snx1600/siddhart/siddhart/dragonegg-vanilla-gcc/dragonegg/dragonegg-src/dragonegg.so -fplugin-arg-dragonegg-llvm-ir-optimize=0 -fplugin-arg-dragonegg-llvm-codegen-optimize=0 -flto



# GCC + polly stuff
gfortran_dragonegg=/users/siddhart/gcc-from-source-install/bin/gfortran -fplugin=/users/siddhart/dragonegg/dragonegg-src/dragonegg.so -fplugin-arg-dragonegg-llvm-ir-optimize=0 -fplugin-arg-dragonegg-llvm-codegen-optimize=0 -flto
# all: clean build polly link
all: polly
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
	$(NEW_OPT) -S -polly-canonicalize -instnamer m.ll -o m.canonical.ll
	sed "s/define void @__m_MOD_break_scop() #0 {/define void @__m_MOD_break_scop() noinline #0 {/g" -i m.canonical.ll
	sed "s/define void @__m_MOD_coe_so(\(.*\) #0 {/define void @__m_MOD_coe_so(\1 #0 alwaysinline {/g" -i m.canonical.ll
	sed "s-declare i64 @_gfortran_polly_array_index_1(i64, i64, i64)-declare i64 @_gfortran_polly_array_index_1\(i64, i64, i64\) \#100-g" -i m.canonical.ll
	sed "s-declare i64 @_gfortran_polly_array_index_2(i64, i64, i64, i64, i64)-declare i64 @_gfortran_polly_array_index_2\(i64, i64, i64, i64, i64\) \#100-g" -i m.canonical.ll
	sed "s-declare i64 @_gfortran_polly_array_index_3(i64, i64, i64, i64, i64, i64, i64)-declare i64 @_gfortran_polly_array_index_3\(i64, i64, i64, i64, i64, i64, i64\) #200 readnone-g" -i m.canonical.ll
	sed "s-declare i64 @_gfortran_polly_array_index_4(i64, i64, i64, i64, i64, i64, i64, i64, i64)-declare i64 @_gfortran_polly_array_index_4\(i64, i64, i64, i64, i64, i64, i64, i64, i64\) #200 readnone-g" -i m.canonical.ll
	echo "attributes #100 = { readnone }" >> m.canonical.ll
	$(NEW_OPT) m.canonical.ll -always-inline -polly-canonicalize -instsimplify -polly-rewrite-byref-params -S -o m.canonical.rewrite.ll
	mv m.canonical.rewrite.ll m.canonical.ll
	# $(NEW_LLVM_LINK) m.canonical.ll -S expander.ll.lib -o temp; mv temp m.canonical.ll
	# $(NEW_OPT) -S -always-inline m.canonical.ll -o temp; mv temp m.canonical.ll

polly:
	$(NEW_OPT) m.canonical.ll -S -polly-only-func=__m_MOD_f\
		-polly-ignore-aliasing \
		-polly-codegen-ppcg \
		-debug-only=polly-codegen-ppcg,polly-scops \
		-polly-acc-fail-on-verify-module-failure \
		-polly-acc-codegen-managed-memory \
		-polly-acc-dump-kernel-ir \
		-disable-verify  \
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
		-lcudart -L/opt/nvidia/cudatoolkit8.0/default/lib64/



