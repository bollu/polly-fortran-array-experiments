; ModuleID = 'm.optimised.ll'
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
@FUNC___m_MOD_f_SCOP_0_KERNEL_0 = private unnamed_addr constant [7601 x i8] c"//\0A// Generated by LLVM NVPTX Back-End\0A//\0A\0A.version 5.0\0A.target sm_30\0A.address_size 64\0A\0A\09// .globl\09FUNC___m_MOD_f_SCOP_0_KERNEL_0\0A\0A.visible .entry FUNC___m_MOD_f_SCOP_0_KERNEL_0(\0A\09.param .u64 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_0,\0A\09.param .u64 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_1,\0A\09.param .u64 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_2,\0A\09.param .u64 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_3,\0A\09.param .u64 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_4,\0A\09.param .u32 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_5,\0A\09.param .u32 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_6,\0A\09.param .u64 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_7,\0A\09.param .u64 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_8,\0A\09.param .u64 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_9,\0A\09.param .u64 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_10,\0A\09.param .u32 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_11,\0A\09.param .u32 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_12,\0A\09.param .u64 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_13,\0A\09.param .u64 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_14,\0A\09.param .u64 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_15,\0A\09.param .u64 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_16,\0A\09.param .u32 FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_17\0A)\0A.maxntid 32, 1, 1\0A{\0A\09.reg .pred \09%p<4>;\0A\09.reg .f32 \09%f<2>;\0A\09.reg .b32 \09%r<7>;\0A\09.reg .b64 \09%rd<43>;\0A\0A\09ld.param.u64 \09%rd21, [FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_13];\0A\09ld.param.u64 \09%rd20, [FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_4];\0A\09ld.param.u64 \09%rd19, [FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_2];\0A\09ld.param.u64 \09%rd18, [FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_1];\0A\09ld.param.u64 \09%rd17, [FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_0];\0A\09ld.global.u64 \09%rd1, [%rd17];\0A\09ld.param.u64 \09%rd23, [FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_3];\0A\09ld.global.u64 \09%rd2, [%rd18];\0A\09mov.u32 \09%r1, %ctaid.x;\0A\09ld.param.u32 \09%r2, [FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_6];\0A\09mov.u32 \09%r3, %tid.x;\0A\09cvt.u64.u32 \09%rd24, %r3;\0A\09mul.wide.u32 \09%rd25, %r1, 32;\0A\09ld.param.s32 \09%rd3, [FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_5];\0A\09add.s64 \09%rd26, %rd3, -1;\0A\09sub.s64 \09%rd27, %rd26, %rd25;\0A\09shr.u64 \09%rd4, %rd27, 20;\0A\09ld.param.u32 \09%r4, [FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_14];\0A\09ld.param.u64 \09%rd28, [FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_15];\0A\09mul.lo.s32 \09%r5, %r4, %r2;\0A\09ld.param.u64 \09%rd29, [FUNC___m_MOD_f_SCOP_0_KERNEL_0_param_16];\0A\09cvt.s64.s32 \09%rd30, %r5;\0A\09add.s64 \09%rd31, %rd29, %rd21;\0A\09add.s64 \09%rd32, %rd31, %rd30;\0A\09shl.b64 \09%rd33, %rd32, 2;\0A\09add.s64 \09%rd5, %rd23, %rd33;\0A\09add.s64 \09%rd41, %rd25, %rd24;\0A\09shl.b64 \09%rd7, %rd21, 20;\0A\09add.s64 \09%rd34, %rd41, 1;\0A\09mul.lo.s64 \09%rd35, %rd21, %rd34;\0A\09shl.b64 \09%rd36, %rd35, 2;\0A\09shl.b64 \09%rd37, %rd28, 2;\0A\09add.s64 \09%rd40, %rd36, %rd37;\0A\09mul.lo.s64 \09%rd38, %rd21, %rd21;\0A\09shl.b64 \09%rd9, %rd38, 22;\0A\09mov.u64 \09%rd42, 0;\0ALBB0_1:\0A\09setp.lt.s64 \09%p1, %rd41, %rd3;\0A\09@%p1 bra \09LBB0_4;\0A\09bra.uni \09LBB0_2;\0ALBB0_4:\0A\09add.s64 \09%rd39, %rd19, %rd40;\0A\09ld.global.f32 \09%f1, [%rd39];\0A\09setp.le.ftz.f32 \09%p2, %f1, 0f41200000;\0A\09@%p2 bra \09LBB0_2;\0A\09add.s64 \09%rd16, %rd20, %rd40;\0A\09ld.global.u32 \09%r6, [%rd5];\0A\09st.global.u32 \09[%rd16], %r6;\0ALBB0_2:\0A\09add.s64 \09%rd42, %rd42, %rd21;\0A\09add.s64 \09%rd41, %rd41, %rd7;\0A\09add.s64 \09%rd40, %rd40, %rd9;\0A\09setp.gt.s64 \09%p3, %rd42, %rd4;\0A\09@%p3 bra \09LBB0_3;\0A\09bra.uni \09LBB0_1;\0ALBB0_3:\0A\09st.global.u64 \09[%rd17], %rd1;\0A\09st.global.u64 \09[%rd18], %rd2;\0A\09ret;\0A}\0A\0A\09// .globl\09_gfortran_polly_array_index_0\0A.visible .func  (.param .b64 func_retval0) _gfortran_polly_array_index_0(\0A\09.param .b64 _gfortran_polly_array_index_0_param_0\0A)\0A{\0A\09.reg .b64 \09%rd<2>;\0A\0A\09ld.param.u64 \09%rd1, [_gfortran_polly_array_index_0_param_0];\0A\09st.param.b64 \09[func_retval0+0], %rd1;\0A\09ret;\0A}\0A\0A\09// .globl\09_gfortran_polly_array_index_1\0A.visible .func  (.param .b64 func_retval0) _gfortran_polly_array_index_1(\0A\09.param .b64 _gfortran_polly_array_index_1_param_0,\0A\09.param .b64 _gfortran_polly_array_index_1_param_1,\0A\09.param .b64 _gfortran_polly_array_index_1_param_2\0A)\0A{\0A\09.reg .b64 \09%rd<6>;\0A\0A\09ld.param.u64 \09%rd1, [_gfortran_polly_array_index_1_param_0];\0A\09ld.param.u64 \09%rd2, [_gfortran_polly_array_index_1_param_1];\0A\09ld.param.u64 \09%rd3, [_gfortran_polly_array_index_1_param_2];\0A\09mul.lo.s64 \09%rd4, %rd3, %rd2;\0A\09add.s64 \09%rd5, %rd4, %rd1;\0A\09st.param.b64 \09[func_retval0+0], %rd5;\0A\09ret;\0A}\0A\0A\09// .globl\09_gfortran_polly_array_index_2\0A.visible .func  (.param .b64 func_retval0) _gfortran_polly_array_index_2(\0A\09.param .b64 _gfortran_polly_array_index_2_param_0,\0A\09.param .b64 _gfortran_polly_array_index_2_param_1,\0A\09.param .b64 _gfortran_polly_array_index_2_param_2,\0A\09.param .b64 _gfortran_polly_array_index_2_param_3,\0A\09.param .b64 _gfortran_polly_array_index_2_param_4\0A)\0A{\0A\09.reg .b64 \09%rd<10>;\0A\0A\09ld.param.u64 \09%rd1, [_gfortran_polly_array_index_2_param_0];\0A\09ld.param.u64 \09%rd2, [_gfortran_polly_array_index_2_param_1];\0A\09ld.param.u64 \09%rd3, [_gfortran_polly_array_index_2_param_3];\0A\09mul.lo.s64 \09%rd4, %rd3, %rd2;\0A\09add.s64 \09%rd5, %rd4, %rd1;\0A\09ld.param.u64 \09%rd6, [_gfortran_polly_array_index_2_param_2];\0A\09ld.param.u64 \09%rd7, [_gfortran_polly_array_index_2_param_4];\0A\09mul.lo.s64 \09%rd8, %rd7, %rd6;\0A\09add.s64 \09%rd9, %rd5, %rd8;\0A\09st.param.b64 \09[func_retval0+0], %rd9;\0A\09ret;\0A}\0A\0A\09// .globl\09_gfortran_polly_array_index_3\0A.visible .func  (.param .b64 func_retval0) _gfortran_polly_array_index_3(\0A\09.param .b64 _gfortran_polly_array_index_3_param_0,\0A\09.param .b64 _gfortran_polly_array_index_3_param_1,\0A\09.param .b64 _gfortran_polly_array_index_3_param_2,\0A\09.param .b64 _gfortran_polly_array_index_3_param_3,\0A\09.param .b64 _gfortran_polly_array_index_3_param_4,\0A\09.param .b64 _gfortran_polly_array_index_3_param_5,\0A\09.param .b64 _gfortran_polly_array_index_3_param_6\0A)\0A{\0A\09.reg .b64 \09%rd<14>;\0A\0A\09ld.param.u64 \09%rd1, [_gfortran_polly_array_index_3_param_0];\0A\09ld.param.u64 \09%rd2, [_gfortran_polly_array_index_3_param_1];\0A\09ld.param.u64 \09%rd3, [_gfortran_polly_array_index_3_param_4];\0A\09mul.lo.s64 \09%rd4, %rd3, %rd2;\0A\09add.s64 \09%rd5, %rd4, %rd1;\0A\09ld.param.u64 \09%rd6, [_gfortran_polly_array_index_3_param_2];\0A\09ld.param.u64 \09%rd7, [_gfortran_polly_array_index_3_param_5];\0A\09mul.lo.s64 \09%rd8, %rd7, %rd6;\0A\09ld.param.u64 \09%rd9, [_gfortran_polly_array_index_3_param_3];\0A\09add.s64 \09%rd10, %rd5, %rd8;\0A\09ld.param.u64 \09%rd11, [_gfortran_polly_array_index_3_param_6];\0A\09mul.lo.s64 \09%rd12, %rd11, %rd9;\0A\09add.s64 \09%rd13, %rd10, %rd12;\0A\09st.param.b64 \09[func_retval0+0], %rd13;\0A\09ret;\0A}\0A\0A\09// .globl\09_gfortran_polly_array_index_4\0A.visible .func  (.param .b64 func_retval0) _gfortran_polly_array_index_4(\0A\09.param .b64 _gfortran_polly_array_index_4_param_0,\0A\09.param .b64 _gfortran_polly_array_index_4_param_1,\0A\09.param .b64 _gfortran_polly_array_index_4_param_2,\0A\09.param .b64 _gfortran_polly_array_index_4_param_3,\0A\09.param .b64 _gfortran_polly_array_index_4_param_4,\0A\09.param .b64 _gfortran_polly_array_index_4_param_5,\0A\09.param .b64 _gfortran_polly_array_index_4_param_6,\0A\09.param .b64 _gfortran_polly_array_index_4_param_7,\0A\09.param .b64 _gfortran_polly_array_index_4_param_8\0A)\0A{\0A\09.reg .b64 \09%rd<18>;\0A\0A\09ld.param.u64 \09%rd1, [_gfortran_polly_array_index_4_param_0];\0A\09ld.param.u64 \09%rd2, [_gfortran_polly_array_index_4_param_1];\0A\09ld.param.u64 \09%rd3, [_gfortran_polly_array_index_4_param_5];\0A\09mul.lo.s64 \09%rd4, %rd3, %rd2;\0A\09add.s64 \09%rd5, %rd4, %rd1;\0A\09ld.param.u64 \09%rd6, [_gfortran_polly_array_index_4_param_2];\0A\09ld.param.u64 \09%rd7, [_gfortran_polly_array_index_4_param_6];\0A\09mul.lo.s64 \09%rd8, %rd7, %rd6;\0A\09ld.param.u64 \09%rd9, [_gfortran_polly_array_index_4_param_3];\0A\09add.s64 \09%rd10, %rd5, %rd8;\0A\09ld.param.u64 \09%rd11, [_gfortran_polly_array_index_4_param_4];\0A\09ld.param.u64 \09%rd12, [_gfortran_polly_array_index_4_param_7];\0A\09mul.lo.s64 \09%rd13, %rd12, %rd9;\0A\09add.s64 \09%rd14, %rd10, %rd13;\0A\09ld.param.u64 \09%rd15, [_gfortran_polly_array_index_4_param_8];\0A\09mul.lo.s64 \09%rd16, %rd15, %rd11;\0A\09add.s64 \09%rd17, %rd14, %rd16;\0A\09st.param.b64 \09[func_retval0+0], %rd17;\0A\09ret;\0A}\0A\0A\0A\00"
@FUNC___m_MOD_f_SCOP_0_KERNEL_0_name = private unnamed_addr constant [31 x i8] c"FUNC___m_MOD_f_SCOP_0_KERNEL_0\00"

