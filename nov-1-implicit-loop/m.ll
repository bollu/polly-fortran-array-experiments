; ModuleID = 'm.bc'
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
  %srcarr_addr = alloca [0 x float]*, align 8
  %dim1_addr = alloca i32*, align 8
  %dim2_addr = alloca i32*, align 8
  %ubound.0 = alloca i64
  %ubound.1 = alloca i64
  %stride.2 = alloca i64
  %offset.3 = alloca i64
  %size.4 = alloca i64
  %D.1588 = alloca i64
  %D.1589 = alloca i64
  %D.1590 = alloca i64
  %D.1584 = alloca i64
  %D.1583 = alloca i64
  %D.1582 = alloca i64
  %D.1581 = alloca i64
  %D.1580 = alloca i64
  %D.1579 = alloca [0 x float]*
  %D.1578 = alloca i64
  %D.1577 = alloca i64
  %D.1586 = alloca i64
  %S.5 = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store [0 x float]* %srcarr, [0 x float]** %srcarr_addr, align 1
  store i32* %dim1, i32** %dim1_addr, align 1
  store i32* %dim2, i32** %dim2_addr, align 1
  %0 = load i32*, i32** %dim1_addr, align 8
  %1 = load i32*, i32** %dim2_addr, align 8
  %2 = load [0 x float]*, [0 x float]** %srcarr_addr, align 8
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  %3 = load i32, i32* %0, align 4
  %4 = sext i32 %3 to i64
  %5 = icmp sge i64 %4, 0
  %6 = select i1 %5, i64 %4, i64 0
  %7 = load i32, i32* %1, align 4
  %8 = add i32 %7, 1
  %9 = sext i32 %8 to i64
  %10 = mul i64 %6, %9
  %11 = icmp sge i64 %10, 0
  %12 = select i1 %11, i64 %10, i64 0
  %13 = add i64 %12, -1
  %14 = mul i64 %12, 32
  %15 = mul i64 %12, 4
  %not = xor i64 %6, -1
  %16 = load i8*, i8** getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 0), align 16
  %17 = bitcast i8* %16 to [0 x float]*
  %18 = load i64, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 1), align 8
  %19 = load i64, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 3, i64 0, i32 1), align 8
  %20 = load i64, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 3, i64 0, i32 2), align 8
  %21 = load i32, i32* %1, align 4
  %22 = add i32 %21, 1
  %23 = sext i32 %22 to i64
  %24 = add i64 %19, -1
  %25 = mul i64 %23, %6
  %26 = add i64 %25, %not
  br label %"3"

"3":                                              ; preds = %"4", %"2"
  %27 = phi i64 [ %37, %"4" ], [ 1, %"2" ]
  %28 = icmp sgt i64 %27, %4
  br i1 %28, label %"5", label %"4"

"4":                                              ; preds = %"3"
  %29 = add i64 %27, %24
  %30 = add i64 %29, %18
  %31 = add i64 %27, %26
  %32 = bitcast [0 x float]* %2 to float*
  %33 = getelementptr float, float* %32, i64 %31
  %34 = load float, float* %33, align 4
  %35 = bitcast [0 x float]* %17 to float*
  %36 = getelementptr float, float* %35, i64 %30
  store float %34, float* %36, align 4
  %37 = add i64 %27, 1
  br label %"3"

"5":                                              ; preds = %"3"
  br label %return

return:                                           ; preds = %"5"
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @MAIN__() #0 {
entry:
  %i = alloca i32
  %j = alloca i32
  %overflow.7 = alloca i32
  %overflow.6 = alloca i32
  %D.1596 = alloca i8*
  %D.1597 = alloca i8*
  %D.1599 = alloca i8*
  %D.1600 = alloca i8*
  %D.1604 = alloca i32
  %inc.8 = alloca i64
  %D.1611 = alloca i32
  %D.1610 = alloca i32
  %inc.9 = alloca i64
  %dt_parm.10 = alloca %struct.__st_parameter_dt
  %dt_parm.11 = alloca %struct.__st_parameter_dt
  %dt_parm.12 = alloca %struct.__st_parameter_dt
  %dt_parm.13 = alloca %struct.__st_parameter_dt
  %dt_parm.14 = alloca %struct.__st_parameter_dt
  %dt_parm.15 = alloca %struct.__st_parameter_dt
  %"alloca point" = bitcast i32 0 to i32
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  store i64 281, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 2), align 16
  store i64 0, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 3, i64 0, i32 1), align 8
  store i64 3, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 3, i64 0, i32 2), align 8
  store i64 1, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 3, i64 0, i32 0), align 8
  %0 = call i64 @llvm.expect.i64(i64 0, i64 0)
  %1 = trunc i64 %0 to i1
  %2 = icmp ne i1 %1, false
  br i1 %2, label %"3", label %"4"

