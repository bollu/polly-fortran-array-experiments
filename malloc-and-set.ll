; ModuleID = 'src_soil.o.bc'
; 1. MALLOC, 2. BICAST, [3. GEP], 4. STORE

source_filename = "src_soil.o.bc"
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

module asm "\09.ident\09\22GCC: (GNU) 4.6.4 LLVM: 3.3.1\22"

%"struct.array1_real(kind=8)" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i64, i64, i64 }

@__src_soil_MOD_xdzs = unnamed_addr global %"struct.array1_real(kind=8)" zeroinitializer, align 32
@.cst1 = private unnamed_addr constant [37 x i8] c"Allocation would exceed memory limit\00", align 64
@.cst2 = private unnamed_addr constant [94 x i8] c"At line 128 of file /home/siddhart/cosmo-self-installation/cosmo-pompa/cosmo/src/src_soil.f90\00", align 64
@.cst3 = private unnamed_addr constant [55 x i8] c"Attempting to allocate already allocated variable '%s'\00", align 64
@.cst4 = private unnamed_addr constant [5 x i8] c"xdzs\00", align 8

; Function Attrs: nounwind uwtable
define void @__src_soil_MOD_terra1() unnamed_addr #0 {
entry:
  store i64 537, i64* getelementptr inbounds (%"struct.array1_real(kind=8)", %"struct.array1_real(kind=8)"* @__src_soil_MOD_xdzs, i64 0, i32 2), align 16, !tbaa !0
  store i64 1, i64* getelementptr inbounds (%"struct.array1_real(kind=8)", %"struct.array1_real(kind=8)"* @__src_soil_MOD_xdzs, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !0
  store i64 5, i64* getelementptr inbounds (%"struct.array1_real(kind=8)", %"struct.array1_real(kind=8)"* @__src_soil_MOD_xdzs, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !0
  store i64 1, i64* getelementptr inbounds (%"struct.array1_real(kind=8)", %"struct.array1_real(kind=8)"* @__src_soil_MOD_xdzs, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !0
  %0 = load i8*, i8** getelementptr inbounds (%"struct.array1_real(kind=8)", %"struct.array1_real(kind=8)"* @__src_soil_MOD_xdzs, i64 0, i32 0), align 32, !tbaa !3
  %1 = icmp eq i8* %0, null
  br i1 %1, label %"5", label %"8"

"5":                                              ; preds = %entry
  %2 = tail call noalias i8* @malloc(i64 40) #1 ;<= A.1, B.1 malloc,
  %3 = icmp eq i8* %2, null
  br i1 %3, label %"6", label %"7"

"6":                                              ; preds = %"5"
  tail call void @_gfortran_os_error(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.cst1, i64 0, i64 0)) #3
  unreachable

"7":                                              ; preds = %"5"
  store i8* %2, i8** getelementptr inbounds (%"struct.array1_real(kind=8)", %"struct.array1_real(kind=8)"* @__src_soil_MOD_xdzs, i64 0, i32 0), align 32, !tbaa !3
  store i64 -1, i64* getelementptr inbounds (%"struct.array1_real(kind=8)", %"struct.array1_real(kind=8)"* @__src_soil_MOD_xdzs, i64 0, i32 1), align 8, !tbaa !0
  %4 = bitcast i8* %2 to double* ;<= A.2, B.2 bitcast
  store double 1.000000e+00, double* %4, align 8, !tbaa !5 ;<= A.4 store
  %5 = getelementptr inbounds i8, i8* %2, i64 8 ;<= 2.B GEP
  %6 = bitcast i8* %5 to double* ;<= B.3 bitcast
  store double 4.000000e+00, double* %6, align 8, !tbaa !5 ;<= B.4 store
  %7 = getelementptr inbounds i8, i8* %2, i64 16
  %8 = bitcast i8* %7 to double*
  store double 9.000000e+00, double* %8, align 8, !tbaa !5
  %9 = getelementptr inbounds i8, i8* %2, i64 24
  %10 = bitcast i8* %9 to double*
  store double 1.600000e+01, double* %10, align 8, !tbaa !5
  %11 = getelementptr inbounds i8, i8* %2, i64 32
  %12 = bitcast i8* %11 to double*
  store double 2.500000e+01, double* %12, align 8, !tbaa !5
  ret void

"8":                                              ; preds = %entry
  tail call void bitcast (void (i8*, i8*, ...)* @_gfortran_runtime_error_at to void (i8*, i8*, i8*)*)(i8* getelementptr inbounds ([94 x i8], [94 x i8]* @.cst2, i64 0, i64 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.cst3, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.cst4, i64 0, i64 0)) #1
  unreachable
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noreturn
declare void @_gfortran_os_error(i8*) #2

; Function Attrs: noreturn
declare void @_gfortran_runtime_error_at(i8*, i8*, ...) #2

attributes #0 = { nounwind uwtable }
attributes #1 = { nounwind }
attributes #2 = { noreturn }
attributes #3 = { noreturn nounwind }

!0 = !{!1, !1, i64 0}
!1 = !{!"alias set 4: integer(kind=8)", !2}
!2 = distinct !{!2}
!3 = !{!4, !4, i64 0}
!4 = !{!"alias set 3: void*", !2}
!5 = !{!6, !6, i64 0}
!6 = !{!"alias set 18: real(kind=8)", !2}