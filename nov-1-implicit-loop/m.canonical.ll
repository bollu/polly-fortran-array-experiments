; ModuleID = 'm.ll'
source_filename = "m.bc"
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

module asm "\09.ident\09\22GCC: (GNU) 4.6.4 LLVM: 3.3.1\22"

%"struct.array2_real(kind=4)" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i64, i64, i64 }
%"struct.array1_real(kind=4)" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%struct.__st_parameter_dt = type { %struct.__st_parameter_common, i64, i64*, i64*, i8*, i8*, i32, i32, i8*, i8*, i32, i32, i8*, [256 x i8], i32*, i64, i8*, i32, i32, i8*, i8*, i32, i32, i8*, i8*, i32, i32, i8*, i8*, i32, [4 x i8] }
%struct.__st_parameter_common = type { i32, i32, i8*, i32, i32, i8*, i32* }

@__m_MOD_arr2 = global %"struct.array2_real(kind=4)" zeroinitializer, align 32
@__m_MOD_arr1 = global %"struct.array1_real(kind=4)" zeroinitializer, align 32
@.cst = private constant [67 x i8] c"Integer overflow when calculating the amount of memory to allocate\00", align 64
@.cst1 = private constant [37 x i8] c"Allocation would exceed memory limit\00", align 64
@.cst2 = private constant [25 x i8] c"At line 24 of file m.f90\00", align 8
@.cst3 = private constant [55 x i8] c"Attempting to allocate already allocated variable '%s'\00", align 64
@.cst4 = private constant [5 x i8] c"arr1\00", align 8
@.cst5 = private constant [25 x i8] c"At line 25 of file m.f90\00", align 8
@.cst6 = private constant [5 x i8] c"arr2\00", align 8
@.cst7 = private constant [6 x i8] c"m.f90\00", align 8
@.cst8 = private constant [5 x i8] c"arr1:", align 8
@.cst9 = private constant [5 x i8] c"arr2:", align 8
@.cst10 = private constant [17 x i8] c"===calling f()===", align 8
@0 = internal constant i32 0
@1 = internal constant i32 0
@options.16.1624 = internal constant [8 x i32] [i32 68, i32 511, i32 0, i32 0, i32 0, i32 1, i32 0, i32 1], align 32

; Function Attrs: nounwind uwtable
define void @__m_MOD_f([0 x float]* noalias %srcarr, i32* noalias %dim1, i32* noalias %dim2) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %0 = load i32, i32* %dim1, align 4
  %1 = sext i32 %0 to i64
  %2 = icmp sgt i64 %1, 0
  %3 = select i1 %2, i64 %1, i64 0
  %4 = load i32, i32* %dim2, align 4
  %5 = add i32 %4, 1
  %6 = sext i32 %5 to i64
  %7 = mul nsw i64 %3, %6
  %not = xor i64 %3, -1
  %8 = load float*, float** bitcast (%"struct.array1_real(kind=4)"* @__m_MOD_arr1 to float**), align 32
  %9 = load i64, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 1), align 8
  %10 = load i64, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 3, i64 0, i32 1), align 8
  %11 = add i64 %7, %not
  %12 = icmp slt i32 %0, 1
  br i1 %12, label %return, label %"4.lr.ph"

"4.lr.ph":                                        ; preds = %entry.split
  br label %"4"

"4":                                              ; preds = %"4.lr.ph", %"4"
  %13 = phi i64 [ 1, %"4.lr.ph" ], [ %23, %"4" ]
  %14 = add i64 %9, -1
  %15 = add i64 %14, %10
  %16 = add i64 %15, %13
  %17 = add nsw i64 %11, %13
  %18 = getelementptr [0 x float], [0 x float]* %srcarr, i64 0, i64 %17
  %19 = bitcast float* %18 to i32*
  %20 = load i32, i32* %19, align 4
  %21 = getelementptr float, float* %8, i64 %16
  %22 = bitcast float* %21 to i32*
  store i32 %20, i32* %22, align 4
  %23 = add nuw nsw i64 %13, 1
  %24 = icmp sgt i64 %23, %1
  br i1 %24, label %"3.return_crit_edge", label %"4"