"3":                                              ; preds = %"2"
  call void bitcast (void (i8*, ...)* @_gfortran_runtime_error to void (i8*)*)(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.cst, i64 0, i64 0)) #3
  unreachable

"4":                                              ; preds = %"2"
  %3 = load i8*, i8** getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 0), align 16
  %4 = icmp eq i8* %3, null
  br i1 %4, label %"5", label %"8"

"5":                                              ; preds = %"4"
  %5 = call noalias i8* @malloc(i64 16) #3
  %6 = icmp eq i8* %5, null
  br i1 %6, label %"6", label %"7"

"6":                                              ; preds = %"5"
  call void @_gfortran_os_error(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.cst1, i64 0, i64 0)) #4
  unreachable

"7":                                              ; preds = %"5"
  store i8* %5, i8** getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 0), align 16
  store i64 0, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 1), align 8
  store i64 282, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 2), align 16
  store i64 0, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 3, i64 0, i32 1), align 8
  store i64 3, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 3, i64 0, i32 2), align 8
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 3, i64 0, i32 0), align 8
  store i64 0, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 3, i64 1, i32 1), align 8
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 3, i64 1, i32 2), align 8
  store i64 4, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 3, i64 1, i32 0), align 8
  %7 = call i64 @llvm.expect.i64(i64 0, i64 0)
  %8 = trunc i64 %7 to i1
  %9 = icmp ne i1 %8, false
  br i1 %9, label %"9", label %"10"

"8":                                              ; preds = %"4"
  call void bitcast (void (i8*, i8*, ...)* @_gfortran_runtime_error_at to void (i8*, i8*, i8*)*)(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.cst2, i64 0, i64 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.cst3, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.cst4, i64 0, i64 0)) #3
  unreachable

"9":                                              ; preds = %"7"
  call void bitcast (void (i8*, ...)* @_gfortran_runtime_error to void (i8*)*)(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.cst, i64 0, i64 0)) #3
  unreachable

"10":                                             ; preds = %"7"
  %10 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 0), align 16
  %11 = icmp eq i8* %10, null
  br i1 %11, label %"11", label %"14"

"11":                                             ; preds = %"10"
  %12 = call noalias i8* @malloc(i64 32) #3
  %13 = icmp eq i8* %12, null
  br i1 %13, label %"12", label %"13"

"12":                                             ; preds = %"11"
  call void @_gfortran_os_error(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.cst1, i64 0, i64 0)) #4
  unreachable

"13":                                             ; preds = %"11"
  store i8* %12, i8** getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 0), align 16
  store i64 0, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 1), align 8
  br i1 true, label %"15", label %"17"

"14":                                             ; preds = %"10"
  call void bitcast (void (i8*, i8*, ...)* @_gfortran_runtime_error_at to void (i8*, i8*, i8*)*)(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.cst5, i64 0, i64 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.cst3, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.cst6, i64 0, i64 0)) #3
  unreachable

