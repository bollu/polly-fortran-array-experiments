; ModuleID = 'm.bc'
source_filename = "m.bc"
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

module asm "\09.ident\09\22GCC: (GNU) 4.6.4 LLVM: 3.3.1\22"

%"struct.array2_integer(kind=4)" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i64, i64, i64 }
%"struct.array2_integer(kind=4).0" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4)" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4)" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%struct.array_descriptor1 = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%struct.array_descriptor2 = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }

@__m_MOD_mind_jlat = unnamed_addr global %"struct.array2_integer(kind=4)" zeroinitializer, align 32
@__m_MOD_mind_ilon = unnamed_addr global %"struct.array2_integer(kind=4).0" zeroinitializer, align 32
@options.14.1619 = internal constant [8 x i32] [i32 68, i32 511, i32 0, i32 0, i32 0, i32 1, i32 0, i32 1], align 32

; Function Attrs: nounwind uwtable
define void @__m_MOD_f(%"struct.array2_real(kind=4)"* noalias %fld, %"struct.array1_real(kind=4)"* noalias %fld_b, i32* noalias %ipend, i32* noalias %ib) unnamed_addr #0 {
entry:
  %fld_addr = alloca %"struct.array2_real(kind=4)"*, align 8
  %fld_b_addr = alloca %"struct.array1_real(kind=4)"*, align 8
  %ipend_addr = alloca i32*, align 8
  %ib_addr = alloca i32*, align 8
  %ubound.0 = alloca i64
  %stride.1 = alloca i64
  %ubound.2 = alloca i64
  %stride.3 = alloca i64
  %offset.4 = alloca i64
  %size.5 = alloca i64
  %fld.0 = alloca [0 x float]*
  %ubound.6 = alloca i64
  %stride.7 = alloca i64
  %offset.8 = alloca i64
  %size.9 = alloca i64
  %fld_b.0 = alloca [0 x float]*
  %i = alloca i32
  %ip = alloca i32
  %j = alloca i32
  %D.1606 = alloca i64
  %D.1607 = alloca i64
  %D.1608 = alloca i64
  %D.1610 = alloca i64
  %D.1611 = alloca i64
  %D.1612 = alloca i64
  %D.1609 = alloca i64
  %D.1605 = alloca i64
  %D.1597 = alloca i32
  %D.1604 = alloca i32
  %inc.10 = alloca i64
  %inc.11 = alloca i64
  %inc.13 = alloca i64
  %inc.12 = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store %"struct.array2_real(kind=4)"* %fld, %"struct.array2_real(kind=4)"** %fld_addr, align 1
  store %"struct.array1_real(kind=4)"* %fld_b, %"struct.array1_real(kind=4)"** %fld_b_addr, align 1
  store i32* %ipend, i32** %ipend_addr, align 1
  store i32* %ib, i32** %ib_addr, align 1
  %0 = load %"struct.array1_real(kind=4)"*, %"struct.array1_real(kind=4)"** %fld_b_addr, align 8
  %1 = load %"struct.array2_real(kind=4)"*, %"struct.array2_real(kind=4)"** %fld_addr, align 8
  %2 = load i32*, i32** %ipend_addr, align 8
  %3 = load i32*, i32** %ib_addr, align 8
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  %4 = bitcast %"struct.array1_real(kind=4)"* %0 to %struct.array_descriptor1*
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
  %12 = bitcast %"struct.array1_real(kind=4)"* %0 to %struct.array_descriptor1*
  %13 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %12, i32 0, i32 0
  %14 = load i8*, i8** %13, align 8
  %15 = bitcast i8* %14 to [0 x float]*
  %16 = bitcast %"struct.array1_real(kind=4)"* %0 to %struct.array_descriptor1*
  %17 = getelementptr inbounds %struct.array_descriptor1, %struct.array_descriptor1* %16, i32 0, i32 3
  %18 = bitcast [1 x %struct.descriptor_dimension]* %17 to %struct.descriptor_dimension*
  %19 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %18, i64 0
  %20 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %19, i32 0, i32 2
  %21 = load i64, i64* %20, align 8
  %22 = bitcast %"struct.array1_real(kind=4)"* %0 to %struct.array_descriptor1*
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
  %35 = bitcast %"struct.array2_real(kind=4)"* %1 to %struct.array_descriptor2*
  %36 = getelementptr inbounds %struct.array_descriptor2, %struct.array_descriptor2* %35, i32 0, i32 3
  %37 = bitcast [2 x %struct.descriptor_dimension]* %36 to %struct.descriptor_dimension*
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
  %43 = bitcast %"struct.array2_real(kind=4)"* %1 to %struct.array_descriptor2*
  %44 = getelementptr inbounds %struct.array_descriptor2, %struct.array_descriptor2* %43, i32 0, i32 0
  %45 = load i8*, i8** %44, align 8
  %46 = bitcast i8* %45 to [0 x float]*
  %47 = bitcast %"struct.array2_real(kind=4)"* %1 to %struct.array_descriptor2*
  %48 = getelementptr inbounds %struct.array_descriptor2, %struct.array_descriptor2* %47, i32 0, i32 3
  %49 = bitcast [2 x %struct.descriptor_dimension]* %48 to %struct.descriptor_dimension*
  %50 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %49, i64 0
  %51 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %50, i32 0, i32 2
  %52 = load i64, i64* %51, align 8
  %53 = bitcast %"struct.array2_real(kind=4)"* %1 to %struct.array_descriptor2*
  %54 = getelementptr inbounds %struct.array_descriptor2, %struct.array_descriptor2* %53, i32 0, i32 3
  %55 = bitcast [2 x %struct.descriptor_dimension]* %54 to %struct.descriptor_dimension*
  %56 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %55, i64 0
  %57 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %56, i32 0, i32 1
  %58 = load i64, i64* %57, align 8
  %59 = sub i64 %52, %58
  %60 = add i64 %59, 1
  %61 = bitcast %"struct.array2_real(kind=4)"* %1 to %struct.array_descriptor2*
  %62 = getelementptr inbounds %struct.array_descriptor2, %struct.array_descriptor2* %61, i32 0, i32 3
  %63 = bitcast [2 x %struct.descriptor_dimension]* %62 to %struct.descriptor_dimension*
  %64 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %63, i64 1
  %65 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %64, i32 0, i32 0
  %66 = load i64, i64* %65, align 8
  %67 = bitcast %"struct.array2_real(kind=4)"* %1 to %struct.array_descriptor2*
  %68 = getelementptr inbounds %struct.array_descriptor2, %struct.array_descriptor2* %67, i32 0, i32 3
  %69 = bitcast [2 x %struct.descriptor_dimension]* %68 to %struct.descriptor_dimension*
  %70 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %69, i64 1
  %71 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %70, i32 0, i32 2
  %72 = load i64, i64* %71, align 8
  %73 = bitcast %"struct.array2_real(kind=4)"* %1 to %struct.array_descriptor2*
  %74 = getelementptr inbounds %struct.array_descriptor2, %struct.array_descriptor2* %73, i32 0, i32 3
  %75 = bitcast [2 x %struct.descriptor_dimension]* %74 to %struct.descriptor_dimension*
  %76 = getelementptr %struct.descriptor_dimension, %struct.descriptor_dimension* %75, i64 1
  %77 = getelementptr inbounds %struct.descriptor_dimension, %struct.descriptor_dimension* %76, i32 0, i32 1
  %78 = load i64, i64* %77, align 8
  %79 = sub i64 %72, %78
  %80 = add i64 %79, 1
  %81 = mul i64 %66, %80
  %82 = sub i64 0, %42
  %83 = sub i64 %82, %66
  %84 = add i64 %81, -1
  %85 = mul i64 %81, 32
  %86 = mul i64 %81, 4
  %87 = load i32, i32* %2, align 4
  %88 = icmp sle i32 1, %87
  br i1 %88, label %"9", label %"11"

