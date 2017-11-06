; ModuleID = 'm.bc'
source_filename = "m.bc"
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

module asm "\09.ident\09\22GCC: (GNU) 4.6.4 LLVM: 3.3.1\22"

%"struct.array1_real(kind=4)" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i64, i64, i64 }
%"struct.array1_real(kind=4).0" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).1" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%struct.array_descriptor1 = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%struct.__st_parameter_dt = type { %struct.__st_parameter_common, i64, i64*, i64*, i8*, i8*, i32, i32, i8*, i8*, i32, i32, i8*, [256 x i8], i32*, i64, i8*, i32, i32, i8*, i8*, i32, i32, i8*, i8*, i32, i32, i8*, i8*, i32, [4 x i8] }
%struct.__st_parameter_common = type { i32, i32, i8*, i32, i32, i8*, i32* }
%"struct.array1_real(kind=4).2" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).3" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).4" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).5" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%struct.array_descriptor1.6 = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }

@.cst = private constant [6 x i8] c"m.f90\00", align 8
@.cst1 = private constant [11 x i8] c"calling f()", align 8
@0 = internal constant i32 10
@.cst2 = private constant [7 x i8] c"arrout:", align 8
@options.25.1640 = internal constant [8 x i32] [i32 68, i32 511, i32 0, i32 0, i32 0, i32 1, i32 0, i32 1], align 32

; Function Attrs: nounwind uwtable
define void @__m_MOD_f(%"struct.array1_real(kind=4)"* noalias %arrin, %"struct.array1_real(kind=4).0"* noalias %arridx, %"struct.array1_real(kind=4).1"* noalias %arrout, i32* noalias %n) #0 {
entry:
  %arrin_addr = alloca %"struct.array1_real(kind=4)"*, align 8
  %arridx_addr = alloca %"struct.array1_real(kind=4).0"*, align 8
  %arrout_addr = alloca %"struct.array1_real(kind=4).1"*, align 8
  %n_addr = alloca i32*, align 8
  %ubound.0 = alloca i64
  %stride.1 = alloca i64
  %offset.2 = alloca i64
  %size.3 = alloca i64
  %arridx.0 = alloca [0 x float]*
  %ubound.4 = alloca i64
  %stride.5 = alloca i64
  %offset.6 = alloca i64
  %size.7 = alloca i64
  %arrin.0 = alloca [0 x float]*
  %ubound.8 = alloca i64
  %stride.9 = alloca i64
  %offset.10 = alloca i64
  %size.11 = alloca i64
  %arrout.0 = alloca [0 x float]*
  %i = alloca i32
  %idx = alloca i32
  %D.1594 = alloca i64
  %D.1595 = alloca i64
  %D.1596 = alloca i64
  %D.1598 = alloca i64
  %D.1599 = alloca i64
  %D.1600 = alloca i64
  %D.1602 = alloca i64
  %D.1603 = alloca i64
  %D.1604 = alloca i64
  %D.1601 = alloca i64
  %D.1597 = alloca i64
  %D.1593 = alloca i64
  %D.1586 = alloca i32
  %D.1592 = alloca i32
  %inc.12 = alloca i64
  %inc.14 = alloca i64
  %inc.13 = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store %"struct.array1_real(kind=4)"* %arrin, %"struct.array1_real(kind=4)"** %arrin_addr, align 1
  store %"struct.array1_real(kind=4).0"* %arridx, %"struct.array1_real(kind=4).0"** %arridx_addr, align 1
  store %"struct.array1_real(kind=4).1"* %arrout, %"struct.array1_real(kind=4).1"** %arrout_addr, align 1
  store i32* %n, i32** %n_addr, align 1
  %0 = load %"struct.array1_real(kind=4).0"*, %"struct.array1_real(kind=4).0"** %arridx_addr, align 8
  %1 = load %"struct.array1_real(kind=4).1"*, %"struct.array1_real(kind=4).1"** %arrout_addr, align 8
  %2 = load %"struct.array1_real(kind=4)"*, %"struct.array1_real(kind=4)"** %arrin_addr, align 8
  %3 = load i32*, i32** %n_addr, align 8
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  %4 = bitcast %"struct.array1_real(kind=4).0"* %0 to %struct.array_descriptor1*
  %5 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %4, i32 0, i32 3
  %6 = bitcast [1 x %struct.descriptor_dimension]* %5 to %struct.descriptor_dimension*
  %7 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %6, i64 0
  %8 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %7, i32 0, i32 0
  %9 = load i64, i64* %8, align 8
  %10 = icmp ne i64 %9, 0
  br i1 %10, label %"3", label %"4"

