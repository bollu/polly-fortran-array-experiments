echo "--"
opt -polly-canonicalize -analyze \
-polly-detect-fortran-arrays -polly-allow-nonaffine  -polly-scops -polly-dependences \
-polly-process-unprofitable -polly-ignore-aliasing  $@
