rm *.o
scp -r siddhart@daint:/users/siddhart/playground/standalone/pp/CMakeFiles/standalone.dir/bitcode/ bitcode/
cd bitcode
ls *.bc | parallel "opt {} -S -o ../{.}.new.o"
llvm-link *.new.o -o linked.s
opt -S -polly-process-unprofitable -polly-codegen -polly-codegen-perf-monitoring linked.s -o linked.profiled.s -polly-ignore-parameter-bounds  -polly-overflow-tracking=never
llc linked.profiled.s -o linked.o -filetype=obj

# srun --ntasks=1 --cpus-per-task=8 "opt -S -polly-process-unprofitable -polly-codegen -polly-codegen-perf-monitoring linked.s -o linked.profiled.s -polly-ignore-parameter-bounds  -polly-overflow-tracking=never"