"3.return_crit_edge":                             ; preds = %"4"
  br label %return

return:                                           ; preds = %"3.return_crit_edge", %entry.split
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @MAIN__() #0 {
entry:
  %dt_parm.10 = alloca %struct.__st_parameter_dt, align 8
  %dt_parm.11 = alloca %struct.__st_parameter_dt, align 8
  %dt_parm.12 = alloca %struct.__st_parameter_dt, align 8
  %dt_parm.13 = alloca %struct.__st_parameter_dt, align 8
  %dt_parm.14 = alloca %struct.__st_parameter_dt, align 8
  %dt_parm.15 = alloca %struct.__st_parameter_dt, align 8
  br label %entry.split

entry.split:                                      ; preds = %entry
  store i64 281, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 2), align 16
  store i64 0, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 3, i64 0, i32 1), align 8
  store i64 3, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 3, i64 0, i32 2), align 8
  store i64 1, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 3, i64 0, i32 0), align 8
  %0 = tail call i64 @llvm.expect.i64(i64 0, i64 0)
  %1 = and i64 %0, 1
  %2 = icmp eq i64 %1, 0
  br i1 %2, label %"4", label %"3"

"3":                                              ; preds = %entry.split
  tail call void bitcast (void (i8*, ...)* @_gfortran_runtime_error to void (i8*)*)(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.cst, i64 0, i64 0)) #3
  unreachable

"4":                                              ; preds = %entry.split
  %3 = load i8*, i8** getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 0), align 32
  %4 = icmp eq i8* %3, null
  br i1 %4, label %"5", label %"8"

"5":                                              ; preds = %"4"
  %5 = tail call noalias i8* @malloc(i64 16) #3
  %6 = icmp eq i8* %5, null
  br i1 %6, label %"6", label %"7"

"6":                                              ; preds = %"5"
  tail call void @_gfortran_os_error(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.cst1, i64 0, i64 0)) #4
  unreachable

"7":                                              ; preds = %"5"
  store i8* %5, i8** getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 0), align 32
  store i64 0, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 1), align 8
  store i64 282, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 2), align 16
  store i64 0, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 3, i64 0, i32 1), align 8
  store i64 3, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 3, i64 0, i32 2), align 8
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 3, i64 0, i32 0), align 8
  store i64 0, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 3, i64 1, i32 1), align 8
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 3, i64 1, i32 2), align 8
  store i64 4, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 3, i64 1, i32 0), align 8
  %7 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 0), align 32
  %8 = icmp eq i8* %7, null
  br i1 %8, label %"11", label %"14"

"8":                                              ; preds = %"4"
  tail call void bitcast (void (i8*, i8*, ...)* @_gfortran_runtime_error_at to void (i8*, i8*, i8*)*)(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.cst2, i64 0, i64 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.cst3, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.cst4, i64 0, i64 0)) #3
  unreachable

"11":                                             ; preds = %"7"
  %9 = tail call noalias i8* @malloc(i64 32) #3
  %10 = icmp eq i8* %9, null
  br i1 %10, label %"12", label %"13"

"12":                                             ; preds = %"11"
  tail call void @_gfortran_os_error(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.cst1, i64 0, i64 0)) #4
  unreachable

"13":                                             ; preds = %"11"
  store i8* %9, i8** getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 0), align 32
  store i64 0, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 1), align 8
  br label %"15"

"14":                                             ; preds = %"7"
  tail call void bitcast (void (i8*, i8*, ...)* @_gfortran_runtime_error_at to void (i8*, i8*, i8*)*)(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.cst5, i64 0, i64 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.cst3, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.cst6, i64 0, i64 0)) #3
  unreachable