; Function Attrs: nounwind uwtable
define void @__m_MOD_f([0 x float]* noalias %sotr, [0 x float]* noalias %sobs, [0 x float]* noalias %sod_t, [0 x float]* noalias %zsmu0_flux, i32* noalias %nproma, i32* noalias %ke, i32* noalias %ipend) unnamed_addr #0 {
entry:
  %0 = call i8* @polly_mallocManaged(i64 8)
  %tmp3.s2a = bitcast i8* %0 to i64*
  %1 = call i8* @polly_mallocManaged(i64 8)
  %not.s2a = bitcast i8* %1 to i64*
  %2 = call i8* @polly_mallocManaged(i64 4)
  %tmp4.preload.s2a = bitcast i8* %2 to i32*
  %3 = call i8* @polly_mallocManaged(i64 4)
  %tmp.preload.s2a = bitcast i8* %3 to i32*
  %4 = call i8* @polly_mallocManaged(i64 4)
  %tmp5.preload.s2a = bitcast i8* %4 to i32*
  %5 = call i8* @polly_mallocManaged(i64 144)
  %polly_launch_0_params = bitcast i8* %5 to [18 x i8*]*
  %6 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_0 = bitcast i8* %6 to i8**
  %7 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_1 = bitcast i8* %7 to i8**
  %8 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_2 = bitcast i8* %8 to i8**
  %9 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_3 = bitcast i8* %9 to i8**
  %10 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_4 = bitcast i8* %10 to i8**
  %11 = call i8* @polly_mallocManaged(i64 4)
  %polly_launch_0_param_5 = bitcast i8* %11 to i32*
  %12 = call i8* @polly_mallocManaged(i64 4)
  %polly_launch_0_param_6 = bitcast i8* %12 to i32*
  %13 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_7 = bitcast i8* %13 to i64*
  %14 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_8 = bitcast i8* %14 to i64*
  %15 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_9 = bitcast i8* %15 to i64*
  %16 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_10 = bitcast i8* %16 to i64*
  %17 = call i8* @polly_mallocManaged(i64 4)
  %polly_launch_0_param_11 = bitcast i8* %17 to i32*
  %18 = call i8* @polly_mallocManaged(i64 4)
  %polly_launch_0_param_12 = bitcast i8* %18 to i32*
  %19 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_13 = bitcast i8* %19 to i64*
  %20 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_14 = bitcast i8* %20 to i64*
  %21 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_15 = bitcast i8* %21 to i64*
  %22 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_16 = bitcast i8* %22 to i64*
  %23 = call i8* @polly_mallocManaged(i64 4)
  %polly_launch_0_param_17 = bitcast i8* %23 to i32*
  %polly_launch_0_params_i8ptr = bitcast [18 x i8*]* %polly_launch_0_params to i8*
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %entry
  br label %polly.preload.begin

