; ModuleID = 'm.optimised.ll'
source_filename = "m.bc"
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

module asm "\09.ident\09\22GCC: (GNU) 4.6.4 LLVM: 3.3.1\22"

%"struct.array1_real(kind=4)" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i64, i64, i64 }
%"struct.array1_real(kind=4).0" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).1" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%struct.__st_parameter_dt = type { %struct.__st_parameter_common, i64, i64*, i64*, i8*, i8*, i32, i32, i8*, i8*, i32, i32, i8*, [256 x i8], i32*, i64, i8*, i32, i32, i8*, i8*, i32, i32, i8*, i8*, i32, i32, i8*, i8*, i32, [4 x i8] }
%struct.__st_parameter_common = type { i32, i32, i8*, i32, i32, i8*, i32* }
%"struct.array1_real(kind=4).2" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).3" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).4" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).5" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }

@.cst = private constant [6 x i8] c"m.f90\00", align 8
@.cst1 = private constant [11 x i8] c"calling f()", align 8
@0 = internal constant i32 10
@.cst2 = private constant [7 x i8] c"arrout:", align 8
@options.25.1640 = internal constant [8 x i32] [i32 68, i32 511, i32 0, i32 0, i32 0, i32 1, i32 0, i32 1], align 32

; Function Attrs: nounwind uwtable
define void @__m_MOD_f(%"struct.array1_real(kind=4)"* noalias %arrin, %"struct.array1_real(kind=4).0"* noalias %arridx, %"struct.array1_real(kind=4).1"* noalias %arrout, i32* noalias %n) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %tmp = getelementptr inbounds %"struct.array1_real(kind=4).0", %"struct.array1_real(kind=4).0"* %arridx, i64 0, i32 3, i64 0, i32 0
  %tmp1 = load i64, i64* %tmp, align 8
  %tmp2 = icmp eq i64 %tmp1, 0
  %tmp3 = select i1 %tmp2, i64 1, i64 %tmp1
  %tmp4 = bitcast %"struct.array1_real(kind=4).0"* %arridx to float**
  %tmp5 = load float*, float** %tmp4, align 8
  %tmp6 = sub i64 0, %tmp3
  %tmp7 = getelementptr inbounds %"struct.array1_real(kind=4).1", %"struct.array1_real(kind=4).1"* %arrout, i64 0, i32 3, i64 0, i32 0
  %tmp8 = load i64, i64* %tmp7, align 8
  %tmp9 = icmp eq i64 %tmp8, 0
  %. = select i1 %tmp9, i64 1, i64 %tmp8
  %tmp10 = bitcast %"struct.array1_real(kind=4).1"* %arrout to float**
  %tmp11 = load float*, float** %tmp10, align 8
  %tmp12 = sub i64 0, %.
  %tmp13 = getelementptr inbounds %"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* %arrin, i64 0, i32 3, i64 0, i32 0
  %tmp14 = load i64, i64* %tmp13, align 8
  %tmp15 = icmp eq i64 %tmp14, 0
  %tmp16 = select i1 %tmp15, i64 1, i64 %tmp14
  %tmp17 = bitcast %"struct.array1_real(kind=4)"* %arrin to float**
  %tmp18 = load float*, float** %tmp17, align 8
  %tmp19 = sub i64 0, %tmp16
  %tmp20 = load i32, i32* %n, align 4
  %tmp21 = icmp sgt i32 %tmp20, 0
  br i1 %tmp21, label %"12.preheader", label %return

"12.preheader":                                   ; preds = %entry.split
  br label %"12"

"12":                                             ; preds = %"12", %"12.preheader"
  %tmp22 = phi i32 [ %tmp37, %"12" ], [ 1, %"12.preheader" ]
  %tmp23 = sext i32 %tmp22 to i64
  %tmp24 = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp6, i64 %tmp3, i64 %tmp23) #2
  %tmp25 = getelementptr float, float* %tmp5, i64 %tmp24
  %tmp26 = load float, float* %tmp25, align 4
  %tmp27 = fptosi float %tmp26 to i32
  %tmp28 = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp12, i64 %., i64 %tmp23) #2
  %tmp29 = sext i32 %tmp27 to i64
  %tmp30 = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp19, i64 %tmp16, i64 %tmp29) #2
  %tmp31 = getelementptr float, float* %tmp18, i64 %tmp30
  %tmp32 = bitcast float* %tmp31 to i32*
  %tmp33 = load i32, i32* %tmp32, align 4
  %tmp34 = getelementptr float, float* %tmp11, i64 %tmp28
  %tmp35 = bitcast float* %tmp34 to i32*
  store i32 %tmp33, i32* %tmp35, align 4
  %tmp36 = icmp eq i32 %tmp22, %tmp20
  %tmp37 = add i32 %tmp22, 1
  br i1 %tmp36, label %return.loopexit, label %"12"

