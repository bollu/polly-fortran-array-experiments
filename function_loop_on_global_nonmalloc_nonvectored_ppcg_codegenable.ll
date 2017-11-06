; What the input fortran code should look like. NOTE: this is fake, the
; .ll file was hand-written.
; 
; MODULE testmod
; USE data_parameters, ONLY : &
; IMPLICIT NONE
; 
; INTEGER (KIND=iintegers), ALLOCATABLE, PRIVATE  :: &
;   arrin(:), arrout(:)
; CONTAINS
;
; SUBROUTINE test()
;   INTEGER (KIND=iintegers) :: i
; 
;   DO i = 1, 100
;       arrout(i) = arrin(i) * arrin(i)
;   END DO
; END SUBROUTINE test


; !==============================================================================

; !------------------------------------------------------------------------------
; ! End of module src_soil
; !------------------------------------------------------------------------------

; END MODULE src_soil

; ModuleID = 'src_soil.o.bc'
source_filename = "src_soil.o.bc"
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i32:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

module asm "\09.ident\09\22GCC: (GNU) 4.6.4 LLVM: 3.3.1\22"

%"struct.array1_real(kind=8)" = type { i8*, i32, i32, [1 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i32, i32, i32 }

@arrin = unnamed_addr global %"struct.array1_real(kind=8)" zeroinitializer, align 32
@arrout = unnamed_addr global %"struct.array1_real(kind=8)" zeroinitializer, align 32

; Function Attrs: nounwind uwtable
define void @__src_soil_MOD_terra1() unnamed_addr #0 {
entry:
  %rawmemin = load i8*, i8** getelementptr inbounds (%"struct.array1_real(kind=8)", %"struct.array1_real(kind=8)"* @arrin, i32 0, i32 0), align 32, !tbaa !5
  %typedmemin = bitcast i8* %rawmemin to i32*


  %rawmemout = load i8*, i8** getelementptr inbounds (%"struct.array1_real(kind=8)", %"struct.array1_real(kind=8)"* @arrout, i32 0, i32 0), align 32, !tbaa !5
  %typedmemout = bitcast i8* %rawmemout to i32*
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc ], [ 1, %entry ]
  %exitcond = icmp ne i32 %indvars.iv, 100
  br i1 %exitcond, label %for.body, label %return

for.body:                                              ; preds = %"3", %"3.preheader"
  ; %6 = add nsw i32 %indvars.iv, %0
  %inslot = getelementptr inbounds i32, i32* %typedmemin, i32 %indvars.iv
  %inval = load i32, i32* %inslot, align 8
  
  %outslot = getelementptr inbounds i32, i32* %typedmemout, i32 %indvars.iv

  %out = mul nsw i32 %inval, %inval
  store i32 %out, i32* %outslot, align 8

  br label %for.inc

for.inc:
  %indvars.iv.next = add i32 %indvars.iv, 1
  br label %for.cond

return:                                           ; preds = %"3", %entry
  ret void
}

attributes #0 = { nounwind uwtable }

!0 = !{!1, !1, i32 0}
!1 = !{!"alias set 11: integer(kind=4)", !2}
!2 = distinct !{!2}
!3 = !{!4, !4, i32 0}
!4 = !{!"alias set 4: integer(kind=8)", !2}
!5 = !{!6, !6, i32 0}
!6 = !{!"alias set 3: void*", !2}
!7 = !{!8, !8, i32 0}
!8 = !{!"alias set 18: real(kind=8)", !2}