polly.preload.begin:                              ; preds = %polly.split_new_and_old
  %polly.access.ipend = getelementptr i32, i32* %ipend, i64 0
  %polly.access.ipend.load = load i32, i32* %polly.access.ipend, align 4, !alias.scope !0, !noalias !2
  store i32 %polly.access.ipend.load, i32* %tmp5.preload.s2a
  %polly.access.nproma = getelementptr i32, i32* %nproma, i64 0
  %polly.access.nproma.load = load i32, i32* %polly.access.nproma, align 4, !alias.scope !3, !noalias !8
  store i32 %polly.access.nproma.load, i32* %tmp.preload.s2a
  %polly.access.ke = getelementptr i32, i32* %ke, i64 0
  %polly.access.ke.load = load i32, i32* %polly.access.ke, align 4, !alias.scope !5, !noalias !9
  store i32 %polly.access.ke.load, i32* %tmp4.preload.s2a
  %24 = sext i32 %polly.access.nproma.load to i64
  %25 = icmp sgt i64 %24, 0
  %smax = select i1 %25, i64 %24, i64 0
  %26 = sext i32 %polly.access.nproma.load to i64
  %27 = icmp sgt i64 %26, 0
  %smax1 = select i1 %27, i64 %26, i64 0
  %28 = sub i64 -1, %smax1
  %29 = sext i32 %polly.access.ipend.load to i64
  %30 = mul nsw i64 1, %29
  %31 = mul nsw i64 18, %30
  %32 = add nsw i64 8, %31
  %33 = icmp sge i64 %32, 0
  %34 = and i1 true, %33
  br i1 %34, label %polly.start, label %entry.split.pre_entry_bb

