; ModuleID = 'm.optimised.ll'
source_filename = "m.bc"
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

module asm "\09.ident\09\22GCC: (GNU) 4.6.4 LLVM: 3.3.1\22"

%"struct.array2_integer(kind=4)" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i64, i64, i64 }
%"struct.array1_integer(kind=4)" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4)" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).0" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }

@__m_MOD_mind_jlat = unnamed_addr global %"struct.array2_integer(kind=4)" zeroinitializer, align 32
@__m_MOD_global_idx_array = unnamed_addr global %"struct.array1_integer(kind=4)" zeroinitializer, align 32
@options.11.1612 = internal constant [8 x i32] [i32 68, i32 511, i32 0, i32 0, i32 0, i32 1, i32 0, i32 1], align 32
@FUNC___m_MOD_fn_SCOP_0_KERNEL_0 = private unnamed_addr constant [7874 x i8] c"//\0A// Generated by LLVM NVPTX Back-End\0A//\0A\0A.version 3.2\0A.target sm_30\0A.address_size 64\0A\0A\09// .globl\09FUNC___m_MOD_fn_SCOP_0_KERNEL_0\0A.visible .func  (.param .b64 func_retval0) _gfortran_polly_array_index_1\0A(\0A\09.param .b64 _gfortran_polly_array_index_1_param_0,\0A\09.param .b64 _gfortran_polly_array_index_1_param_1,\0A\09.param .b64 _gfortran_polly_array_index_1_param_2\0A)\0A;\0A\0A.visible .entry FUNC___m_MOD_fn_SCOP_0_KERNEL_0(\0A\09.param .u64 FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_0,\0A\09.param .u64 FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_1,\0A\09.param .u64 FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_2,\0A\09.param .u64 FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_3,\0A\09.param .u64 FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_4,\0A\09.param .u64 FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_5,\0A\09.param .u64 FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_6,\0A\09.param .u64 FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_7,\0A\09.param .u64 FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_8,\0A\09.param .u64 FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_9,\0A\09.param .u64 FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_10,\0A\09.param .u64 FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_11\0A)\0A.maxntid 32, 1, 1\0A{\0A\09.reg .pred \09%p<2>;\0A\09.reg .b32 \09%r<4>;\0A\09.reg .b64 \09%rd<29>;\0A\0A\09mov.u32 \09%r1, %ctaid.x;\0A\09mov.u32 \09%r2, %tid.x;\0A\09cvt.u64.u32 \09%rd10, %r2;\0A\09mul.wide.u32 \09%rd11, %r1, 32;\0A\09add.s64 \09%rd1, %rd11, %rd10;\0A\09setp.lt.s64 \09%p1, %rd1, 100;\0A\09@%p1 bra \09LBB0_2;\0A\09bra.uni \09LBB0_1;\0ALBB0_2:\0A\09ld.param.u64 \09%rd9, [FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_11];\0A\09ld.param.u64 \09%rd8, [FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_8];\0A\09ld.param.u64 \09%rd7, [FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_7];\0A\09ld.param.u64 \09%rd6, [FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_6];\0A\09ld.param.u64 \09%rd5, [FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_5];\0A\09ld.param.u64 \09%rd4, [FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_2];\0A\09ld.param.u64 \09%rd3, [FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_1];\0A\09ld.param.u64 \09%rd2, [FUNC___m_MOD_fn_SCOP_0_KERNEL_0_param_0];\0A\09add.s64 \09%rd12, %rd1, 1;\0A\09{ // callseq 0, 0\0A\09.reg .b32 temp_param_reg;\0A\09.param .b64 param0;\0A\09st.param.b64 \09[param0+0], %rd7;\0A\09.param .b64 param1;\0A\09st.param.b64 \09[param1+0], %rd5;\0A\09.param .b64 param2;\0A\09st.param.b64 \09[param2+0], %rd12;\0A\09.param .b64 retval0;\0A\09call.uni (retval0), \0A\09_gfortran_polly_array_index_1, \0A\09(\0A\09param0, \0A\09param1, \0A\09param2\0A\09);\0A\09ld.param.b64 \09%rd13, [retval0+0];\0A\09} // callseq 0\0A\09mul.lo.s64 \09%rd14, %rd12, %rd5;\0A\09add.s64 \09%rd15, %rd14, %rd7;\0A\09shl.b64 \09%rd16, %rd15, 2;\0A\09add.s64 \09%rd17, %rd2, %rd16;\0A\09ld.global.s32 \09%rd18, [%rd17];\0A\09{ // callseq 1, 0\0A\09.reg .b32 temp_param_reg;\0A\09.param .b64 param0;\0A\09st.param.b64 \09[param0+0], %rd8;\0A\09.param .b64 param1;\0A\09st.param.b64 \09[param1+0], %rd6;\0A\09.param .b64 param2;\0A\09st.param.b64 \09[param2+0], %rd12;\0A\09.param .b64 retval0;\0A\09call.uni (retval0), \0A\09_gfortran_polly_array_index_1, \0A\09(\0A\09param0, \0A\09param1, \0A\09param2\0A\09);\0A\09ld.param.b64 \09%rd19, [retval0+0];\0A\09} // callseq 1\0A\09max.u64 \09%rd20, %rd9, 1;\0A\09neg.s64 \09%rd21, %rd20;\0A\09{ // callseq 2, 0\0A\09.reg .b32 temp_param_reg;\0A\09.param .b64 param0;\0A\09st.param.b64 \09[param0+0], %rd21;\0A\09.param .b64 param1;\0A\09st.param.b64 \09[param1+0], %rd20;\0A\09.param .b64 param2;\0A\09st.param.b64 \09[param2+0], %rd18;\0A\09.param .b64 retval0;\0A\09call.uni (retval0), \0A\09_gfortran_polly_array_index_1, \0A\09(\0A\09param0, \0A\09param1, \0A\09param2\0A\09);\0A\09ld.param.b64 \09%rd22, [retval0+0];\0A\09} // callseq 2\0A\09shl.b64 \09%rd23, %rd22, 2;\0A\09add.s64 \09%rd24, %rd3, %rd23;\0A\09ld.global.u32 \09%r3, [%rd24];\0A\09mul.lo.s64 \09%rd25, %rd12, %rd6;\0A\09add.s64 \09%rd26, %rd25, %rd8;\0A\09shl.b64 \09%rd27, %rd26, 2;\0A\09add.s64 \09%rd28, %rd4, %rd27;\0A\09st.global.u32 \09[%rd28], %r3;\0ALBB0_1:\0A\09ret;\0A}\0A\0A\09// .globl\09_gfortran_polly_array_index_0\0A.visible .func  (.param .b64 func_retval0) _gfortran_polly_array_index_0(\0A\09.param .b64 _gfortran_polly_array_index_0_param_0\0A)\0A{\0A\09.reg .b64 \09%rd<2>;\0A\0A\09ld.param.u64 \09%rd1, [_gfortran_polly_array_index_0_param_0];\0A\09st.param.b64 \09[func_retval0+0], %rd1;\0A\09ret;\0A}\0A\0A\09// .globl\09_gfortran_polly_array_index_1\0A.visible .func  (.param .b64 func_retval0) _gfortran_polly_array_index_1(\0A\09.param .b64 _gfortran_polly_array_index_1_param_0,\0A\09.param .b64 _gfortran_polly_array_index_1_param_1,\0A\09.param .b64 _gfortran_polly_array_index_1_param_2\0A)\0A{\0A\09.reg .b64 \09%rd<6>;\0A\0A\09ld.param.u64 \09%rd1, [_gfortran_polly_array_index_1_param_0];\0A\09ld.param.u64 \09%rd2, [_gfortran_polly_array_index_1_param_1];\0A\09ld.param.u64 \09%rd3, [_gfortran_polly_array_index_1_param_2];\0A\09mul.lo.s64 \09%rd4, %rd2, %rd3;\0A\09add.s64 \09%rd5, %rd1, %rd4;\0A\09st.param.b64 \09[func_retval0+0], %rd5;\0A\09ret;\0A}\0A\0A\09// .globl\09_gfortran_polly_array_index_2\0A.visible .func  (.param .b64 func_retval0) _gfortran_polly_array_index_2(\0A\09.param .b64 _gfortran_polly_array_index_2_param_0,\0A\09.param .b64 _gfortran_polly_array_index_2_param_1,\0A\09.param .b64 _gfortran_polly_array_index_2_param_2,\0A\09.param .b64 _gfortran_polly_array_index_2_param_3,\0A\09.param .b64 _gfortran_polly_array_index_2_param_4\0A)\0A{\0A\09.reg .b64 \09%rd<10>;\0A\0A\09ld.param.u64 \09%rd1, [_gfortran_polly_array_index_2_param_0];\0A\09ld.param.u64 \09%rd2, [_gfortran_polly_array_index_2_param_1];\0A\09ld.param.u64 \09%rd3, [_gfortran_polly_array_index_2_param_3];\0A\09mul.lo.s64 \09%rd4, %rd2, %rd3;\0A\09add.s64 \09%rd5, %rd1, %rd4;\0A\09ld.param.u64 \09%rd6, [_gfortran_polly_array_index_2_param_2];\0A\09ld.param.u64 \09%rd7, [_gfortran_polly_array_index_2_param_4];\0A\09mul.lo.s64 \09%rd8, %rd6, %rd7;\0A\09add.s64 \09%rd9, %rd5, %rd8;\0A\09st.param.b64 \09[func_retval0+0], %rd9;\0A\09ret;\0A}\0A\0A\09// .globl\09_gfortran_polly_array_index_3\0A.visible .func  (.param .b64 func_retval0) _gfortran_polly_array_index_3(\0A\09.param .b64 _gfortran_polly_array_index_3_param_0,\0A\09.param .b64 _gfortran_polly_array_index_3_param_1,\0A\09.param .b64 _gfortran_polly_array_index_3_param_2,\0A\09.param .b64 _gfortran_polly_array_index_3_param_3,\0A\09.param .b64 _gfortran_polly_array_index_3_param_4,\0A\09.param .b64 _gfortran_polly_array_index_3_param_5,\0A\09.param .b64 _gfortran_polly_array_index_3_param_6\0A)\0A{\0A\09.reg .b64 \09%rd<14>;\0A\0A\09ld.param.u64 \09%rd1, [_gfortran_polly_array_index_3_param_0];\0A\09ld.param.u64 \09%rd2, [_gfortran_polly_array_index_3_param_1];\0A\09ld.param.u64 \09%rd3, [_gfortran_polly_array_index_3_param_4];\0A\09mul.lo.s64 \09%rd4, %rd2, %rd3;\0A\09add.s64 \09%rd5, %rd1, %rd4;\0A\09ld.param.u64 \09%rd6, [_gfortran_polly_array_index_3_param_2];\0A\09ld.param.u64 \09%rd7, [_gfortran_polly_array_index_3_param_5];\0A\09mul.lo.s64 \09%rd8, %rd6, %rd7;\0A\09ld.param.u64 \09%rd9, [_gfortran_polly_array_index_3_param_3];\0A\09add.s64 \09%rd10, %rd5, %rd8;\0A\09ld.param.u64 \09%rd11, [_gfortran_polly_array_index_3_param_6];\0A\09mul.lo.s64 \09%rd12, %rd9, %rd11;\0A\09add.s64 \09%rd13, %rd10, %rd12;\0A\09st.param.b64 \09[func_retval0+0], %rd13;\0A\09ret;\0A}\0A\0A\09// .globl\09_gfortran_polly_array_index_4\0A.visible .func  (.param .b64 func_retval0) _gfortran_polly_array_index_4(\0A\09.param .b64 _gfortran_polly_array_index_4_param_0,\0A\09.param .b64 _gfortran_polly_array_index_4_param_1,\0A\09.param .b64 _gfortran_polly_array_index_4_param_2,\0A\09.param .b64 _gfortran_polly_array_index_4_param_3,\0A\09.param .b64 _gfortran_polly_array_index_4_param_4,\0A\09.param .b64 _gfortran_polly_array_index_4_param_5,\0A\09.param .b64 _gfortran_polly_array_index_4_param_6,\0A\09.param .b64 _gfortran_polly_array_index_4_param_7,\0A\09.param .b64 _gfortran_polly_array_index_4_param_8\0A)\0A{\0A\09.reg .b64 \09%rd<18>;\0A\0A\09ld.param.u64 \09%rd1, [_gfortran_polly_array_index_4_param_0];\0A\09ld.param.u64 \09%rd2, [_gfortran_polly_array_index_4_param_1];\0A\09ld.param.u64 \09%rd3, [_gfortran_polly_array_index_4_param_5];\0A\09mul.lo.s64 \09%rd4, %rd2, %rd3;\0A\09add.s64 \09%rd5, %rd1, %rd4;\0A\09ld.param.u64 \09%rd6, [_gfortran_polly_array_index_4_param_2];\0A\09ld.param.u64 \09%rd7, [_gfortran_polly_array_index_4_param_6];\0A\09mul.lo.s64 \09%rd8, %rd6, %rd7;\0A\09ld.param.u64 \09%rd9, [_gfortran_polly_array_index_4_param_3];\0A\09add.s64 \09%rd10, %rd5, %rd8;\0A\09ld.param.u64 \09%rd11, [_gfortran_polly_array_index_4_param_4];\0A\09ld.param.u64 \09%rd12, [_gfortran_polly_array_index_4_param_7];\0A\09mul.lo.s64 \09%rd13, %rd9, %rd12;\0A\09add.s64 \09%rd14, %rd10, %rd13;\0A\09ld.param.u64 \09%rd15, [_gfortran_polly_array_index_4_param_8];\0A\09mul.lo.s64 \09%rd16, %rd11, %rd15;\0A\09add.s64 \09%rd17, %rd14, %rd16;\0A\09st.param.b64 \09[func_retval0+0], %rd17;\0A\09ret;\0A}\0A\0A\0A\00"
@FUNC___m_MOD_fn_SCOP_0_KERNEL_0_name = private unnamed_addr constant [32 x i8] c"FUNC___m_MOD_fn_SCOP_0_KERNEL_0\00"

