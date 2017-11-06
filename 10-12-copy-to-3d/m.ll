; ModuleID = 'm.bc'
source_filename = "m.bc"
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

module asm "\09.ident\09\22GCC: (GNU) 4.6.4 LLVM: 3.3.1\22"

%"struct.array2_integer(kind=4)" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i64, i64, i64 }
%"struct.array1_integer(kind=4)" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4)" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).0" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%struct.array_descriptor1 = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }

@__m_MOD_mind_jlat = unnamed_addr global %"struct.array2_integer(kind=4)" zeroinitializer, align 32
@__m_MOD_global_idx_array = unnamed_addr global %"struct.array1_integer(kind=4)" zeroinitializer, align 32
@options.11.1612 = internal constant [8 x i32] [i32 68, i32 511, i32 0, i32 0, i32 0, i32 1, i32 0, i32 1], align 32

; Function Attrs: nounwind uwtable
define void @__m_MOD_fn(%"struct.array1_real(kind=4)"* noalias %in_array, %"struct.array1_real(kind=4).0"* noalias %out_array) unnamed_addr #0 {
entry:
  %in_array_addr = alloca %"struct.array1_real(kind=4)"*, align 8
  %out_array_addr = alloca %"struct.array1_real(kind=4).0"*, align 8
  %i = alloca i32
  %ubound.0 = alloca i64
  %stride.1 = alloca i64
  %offset.2 = alloca i64
  %size.3 = alloca i64
  %in_array.0 = alloca [0 x float]*
  %indirect_idx = alloca i32
  %ubound.4 = alloca i64
  %stride.5 = alloca i64
  %offset.6 = alloca i64
  %size.7 = alloca i64
  %out_array.0 = alloca [0 x float]*
  %D.1599 = alloca i64
  %D.1600 = alloca i64
  %D.1601 = alloca i64
  %D.1603 = alloca i64
  %D.1604 = alloca i64
  %D.1605 = alloca i64
  %D.1602 = alloca i64
  %D.1598 = alloca i64
  %D.1597 = alloca i32
  %inc.8 = alloca i64
  %inc.10 = alloca i64
  %inc.9 = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store %"struct.array1_real(kind=4)"* %in_array, %"struct.array1_real(kind=4)"** %in_array_addr, align 1
  store %"struct.array1_real(kind=4).0"* %out_array, %"struct.array1_real(kind=4).0"** %out_array_addr, align 1
  %0 = load %"struct.array1_real(kind=4).0"*, %"struct.array1_real(kind=4).0"** %out_array_addr, align 8
  %1 = load %"struct.array1_real(kind=4)"*, %"struct.array1_real(kind=4)"** %in_array_addr, align 8
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  %2 = bitcast %"struct.array1_real(kind=4).0"* %0 to %struct.array_descriptor1*
  %3 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %2, i32 0, i32 3
  %4 = bitcast [1 x %struct.descriptor_dimension]* %3 to %struct.descriptor_dimension*
  %5 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %4, i64 0
  %6 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %5, i32 0, i32 0
  %7 = load i64, i64* %6, align 8
  %8 = icmp ne i64 %7, 0
  br i1 %8, label %"3", label %"4"

"3":                                              ; preds = %"2"
  br label %"5"

"4":                                              ; preds = %"2"
  br label %"5"

"5":                                              ; preds = %"4", %"3"
  %9 = phi i64 [ 1, %"4" ], [ %7, %"3" ]
  %10 = bitcast %"struct.array1_real(kind=4).0"* %0 to %struct.array_descriptor1*
  %11 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %10, i32 0, i32 0
  %12 = load i8*, i8** %11, align 8
  %13 = bitcast i8* %12 to [0 x float]*
  %14 = bitcast %"struct.array1_real(kind=4).0"* %0 to %struct.array_descriptor1*
  %15 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %14, i32 0, i32 3
  %16 = bitcast [1 x %struct.descriptor_dimension]* %15 to %struct.descriptor_dimension*
  %17 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %16, i64 0
  %18 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %17, i32 0, i32 2
  %19 = load i64, i64* %18, align 8
  %20 = bitcast %"struct.array1_real(kind=4).0"* %0 to %struct.array_descriptor1*
  %21 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %20, i32 0, i32 3
  %22 = bitcast [1 x %struct.descriptor_dimension]* %21 to %struct.descriptor_dimension*
  %23 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %22, i64 0
  %24 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %23, i32 0, i32 1
  %25 = load i64, i64* %24, align 8
  %26 = sub i64 %19, %25
  %27 = add i64 %26, 1
  %28 = mul i64 %9, %27
  %29 = sub i64 0, %9
  %30 = add i64 %28, -1
  %31 = mul i64 %28, 32
  %32 = mul i64 %28, 4
  %33 = bitcast %"struct.array1_real(kind=4)"* %1 to %struct.array_descriptor1*
  %34 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %33, i32 0, i32 3
  %35 = bitcast [1 x %struct.descriptor_dimension]* %34 to %struct.descriptor_dimension*
  %36 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %35, i64 0
  %37 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %36, i32 0, i32 0
  %38 = load i64, i64* %37, align 8
  %39 = icmp ne i64 %38, 0
  br i1 %39, label %"6", label %"7"