entry.split.pre_entry_bb:                         ; preds = %polly.preload.begin
  br label %entry.split

entry.split:                                      ; preds = %entry.split.pre_entry_bb
  %tmp = load i32, i32* %nproma, align 4
  %tmp1 = sext i32 %tmp to i64
  %tmp2 = icmp sgt i64 %tmp1, 0
  %tmp3 = select i1 %tmp2, i64 %tmp1, i64 0
  %not = xor i64 %tmp3, -1
  %tmp5 = load i32, i32* %ipend, align 4
  %tmp6 = icmp sgt i32 %tmp5, 0
  br i1 %tmp6, label %"3.preheader", label %return.region_exiting

"3.preheader":                                    ; preds = %entry.split
  br label %"3"

"3":                                              ; preds = %"5", %"3.preheader"
  %tmp7 = phi i32 [ %tmp22, %"5" ], [ 1, %"3.preheader" ]
  %tmp8 = sext i32 %tmp7 to i64
  %tmp9 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp8) #2
  %tmp10 = getelementptr [0 x float], [0 x float]* %zsmu0_flux, i64 0, i64 %tmp9
  %tmp11 = load float, float* %tmp10, align 4
  %tmp12 = fcmp ogt float %tmp11, 1.000000e+01
  br i1 %tmp12, label %"4", label %"5"