"15":                                             ; preds = %"15", %"13"
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %"15" ], [ 0, %"13" ]
  %11 = load float*, float** bitcast (%"struct.array1_real(kind=4)"* @__m_MOD_arr1 to float**), align 32
  %12 = load i64, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 1), align 8
  %13 = tail call i64 @_gfortran_polly_array_index_1(i64 %12, i64 1, i64 %indvars.iv3) #3
  %14 = getelementptr float, float* %11, i64 %13
  store float -4.200000e+01, float* %14, align 4
  %15 = icmp eq i64 %indvars.iv3, 3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  br i1 %15, label %"17", label %"15"

"17":                                             ; preds = %"15"
  br label %"18"

"18":                                             ; preds = %"21", %"17"
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %"21" ], [ 0, %"17" ]
  br label %"19"

"19":                                             ; preds = %"19", %"18"
  %indvars.iv = phi i64 [ %indvars.iv.next, %"19" ], [ 0, %"18" ]
  %16 = load float*, float** bitcast (%"struct.array2_real(kind=4)"* @__m_MOD_arr2 to float**), align 32
  %17 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 3, i64 1, i32 0), align 8
  %18 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 1), align 8
  %19 = tail call i64 @_gfortran_polly_array_index_2(i64 %18, i64 %17, i64 1, i64 %indvars.iv, i64 %indvars.iv1) #3
  %20 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %21 = add nsw i64 %20, -3
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to float
  %24 = getelementptr float, float* %16, i64 %19
  store float %23, float* %24, align 4
  %25 = icmp eq i64 %indvars.iv, 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %25, label %"21", label %"19"

"21":                                             ; preds = %"19"
  %26 = icmp eq i64 %indvars.iv1, 3
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  br i1 %26, label %"23", label %"18"

