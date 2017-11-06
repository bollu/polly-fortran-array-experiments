; ModuleID = 'm.optimised.ll'
source_filename = "m.bc"
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

module asm "\09.ident\09\22GCC: (GNU) 4.6.4 LLVM: 3.3.1\22"

%"struct.array2_integer(kind=4)" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i64, i64, i64 }
%"struct.array2_integer(kind=4).0" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4)" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4)" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }

@__m_MOD_mind_jlat = unnamed_addr global %"struct.array2_integer(kind=4)" zeroinitializer, align 32
@__m_MOD_mind_ilon = unnamed_addr global %"struct.array2_integer(kind=4).0" zeroinitializer, align 32
@options.14.1619 = internal constant [8 x i32] [i32 68, i32 511, i32 0, i32 0, i32 0, i32 1, i32 0, i32 1], align 32

; Function Attrs: nounwind uwtable
define void @__m_MOD_f(%"struct.array2_real(kind=4)"* noalias %fld, %"struct.array1_real(kind=4)"* noalias %fld_b, i32* noalias %ipend, i32* noalias %ib) unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %tmp = getelementptr inbounds %"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* %fld_b, i64 0, i32 3, i64 0, i32 0
  %tmp1 = load i64, i64* %tmp, align 8
  %tmp2 = icmp eq i64 %tmp1, 0
  %tmp3 = select i1 %tmp2, i64 1, i64 %tmp1
  %tmp4 = bitcast %"struct.array1_real(kind=4)"* %fld_b to float**
  %tmp5 = load float*, float** %tmp4, align 8
  %tmp6 = sub i64 0, %tmp3
  %tmp7 = getelementptr inbounds %"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* %fld, i64 0, i32 3, i64 0, i32 0
  %tmp8 = load i64, i64* %tmp7, align 8
  %tmp9 = icmp eq i64 %tmp8, 0
  %. = select i1 %tmp9, i64 1, i64 %tmp8
  %tmp10 = bitcast %"struct.array2_real(kind=4)"* %fld to float**
  %tmp11 = load float*, float** %tmp10, align 8
  %tmp12 = getelementptr %"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* %fld, i64 0, i32 3, i64 1, i32 0
  %tmp13 = load i64, i64* %tmp12, align 8
  %sum = add i64 %., %tmp13
  %tmp14 = sub i64 0, %sum
  %tmp15 = load i32, i32* %ipend, align 4
  %tmp16 = icmp sgt i32 %tmp15, 0
  br i1 %tmp16, label %"9.preheader", label %return

"9.preheader":                                    ; preds = %entry.split
  br label %"9"

"9":                                              ; preds = %"9", %"9.preheader"
  %tmp17 = phi i32 [ %tmp43, %"9" ], [ 1, %"9.preheader" ]
  %tmp18 = load i32*, i32** bitcast (%"struct.array2_integer(kind=4).0"* @__m_MOD_mind_ilon to i32**), align 32
  %tmp19 = sext i32 %tmp17 to i64
  %tmp20 = load i32, i32* %ib, align 4
  %tmp21 = sext i32 %tmp20 to i64
  %tmp22 = load i64, i64* getelementptr inbounds (%"struct.array2_integer(kind=4).0", %"struct.array2_integer(kind=4).0"* @__m_MOD_mind_ilon, i64 0, i32 3, i64 1, i32 0), align 8
  %tmp23 = load i64, i64* getelementptr inbounds (%"struct.array2_integer(kind=4).0", %"struct.array2_integer(kind=4).0"* @__m_MOD_mind_ilon, i64 0, i32 1), align 8
  %tmp24 = tail call i64 @_gfortran_polly_array_index_2(i64 %tmp23, i64 %tmp22, i64 1, i64 %tmp21, i64 %tmp19) #2
  %tmp25 = getelementptr i32, i32* %tmp18, i64 %tmp24
  %tmp26 = load i32, i32* %tmp25, align 4
  %tmp27 = load i32*, i32** bitcast (%"struct.array2_integer(kind=4)"* @__m_MOD_mind_jlat to i32**), align 32
  %tmp28 = load i64, i64* getelementptr inbounds (%"struct.array2_integer(kind=4)", %"struct.array2_integer(kind=4)"* @__m_MOD_mind_jlat, i64 0, i32 3, i64 1, i32 0), align 8
  %tmp29 = load i64, i64* getelementptr inbounds (%"struct.array2_integer(kind=4)", %"struct.array2_integer(kind=4)"* @__m_MOD_mind_jlat, i64 0, i32 1), align 8
  %tmp30 = tail call i64 @_gfortran_polly_array_index_2(i64 %tmp29, i64 %tmp28, i64 1, i64 %tmp21, i64 %tmp19) #2
  %tmp31 = getelementptr i32, i32* %tmp27, i64 %tmp30
  %tmp32 = load i32, i32* %tmp31, align 4
  %tmp33 = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp6, i64 %tmp3, i64 %tmp19) #2
  %tmp34 = sext i32 %tmp26 to i64
  %tmp35 = sext i32 %tmp32 to i64
  %tmp36 = tail call i64 @_gfortran_polly_array_index_2(i64 %tmp14, i64 %tmp13, i64 %., i64 %tmp35, i64 %tmp34) #2
  %tmp37 = getelementptr float, float* %tmp11, i64 %tmp36
  %tmp38 = bitcast float* %tmp37 to i32*
  %tmp39 = load i32, i32* %tmp38, align 4
  %tmp40 = getelementptr float, float* %tmp5, i64 %tmp33
  %tmp41 = bitcast float* %tmp40 to i32*
  store i32 %tmp39, i32* %tmp41, align 4
  %tmp42 = icmp eq i32 %tmp17, %tmp15
  %tmp43 = add i32 %tmp17, 1
  br i1 %tmp42, label %return.loopexit, label %"9"

return.loopexit:                                  ; preds = %"9"
  br label %return

return:                                           ; preds = %return.loopexit, %entry.split
  ret void
}

; Function Attrs: readnone
declare i64 @_gfortran_polly_array_index_2(i64, i64, i64, i64, i64) #1

; Function Attrs: readnone
declare i64 @_gfortran_polly_array_index_1(i64, i64, i64) #1

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
  tail call void @_gfortran_set_args(i32 %argc, i8** %argv) #2
  tail call void @_gfortran_set_options(i32 8, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @options.14.1619, i64 0, i64 0)) #2
  tail call void @MAIN__() #0
  ret i32 0
}

declare void @_gfortran_set_args(i32, i8**)

declare void @_gfortran_set_options(i32, i32*)

attributes #0 = { nounwind uwtable }
attributes #1 = { readnone }
attributes #2 = { nounwind }