"4":                                              ; preds = %"3"
  %tmp13 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp8) #2
  %tmp4 = load i32, i32* %ke, align 4
  %tmp14 = sext i32 %tmp4 to i64
  %tmp15 = tail call i64 @_gfortran_polly_array_index_2(i64 %not, i64 %tmp3, i64 1, i64 %tmp14, i64 1) #2
  %tmp16 = getelementptr [0 x float], [0 x float]* %sotr, i64 0, i64 %tmp15
  %tmp17 = bitcast float* %tmp16 to i32*
  %tmp18 = load i32, i32* %tmp17, align 4
  %tmp19 = getelementptr [0 x float], [0 x float]* %sobs, i64 0, i64 %tmp13
  %tmp20 = bitcast float* %tmp19 to i32*
  store i32 %tmp18, i32* %tmp20, align 4
  br label %"5"

"5":                                              ; preds = %"4", %"3"
  %tmp21 = icmp eq i32 %tmp7, %tmp5
  %tmp22 = add i32 %tmp7, 1
  br i1 %tmp21, label %return.loopexit, label %"3"

return.loopexit:                                  ; preds = %"5"
  br label %return.region_exiting

return.region_exiting:                            ; preds = %return.loopexit, %entry.split
  br label %polly.merge_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.exiting, %return.region_exiting
  br label %return

return:                                           ; preds = %polly.merge_new_and_old
  call void @polly_freeManaged(i8* %17)
  call void @polly_freeManaged(i8* %4)
  call void @polly_freeManaged(i8* %18)
  call void @polly_freeManaged(i8* %6)
  call void @polly_freeManaged(i8* %7)
  call void @polly_freeManaged(i8* %19)
  call void @polly_freeManaged(i8* %20)
  call void @polly_freeManaged(i8* %8)
  call void @polly_freeManaged(i8* %10)
  call void @polly_freeManaged(i8* %23)
  call void @polly_freeManaged(i8* %5)
  call void @polly_freeManaged(i8* %9)
  call void @polly_freeManaged(i8* %21)
  call void @polly_freeManaged(i8* %0)
  call void @polly_freeManaged(i8* %12)
  call void @polly_freeManaged(i8* %11)
  call void @polly_freeManaged(i8* %22)
  call void @polly_freeManaged(i8* %14)
  call void @polly_freeManaged(i8* %1)
  call void @polly_freeManaged(i8* %13)
  call void @polly_freeManaged(i8* %16)
  call void @polly_freeManaged(i8* %3)
  call void @polly_freeManaged(i8* %2)
  call void @polly_freeManaged(i8* %15)
  ret void

polly.start:                                      ; preds = %polly.preload.begin
  br label %polly.acc.initialize