; Function Attrs: nounwind uwtable
define void @__m_MOD_fn(%"struct.array1_real(kind=4)"* noalias %in_array, %"struct.array1_real(kind=4).0"* noalias %out_array) unnamed_addr #0 {
entry:
  %0 = call i8* @polly_mallocManaged(i64 8)
  %tmp14.preload.s2a = bitcast i8* %0 to i64*
  %1 = call i8* @polly_mallocManaged(i64 8)
  %idx_array_data.preload.s2a = bitcast i8* %1 to i32**
  %2 = call i8* @polly_mallocManaged(i64 96)
  %polly_launch_0_params = bitcast i8* %2 to [12 x i8*]*
  %3 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_0 = bitcast i8* %3 to i8**
  %4 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_1 = bitcast i8* %4 to i8**
  %5 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_2 = bitcast i8* %5 to i8**
  %6 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_3 = bitcast i8* %6 to i64*
  %7 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_4 = bitcast i8* %7 to i64*
  %8 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_5 = bitcast i8* %8 to i64*
  %9 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_6 = bitcast i8* %9 to i64*
  %10 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_7 = bitcast i8* %10 to i64*
  %11 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_8 = bitcast i8* %11 to i64*
  %12 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_9 = bitcast i8* %12 to i32**
  %13 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_10 = bitcast i8* %13 to i64*
  %14 = call i8* @polly_mallocManaged(i64 8)
  %polly_launch_0_param_11 = bitcast i8* %14 to i64*
  %polly_launch_0_params_i8ptr = bitcast [12 x i8*]* %polly_launch_0_params to i8*
  br label %entry.split