"6":                                              ; preds = %"5"
  br label %"8"

"7":                                              ; preds = %"5"
  br label %"8"

"8":                                              ; preds = %"7", %"6"
  %40 = phi i64 [ 1, %"7" ], [ %38, %"6" ]
  %41 = bitcast %"struct.array1_real(kind=4)"* %1 to %struct.array_descriptor1*
  %42 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %41, i32 0, i32 0
  %43 = load i8*, i8** %42, align 8
  %44 = bitcast i8* %43 to [0 x float]*
  %45 = bitcast %"struct.array1_real(kind=4)"* %1 to %struct.array_descriptor1*
  %46 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %45, i32 0, i32 3
  %47 = bitcast [1 x %struct.descriptor_dimension]* %46 to %struct.descriptor_dimension*
  %48 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %47, i64 0
  %49 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %48, i32 0, i32 2
  %50 = load i64, i64* %49, align 8
  %51 = bitcast %"struct.array1_real(kind=4)"* %1 to %struct.array_descriptor1*
  %52 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %51, i32 0, i32 3
  %53 = bitcast [1 x %struct.descriptor_dimension]* %52 to %struct.descriptor_dimension*
  %54 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %53, i64 0
  %55 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %54, i32 0, i32 1
  %56 = load i64, i64* %55, align 8
  %57 = sub i64 %50, %56
  %58 = add i64 %57, 1
  %59 = mul i64 %40, %58
  %60 = sub i64 0, %40
  %61 = add i64 %59, -1
  %62 = mul i64 %59, 32
  %63 = mul i64 %59, 4
  br i1 true, label %"9", label %"11"

"9":                                              ; preds = %"10", %"8"
  %64 = phi i32 [ %83, %"10" ], [ 1, %"8" ]
  %65 = load i8*, i8** getelementptr inbounds (%"struct.array1_integer(kind=4)", %"struct.array1_integer(kind=4)"* @__m_MOD_global_idx_array, i64 0, i32 0), align 16
  %66 = sext i32 %64 to i64
  %67 = load i64, i64* getelementptr inbounds (%"struct.array1_integer(kind=4)", %"struct.array1_integer(kind=4)"* @__m_MOD_global_idx_array, i64 0, i32 1), align 8
  %68 = call i64 @_gfortran_polly_array_index_1(i64 %67, i64 1, i64 %66) #1
  %69 = bitcast i8* %65 to [0 x i32]*
  %70 = bitcast [0 x i32]* %69 to i32*
  %71 = getelementptr i32, i32* %70, i64 %68
  %72 = load i32, i32* %71, align 4
  %73 = sext i32 %64 to i64
  %74 = call i64 @_gfortran_polly_array_index_1(i64 %29, i64 %9, i64 %73) #1
  %75 = sext i32 %72 to i64
  %76 = call i64 @_gfortran_polly_array_index_1(i64 %60, i64 %40, i64 %75) #1
  %77 = bitcast [0 x float]* %44 to float*
  %78 = getelementptr float, float* %77, i64 %76
  %79 = load float, float* %78, align 4
  %80 = bitcast [0 x float]* %13 to float*
  %81 = getelementptr float, float* %80, i64 %74
  store float %79, float* %81, align 4
  %82 = icmp eq i32 %64, 100
  %83 = add i32 %64, 1
  %84 = icmp ne i1 %82, false
  br i1 %84, label %"11", label %"10"

"10":                                             ; preds = %"9"
  br label %"9"

"11":                                             ; preds = %"9", %"8"
  br label %return

return:                                           ; preds = %"11"
  ret void
}

declare i64 @_gfortran_polly_array_index_1(i64, i64, i64)

; Function Attrs: nounwind uwtable
define internal void @MAIN__() #0 {
entry:
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  br label %return

return:                                           ; preds = %"2"
  ret void
}

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
  call void @_gfortran_set_options(i32 8, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @options.11.1612, i64 0, i64 0)) #1
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