"3":                                              ; preds = %"2"
  br label %"5"

"4":                                              ; preds = %"2"
  br label %"5"

"5":                                              ; preds = %"4", %"3"
  %11 = phi i64 [ 1, %"4" ], [ %9, %"3" ]
  %12 = bitcast %"struct.array1_real(kind=4).0"* %0 to %struct.array_descriptor1*
  %13 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %12, i32 0, i32 0
  %14 = load i8*, i8** %13, align 8
  %15 = bitcast i8* %14 to [0 x float]*
  %16 = bitcast %"struct.array1_real(kind=4).0"* %0 to %struct.array_descriptor1*
  %17 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %16, i32 0, i32 3
  %18 = bitcast [1 x %struct.descriptor_dimension]* %17 to %struct.descriptor_dimension*
  %19 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %18, i64 0
  %20 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %19, i32 0, i32 2
  %21 = load i64, i64* %20, align 8
  %22 = bitcast %"struct.array1_real(kind=4).0"* %0 to %struct.array_descriptor1*
  %23 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %22, i32 0, i32 3
  %24 = bitcast [1 x %struct.descriptor_dimension]* %23 to %struct.descriptor_dimension*
  %25 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %24, i64 0
  %26 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %25, i32 0, i32 1
  %27 = load i64, i64* %26, align 8
  %28 = sub i64 %21, %27
  %29 = add i64 %28, 1
  %30 = mul i64 %11, %29
  %31 = sub i64 0, %11
  %32 = add i64 %30, -1
  %33 = mul i64 %30, 32
  %34 = mul i64 %30, 4
  %35 = bitcast %"struct.array1_real(kind=4).1"* %1 to %struct.array_descriptor1*
  %36 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %35, i32 0, i32 3
  %37 = bitcast [1 x %struct.descriptor_dimension]* %36 to %struct.descriptor_dimension*
  %38 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %37, i64 0
  %39 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %38, i32 0, i32 0
  %40 = load i64, i64* %39, align 8
  %41 = icmp ne i64 %40, 0
  br i1 %41, label %"6", label %"7"

"6":                                              ; preds = %"5"
  br label %"8"

"7":                                              ; preds = %"5"
  br label %"8"

"8":                                              ; preds = %"7", %"6"
  %42 = phi i64 [ 1, %"7" ], [ %40, %"6" ]
  %43 = bitcast %"struct.array1_real(kind=4).1"* %1 to %struct.array_descriptor1*
  %44 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %43, i32 0, i32 0
  %45 = load i8*, i8** %44, align 8
  %46 = bitcast i8* %45 to [0 x float]*
  %47 = bitcast %"struct.array1_real(kind=4).1"* %1 to %struct.array_descriptor1*
  %48 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %47, i32 0, i32 3
  %49 = bitcast [1 x %struct.descriptor_dimension]* %48 to %struct.descriptor_dimension*
  %50 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %49, i64 0
  %51 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %50, i32 0, i32 2
  %52 = load i64, i64* %51, align 8
  %53 = bitcast %"struct.array1_real(kind=4).1"* %1 to %struct.array_descriptor1*
  %54 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %53, i32 0, i32 3
  %55 = bitcast [1 x %struct.descriptor_dimension]* %54 to %struct.descriptor_dimension*
  %56 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %55, i64 0
  %57 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %56, i32 0, i32 1
  %58 = load i64, i64* %57, align 8
  %59 = sub i64 %52, %58
  %60 = add i64 %59, 1
  %61 = mul i64 %42, %60
  %62 = sub i64 0, %42
  %63 = add i64 %61, -1
  %64 = mul i64 %61, 32
  %65 = mul i64 %61, 4
  %66 = bitcast %"struct.array1_real(kind=4)"* %2 to %struct.array_descriptor1*
  %67 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %66, i32 0, i32 3
  %68 = bitcast [1 x %struct.descriptor_dimension]* %67 to %struct.descriptor_dimension*
  %69 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %68, i64 0
  %70 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %69, i32 0, i32 0
  %71 = load i64, i64* %70, align 8
  %72 = icmp ne i64 %71, 0
  br i1 %72, label %"9", label %"10"

