echo "--"
lldb opt -- -polly-canonicalize -polly-scops -analyze \
-polly-detect-fortran-arrays -polly-allow-nonaffine \
-polly-process-unprofitable -polly-ignore-aliasing $@
