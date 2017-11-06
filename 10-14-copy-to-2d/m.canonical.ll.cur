; ModuleID = 'm.canonical.ll'
source_filename = "m.bc"
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

module asm "\09.ident\09\22GCC: (GNU) 4.6.4 LLVM: 3.3.1\22"

%"struct.array2_integer(kind=4)" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i64, i64, i64 }
%"struct.array1_integer(kind=4)" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4)" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).0" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }

@__m_MOD_mind_jlat = unnamed_addr global %"struct.array2_integer(kind=4)" zeroinitializer, align 32
@__m_MOD_global_idx_array = unnamed_addr global %"struct.array1_integer(kind=4)" zeroinitializer, align 32
@options.11.1612 = internal constant [8 x i32] [i32 68, i32 511, i32 0, i32 0, i32 0, i32 1, i32 0, i32 1], align 32

; Function Attrs: nounwind uwtable
define void @__m_MOD_fn(%"struct.array1_real(kind=4)"* noalias %in_array, %"struct.array1_real(kind=4).0"* noalias %out_array) unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %tmp = getelementptr inbounds %"struct.array1_real(kind=4).0", %"struct.array1_real(kind=4).0"* %out_array, i64 0, i32 3, i64 0, i32 0
  %tmp1 = load i64, i64* %tmp, align 8
  %tmp2 = icmp eq i64 %tmp1, 0
  %tmp3 = select i1 %tmp2, i64 1, i64 %tmp1
  %tmp4 = bitcast %"struct.array1_real(kind=4).0"* %out_array to float**
  %out_arr_data = load float*, float** %tmp4, align 8
  %tmp6 = sub i64 0, %tmp3
  %tmp7 = getelementptr inbounds %"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* %in_array, i64 0, i32 3, i64 0, i32 0
  %tmp8 = load i64, i64* %tmp7, align 8
  %tmp9 = icmp eq i64 %tmp8, 0
  %. = select i1 %tmp9, i64 1, i64 %tmp8
  %tmp10 = bitcast %"struct.array1_real(kind=4)"* %in_array to float**
  %in_arr_data = load float*, float** %tmp10, align 8
  %tmp12 = sub i64 0, %.
  br label %"9"

"9":                                              ; preds = %"9", %entry.split
  %indvars.iv = phi i64 [ %indvars.iv.next, %"9" ], [ 1, %entry.split ]
  %idx_array_data = load i32*, i32** bitcast (%"struct.array1_integer(kind=4)"* @__m_MOD_global_idx_array to i32**), align 32
  %tmp14 = load i64, i64* getelementptr inbounds (%"struct.array1_integer(kind=4)", %"struct.array1_integer(kind=4)"* @__m_MOD_global_idx_array, i64 0, i32 1), align 8
  
  ; indirect_idx = global_idx_array(i)
  %idx_array_islot_index = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp14, i64 1, i64 %indvars.iv) #2
  %idx_array_slot = getelementptr i32, i32* %idx_array_data, i64 %idx_array_islot_index
  %indirect_idx = load i32, i32* %idx_array_slot, align 4
  %tmp18 = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp6, i64 %tmp3, i64 %indvars.iv) #2
  %indirect_idx_sext = sext i32 %indirect_idx to i64

  ; in_array(indirect_idx)
  %in_array_idx_loc = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp12, i64 %., i64 %indirect_idx_sext) #2
  %in_arr_slot = getelementptr float, float* %in_arr_data, i64 %in_array_idx_loc
  %in_arr_slot_typed = bitcast float* %in_arr_slot to i32*
  %in_arr_slot_val = load i32, i32* %in_arr_slot_typed, align 4

  ; out_array(i) = in_array(indirect_idx)
  %out_arr_slot = getelementptr float, float* %out_arr_data, i64 %tmp18
  %out_arr_slot_bitcast = bitcast float* %out_arr_slot to i32*
  store i32 %in_arr_slot_val, i32* %out_arr_slot_bitcast, align 4

  %tmp26 = icmp eq i64 %indvars.iv, 100
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %tmp26, label %return, label %"9"

return:                                           ; preds = %"9"
  ret void
}

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
  tail call void @_gfortran_set_options(i32 8, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @options.11.1612, i64 0, i64 0)) #2
  tail call void @MAIN__() #0
  ret i32 0
}

declare void @_gfortran_set_args(i32, i8**)

declare void @_gfortran_set_options(i32, i32*)

attributes #0 = { nounwind uwtable }
attributes #1 = { readnone }
attributes #2 = { nounwind }