return.loopexit:                                  ; preds = %"12"
  br label %return

return:                                           ; preds = %return.loopexit, %entry.split
  ret void
}

; Function Attrs: readnone
declare i64 @_gfortran_polly_array_index_1(i64, i64, i64) #1

; Function Attrs: nounwind uwtable
define internal void @MAIN__() #0 {
entry:
  %0 = call i8* @polly_mallocManaged(i64 40)
  %arridx = bitcast i8* %0 to [10 x float]*
  %1 = call i8* @polly_mallocManaged(i64 40)
  %arrin = bitcast i8* %1 to [10 x float]*
  %2 = call i8* @polly_mallocManaged(i64 40)
  %arrout = bitcast i8* %2 to [10 x float]*
  %3 = call i8* @polly_mallocManaged(i64 480)
  %dt_parm.18 = bitcast i8* %3 to %struct.__st_parameter_dt*
  %4 = call i8* @polly_mallocManaged(i64 48)
  %parm.21 = bitcast i8* %4 to %"struct.array1_real(kind=4).2"*
  %5 = call i8* @polly_mallocManaged(i64 48)
  %parm.20 = bitcast i8* %5 to %"struct.array1_real(kind=4).3"*
  %6 = call i8* @polly_mallocManaged(i64 48)
  %parm.19 = bitcast i8* %6 to %"struct.array1_real(kind=4).4"*
  %7 = call i8* @polly_mallocManaged(i64 480)
  %dt_parm.22 = bitcast i8* %7 to %struct.__st_parameter_dt*
  %8 = call i8* @polly_mallocManaged(i64 480)
  %dt_parm.23 = bitcast i8* %8 to %struct.__st_parameter_dt*
  %9 = call i8* @polly_mallocManaged(i64 48)
  %parm.24 = bitcast i8* %9 to %"struct.array1_real(kind=4).5"*
  br label %entry.split

entry.split:                                      ; preds = %entry
  br label %"3"

"3":                                              ; preds = %"3", %entry.split
  %indvars.iv = phi i64 [ %indvars.iv.next, %"3" ], [ 1, %entry.split ]
  %tmp = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %indvars.iv) #2
  %tmp1 = trunc i64 %indvars.iv to i32
  %tmp2 = sitofp i32 %tmp1 to float
  %tmp3 = getelementptr [10 x float], [10 x float]* %arrin, i64 0, i64 %tmp
  store float %tmp2, float* %tmp3, align 4
  %tmp5 = getelementptr [10 x float], [10 x float]* %arridx, i64 0, i64 %tmp
  store float 2.000000e+00, float* %tmp5, align 4
  %tmp7 = getelementptr [10 x float], [10 x float]* %arrout, i64 0, i64 %tmp
  store float -4.200000e+01, float* %tmp7, align 4
  %tmp8 = icmp eq i64 %indvars.iv, 10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %tmp8, label %"5", label %"3"

