; !+ Source module  "src_soil"
; !------------------------------------------------------------------------------

; MODULE src_soil


; USE data_parameters, ONLY :   &
;     wp,        & ! KIND-type parameter for real variables
;     iintegers    ! KIND-type parameter for standard integer variables

; IMPLICIT NONE

; REAL (KIND = wp),     ALLOCATABLE, PRIVATE  :: &
;   xdzs     (:)
; CONTAINS

; SUBROUTINE terra1()
;   INTEGER (KIND=iintegers) ::  &
;     j

;    DO j = 1, 4
;         xdzs(j) = j
;   END DO
; END SUBROUTINE terra1

; END MODULE src_soil
; ModuleID = 'src_soil.o.bc'
source_filename = "src_soil.o.bc"
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

module asm "\09.ident\09\22GCC: (GNU) 4.6.4 LLVM: 3.3.1\22"

%"struct.array1_real(kind=8)" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i64, i64, i64 }

@__src_soil_MOD_xdzs = unnamed_addr global %"struct.array1_real(kind=8)" zeroinitializer, align 32

; Function Attrs: nounwind uwtable
define void @__src_soil_MOD_terra1(i32* noalias nocapture %n) unnamed_addr #0 {
entry:
  %0 = load i8*, i8** getelementptr inbounds (%"struct.array1_real(kind=8)", %"struct.array1_real(kind=8)"* @__src_soil_MOD_xdzs, i64 0, i32 0), align 32, !tbaa !0
  %1 = load i64, i64* getelementptr inbounds (%"struct.array1_real(kind=8)", %"struct.array1_real(kind=8)"* @__src_soil_MOD_xdzs, i64 0, i32 1), align 8, !tbaa !3
  %2 = bitcast i8* %0 to double*
  %3 = add nsw i64 %1, 1
  %4 = getelementptr inbounds double, double* %2, i64 %3
  store double 1.000000e+00, double* %4, align 8, !tbaa !5
  %5 = add nsw i64 %1, 2
  %6 = getelementptr inbounds double, double* %2, i64 %5
  store double 2.000000e+00, double* %6, align 8, !tbaa !5
  %7 = add nsw i64 %1, 3
  %8 = getelementptr inbounds double, double* %2, i64 %7
  store double 3.000000e+00, double* %8, align 8, !tbaa !5
  %9 = add nsw i64 %1, 4
  %10 = getelementptr inbounds double, double* %2, i64 %9
  store double 4.000000e+00, double* %10, align 8, !tbaa !5
  ret void
}

attributes #0 = { nounwind uwtable }

!0 = !{!1, !1, i64 0}
!1 = !{!"alias set 3: void*", !2}
!2 = distinct !{!2}
!3 = !{!4, !4, i64 0}
!4 = !{!"alias set 4: integer(kind=8)", !2}
!5 = !{!6, !6, i64 0}
!6 = !{!"alias set 18: real(kind=8)", !2}