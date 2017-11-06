; ModuleID = 'm.ll'
source_filename = "m.bc"
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

module asm "\09.ident\09\22GCC: (GNU) 4.6.4 LLVM: 3.3.1\22"

%"struct.array2_real(kind=4)" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i64, i64, i64 }
%"struct.array1_real(kind=4)" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }

@__m_MOD_arr2 = unnamed_addr global %"struct.array2_real(kind=4)" zeroinitializer, align 32
@__m_MOD_arr1 = unnamed_addr global %"struct.array1_real(kind=4)" zeroinitializer, align 32
@options.12.1618 = internal constant [8 x i32] [i32 68, i32 511, i32 0, i32 0, i32 0, i32 1, i32 0, i32 1], align 32

; Function Attrs: nounwind uwtable
define void @__m_MOD_f([0 x float]* noalias %sotr, [0 x float]* noalias %sobs, [0 x float]* noalias %sod_t, [0 x float]* noalias %zsmu0_flux, i32* noalias %nproma, i32* noalias %ke, i32* noalias %ipend) unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %tmp = load i32, i32* %nproma, align 4
  %tmp1 = sext i32 %tmp to i64
  %tmp2 = icmp sgt i64 %tmp1, 0
  %tmp3 = select i1 %tmp2, i64 %tmp1, i64 0
  ; %tmp4 = load i32, i32* %ke, align 4
  %not = xor i64 %tmp3, -1
  %tmp5 = load i32, i32* %ipend, align 4
  %tmp6 = icmp sgt i32 %tmp5, 0
  br i1 %tmp6, label %"3.preheader", label %return

"3.preheader":                                    ; preds = %entry.split
  br label %"3"

"3":                                              ; preds = %"5", %"3.preheader"
  %tmp7 = phi i32 [ %tmp22, %"5" ], [ 1, %"3.preheader" ]
  %tmp8 = sext i32 %tmp7 to i64
  %tmp9 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp8) #1
  %tmp10 = getelementptr [0 x float], [0 x float]* %zsmu0_flux, i64 0, i64 %tmp9
  %tmp11 = load float, float* %tmp10, align 4
  %tmp12 = fcmp ogt float %tmp11, 1.000000e+01
  br i1 %tmp12, label %"4", label %"5"

"4":                                              ; preds = %"3"
  %tmp13 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp8) #1
  %tmp4 = load i32, i32* %ke, align 4
  %tmp14 = sext i32 %tmp4 to i64
  %tmp15 = tail call i64 @_gfortran_polly_array_index_2(i64 %not, i64 %tmp3, i64 1, i64 %tmp14, i64 1) #1
  %tmp16 = getelementptr [0 x float], [0 x float]* %sotr, i64 0, i64 %tmp15
  %tmp17 = bitcast float* %tmp16 to i32*
  %tmp18 = load i32, i32* %tmp17, align 4
  %tmp19 = getelementptr [0 x float], [0 x float]* %sobs, i64 0, i64 %tmp13
  %tmp20 = bitcast float* %tmp19 to i32*
  store i32 %tmp18, i32* %tmp20, align 4
  br label %"5"

"5":                                              ; preds = %"4", %"3"
  %tmp21 = icmp eq i32 %tmp7, %tmp5
  %tmp22 = add i32 %tmp7, 1
  br i1 %tmp21, label %return.loopexit, label %"3"

return.loopexit:                                  ; preds = %"5"
  br label %return

return:                                           ; preds = %return.loopexit, %entry.split
  ret void
}

declare i64 @_gfortran_polly_array_index_1(i64, i64, i64) #2

declare i64 @_gfortran_polly_array_index_2(i64, i64, i64, i64, i64) #2

; Function Attrs: nounwind uwtable
define internal void @MAIN__() #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  tail call void @_gfortran_set_args(i32 %argc, i8** %argv) #1
  tail call void @_gfortran_set_options(i32 8, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @options.12.1618, i64 0, i64 0)) #1
  tail call void @MAIN__() #0
  ret i32 0
}

declare void @_gfortran_set_args(i32, i8**)

declare void @_gfortran_set_options(i32, i32*)

attributes #0 = { nounwind uwtable }
attributes #1 = { nounwind }
attributes #2 = { readnone }