"5":                                              ; preds = %"3"
  %tmp9 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.18, i64 0, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst, i64 0, i64 0), i8** %tmp9, align 8
  %tmp10 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.18, i64 0, i32 0, i32 3
  store i32 487, i32* %tmp10, align 8
  %tmp11 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.18, i64 0, i32 0, i32 0
  store i32 128, i32* %tmp11, align 8
  %tmp12 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.18, i64 0, i32 0, i32 1
  store i32 6, i32* %tmp12, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* nonnull %dt_parm.18) #2
  call void @_gfortran_transfer_character_write(%struct.__st_parameter_dt* nonnull %dt_parm.18, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst1, i64 0, i64 0), i32 11) #2
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* nonnull %dt_parm.18) #2
  %tmp13 = getelementptr inbounds %"struct.array1_real(kind=4).4", %"struct.array1_real(kind=4).4"* %parm.19, i64 0, i32 2
  store i64 281, i64* %tmp13, align 8
  %tmp14 = getelementptr inbounds %"struct.array1_real(kind=4).4", %"struct.array1_real(kind=4).4"* %parm.19, i64 0, i32 3, i64 0, i32 1
  store i64 1, i64* %tmp14, align 8
  %tmp15 = getelementptr inbounds %"struct.array1_real(kind=4).4", %"struct.array1_real(kind=4).4"* %parm.19, i64 0, i32 3, i64 0, i32 2
  store i64 10, i64* %tmp15, align 8
  %tmp16 = getelementptr inbounds %"struct.array1_real(kind=4).4", %"struct.array1_real(kind=4).4"* %parm.19, i64 0, i32 3, i64 0, i32 0
  store i64 1, i64* %tmp16, align 8
  %tmp17 = bitcast %"struct.array1_real(kind=4).4"* %parm.19 to [10 x float]**
  store [10 x float]* %arrin, [10 x float]** %tmp17, align 8
  %tmp18 = getelementptr inbounds %"struct.array1_real(kind=4).4", %"struct.array1_real(kind=4).4"* %parm.19, i64 0, i32 1
  store i64 -1, i64* %tmp18, align 8
  %tmp19 = getelementptr inbounds %"struct.array1_real(kind=4).3", %"struct.array1_real(kind=4).3"* %parm.20, i64 0, i32 2
  store i64 281, i64* %tmp19, align 8
  %tmp20 = getelementptr inbounds %"struct.array1_real(kind=4).3", %"struct.array1_real(kind=4).3"* %parm.20, i64 0, i32 3, i64 0, i32 1
  store i64 1, i64* %tmp20, align 8
  %tmp21 = getelementptr inbounds %"struct.array1_real(kind=4).3", %"struct.array1_real(kind=4).3"* %parm.20, i64 0, i32 3, i64 0, i32 2
  store i64 10, i64* %tmp21, align 8
  %tmp22 = getelementptr inbounds %"struct.array1_real(kind=4).3", %"struct.array1_real(kind=4).3"* %parm.20, i64 0, i32 3, i64 0, i32 0
  store i64 1, i64* %tmp22, align 8
  %tmp23 = bitcast %"struct.array1_real(kind=4).3"* %parm.20 to [10 x float]**
  store [10 x float]* %arridx, [10 x float]** %tmp23, align 8
  %tmp24 = getelementptr inbounds %"struct.array1_real(kind=4).3", %"struct.array1_real(kind=4).3"* %parm.20, i64 0, i32 1
  store i64 -1, i64* %tmp24, align 8
  %tmp25 = getelementptr inbounds %"struct.array1_real(kind=4).2", %"struct.array1_real(kind=4).2"* %parm.21, i64 0, i32 2
  store i64 281, i64* %tmp25, align 8
  %tmp26 = getelementptr inbounds %"struct.array1_real(kind=4).2", %"struct.array1_real(kind=4).2"* %parm.21, i64 0, i32 3, i64 0, i32 1
  store i64 1, i64* %tmp26, align 8
  %tmp27 = getelementptr inbounds %"struct.array1_real(kind=4).2", %"struct.array1_real(kind=4).2"* %parm.21, i64 0, i32 3, i64 0, i32 2
  store i64 10, i64* %tmp27, align 8
  %tmp28 = getelementptr inbounds %"struct.array1_real(kind=4).2", %"struct.array1_real(kind=4).2"* %parm.21, i64 0, i32 3, i64 0, i32 0
  store i64 1, i64* %tmp28, align 8
  %tmp29 = bitcast %"struct.array1_real(kind=4).2"* %parm.21 to [10 x float]**
  store [10 x float]* %arrout, [10 x float]** %tmp29, align 8
  %tmp30 = getelementptr inbounds %"struct.array1_real(kind=4).2", %"struct.array1_real(kind=4).2"* %parm.21, i64 0, i32 1
  store i64 -1, i64* %tmp30, align 8
  %tmp31 = bitcast %"struct.array1_real(kind=4).4"* %parm.19 to %"struct.array1_real(kind=4)"*
  %tmp32 = bitcast %"struct.array1_real(kind=4).3"* %parm.20 to %"struct.array1_real(kind=4).0"*
  %tmp33 = bitcast %"struct.array1_real(kind=4).2"* %parm.21 to %"struct.array1_real(kind=4).1"*
  call void @__m_MOD_f(%"struct.array1_real(kind=4)"* nonnull %tmp31, %"struct.array1_real(kind=4).0"* nonnull %tmp32, %"struct.array1_real(kind=4).1"* nonnull %tmp33, i32* nonnull @0) #2
  %tmp34 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.22, i64 0, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst, i64 0, i64 0), i8** %tmp34, align 8
  %tmp35 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.22, i64 0, i32 0, i32 3
  store i32 489, i32* %tmp35, align 8
  %tmp36 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.22, i64 0, i32 0, i32 0
  store i32 128, i32* %tmp36, align 8
  %tmp37 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.22, i64 0, i32 0, i32 1
  store i32 6, i32* %tmp37, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* nonnull %dt_parm.22) #2
  call void @_gfortran_transfer_character_write(%struct.__st_parameter_dt* nonnull %dt_parm.22, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.cst2, i64 0, i64 0), i32 7) #2
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* nonnull %dt_parm.22) #2
  %tmp38 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.23, i64 0, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst, i64 0, i64 0), i8** %tmp38, align 8
  %tmp39 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.23, i64 0, i32 0, i32 3
  store i32 490, i32* %tmp39, align 8
  %tmp40 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.23, i64 0, i32 0, i32 0
  store i32 128, i32* %tmp40, align 8
  %tmp41 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.23, i64 0, i32 0, i32 1
  store i32 6, i32* %tmp41, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* nonnull %dt_parm.23) #2
  %tmp42 = getelementptr inbounds %"struct.array1_real(kind=4).5", %"struct.array1_real(kind=4).5"* %parm.24, i64 0, i32 2
  store i64 281, i64* %tmp42, align 8
  %tmp43 = getelementptr inbounds %"struct.array1_real(kind=4).5", %"struct.array1_real(kind=4).5"* %parm.24, i64 0, i32 3, i64 0, i32 1
  store i64 1, i64* %tmp43, align 8
  %tmp44 = getelementptr inbounds %"struct.array1_real(kind=4).5", %"struct.array1_real(kind=4).5"* %parm.24, i64 0, i32 3, i64 0, i32 2
  store i64 10, i64* %tmp44, align 8
  %tmp45 = getelementptr inbounds %"struct.array1_real(kind=4).5", %"struct.array1_real(kind=4).5"* %parm.24, i64 0, i32 3, i64 0, i32 0
  store i64 1, i64* %tmp45, align 8
  %tmp46 = bitcast %"struct.array1_real(kind=4).5"* %parm.24 to [10 x float]**
  store [10 x float]* %arrout, [10 x float]** %tmp46, align 8
  %tmp47 = getelementptr inbounds %"struct.array1_real(kind=4).5", %"struct.array1_real(kind=4).5"* %parm.24, i64 0, i32 1
  store i64 -1, i64* %tmp47, align 8
  %tmp48 = bitcast %"struct.array1_real(kind=4).5"* %parm.24 to i8*
  call void @_gfortran_transfer_array_write(%struct.__st_parameter_dt* nonnull %dt_parm.23, i8* nonnull %tmp48, i32 4, i32 0) #2
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* nonnull %dt_parm.23) #2
  call void @polly_freeManaged(i8* %1)
  call void @polly_freeManaged(i8* %2)
  call void @polly_freeManaged(i8* %8)
  call void @polly_freeManaged(i8* %7)
  call void @polly_freeManaged(i8* %9)
  call void @polly_freeManaged(i8* %0)
  call void @polly_freeManaged(i8* %3)
  call void @polly_freeManaged(i8* %4)
  call void @polly_freeManaged(i8* %5)
  call void @polly_freeManaged(i8* %6)
  ret void
}

declare void @_gfortran_st_write(%struct.__st_parameter_dt*)

declare void @_gfortran_transfer_character_write(%struct.__st_parameter_dt*, i8*, i32)

declare void @_gfortran_st_write_done(%struct.__st_parameter_dt*)

declare void @_gfortran_transfer_array_write(%struct.__st_parameter_dt*, i8*, i32, i32)

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  tail call void @_gfortran_set_args(i32 %argc, i8** %argv) #2
  tail call void @_gfortran_set_options(i32 8, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @options.25.1640, i64 0, i64 0)) #2
  tail call void @MAIN__() #0
  ret i32 0
}

declare void @_gfortran_set_args(i32, i8**)

declare void @_gfortran_set_options(i32, i32*)

declare i8* @polly_mallocManaged(i64)

declare void @polly_freeManaged(i8*)

attributes #0 = { nounwind uwtable }
attributes #1 = { readnone }
attributes #2 = { nounwind }