"23":                                             ; preds = %"21"
  %27 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.10, i64 0, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst7, i64 0, i64 0), i8** %27, align 8
  %28 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.10, i64 0, i32 0, i32 3
  store i32 37, i32* %28, align 8
  %29 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.10, i64 0, i32 0, i32 0
  store i32 128, i32* %29, align 8
  %30 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.10, i64 0, i32 0, i32 1
  store i32 6, i32* %30, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* nonnull %dt_parm.10) #3
  call void @_gfortran_transfer_character_write(%struct.__st_parameter_dt* nonnull %dt_parm.10, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.cst8, i64 0, i64 0), i32 5) #3
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* nonnull %dt_parm.10) #3
  %31 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.11, i64 0, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst7, i64 0, i64 0), i8** %31, align 8
  %32 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.11, i64 0, i32 0, i32 3
  store i32 38, i32* %32, align 8
  %33 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.11, i64 0, i32 0, i32 0
  store i32 128, i32* %33, align 8
  %34 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.11, i64 0, i32 0, i32 1
  store i32 6, i32* %34, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* nonnull %dt_parm.11) #3
  call void @_gfortran_transfer_array_write(%struct.__st_parameter_dt* nonnull %dt_parm.11, i8* nonnull bitcast (%"struct.array1_real(kind=4)"* @__m_MOD_arr1 to i8*), i32 4, i32 0) #3
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* nonnull %dt_parm.11) #3
  %35 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.12, i64 0, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst7, i64 0, i64 0), i8** %35, align 8
  %36 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.12, i64 0, i32 0, i32 3
  store i32 39, i32* %36, align 8
  %37 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.12, i64 0, i32 0, i32 0
  store i32 128, i32* %37, align 8
  %38 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.12, i64 0, i32 0, i32 1
  store i32 6, i32* %38, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* nonnull %dt_parm.12) #3
  call void @_gfortran_transfer_character_write(%struct.__st_parameter_dt* nonnull %dt_parm.12, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.cst9, i64 0, i64 0), i32 5) #3
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* nonnull %dt_parm.12) #3
  %39 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.13, i64 0, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst7, i64 0, i64 0), i8** %39, align 8
  %40 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.13, i64 0, i32 0, i32 3
  store i32 40, i32* %40, align 8
  %41 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.13, i64 0, i32 0, i32 0
  store i32 128, i32* %41, align 8
  %42 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.13, i64 0, i32 0, i32 1
  store i32 6, i32* %42, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* nonnull %dt_parm.13) #3
  call void @_gfortran_transfer_array_write(%struct.__st_parameter_dt* nonnull %dt_parm.13, i8* nonnull bitcast (%"struct.array2_real(kind=4)"* @__m_MOD_arr2 to i8*), i32 4, i32 0) #3
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* nonnull %dt_parm.13) #3
  %43 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.14, i64 0, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst7, i64 0, i64 0), i8** %43, align 8
  %44 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.14, i64 0, i32 0, i32 3
  store i32 41, i32* %44, align 8
  %45 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.14, i64 0, i32 0, i32 0
  store i32 128, i32* %45, align 8
  %46 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.14, i64 0, i32 0, i32 1
  store i32 6, i32* %46, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* nonnull %dt_parm.14) #3
  call void @_gfortran_transfer_character_write(%struct.__st_parameter_dt* nonnull %dt_parm.14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.cst10, i64 0, i64 0), i32 17) #3
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* nonnull %dt_parm.14) #3
  %47 = load [0 x float]*, [0 x float]** bitcast (%"struct.array2_real(kind=4)"* @__m_MOD_arr2 to [0 x float]**), align 32
  call void @__m_MOD_f([0 x float]* noalias %47, i32* nonnull @0, i32* nonnull @1) #3
  %48 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.15, i64 0, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst7, i64 0, i64 0), i8** %48, align 8
  %49 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.15, i64 0, i32 0, i32 3
  store i32 43, i32* %49, align 8
  %50 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.15, i64 0, i32 0, i32 0
  store i32 128, i32* %50, align 8
  %51 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.15, i64 0, i32 0, i32 1
  store i32 6, i32* %51, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* nonnull %dt_parm.15) #3
  call void @_gfortran_transfer_array_write(%struct.__st_parameter_dt* nonnull %dt_parm.15, i8* nonnull bitcast (%"struct.array1_real(kind=4)"* @__m_MOD_arr1 to i8*), i32 4, i32 0) #3
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* nonnull %dt_parm.15) #3
  ret void
}

; Function Attrs: nounwind readnone
declare i64 @llvm.expect.i64(i64, i64) #1

; Function Attrs: noreturn
declare void @_gfortran_runtime_error(i8*, ...) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: noreturn
declare void @_gfortran_os_error(i8*) #2

; Function Attrs: noreturn
declare void @_gfortran_runtime_error_at(i8*, i8*, ...) #2

declare i64 @_gfortran_polly_array_index_1(i64, i64, i64) #2

declare i64 @_gfortran_polly_array_index_2(i64, i64, i64, i64, i64) #2

declare void @_gfortran_st_write(%struct.__st_parameter_dt*)

declare void @_gfortran_transfer_character_write(%struct.__st_parameter_dt*, i8*, i32)

declare void @_gfortran_st_write_done(%struct.__st_parameter_dt*)

declare void @_gfortran_transfer_array_write(%struct.__st_parameter_dt*, i8*, i32, i32)

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  tail call void @_gfortran_set_args(i32 %argc, i8** %argv) #3
  tail call void @_gfortran_set_options(i32 8, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @options.16.1624, i64 0, i64 0)) #3
  tail call void @MAIN__() #0
  ret i32 0
}

declare void @_gfortran_set_args(i32, i8**)

declare void @_gfortran_set_options(i32, i32*)

attributes #0 = { nounwind uwtable }
attributes #1 = { nounwind readnone }
attributes #2 = { noreturn }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }
attributes #2 = { readnone }