polly.acc.initialize:                             ; preds = %polly.start
  %35 = call i8* @polly_initContextCUDA()
  br label %polly.stmt.entry.split

polly.stmt.entry.split:                           ; preds = %polly.acc.initialize
  %36 = sext i32 %polly.access.nproma.load to i64
  %37 = icmp sgt i64 %36, 0
  %smax2 = select i1 %37, i64 %36, i64 0
  %38 = sub i64 -1, %smax2
  store i64 %38, i64* %not.s2a
  %39 = sext i32 %polly.access.nproma.load to i64
  %40 = icmp sgt i64 %39, 0
  %smax3 = select i1 %40, i64 %39, i64 0
  store i64 %smax3, i64* %tmp3.s2a
  br label %polly.cond

polly.cond:                                       ; preds = %polly.stmt.entry.split
  %41 = sext i32 %polly.access.ipend.load to i64
  %42 = icmp sge i64 %41, 1
  br i1 %42, label %polly.then, label %polly.else

polly.merge:                                      ; preds = %polly.else, %polly.then
  call void @polly_freeContext(i8* %35)
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.merge
  br label %polly.merge_new_and_old

polly.then:                                       ; preds = %polly.cond
  %43 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 0
  %DevArrayCast = bitcast i64* %not.s2a to i8*
  store i8* %DevArrayCast, i8** %polly_launch_0_param_0
  %ParamTyped = bitcast i8** %polly_launch_0_param_0 to i8*
  store i8* %ParamTyped, i8** %43
  %44 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 1
  %DevArrayCast4 = bitcast i64* %tmp3.s2a to i8*
  store i8* %DevArrayCast4, i8** %polly_launch_0_param_1
  %ParamTyped5 = bitcast i8** %polly_launch_0_param_1 to i8*
  store i8* %ParamTyped5, i8** %44
  %45 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 2
  %DevArrayCast6 = bitcast [0 x float]* %zsmu0_flux to i8*
  store i8* %DevArrayCast6, i8** %polly_launch_0_param_2
  %ParamTyped7 = bitcast i8** %polly_launch_0_param_2 to i8*
  store i8* %ParamTyped7, i8** %45
  %46 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 3
  %DevArrayCast8 = bitcast [0 x float]* %sotr to i8*
  store i8* %DevArrayCast8, i8** %polly_launch_0_param_3
  %ParamTyped9 = bitcast i8** %polly_launch_0_param_3 to i8*
  store i8* %ParamTyped9, i8** %46
  %47 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 4
  %DevArrayCast10 = bitcast [0 x float]* %sobs to i8*
  store i8* %DevArrayCast10, i8** %polly_launch_0_param_4
  %ParamTyped11 = bitcast i8** %polly_launch_0_param_4 to i8*
  store i8* %ParamTyped11, i8** %47
  store i32 %polly.access.ipend.load, i32* %polly_launch_0_param_5
  %48 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 5
  %49 = bitcast i32* %polly_launch_0_param_5 to i8*
  store i8* %49, i8** %48
  store i32 %polly.access.ke.load, i32* %polly_launch_0_param_6
  %50 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 6
  %51 = bitcast i32* %polly_launch_0_param_6 to i8*
  store i8* %51, i8** %50
  store i64 1, i64* %polly_launch_0_param_7
  %52 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 7
  %53 = bitcast i64* %polly_launch_0_param_7 to i8*
  store i8* %53, i8** %52
  store i64 %smax, i64* %polly_launch_0_param_8
  %54 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 8
  %55 = bitcast i64* %polly_launch_0_param_8 to i8*
  store i8* %55, i8** %54
  store i64 1, i64* %polly_launch_0_param_9
  %56 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 9
  %57 = bitcast i64* %polly_launch_0_param_9 to i8*
  store i8* %57, i8** %56
  store i64 1, i64* %polly_launch_0_param_10
  %58 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 10
  %59 = bitcast i64* %polly_launch_0_param_10 to i8*
  store i8* %59, i8** %58
  store i32 %polly.access.ipend.load, i32* %polly_launch_0_param_11
  %60 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 11
  %61 = bitcast i32* %polly_launch_0_param_11 to i8*
  store i8* %61, i8** %60
  store i32 %polly.access.ke.load, i32* %polly_launch_0_param_12
  %62 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 12
  %63 = bitcast i32* %polly_launch_0_param_12 to i8*
  store i8* %63, i8** %62
  store i64 1, i64* %polly_launch_0_param_13
  %64 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 13
  %65 = bitcast i64* %polly_launch_0_param_13 to i8*
  store i8* %65, i8** %64
  store i64 %smax, i64* %polly_launch_0_param_14
  %66 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 14
  %67 = bitcast i64* %polly_launch_0_param_14 to i8*
  store i8* %67, i8** %66
  store i64 -1, i64* %polly_launch_0_param_15
  %68 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 15
  %69 = bitcast i64* %polly_launch_0_param_15 to i8*
  store i8* %69, i8** %68
  store i64 %28, i64* %polly_launch_0_param_16
  %70 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 16
  %71 = bitcast i64* %polly_launch_0_param_16 to i8*
  store i8* %71, i8** %70
  store i32 %polly.access.nproma.load, i32* %polly_launch_0_param_17
  %72 = getelementptr [18 x i8*], [18 x i8*]* %polly_launch_0_params, i64 0, i64 17
  %73 = bitcast i32* %polly_launch_0_param_17 to i8*
  store i8* %73, i8** %72
  %74 = call i8* @polly_getKernel(i8* getelementptr inbounds ([7601 x i8], [7601 x i8]* @FUNC___m_MOD_f_SCOP_0_KERNEL_0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @FUNC___m_MOD_f_SCOP_0_KERNEL_0_name, i32 0, i32 0))
  %75 = sext i32 %polly.access.ipend.load to i64
  %76 = icmp sge i64 %75, 1048546
  %77 = sext i32 %polly.access.ipend.load to i64
  %78 = add nsw i64 %77, 31
  %polly.fdiv_q.shr = ashr i64 %78, 5
  %79 = select i1 %76, i64 32768, i64 %polly.fdiv_q.shr
  %80 = trunc i64 %79 to i32
  call void @polly_launchKernel(i8* %74, i32 %80, i32 1, i32 32, i32 1, i32 1, i8* %polly_launch_0_params_i8ptr)
  call void @polly_freeKernel(i8* %74)
  call void @polly_synchronizeDevice()
  br label %polly.merge