"9":                                              ; preds = %"8"
  br label %"11"

"10":                                             ; preds = %"8"
  br label %"11"

"11":                                             ; preds = %"10", %"9"
  %73 = phi i64 [ 1, %"10" ], [ %71, %"9" ]
  %74 = bitcast %"struct.array1_real(kind=4)"* %2 to %struct.array_descriptor1*
  %75 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %74, i32 0, i32 0
  %76 = load i8*, i8** %75, align 8
  %77 = bitcast i8* %76 to [0 x float]*
  %78 = bitcast %"struct.array1_real(kind=4)"* %2 to %struct.array_descriptor1*
  %79 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %78, i32 0, i32 3
  %80 = bitcast [1 x %struct.descriptor_dimension]* %79 to %struct.descriptor_dimension*
  %81 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %80, i64 0
  %82 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %81, i32 0, i32 2
  %83 = load i64, i64* %82, align 8
  %84 = bitcast %"struct.array1_real(kind=4)"* %2 to %struct.array_descriptor1*
  %85 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %84, i32 0, i32 3
  %86 = bitcast [1 x %struct.descriptor_dimension]* %85 to %struct.descriptor_dimension*
  %87 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %86, i64 0
  %88 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %87, i32 0, i32 1
  %89 = load i64, i64* %88, align 8
  %90 = sub i64 %83, %89
  %91 = add i64 %90, 1
  %92 = mul i64 %73, %91
  %93 = sub i64 0, %73
  %94 = add i64 %92, -1
  %95 = mul i64 %92, 32
  %96 = mul i64 %92, 4
  %97 = load i32, i32* %3, align 4
  %98 = icmp sle i32 1, %97
  br i1 %98, label %"12", label %"14"

"12":                                             ; preds = %"13", %"11"
  %99 = phi i32 [ %116, %"13" ], [ 1, %"11" ]
  %100 = sext i32 %99 to i64
  %101 = call i64 @_gfortran_polly_array_index_1(i64 %31, i64 %11, i64 %100) #1
  %102 = bitcast [0 x float]* %15 to float*
  %103 = getelementptr float, float* %102, i64 %101
  %104 = load float, float* %103, align 4
  %105 = fptosi float %104 to i32
  %106 = sext i32 %99 to i64
  %107 = call i64 @_gfortran_polly_array_index_1(i64 %62, i64 %42, i64 %106) #1
  %108 = sext i32 %105 to i64
  %109 = call i64 @_gfortran_polly_array_index_1(i64 %93, i64 %73, i64 %108) #1
  %110 = bitcast [0 x float]* %77 to float*
  %111 = getelementptr float, float* %110, i64 %109
  %112 = load float, float* %111, align 4
  %113 = bitcast [0 x float]* %46 to float*
  %114 = getelementptr float, float* %113, i64 %107
  store float %112, float* %114, align 4
  %115 = icmp eq i32 %99, %97
  %116 = add i32 %99, 1
  %117 = icmp ne i1 %115, false
  br i1 %117, label %"14", label %"13"

"13":                                             ; preds = %"12"
  br label %"12"

"14":                                             ; preds = %"12", %"11"
  br label %return

return:                                           ; preds = %"14"
  ret void
}

declare i64 @_gfortran_polly_array_index_1(i64, i64, i64)

; Function Attrs: nounwind uwtable
define internal void @MAIN__() #0 {
entry:
  %arridx = alloca [10 x float]
  %arrin = alloca [10 x float]
  %arrout = alloca [10 x float]
  %i = alloca i32
  %D.1619 = alloca i32
  %inc.15 = alloca i64
  %inc.16 = alloca i64
  %inc.17 = alloca i64
  %dt_parm.18 = alloca %struct.__st_parameter_dt
  %parm.21 = alloca %"struct.array1_real(kind=4).2"
  %parm.20 = alloca %"struct.array1_real(kind=4).3"
  %parm.19 = alloca %"struct.array1_real(kind=4).4"
  %dt_parm.22 = alloca %struct.__st_parameter_dt
  %dt_parm.23 = alloca %struct.__st_parameter_dt
  %parm.24 = alloca %"struct.array1_real(kind=4).5"
  %"alloca point" = bitcast i32 0 to i32
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  br i1 true, label %"3", label %"5"