"15":                                             ; preds = %"16", %"13"
  %14 = phi i32 [ %23, %"16" ], [ 0, %"13" ]
  %15 = load i8*, i8** getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 0), align 16
  %16 = sext i32 %14 to i64
  %17 = load i64, i64* getelementptr inbounds (%"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i64 0, i32 1), align 8
  %18 = call i64 @_gfortran_polly_array_index_1(i64 %17, i64 1, i64 %16) #3
  %19 = bitcast i8* %15 to [0 x float]*
  %20 = bitcast [0 x float]* %19 to float*
  %21 = getelementptr float, float* %20, i64 %18
  store float -4.200000e+01, float* %21, align 4
  %22 = icmp eq i32 %14, 3
  %23 = add i32 %14, 1
  %24 = icmp ne i1 %22, false
  br i1 %24, label %"17", label %"16"

"16":                                             ; preds = %"15"
  br label %"15"

"17":                                             ; preds = %"15", %"13"
  br i1 true, label %"18", label %"23"

"18":                                             ; preds = %"22", %"17"
  %25 = phi i32 [ %43, %"22" ], [ 0, %"17" ]
  br i1 true, label %"19", label %"21"

"19":                                             ; preds = %"20", %"18"
  %26 = phi i32 [ %40, %"20" ], [ 0, %"18" ]
  %27 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 0), align 16
  %28 = sext i32 %25 to i64
  %29 = sext i32 %26 to i64
  %30 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 3, i64 1, i32 0), align 8
  %31 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 1), align 8
  %32 = call i64 @_gfortran_polly_array_index_2(i64 %31, i64 %30, i64 1, i64 %29, i64 %28) #3
  %33 = mul i32 %25, %26
  %34 = add i32 %33, -3
  %35 = sitofp i32 %34 to float
  %36 = bitcast i8* %27 to [0 x float]*
  %37 = bitcast [0 x float]* %36 to float*
  %38 = getelementptr float, float* %37, i64 %32
  store float %35, float* %38, align 4
  %39 = icmp eq i32 %26, 1
  %40 = add i32 %26, 1
  %41 = icmp ne i1 %39, false
  br i1 %41, label %"21", label %"20"

"20":                                             ; preds = %"19"
  br label %"19"

"21":                                             ; preds = %"19", %"18"
  %42 = icmp eq i32 %25, 3
  %43 = add i32 %25, 1
  %44 = icmp ne i1 %42, false
  br i1 %44, label %"23", label %"22"

"22":                                             ; preds = %"21"
  br label %"18"

"23":                                             ; preds = %"21", %"17"
  %45 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.10, i32 0, i32 0
  %46 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %45, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst7, i64 0, i64 0), i8** %46, align 8
  %47 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.10, i32 0, i32 0
  %48 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %47, i32 0, i32 3
  store i32 37, i32* %48, align 8
  %49 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.10, i32 0, i32 0
  %50 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %49, i32 0, i32 0
  store i32 128, i32* %50, align 8
  %51 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.10, i32 0, i32 0
  %52 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %51, i32 0, i32 1
  store i32 6, i32* %52, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* %dt_parm.10) #3
  call void @_gfortran_transfer_character_write(%struct.__st_parameter_dt* %dt_parm.10, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.cst8, i64 0, i64 0), i32 5) #3
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* %dt_parm.10) #3
  %53 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.11, i32 0, i32 0
  %54 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %53, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst7, i64 0, i64 0), i8** %54, align 8
  %55 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.11, i32 0, i32 0
  %56 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %55, i32 0, i32 3
  store i32 38, i32* %56, align 8
  %57 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.11, i32 0, i32 0
  %58 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %57, i32 0, i32 0
  store i32 128, i32* %58, align 8
  %59 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.11, i32 0, i32 0
  %60 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %59, i32 0, i32 1
  store i32 6, i32* %60, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* %dt_parm.11) #3
  call void bitcast (void (%struct.__st_parameter_dt*, i8*, i32, i32)* @_gfortran_transfer_array_write to void (%struct.__st_parameter_dt*, %"struct.array1_real(kind=4)"*, i32, i32)*)(%struct.__st_parameter_dt* %dt_parm.11, %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i32 4, i32 0) #3
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* %dt_parm.11) #3
  %61 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.12, i32 0, i32 0
  %62 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %61, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst7, i64 0, i64 0), i8** %62, align 8
  %63 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.12, i32 0, i32 0
  %64 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %63, i32 0, i32 3
  store i32 39, i32* %64, align 8
  %65 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.12, i32 0, i32 0
  %66 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %65, i32 0, i32 0
  store i32 128, i32* %66, align 8
  %67 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.12, i32 0, i32 0
  %68 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %67, i32 0, i32 1
  store i32 6, i32* %68, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* %dt_parm.12) #3
  call void @_gfortran_transfer_character_write(%struct.__st_parameter_dt* %dt_parm.12, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.cst9, i64 0, i64 0), i32 5) #3
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* %dt_parm.12) #3
  %69 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.13, i32 0, i32 0
  %70 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %69, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst7, i64 0, i64 0), i8** %70, align 8
  %71 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.13, i32 0, i32 0
  %72 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %71, i32 0, i32 3
  store i32 40, i32* %72, align 8
  %73 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.13, i32 0, i32 0
  %74 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %73, i32 0, i32 0
  store i32 128, i32* %74, align 8
  %75 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.13, i32 0, i32 0
  %76 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %75, i32 0, i32 1
  store i32 6, i32* %76, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* %dt_parm.13) #3
  call void bitcast (void (%struct.__st_parameter_dt*, i8*, i32, i32)* @_gfortran_transfer_array_write to void (%struct.__st_parameter_dt*, %"struct.array2_real(kind=4)"*, i32, i32)*)(%struct.__st_parameter_dt* %dt_parm.13, %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i32 4, i32 0) #3
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* %dt_parm.13) #3
  %77 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.14, i32 0, i32 0
  %78 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %77, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst7, i64 0, i64 0), i8** %78, align 8
  %79 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.14, i32 0, i32 0
  %80 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %79, i32 0, i32 3
  store i32 41, i32* %80, align 8
  %81 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.14, i32 0, i32 0
  %82 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %81, i32 0, i32 0
  store i32 128, i32* %82, align 8
  %83 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.14, i32 0, i32 0
  %84 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %83, i32 0, i32 1
  store i32 6, i32* %84, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* %dt_parm.14) #3
  call void @_gfortran_transfer_character_write(%struct.__st_parameter_dt* %dt_parm.14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.cst10, i64 0, i64 0), i32 17) #3
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* %dt_parm.14) #3
  %85 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=4)", %"struct.array2_real(kind=4)"* @__m_MOD_arr2, i64 0, i32 0), align 16
  call void bitcast (void ([0 x float]*, i32*, i32*)* @__m_MOD_f to void (i8*, i32*, i32*)*)(i8* noalias %85, i32* @0, i32* @1) #3
  %86 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.15, i32 0, i32 0
  %87 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %86, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst7, i64 0, i64 0), i8** %87, align 8
  %88 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.15, i32 0, i32 0
  %89 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %88, i32 0, i32 3
  store i32 43, i32* %89, align 8
  %90 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.15, i32 0, i32 0
  %91 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %90, i32 0, i32 0
  store i32 128, i32* %91, align 8
  %92 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.15, i32 0, i32 0
  %93 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %92, i32 0, i32 1
  store i32 6, i32* %93, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* %dt_parm.15) #3
  call void bitcast (void (%struct.__st_parameter_dt*, i8*, i32, i32)* @_gfortran_transfer_array_write to void (%struct.__st_parameter_dt*, %"struct.array1_real(kind=4)"*, i32, i32)*)(%struct.__st_parameter_dt* %dt_parm.15, %"struct.array1_real(kind=4)"* @__m_MOD_arr1, i32 4, i32 0) #3
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* %dt_parm.15) #3
  br label %return