"9":                                              ; preds = %"10", %"8"
  %89 = phi i32 [ %123, %"10" ], [ 1, %"8" ]
  %90 = load i8*, i8** getelementptr inbounds (%"struct.array2_integer(kind=4).0", %"struct.array2_integer(kind=4).0"* @__m_MOD_mind_ilon, i64 0, i32 0), align 16
  %91 = sext i32 %89 to i64
  %92 = load i32, i32* %3, align 4
  %93 = sext i32 %92 to i64
  %94 = load i64, i64* getelementptr inbounds (%"struct.array2_integer(kind=4).0", %"struct.array2_integer(kind=4).0"* @__m_MOD_mind_ilon, i64 0, i32 3, i64 1, i32 0), align 8
  %95 = load i64, i64* getelementptr inbounds (%"struct.array2_integer(kind=4).0", %"struct.array2_integer(kind=4).0"* @__m_MOD_mind_ilon, i64 0, i32 1), align 8
  %96 = call i64 @_gfortran_polly_array_index_2(i64 %95, i64 %94, i64 1, i64 %93, i64 %91) #1
  %97 = bitcast i8* %90 to [0 x i32]*
  %98 = bitcast [0 x i32]* %97 to i32*
  %99 = getelementptr i32, i32* %98, i64 %96
  %100 = load i32, i32* %99, align 4
  %101 = load i8*, i8** getelementptr inbounds (%"struct.array2_integer(kind=4)", %"struct.array2_integer(kind=4)"* @__m_MOD_mind_jlat, i64 0, i32 0), align 16
  %102 = sext i32 %89 to i64
  %103 = load i32, i32* %3, align 4
  %104 = sext i32 %103 to i64
  %105 = load i64, i64* getelementptr inbounds (%"struct.array2_integer(kind=4)", %"struct.array2_integer(kind=4)"* @__m_MOD_mind_jlat, i64 0, i32 3, i64 1, i32 0), align 8
  %106 = load i64, i64* getelementptr inbounds (%"struct.array2_integer(kind=4)", %"struct.array2_integer(kind=4)"* @__m_MOD_mind_jlat, i64 0, i32 1), align 8
  %107 = call i64 @_gfortran_polly_array_index_2(i64 %106, i64 %105, i64 1, i64 %104, i64 %102) #1
  %108 = bitcast i8* %101 to [0 x i32]*
  %109 = bitcast [0 x i32]* %108 to i32*
  %110 = getelementptr i32, i32* %109, i64 %107
  %111 = load i32, i32* %110, align 4
  %112 = sext i32 %89 to i64
  %113 = call i64 @_gfortran_polly_array_index_1(i64 %31, i64 %11, i64 %112) #1
  %114 = sext i32 %100 to i64
  %115 = sext i32 %111 to i64
  %116 = call i64 @_gfortran_polly_array_index_2(i64 %83, i64 %66, i64 %42, i64 %115, i64 %114) #1
  %117 = bitcast [0 x float]* %46 to float*
  %118 = getelementptr float, float* %117, i64 %116
  %119 = load float, float* %118, align 4
  %120 = bitcast [0 x float]* %15 to float*
  %121 = getelementptr float, float* %120, i64 %113
  store float %119, float* %121, align 4
  %122 = icmp eq i32 %89, %87
  %123 = add i32 %89, 1
  %124 = icmp ne i1 %122, false
  br i1 %124, label %"11", label %"10"

"10":                                             ; preds = %"9"
  br label %"9"

"11":                                             ; preds = %"9", %"8"
  br label %return

return:                                           ; preds = %"11"
  ret void
}

declare i64 @_gfortran_polly_array_index_2(i64, i64, i64, i64, i64)

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
  call void @_gfortran_set_options(i32 8, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @options.14.1619, i64 0, i64 0)) #1
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