entry.split:                                      ; preds = %entry
  %tmp = getelementptr inbounds %"struct.array1_real(kind=4).0", %"struct.array1_real(kind=4).0"* %out_array, i64 0, i32 3, i64 0, i32 0
  %tmp1 = load i64, i64* %tmp, align 8
  %tmp2 = icmp eq i64 %tmp1, 0
  %tmp3 = select i1 %tmp2, i64 1, i64 %tmp1
  %tmp4 = bitcast %"struct.array1_real(kind=4).0"* %out_array to float**
  %out_arr_data = load float*, float** %tmp4, align 8
  %tmp6 = sub i64 0, %tmp3
  %tmp7 = getelementptr inbounds %"struct.array1_real(kind=4)", %"struct.array1_real(kind=4)"* %in_array, i64 0, i32 3, i64 0, i32 0
  %tmp8 = load i64, i64* %tmp7, align 8
  %tmp9 = icmp eq i64 %tmp8, 0
  %. = select i1 %tmp9, i64 1, i64 %tmp8
  %tmp10 = bitcast %"struct.array1_real(kind=4)"* %in_array to float**
  %in_arr_data = load float*, float** %tmp10, align 8
  %tmp12 = sub i64 0, %.
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %entry.split
  br label %polly.preload.begin

polly.preload.begin:                              ; preds = %polly.split_new_and_old
  %.load = load i32*, i32** bitcast (%"struct.array1_integer(kind=4)"* @__m_MOD_global_idx_array to i32**), align 32, !alias.scope !0, !noalias !2
  store i32* %.load, i32** %idx_array_data.preload.s2a
  %.load1 = load i64, i64* bitcast (i32** getelementptr (i32*, i32** bitcast (%"struct.array1_integer(kind=4)"* @__m_MOD_global_idx_array to i32**), i64 1) to i64*), align 8, !alias.scope !0, !noalias !2
  store i64 %.load1, i64* %tmp14.preload.s2a
  br i1 true, label %polly.start, label %"9.pre_entry_bb"