polly.else:                                       ; preds = %polly.cond
  br label %polly.merge
}

; Function Attrs: readnone
declare i64 @_gfortran_polly_array_index_1(i64, i64, i64) #1

; Function Attrs: readnone
declare i64 @_gfortran_polly_array_index_2(i64, i64, i64, i64, i64) #1

; Function Attrs: nounwind uwtable
define internal void @MAIN__() #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  tail call void @_gfortran_set_args(i32 %argc, i8** %argv) #2
  tail call void @_gfortran_set_options(i32 8, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @options.12.1618, i64 0, i64 0)) #2
  tail call void @MAIN__() #0
  ret i32 0
}

declare void @_gfortran_set_args(i32, i8**)

declare void @_gfortran_set_options(i32, i32*)

declare i8* @polly_initContextCUDA()

declare i8* @polly_getKernel(i8*, i8*)

declare void @polly_launchKernel(i8*, i32, i32, i32, i32, i32, i8*)

declare void @polly_freeKernel(i8*)

declare void @polly_synchronizeDevice()

declare void @polly_freeContext(i8*)

declare i8* @polly_mallocManaged(i64)

declare void @polly_freeManaged(i8*)

attributes #0 = { nounwind uwtable }
attributes #1 = { readnone }
attributes #2 = { nounwind }

!0 = distinct !{!0, !1, !"polly.alias.scope.MemRef_ipend"}
!1 = distinct !{!1, !"polly.alias.scope.domain"}
!2 = !{!3, !4, !5, !6, !7}
!3 = distinct !{!3, !1, !"polly.alias.scope.MemRef_nproma"}
!4 = distinct !{!4, !1, !"polly.alias.scope.MemRef_zsmu0_flux"}
!5 = distinct !{!5, !1, !"polly.alias.scope.MemRef_ke"}
!6 = distinct !{!6, !1, !"polly.alias.scope.MemRef_sotr"}
!7 = distinct !{!7, !1, !"polly.alias.scope.MemRef_sobs"}
!8 = !{!0, !4, !5, !6, !7}
!9 = !{!3, !0, !4, !6, !7}
