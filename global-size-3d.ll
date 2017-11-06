; ModuleID = 'src_soil.o.bc'
source_filename = "src_soil.o.bc"
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

module asm "\09.ident\09\22GCC: (GNU) 4.6.4 LLVM: 3.3.1\22"

%"struct.array3_integer(kind=4)" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i64, i64, i64 }

@__src_soil_MOD_arr = global %"struct.array3_integer(kind=4)" zeroinitializer, align 32

; Function Attrs: nounwind uwtable
define void @__src_soil_MOD_terra1() unnamed_addr #0 {
entry:
  %0 = load i64, i64* getelementptr inbounds (%"struct.array3_integer(kind=4)", %"struct.array3_integer(kind=4)"* @__src_soil_MOD_arr, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !0
  %1 = load i64, i64* getelementptr inbounds (%"struct.array3_integer(kind=4)", %"struct.array3_integer(kind=4)"* @__src_soil_MOD_arr, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !0
  %2 = sub nsw i64 %0, %1
  %3 = add nsw i64 %2, 1
  %4 = icmp sgt i64 %2, -2
  %5 = trunc i64 %3 to i32
  %6 = select i1 %4, i32 %5, i32 0
  %7 = load i64, i64* getelementptr inbounds (%"struct.array3_integer(kind=4)", %"struct.array3_integer(kind=4)"* @__src_soil_MOD_arr, i64 0, i32 3, i64 1, i32 2), align 8, !tbaa !0
  %8 = load i64, i64* getelementptr inbounds (%"struct.array3_integer(kind=4)", %"struct.array3_integer(kind=4)"* @__src_soil_MOD_arr, i64 0, i32 3, i64 1, i32 1), align 8, !tbaa !0
  %9 = sub nsw i64 %7, %8
  %10 = add nsw i64 %9, 1
  %11 = icmp sgt i64 %9, -2
  %12 = trunc i64 %10 to i32
  %13 = select i1 %11, i32 %12, i32 0
  %14 = load i64, i64* getelementptr inbounds (%"struct.array3_integer(kind=4)", %"struct.array3_integer(kind=4)"* @__src_soil_MOD_arr, i64 0, i32 3, i64 2, i32 2), align 8, !tbaa !0
  %15 = load i64, i64* getelementptr inbounds (%"struct.array3_integer(kind=4)", %"struct.array3_integer(kind=4)"* @__src_soil_MOD_arr, i64 0, i32 3, i64 2, i32 1), align 8, !tbaa !0
  %16 = sub nsw i64 %14, %15
  %17 = add nsw i64 %16, 1
  %18 = icmp sgt i64 %16, -2
  %19 = trunc i64 %17 to i32
  %20 = select i1 %18, i32 %19, i32 0
  %21 = load i8*, i8** getelementptr inbounds (%"struct.array3_integer(kind=4)", %"struct.array3_integer(kind=4)"* @__src_soil_MOD_arr, i64 0, i32 0), align 32, !tbaa !3
  %22 = load i64, i64* getelementptr inbounds (%"struct.array3_integer(kind=4)", %"struct.array3_integer(kind=4)"* @__src_soil_MOD_arr, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !0
  %23 = add nsw i64 %22, 1
  %24 = load i64, i64* getelementptr inbounds (%"struct.array3_integer(kind=4)", %"struct.array3_integer(kind=4)"* @__src_soil_MOD_arr, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !0
  %25 = add nsw i64 %23, %24
  %26 = load i64, i64* getelementptr inbounds (%"struct.array3_integer(kind=4)", %"struct.array3_integer(kind=4)"* @__src_soil_MOD_arr, i64 0, i32 1), align 8, !tbaa !0
  %27 = add nsw i64 %25, %26
  %28 = bitcast i8* %21 to i32*
  %29 = getelementptr inbounds i32, i32* %28, i64 %27
  store i32 %6, i32* %29, align 4, !tbaa !5
  %30 = shl i64 %24, 1
  %31 = add nsw i64 %23, %30
  %32 = add nsw i64 %31, %26
  %33 = getelementptr inbounds i32, i32* %28, i64 %32
  store i32 %13, i32* %33, align 4, !tbaa !5
  %34 = mul nsw i64 %24, 3
  %35 = add nsw i64 %23, %34
  %36 = add nsw i64 %35, %26
  %37 = getelementptr inbounds i32, i32* %28, i64 %36
  store i32 %20, i32* %37, align 4, !tbaa !5
  ret void
}

attributes #0 = { nounwind uwtable }

!0 = !{!1, !1, i64 0}
!1 = !{!"alias set 4: integer(kind=8)", !2}
!2 = distinct !{!2}
!3 = !{!4, !4, i64 0}
!4 = !{!"alias set 3: void*", !2}
!5 = !{!6, !6, i64 0}
!6 = !{!"alias set 11: integer(kind=4)", !2}