"9.pre_entry_bb":                                 ; preds = %polly.preload.begin
  br label %"9"

"9":                                              ; preds = %"9", %"9.pre_entry_bb"
  %indvars.iv = phi i64 [ %indvars.iv.next, %"9" ], [ 1, %"9.pre_entry_bb" ]
  %idx_array_data = load i32*, i32** bitcast (%"struct.array1_integer(kind=4)"* @__m_MOD_global_idx_array to i32**), align 32
  %tmp14 = load i64, i64* getelementptr inbounds (%"struct.array1_integer(kind=4)", %"struct.array1_integer(kind=4)"* @__m_MOD_global_idx_array, i64 0, i32 1), align 8
  %idx_array_islot_index = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp14, i64 1, i64 %indvars.iv) #2
  %idx_array_slot = getelementptr i32, i32* %idx_array_data, i64 %idx_array_islot_index
  %indirect_idx = load i32, i32* %idx_array_slot, align 4
  %tmp18 = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp6, i64 %tmp3, i64 %indvars.iv) #2
  %indirect_idx_sext = sext i32 %indirect_idx to i64
  %in_array_idx_loc = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp12, i64 %., i64 %indirect_idx_sext) #2
  %in_arr_slot = getelementptr float, float* %in_arr_data, i64 %in_array_idx_loc
  %in_arr_slot_typed = bitcast float* %in_arr_slot to i32*
  %in_arr_slot_val = load i32, i32* %in_arr_slot_typed, align 4
  %out_arr_slot = getelementptr float, float* %out_arr_data, i64 %tmp18
  %out_arr_slot_bitcast = bitcast float* %out_arr_slot to i32*
  store i32 %in_arr_slot_val, i32* %out_arr_slot_bitcast, align 4
  %tmp26 = icmp eq i64 %indvars.iv, 100
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %tmp26, label %polly.merge_new_and_old, label %"9"