return:                                           ; preds = %"23"
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

declare i64 @_gfortran_polly_array_index_1(i64, i64, i64)

declare i64 @_gfortran_polly_array_index_2(i64, i64, i64, i64, i64)

declare void @_gfortran_st_write(%struct.__st_parameter_dt*)

declare void @_gfortran_transfer_character_write(%struct.__st_parameter_dt*, i8*, i32)

declare void @_gfortran_st_write_done(%struct.__st_parameter_dt*)

declare void @_gfortran_transfer_array_write(%struct.__st_parameter_dt*, i8*, i32, i32)

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) unnamed_addr #0 {
entry:
  %argc_addr = alloca i32, align 4
  %argv_addr = alloca i8**, align 8
  %"<retval>" = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %argc, i32* %argc_addr, align 1
  store i8** %argv, i8*** %argv_addr, align 1
  %0 = load i32, i32* %argc_addr, align 4
  %1 = load i8**, i8*** %argv_addr, align 8
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  call void @_gfortran_set_args(i32 %0, i8** %1) #3
  call void @_gfortran_set_options(i32 8, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @options.16.1624, i64 0, i64 0)) #3
  call void @MAIN__() #0
  store i32 0, i32* %"<retval>", align 1
  br label %return

return:                                           ; preds = %"2"
  %2 = load i32, i32* %"<retval>", align 4
  ret i32 %2
}

declare void @_gfortran_set_args(i32, i8**)

declare void @_gfortran_set_options(i32, i32*)

attributes #0 = { nounwind uwtable }
attributes #1 = { nounwind readnone }
attributes #2 = { noreturn }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }
