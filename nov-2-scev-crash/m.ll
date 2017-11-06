; ModuleID = 'm.bc'
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
  %sotr_addr = alloca [0 x float]*, align 8
  %sobs_addr = alloca [0 x float]*, align 8
  %sod_t_addr = alloca [0 x float]*, align 8
  %zsmu0_flux_addr = alloca [0 x float]*, align 8
  %nproma_addr = alloca i32*, align 8
  %ke_addr = alloca i32*, align 8
  %ipend_addr = alloca i32*, align 8
  %ip = alloca i32
  %ubound.0 = alloca i64
  %size.1 = alloca i64
  %ubound.2 = alloca i64
  %ubound.3 = alloca i64
  %stride.4 = alloca i64
  %offset.5 = alloca i64
  %size.6 = alloca i64
  %ubound.7 = alloca i64
  %size.8 = alloca i64
  %D.1602 = alloca i64
  %D.1603 = alloca i64
  %D.1604 = alloca i64
  %D.1605 = alloca i64
  %D.1606 = alloca i64
  %D.1607 = alloca i64
  %D.1608 = alloca i64
  %D.1609 = alloca i64
  %D.1610 = alloca i64
  %D.1594 = alloca i32
  %D.1601 = alloca i32
  %inc.9 = alloca i64
  %inc.11 = alloca i64
  %inc.10 = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store [0 x float]* %sotr, [0 x float]** %sotr_addr, align 1
  store [0 x float]* %sobs, [0 x float]** %sobs_addr, align 1
  store [0 x float]* %sod_t, [0 x float]** %sod_t_addr, align 1
  store [0 x float]* %zsmu0_flux, [0 x float]** %zsmu0_flux_addr, align 1
  store i32* %nproma, i32** %nproma_addr, align 1
  store i32* %ke, i32** %ke_addr, align 1
  store i32* %ipend, i32** %ipend_addr, align 1
  %0 = load i32*, i32** %nproma_addr, align 8
  %1 = load i32*, i32** %ke_addr, align 8
  %2 = load i32*, i32** %ipend_addr, align 8
  %3 = load [0 x float]*, [0 x float]** %zsmu0_flux_addr, align 8
  %4 = load [0 x float]*, [0 x float]** %sotr_addr, align 8
  %5 = load [0 x float]*, [0 x float]** %sobs_addr, align 8
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  %6 = load i32, i32* %0, align 4
  %7 = sext i32 %6 to i64
  %8 = icmp sge i64 %7, 0
  %9 = select i1 %8, i64 %7, i64 0
  %10 = add i64 %9, -1
  %11 = mul i64 %9, 32
  %12 = mul i64 %9, 4
  %13 = load i32, i32* %0, align 4
  %14 = sext i32 %13 to i64
  %15 = icmp sge i64 %14, 0
  %16 = select i1 %15, i64 %14, i64 0
  %17 = add i64 %16, -1
  %18 = mul i64 %16, 32
  %19 = mul i64 %16, 4
  %20 = load i32, i32* %0, align 4
  %21 = sext i32 %20 to i64
  %22 = icmp sge i64 %21, 0
  %23 = select i1 %22, i64 %21, i64 0
  %24 = load i32, i32* %1, align 4
  %25 = add i32 %24, 1
  %26 = sext i32 %25 to i64
  %27 = mul i64 %23, %26
  %28 = icmp sge i64 %27, 0
  %29 = select i1 %28, i64 %27, i64 0
  %30 = add i64 %29, -1
  %31 = mul i64 %29, 32
  %32 = mul i64 %29, 4
  %not = xor i64 %23, -1
  %33 = load i32, i32* %2, align 4
  %34 = icmp sle i32 1, %33
  br i1 %34, label %"3", label %"7"

"3":                                              ; preds = %"6", %"2"
  %35 = phi i32 [ %54, %"6" ], [ 1, %"2" ]
  %36 = sext i32 %35 to i64
  %37 = call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %36) #1
  %38 = bitcast [0 x float]* %3 to float*
  %39 = getelementptr float, float* %38, i64 %37
  %40 = load float, float* %39, align 4
  %41 = fcmp ogt float %40, 1.000000e+01
  %42 = icmp ne i1 %41, false
  br i1 %42, label %"4", label %"5"

"4":                                              ; preds = %"3"
  %43 = sext i32 %35 to i64
  %44 = call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %43) #1
  %45 = load i32, i32* %1, align 4
  %46 = sext i32 %45 to i64
  %47 = call i64 @_gfortran_polly_array_index_2(i64 %not, i64 %23, i64 1, i64 %46, i64 1) #1
  %48 = bitcast [0 x float]* %4 to float*
  %49 = getelementptr float, float* %48, i64 %47
  %50 = load float, float* %49, align 4
  %51 = bitcast [0 x float]* %5 to float*
  %52 = getelementptr float, float* %51, i64 %44
  store float %50, float* %52, align 4
  br label %"5"

"5":                                              ; preds = %"4", %"3"
  %53 = icmp eq i32 %35, %33
  %54 = add i32 %35, 1
  %55 = icmp ne i1 %53, false
  br i1 %55, label %"7", label %"6"

"6":                                              ; preds = %"5"
  br label %"3"

"7":                                              ; preds = %"5", %"2"
  br label %return

return:                                           ; preds = %"7"
  ret void
}

declare i64 @_gfortran_polly_array_index_1(i64, i64, i64)

declare i64 @_gfortran_polly_array_index_2(i64, i64, i64, i64, i64)

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
  call void @_gfortran_set_options(i32 8, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @options.12.1618, i64 0, i64 0)) #1
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
