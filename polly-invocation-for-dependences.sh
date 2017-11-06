echo "--"
opt -O0 -polly -polly-process-unprofitable -S -polly-canonicalize  -analyze \
    -polly-allow-nonaffine -polly-ignore-aliasing -polly-invariant-load-hoisting -polly-scops -polly-dependences -debug-only=polly-dependence $@

# opt -polly -polly-process-unprofitable -S -polly-canonicalize  -polly-scops -analyze \
#     -polly-allow-nonaffine -polly-ignore-aliasing -polly-invariant-load-hoisting -polly-dependences -debug-only=polly-dependence $@
