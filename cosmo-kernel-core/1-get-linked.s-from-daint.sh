scp siddhart@daint:/users/siddhart/playground/standalone/pp/CMakeFiles/standalone.dir/new-bytcode/linked.s linked.unoptimised.s
scp siddhart@daint:/users/siddhart/playground/linked.o linked.optimised.o
opt -S linked.optimised.o -o linked.optimised.s