"3":                                              ; preds = %"4", %"2"
  %0 = phi i32 [ %15, %"4" ], [ 1, %"2" ]
  %1 = sext i32 %0 to i64
  %2 = call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %1) #1
  %3 = sitofp i32 %0 to float
  %4 = bitcast [10 x float]* %arrin to float*
  %5 = getelementptr float, float* %4, i64 %2
  store float %3, float* %5, align 4
  %6 = sext i32 %0 to i64
  %7 = call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %6) #1
  %8 = bitcast [10 x float]* %arridx to float*
  %9 = getelementptr float, float* %8, i64 %7
  store float 2.000000e+00, float* %9, align 4
  %10 = sext i32 %0 to i64
  %11 = call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %10) #1
  %12 = bitcast [10 x float]* %arrout to float*
  %13 = getelementptr float, float* %12, i64 %11
  store float -4.200000e+01, float* %13, align 4
  %14 = icmp eq i32 %0, 10
  %15 = add i32 %0, 1
  %16 = icmp ne i1 %14, false
  br i1 %16, label %"5", label %"4"

"4":                                              ; preds = %"3"
  br label %"3"

"5":                                              ; preds = %"3", %"2"
  %17 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.18, i32 0, i32 0
  %18 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %17, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst, i64 0, i64 0), i8** %18, align 8
  %19 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.18, i32 0, i32 0
  %20 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %19, i32 0, i32 3
  store i32 487, i32* %20, align 8
  %21 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.18, i32 0, i32 0
  %22 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %21, i32 0, i32 0
  store i32 128, i32* %22, align 8
  %23 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.18, i32 0, i32 0
  %24 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %23, i32 0, i32 1
  store i32 6, i32* %24, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* %dt_parm.18) #1
  call void @_gfortran_transfer_character_write(%struct.__st_parameter_dt* %dt_parm.18, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst1, i64 0, i64 0), i32 11) #1
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* %dt_parm.18) #1
  %25 = bitcast %"struct.array1_real(kind=4).4"* %parm.19 to %struct.array_descriptor1.6*
  %26 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %25, i32 0, i32 2
  store i64 281, i64* %26, align 8
  %27 = bitcast %"struct.array1_real(kind=4).4"* %parm.19 to %struct.array_descriptor1.6*
  %28 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %27, i32 0, i32 3
  %29 = bitcast [1 x %struct.descriptor_dimension]* %28 to %struct.descriptor_dimension*
  %30 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %29, i64 0
  %31 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %30, i32 0, i32 1
  store i64 1, i64* %31, align 8
  %32 = bitcast %"struct.array1_real(kind=4).4"* %parm.19 to %struct.array_descriptor1.6*
  %33 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %32, i32 0, i32 3
  %34 = bitcast [1 x %struct.descriptor_dimension]* %33 to %struct.descriptor_dimension*
  %35 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %34, i64 0
  %36 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %35, i32 0, i32 2
  store i64 10, i64* %36, align 8
  %37 = bitcast %"struct.array1_real(kind=4).4"* %parm.19 to %struct.array_descriptor1.6*
  %38 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %37, i32 0, i32 3
  %39 = bitcast [1 x %struct.descriptor_dimension]* %38 to %struct.descriptor_dimension*
  %40 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %39, i64 0
  %41 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %40, i32 0, i32 0
  store i64 1, i64* %41, align 8
  %42 = bitcast [10 x float]* %arrin to float*
  %43 = getelementptr float, float* %42, i64 0
  %44 = bitcast float* %43 to i8*
  %45 = bitcast %"struct.array1_real(kind=4).4"* %parm.19 to %struct.array_descriptor1.6*
  %46 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %45, i32 0, i32 0
  store i8* %44, i8** %46, align 8
  %47 = bitcast %"struct.array1_real(kind=4).4"* %parm.19 to %struct.array_descriptor1.6*
  %48 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %47, i32 0, i32 1
  store i64 -1, i64* %48, align 8
  %49 = bitcast %"struct.array1_real(kind=4).3"* %parm.20 to %struct.array_descriptor1.6*
  %50 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %49, i32 0, i32 2
  store i64 281, i64* %50, align 8
  %51 = bitcast %"struct.array1_real(kind=4).3"* %parm.20 to %struct.array_descriptor1.6*
  %52 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %51, i32 0, i32 3
  %53 = bitcast [1 x %struct.descriptor_dimension]* %52 to %struct.descriptor_dimension*
  %54 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %53, i64 0
  %55 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %54, i32 0, i32 1
  store i64 1, i64* %55, align 8
  %56 = bitcast %"struct.array1_real(kind=4).3"* %parm.20 to %struct.array_descriptor1.6*
  %57 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %56, i32 0, i32 3
  %58 = bitcast [1 x %struct.descriptor_dimension]* %57 to %struct.descriptor_dimension*
  %59 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %58, i64 0
  %60 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %59, i32 0, i32 2
  store i64 10, i64* %60, align 8
  %61 = bitcast %"struct.array1_real(kind=4).3"* %parm.20 to %struct.array_descriptor1.6*
  %62 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %61, i32 0, i32 3
  %63 = bitcast [1 x %struct.descriptor_dimension]* %62 to %struct.descriptor_dimension*
  %64 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %63, i64 0
  %65 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %64, i32 0, i32 0
  store i64 1, i64* %65, align 8
  %66 = bitcast [10 x float]* %arridx to float*
  %67 = getelementptr float, float* %66, i64 0
  %68 = bitcast float* %67 to i8*
  %69 = bitcast %"struct.array1_real(kind=4).3"* %parm.20 to %struct.array_descriptor1.6*
  %70 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %69, i32 0, i32 0
  store i8* %68, i8** %70, align 8
  %71 = bitcast %"struct.array1_real(kind=4).3"* %parm.20 to %struct.array_descriptor1.6*
  %72 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %71, i32 0, i32 1
  store i64 -1, i64* %72, align 8
  %73 = bitcast %"struct.array1_real(kind=4).2"* %parm.21 to %struct.array_descriptor1.6*
  %74 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %73, i32 0, i32 2
  store i64 281, i64* %74, align 8
  %75 = bitcast %"struct.array1_real(kind=4).2"* %parm.21 to %struct.array_descriptor1.6*
  %76 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %75, i32 0, i32 3
  %77 = bitcast [1 x %struct.descriptor_dimension]* %76 to %struct.descriptor_dimension*
  %78 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %77, i64 0
  %79 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %78, i32 0, i32 1
  store i64 1, i64* %79, align 8
  %80 = bitcast %"struct.array1_real(kind=4).2"* %parm.21 to %struct.array_descriptor1.6*
  %81 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %80, i32 0, i32 3
  %82 = bitcast [1 x %struct.descriptor_dimension]* %81 to %struct.descriptor_dimension*
  %83 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %82, i64 0
  %84 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %83, i32 0, i32 2
  store i64 10, i64* %84, align 8
  %85 = bitcast %"struct.array1_real(kind=4).2"* %parm.21 to %struct.array_descriptor1.6*
  %86 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %85, i32 0, i32 3
  %87 = bitcast [1 x %struct.descriptor_dimension]* %86 to %struct.descriptor_dimension*
  %88 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %87, i64 0
  %89 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %88, i32 0, i32 0
  store i64 1, i64* %89, align 8
  %90 = bitcast [10 x float]* %arrout to float*
  %91 = getelementptr float, float* %90, i64 0
  %92 = bitcast float* %91 to i8*
  %93 = bitcast %"struct.array1_real(kind=4).2"* %parm.21 to %struct.array_descriptor1.6*
  %94 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %93, i32 0, i32 0
  store i8* %92, i8** %94, align 8
  %95 = bitcast %"struct.array1_real(kind=4).2"* %parm.21 to %struct.array_descriptor1.6*
  %96 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %95, i32 0, i32 1
  store i64 -1, i64* %96, align 8
  call void bitcast (void (%"struct.array1_real(kind=4)"*, %"struct.array1_real(kind=4).0"*, %"struct.array1_real(kind=4).1"*, i32*)* @__m_MOD_f to void (%"struct.array1_real(kind=4).4"*, %"struct.array1_real(kind=4).3"*, %"struct.array1_real(kind=4).2"*, i32*)*)(%"struct.array1_real(kind=4).4"* %parm.19, %"struct.array1_real(kind=4).3"* %parm.20, %"struct.array1_real(kind=4).2"* %parm.21, i32* @0) #1
  %97 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.22, i32 0, i32 0
  %98 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %97, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst, i64 0, i64 0), i8** %98, align 8
  %99 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.22, i32 0, i32 0
  %100 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %99, i32 0, i32 3
  store i32 489, i32* %100, align 8
  %101 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.22, i32 0, i32 0
  %102 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %101, i32 0, i32 0
  store i32 128, i32* %102, align 8
  %103 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.22, i32 0, i32 0
  %104 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %103, i32 0, i32 1
  store i32 6, i32* %104, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* %dt_parm.22) #1
  call void @_gfortran_transfer_character_write(%struct.__st_parameter_dt* %dt_parm.22, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.cst2, i64 0, i64 0), i32 7) #1
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* %dt_parm.22) #1
  %105 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.23, i32 0, i32 0
  %106 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %105, i32 0, i32 2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst, i64 0, i64 0), i8** %106, align 8
  %107 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.23, i32 0, i32 0
  %108 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %107, i32 0, i32 3
  store i32 490, i32* %108, align 8
  %109 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.23, i32 0, i32 0
  %110 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %109, i32 0, i32 0
  store i32 128, i32* %110, align 8
  %111 = getelementptr inbounds %struct.__st_parameter_dt, %struct.__st_parameter_dt* %dt_parm.23, i32 0, i32 0
  %112 = getelementptr inbounds %struct.__st_parameter_common, %struct.__st_parameter_common* %111, i32 0, i32 1
  store i32 6, i32* %112, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* %dt_parm.23) #1
  %113 = bitcast %"struct.array1_real(kind=4).5"* %parm.24 to %struct.array_descriptor1.6*
  %114 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %113, i32 0, i32 2
  store i64 281, i64* %114, align 8
  %115 = bitcast %"struct.array1_real(kind=4).5"* %parm.24 to %struct.array_descriptor1.6*
  %116 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %115, i32 0, i32 3
  %117 = bitcast [1 x %struct.descriptor_dimension]* %116 to %struct.descriptor_dimension*
  %118 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %117, i64 0
  %119 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %118, i32 0, i32 1
  store i64 1, i64* %119, align 8
  %120 = bitcast %"struct.array1_real(kind=4).5"* %parm.24 to %struct.array_descriptor1.6*
  %121 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %120, i32 0, i32 3
  %122 = bitcast [1 x %struct.descriptor_dimension]* %121 to %struct.descriptor_dimension*
  %123 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %122, i64 0
  %124 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %123, i32 0, i32 2
  store i64 10, i64* %124, align 8
  %125 = bitcast %"struct.array1_real(kind=4).5"* %parm.24 to %struct.array_descriptor1.6*
  %126 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %125, i32 0, i32 3
  %127 = bitcast [1 x %struct.descriptor_dimension]* %126 to %struct.descriptor_dimension*
  %128 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %127, i64 0
  %129 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %128, i32 0, i32 0
  store i64 1, i64* %129, align 8
  %130 = bitcast [10 x float]* %arrout to float*
  %131 = getelementptr float, float* %130, i64 0
  %132 = bitcast float* %131 to i8*
  %133 = bitcast %"struct.array1_real(kind=4).5"* %parm.24 to %struct.array_descriptor1.6*
  %134 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %133, i32 0, i32 0
  store i8* %132, i8** %134, align 8
  %135 = bitcast %"struct.array1_real(kind=4).5"* %parm.24 to %struct.array_descriptor1.6*
  %136 = getelementptr inbounds %struct.array_descriptor1.6, %struct.array_descriptor1.6* %135, i32 0, i32 1
  store i64 -1, i64* %136, align 8
  call void bitcast (void (%struct.__st_parameter_dt*, i8*, i32, i32)* @_gfortran_transfer_array_write to void (%struct.__st_parameter_dt*, %"struct.array1_real(kind=4).5"*, i32, i32)*)(%struct.__st_parameter_dt* %dt_parm.23, %"struct.array1_real(kind=4).5"* %parm.24, i32 4, i32 0) #1
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* %dt_parm.23) #1
  br label %return

return:                                           ; preds = %"5"
  ret void
}

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
  call void @_gfortran_set_args(i32 %0, i8** %1) #1
  call void @_gfortran_set_options(i32 8, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @options.25.1640, i64 0, i64 0)) #1
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
attributes #1 = { nounwind }
