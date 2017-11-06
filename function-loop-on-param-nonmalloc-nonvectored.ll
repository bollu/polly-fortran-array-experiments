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

; SUBROUTINE terra1(n, arr)
;   INTEGER, intent(in) :: n
;   INTEGER, intent(inout) :: arr(n)

;   INTEGER (KIND=iintegers) ::  &
;     j

;    DO j = 1, n
;         arr(j) = arr(j) * 10
;   END DO
; END SUBROUTINE terra1


; !==============================================================================

; !------------------------------------------------------------------------------
; ! End of module src_soil
; !------------------------------------------------------------------------------

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
define void @__src_soil_MOD_terra1(i32* noalias nocapture %n, [0 x i32]* noalias nocapture %arr) unnamed_addr #0 {
entry:
  %0 = load i32, i32* %n, align 4, !tbaa !0
  %1 = icmp sgt i32 %0, 0
  br i1 %1, label %"3.preheader", label %return

"3.preheader":                                    ; preds = %entry
  %2 = add i32 %0, 1
  %cnt.cast = zext i32 %0 to i64
  %end.idx = add i64 %cnt.cast, 1
  %n.vec = and i64 %cnt.cast, 4294967288
  %end.idx.rnd.down7 = or i64 %n.vec, 1
  %cmp.zero = icmp eq i64 %end.idx.rnd.down7, 1
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %"3.preheader"
  %index = phi i64 [ %index.next, %vector.body ], [ 1, %"3.preheader" ]
  %3 = add i64 %index, -1
  %4 = getelementptr inbounds [0 x i32], [0 x i32]* %arr, i64 0, i64 %3
  %5 = bitcast i32* %4 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %5, align 4
  %.sum = add i64 %index, 3
  %6 = getelementptr [0 x i32], [0 x i32]* %arr, i64 0, i64 %.sum
  %7 = bitcast i32* %6 to <4 x i32>*
  %wide.load2 = load <4 x i32>, <4 x i32>* %7, align 4
  %8 = mul nsw <4 x i32> %wide.load, <i32 10, i32 10, i32 10, i32 10>
  %9 = mul nsw <4 x i32> %wide.load2, <i32 10, i32 10, i32 10, i32 10>
  store <4 x i32> %8, <4 x i32>* %5, align 4
  store <4 x i32> %9, <4 x i32>* %7, align 4
  %index.next = add i64 %index, 8
  %10 = icmp eq i64 %index.next, %end.idx.rnd.down7
  br i1 %10, label %middle.block, label %vector.body

middle.block:                                     ; preds = %vector.body, %"3.preheader"
  %resume.val = phi i64 [ 1, %"3.preheader" ], [ %end.idx.rnd.down7, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %return, label %"3"

; START
"3":                                              ; preds = %"3", %middle.block
  %indvars.iv = phi i64 [ %indvars.iv.next, %"3" ], [ %resume.val, %middle.block ]
  %11 = add nsw i64 %indvars.iv, -1
  %12 = getelementptr inbounds [0 x i32], [0 x i32]* %arr, i64 0, i64 %11
  %13 = load i32, i32* %12, align 4, !tbaa !0
  %14 = mul nsw i32 %13, 10
  store i32 %14, i32* %12, align 4, !tbaa !0
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %2
  br i1 %exitcond, label %return, label %"3", !llvm.vectorizer.already_vectorized !3

return:                                           ; preds = %"3", %middle.block, %entry
  ret void
}
; END

attributes #0 = { nounwind uwtable }

!0 = !{!1, !1, i64 0}
!1 = !{!"alias set 11: integer(kind=4)", !2}
!2 = distinct !{!2}
!3 = !{}