polly.merge_new_and_old:                          ; preds = %polly.exiting, %"9"
  br label %return

return:                                           ; preds = %polly.merge_new_and_old
  call void @polly_freeManaged(i8* %2)
  call void @polly_freeManaged(i8* %1)
  call void @polly_freeManaged(i8* %14)
  call void @polly_freeManaged(i8* %13)
  call void @polly_freeManaged(i8* %0)
  call void @polly_freeManaged(i8* %12)
  call void @polly_freeManaged(i8* %11)
  call void @polly_freeManaged(i8* %10)
  call void @polly_freeManaged(i8* %9)
  call void @polly_freeManaged(i8* %8)
  call void @polly_freeManaged(i8* %7)
  call void @polly_freeManaged(i8* %6)
  call void @polly_freeManaged(i8* %5)
  call void @polly_freeManaged(i8* %4)
  call void @polly_freeManaged(i8* %3)
  ret void

polly.start:                                      ; preds = %polly.preload.begin
  br label %polly.acc.initialize

polly.acc.initialize:                             ; preds = %polly.start
  %15 = call i8* @polly_initContextCUDA()
  %16 = getelementptr [12 x i8*], [12 x i8*]* %polly_launch_0_params, i64 0, i64 0
  %DevArrayCast = bitcast i32* %.load to i8*
  store i8* %DevArrayCast, i8** %polly_launch_0_param_0
  %ParamTyped = bitcast i8** %polly_launch_0_param_0 to i8*
  store i8* %ParamTyped, i8** %16
  %17 = getelementptr [12 x i8*], [12 x i8*]* %polly_launch_0_params, i64 0, i64 1
  %DevArrayCast2 = bitcast float* %in_arr_data to i8*
  store i8* %DevArrayCast2, i8** %polly_launch_0_param_1
  %ParamTyped3 = bitcast i8** %polly_launch_0_param_1 to i8*
  store i8* %ParamTyped3, i8** %17
  %18 = getelementptr [12 x i8*], [12 x i8*]* %polly_launch_0_params, i64 0, i64 2
  %DevArrayCast4 = bitcast float* %out_arr_data to i8*
  store i8* %DevArrayCast4, i8** %polly_launch_0_param_2
  %ParamTyped5 = bitcast i8** %polly_launch_0_param_2 to i8*
  store i8* %ParamTyped5, i8** %18
  store i64 1, i64* %polly_launch_0_param_3
  %19 = getelementptr [12 x i8*], [12 x i8*]* %polly_launch_0_params, i64 0, i64 3
  %20 = bitcast i64* %polly_launch_0_param_3 to i8*
  store i8* %20, i8** %19
  store i64 %tmp3, i64* %polly_launch_0_param_4
  %21 = getelementptr [12 x i8*], [12 x i8*]* %polly_launch_0_params, i64 0, i64 4
  %22 = bitcast i64* %polly_launch_0_param_4 to i8*
  store i8* %22, i8** %21
  store i64 1, i64* %polly_launch_0_param_5
  %23 = getelementptr [12 x i8*], [12 x i8*]* %polly_launch_0_params, i64 0, i64 5
  %24 = bitcast i64* %polly_launch_0_param_5 to i8*
  store i8* %24, i8** %23
  store i64 %tmp3, i64* %polly_launch_0_param_6
  %25 = getelementptr [12 x i8*], [12 x i8*]* %polly_launch_0_params, i64 0, i64 6
  %26 = bitcast i64* %polly_launch_0_param_6 to i8*
  store i8* %26, i8** %25
  store i64 %.load1, i64* %polly_launch_0_param_7
  %27 = getelementptr [12 x i8*], [12 x i8*]* %polly_launch_0_params, i64 0, i64 7
  %28 = bitcast i64* %polly_launch_0_param_7 to i8*
  store i8* %28, i8** %27
  store i64 %tmp6, i64* %polly_launch_0_param_8
  %29 = getelementptr [12 x i8*], [12 x i8*]* %polly_launch_0_params, i64 0, i64 8
  %30 = bitcast i64* %polly_launch_0_param_8 to i8*
  store i8* %30, i8** %29
  store i32* %.load, i32** %polly_launch_0_param_9
  %31 = getelementptr [12 x i8*], [12 x i8*]* %polly_launch_0_params, i64 0, i64 9
  %32 = bitcast i32** %polly_launch_0_param_9 to i8*
  store i8* %32, i8** %31
  store i64 %tmp1, i64* %polly_launch_0_param_10
  %33 = getelementptr [12 x i8*], [12 x i8*]* %polly_launch_0_params, i64 0, i64 10
  %34 = bitcast i64* %polly_launch_0_param_10 to i8*
  store i8* %34, i8** %33
  store i64 %tmp8, i64* %polly_launch_0_param_11
  %35 = getelementptr [12 x i8*], [12 x i8*]* %polly_launch_0_params, i64 0, i64 11
  %36 = bitcast i64* %polly_launch_0_param_11 to i8*
  store i8* %36, i8** %35
  %37 = call i8* @polly_getKernel(i8* getelementptr inbounds ([7874 x i8], [7874 x i8]* @FUNC___m_MOD_fn_SCOP_0_KERNEL_0, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @FUNC___m_MOD_fn_SCOP_0_KERNEL_0_name, i32 0, i32 0))
  call void @polly_launchKernel(i8* %37, i32 4, i32 1, i32 32, i32 1, i32 1, i8* %polly_launch_0_params_i8ptr)
  call void @polly_freeKernel(i8* %37)
  call void @polly_synchronizeDevice()
  call void @polly_freeContext(i8* %15)
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.acc.initialize
  br label %polly.merge_new_and_old
}

; Function Attrs: readnone
declare i64 @_gfortran_polly_array_index_1(i64, i64, i64) #1

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
  tail call void @_gfortran_set_options(i32 8, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @options.11.1612, i64 0, i64 0)) #2
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

!0 = distinct !{!0, !1, !"polly.alias.scope.MemRef___m_MOD_global_idx_array"}
!1 = distinct !{!1, !"polly.alias.scope.domain"}
!2 = !{!3, !4, !5}
!3 = distinct !{!3, !1, !"polly.alias.scope.MemRef_idx_array_data"}
!4 = distinct !{!4, !1, !"polly.alias.scope.MemRef_in_arr_data"}
!5 = distinct !{!5, !1, !"polly.alias.scope.MemRef_out_arr_data"}