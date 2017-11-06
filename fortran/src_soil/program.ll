; ModuleID = 'src_soil.o.bc'
source_filename = "<stdin>"
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

module asm "\09.ident\09\22GCC: (GNU) 4.6.4 LLVM: 3.3.1\22"

%0 = type { i32 }
%1 = type { i32 }
%2 = type { i32, i32, [5 x i32] }
%3 = type { [5 x i32], [1 x i32] }
%4 = type { [1 x [1 x i8]], [1 x [1 x i8]] }
%"struct.array3_real(kind=8)" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i64, i64, i64 }
%"struct.array2_real(kind=8)" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).0" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).1" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).2" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).3" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).4" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).5" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).6" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).7" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).8" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).9" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).10" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).11" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).12" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_logical(kind=4)" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=8).17" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=8).18" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=8).19" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=8).20" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=8).21" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=8).22" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=8).23" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).24" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=8).26" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).27" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).28" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).29" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).31" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).32" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).33" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).34" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).35" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).36" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).37" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).38" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).39" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).40" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).41" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).42" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=8).43" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=8).44" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).48" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array4_real(kind=8).49" = type { i8*, i64, i64, [4 x %struct.descriptor_dimension] }
%"struct.array4_real(kind=8).50" = type { i8*, i64, i64, [4 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=8).51" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).52" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=8).53" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=8).54" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array4_real(kind=8).55" = type { i8*, i64, i64, [4 x %struct.descriptor_dimension] }
%"struct.array4_real(kind=8).56" = type { i8*, i64, i64, [4 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).57" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).58" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).59" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).60" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).61" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).62" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).63" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).64" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=8).65" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=8).45" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array4_real(kind=8)" = type { i8*, i64, i64, [4 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=8).46" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=8).47" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }

@mpifcmb5_ = common unnamed_addr global %0 zeroinitializer, align 16
@mpifcmb9_ = common unnamed_addr global %1 zeroinitializer, align 16
@mpipriv1_ = common unnamed_addr global %2 zeroinitializer, align 16
@mpipriv2_ = common unnamed_addr global %3 zeroinitializer, align 16
@mpiprivc_ = common unnamed_addr global %4 zeroinitializer, align 16
@__src_soil_MOD_xtrang = unnamed_addr global %"struct.array3_real(kind=8)" zeroinitializer, align 32
@__src_soil_MOD_xth_low = unnamed_addr global %"struct.array2_real(kind=8)" zeroinitializer, align 32
@__src_soil_MOD_xrs = unnamed_addr global %"struct.array2_real(kind=8).0" zeroinitializer, align 32
@__src_soil_MOD_xrr = unnamed_addr global %"struct.array2_real(kind=8).1" zeroinitializer, align 32
@__src_soil_MOD_xrocs = unnamed_addr global %"struct.array2_real(kind=8).2" zeroinitializer, align 32
@__src_soil_MOD_xrocm = unnamed_addr global %"struct.array2_real(kind=8).3" zeroinitializer, align 32
@__src_soil_MOD_xrocg = unnamed_addr global %"struct.array2_real(kind=8).4" zeroinitializer, align 32
@__src_soil_MOD_xrhoch = unnamed_addr global %"struct.array2_real(kind=8).5" zeroinitializer, align 32
@__src_soil_MOD_xesoil = unnamed_addr global %"struct.array2_real(kind=8).6" zeroinitializer, align 32
@__src_soil_MOD_xdzs = unnamed_addr global %"struct.array2_real(kind=8).7" zeroinitializer, align 32
@__src_soil_MOD_xdwsndt = unnamed_addr global %"struct.array2_real(kind=8).8" zeroinitializer, align 32
@__src_soil_MOD_xdwidt = unnamed_addr global %"struct.array2_real(kind=8).9" zeroinitializer, align 32
@__src_soil_MOD_xdqvtsnow = unnamed_addr global %"struct.array2_real(kind=8).10" zeroinitializer, align 32
@__src_soil_MOD_xdqvts = unnamed_addr global %"struct.array2_real(kind=8).11" zeroinitializer, align 32
@__src_soil_MOD_xalam = unnamed_addr global %"struct.array2_real(kind=8).12" zeroinitializer, align 32
@__data_modelconfig_MOD_ie = external global i32
@__data_modelconfig_MOD_je = external global i32
@__data_runcontrol_MOD_l2tls = external global i32
@__data_runcontrol_MOD_nnow = external global i32
@__data_modelconfig_MOD_dt = external global double
@__data_runcontrol_MOD_nold = external global i32
@__data_modelconfig_MOD_dt2 = external global double
@__data_modelconfig_MOD_istartpar = external global i32
@__data_modelconfig_MOD_iendpar = external global i32
@__data_modelconfig_MOD_jstartpar = external global i32
@__data_modelconfig_MOD_jendpar = external global i32
@__data_runcontrol_MOD_nlgw = external global i32
@__data_soil_MOD_ctau1 = external global double
@__data_soil_MOD_ctau2 = external global double
@__data_constants_MOD_pi = external global double
@__data_soil_MOD_cdzw12 = external global double
@__data_soil_MOD_cdzw22 = external global double
@__data_soil_MOD_cdzw13 = external global double
@__data_soil_MOD_cdzw23 = external global double
@__data_soil_MOD_cdzw33 = external global double
@__data_constants_MOD_rho_w = external global double
@__data_soil_MOD_ctau_i = external global double
@__data_fields_MOD_llandmask = external global %"struct.array2_logical(kind=4)"
@__data_fields_MOD_t_s = external global %"struct.array3_real(kind=8).17"
@__data_constants_MOD_t0_melt = external global double
@__data_fields_MOD_t_m = external global %"struct.array3_real(kind=8).18"
@__data_fields_MOD_t_snow = external global %"struct.array3_real(kind=8).19"
@__data_fields_MOD_w_snow = external global %"struct.array3_real(kind=8).20"
@__data_fields_MOD_w_i = external global %"struct.array3_real(kind=8).21"
@__data_fields_MOD_w_g1 = external global %"struct.array3_real(kind=8).22"
@__data_fields_MOD_w_g2 = external global %"struct.array3_real(kind=8).23"
@__data_fields_MOD_w_cl = external global %"struct.array2_real(kind=8).24"
@__data_fields_MOD_w_g3 = external global %"struct.array3_real(kind=8).26"
@__data_fields_MOD_soiltyp = external global %"struct.array2_real(kind=8).27"
@__data_soil_MOD_cdz1 = external global [10 x double]
@__data_soil_MOD_cporv = external global [10 x double]
@__data_soil_MOD_cadp = external global [10 x double]
@__data_soil_MOD_cfcap = external global [10 x double]
@__data_soil_MOD_crock = external global [10 x double]
@__data_soil_MOD_cdw0 = external global [10 x double]
@__data_soil_MOD_cdw1 = external global [10 x double]
@__data_soil_MOD_ckw0 = external global [10 x double]
@__data_soil_MOD_ckw1 = external global [10 x double]
@__data_soil_MOD_cik2 = external global [10 x double]
@__data_fields_MOD_fr_snow = external global %"struct.array2_real(kind=8).28"
@__data_soil_MOD_ctalb = external global double
@__data_constants_MOD_sigma = external global double
@__data_fields_MOD_thbs = external global %"struct.array2_real(kind=8).29"
@__data_fields_MOD_prr_con = external global %"struct.array2_real(kind=8).31"
@__data_fields_MOD_prr_gsp = external global %"struct.array2_real(kind=8).32"
@__data_runcontrol_MOD_itype_gscp = external global i32
@__data_fields_MOD_prs_con = external global %"struct.array2_real(kind=8).33"
@__data_fields_MOD_prs_gsp = external global %"struct.array2_real(kind=8).34"
@__data_fields_MOD_prg_gsp = external global %"struct.array2_real(kind=8).35"
@__data_fields_MOD_prh_gsp = external global %"struct.array2_real(kind=8).36"
@__data_fields_MOD_plcov = external global %"struct.array2_real(kind=8).37"
@__data_soil_MOD_csvoro = external global double
@__data_soil_MOD_cik1 = external global double
@__data_soil_MOD_cwimax = external global double
@__data_fields_MOD_runoff_s = external global %"struct.array2_real(kind=8).38"
@__data_soil_MOD_cakw = external global double
@__data_fields_MOD_runoff_g = external global %"struct.array2_real(kind=8).39"
@__data_fields_MOD_t_cl = external global %"struct.array2_real(kind=8).40"
@__data_fields_MOD_sobs = external global %"struct.array2_real(kind=8).41"
@__data_constants_MOD_cp_d = external global double
@__data_constants_MOD_lh_v = external global double
@__data_constants_MOD_lh_s = external global double
@__data_constants_MOD_lh_f = external global double
@__data_soil_MOD_calasmax = external global double
@__data_soil_MOD_calas_dw = external global double
@__data_soil_MOD_calasmin = external global double
@__data_fields_MOD_snow_melt = external global %"struct.array2_real(kind=8).42"
@__data_runcontrol_MOD_nnew = external global i32
@__data_fields_MOD_t_g = external global %"struct.array3_real(kind=8).43"
@__data_soil_MOD_cf_snow = external global double
@qv.2641 = internal global %"struct.array3_real(kind=8).44" zeroinitializer, align 32
@.cst = private unnamed_addr constant [6 x i8] c"terra1", align 8
@__data_modelconfig_MOD_idt_qv = external global i32
@__data_parallel_MOD_my_cart_id = external global i32
@__data_soil_MOD_cdsmin = external global double
@__data_soil_MOD_cpwp = external global [10 x double]
@__data_soil_MOD_crhoc = external global [10 x double]
@__data_soil_MOD_cala1 = external global [10 x double]
@__data_soil_MOD_cala0 = external global [10 x double]
@__data_soil_MOD_ck0di = external global [10 x double]
@__data_soil_MOD_cbedi = external global [10 x double]
@__data_fields_MOD_rootdp = external global %"struct.array2_real(kind=8).48"
@__data_runcontrol_MOD_ntstep = external global i32
@__data_runcontrol_MOD_nstart = external global i32
@__data_soil_MOD_chc_w = external global double
@__data_soil_MOD_ckrdi = external global double
@__data_soil_MOD_clgk0 = external global [10 x double]
@__data_soil_MOD_lsoilinit_dfi = external global i32
@__data_fields_MOD_u = external global %"struct.array4_real(kind=8).49"
@__data_modelconfig_MOD_ke = external global i32
@__data_fields_MOD_v = external global %"struct.array4_real(kind=8).50"
@__data_fields_MOD_qv_s = external global %"struct.array3_real(kind=8).51"
@__data_constants_MOD_rvd_m_o = external global double
@__data_fields_MOD_tch = external global %"struct.array2_real(kind=8).52"
@__data_constants_MOD_g = external global double
@__data_fields_MOD_ps = external global %"struct.array3_real(kind=8).53"
@__data_constants_MOD_r_d = external global double
@__data_fields_MOD_p0 = external global %"struct.array3_real(kind=8).54"
@__data_fields_MOD_pp = external global %"struct.array4_real(kind=8).55"
@__data_fields_MOD_t = external global %"struct.array4_real(kind=8).56"
@__data_constants_MOD_rdocp = external global double
@__data_constants_MOD_b2w = external global double
@__data_constants_MOD_b2i = external global double
@__data_constants_MOD_b4w = external global double
@__data_constants_MOD_b4i = external global double
@__data_constants_MOD_b3 = external global double
@__data_constants_MOD_b1 = external global double
@__data_constants_MOD_rdv = external global double
@__data_constants_MOD_o_m_rdv = external global double
@__data_fields_MOD_tfv = external global %"struct.array2_real(kind=8).57"
@__data_soil_MOD_cf_w = external global double
@__data_fields_MOD_fr_wi = external global %"struct.array2_real(kind=8).58"
@__data_soil_MOD_crhosmax = external global double
@__data_soil_MOD_crhos_dw = external global double
@__data_soil_MOD_crhosmin = external global double
@__data_soil_MOD_chc_i = external global double
@__data_runcontrol_MOD_itype_evsl = external global i32
@__data_fields_MOD_eai = external global %"struct.array2_real(kind=8).59"
@__data_fields_MOD_sai = external global %"struct.array2_real(kind=8).60"
@__data_soil_MOD_cfinull = external global double
@__data_soil_MOD_crhowm = external global double
@__data_soil_MOD_cdmin = external global double
@__data_runcontrol_MOD_itype_trvg = external global i32
@__data_fields_MOD_tai = external global %"struct.array2_real(kind=8).61"
@__data_fields_MOD_ustar_fv = external global %"struct.array2_real(kind=8).62"
@__data_fields_MOD_tcm = external global %"struct.array2_real(kind=8).63"
@__data_runcontrol_MOD_itype_tran = external global i32
@__data_soil_MOD_cdash = external global double
@__data_fields_MOD_pabs = external global %"struct.array2_real(kind=8).64"
@__data_soil_MOD_cparcrit = external global double
@__data_soil_MOD_ctend = external global double
@__data_soil_MOD_crsmax = external global double
@__data_soil_MOD_crsmin = external global double
@__data_fields_MOD_rstom = external global %"struct.array2_real(kind=8).65"

; Function Attrs: nounwind uwtable
define void @__src_soil_MOD_terra2() unnamed_addr #0 {
entry:
  %iends = alloca i32, align 4
  %istarts = alloca i32, align 4
  %jends = alloca i32, align 4
  %jstarts = alloca i32, align 4
  %zdzwg = alloca [4 x double], align 8
  %zdzwsu157 = alloca [4 x double], align 8
  %znlgw1f = alloca [3 x double], align 8
  br label %entry.split

entry.split:                                      ; preds = %entry
  %znlgw1f198 = bitcast [3 x double]* %znlgw1f to i8*
  %zdzwsu157.sub = getelementptr inbounds [4 x double], [4 x double]* %zdzwsu157, i64 0, i64 0
  %0 = load i32, i32* @__data_modelconfig_MOD_ie, align 4, !tbaa !0
  %1 = sext i32 %0 to i64
  %2 = icmp sgt i64 %1, 0
  %3 = select i1 %2, i64 %1, i64 0
  %4 = load i32, i32* @__data_modelconfig_MOD_je, align 4, !tbaa !0
  %5 = sext i32 %4 to i64
  %6 = mul nsw i64 %3, %5
  %7 = icmp slt i64 %6, 0
  %.op = shl i64 %6, 2
  %8 = select i1 %7, i64 0, i64 %.op
  %9 = icmp ne i64 %8, 0
  %10 = select i1 %9, i64 %8, i64 1
  %11 = tail call noalias i8* @malloc(i64 %10) #1
  %not = xor i64 %3, -1
  %.op123 = shl i64 %6, 3
  %12 = select i1 %7, i64 0, i64 %.op123
  %13 = icmp ne i64 %12, 0
  %14 = select i1 %13, i64 %12, i64 1
  %15 = tail call noalias i8* @malloc(i64 %14) #1
  %16 = tail call noalias i8* @malloc(i64 %14) #1
  %17 = tail call noalias i8* @malloc(i64 %14) #1
  %18 = tail call noalias i8* @malloc(i64 %14) #1
  %19 = tail call noalias i8* @malloc(i64 %14) #1
  %20 = tail call noalias i8* @malloc(i64 %14) #1
  %21 = select i1 %7, i64 0, i64 %6
  %22 = mul nsw i64 %21, 3
  %23 = mul i64 %21, 24
  %24 = icmp ne i64 %23, 0
  %25 = select i1 %24, i64 %23, i64 1
  %26 = tail call noalias i8* @malloc(i64 %25) #1
  %27 = sub nuw nsw i64 %not, %21
  %28 = tail call noalias i8* @malloc(i64 %14) #1
  %29 = tail call noalias i8* @malloc(i64 %14) #1
  %30 = tail call noalias i8* @malloc(i64 %14) #1
  %31 = shl i64 %21, 5
  %32 = icmp ne i64 %31, 0
  %33 = select i1 %32, i64 %31, i64 1
  %34 = tail call noalias i8* @malloc(i64 %33) #1
  %35 = tail call noalias i8* @malloc(i64 %14) #1
  %36 = tail call noalias i8* @malloc(i64 %14) #1
  %37 = tail call noalias i8* @malloc(i64 %14) #1
  %38 = tail call noalias i8* @malloc(i64 %14) #1
  %39 = tail call noalias i8* @malloc(i64 %14) #1
  %40 = tail call noalias i8* @malloc(i64 %14) #1
  %41 = tail call noalias i8* @malloc(i64 %14) #1
  %42 = tail call noalias i8* @malloc(i64 %14) #1
  %43 = tail call noalias i8* @malloc(i64 %14) #1
  %44 = tail call noalias i8* @malloc(i64 %14) #1
  %45 = tail call noalias i8* @malloc(i64 %14) #1
  %46 = tail call noalias i8* @malloc(i64 %14) #1
  %47 = tail call noalias i8* @malloc(i64 %14) #1
  %48 = tail call noalias i8* @malloc(i64 %14) #1
  %49 = tail call noalias i8* @malloc(i64 %14) #1
  %50 = tail call noalias i8* @malloc(i64 %14) #1
  %51 = tail call noalias i8* @malloc(i64 %14) #1
  %52 = tail call noalias i8* @malloc(i64 %14) #1
  %53 = tail call noalias i8* @malloc(i64 %14) #1
  %54 = shl i64 %21, 2
  %55 = tail call noalias i8* @malloc(i64 %33) #1
  %56 = tail call noalias i8* @malloc(i64 %14) #1
  %57 = tail call noalias i8* @malloc(i64 %14) #1
  %58 = tail call noalias i8* @malloc(i64 %14) #1
  %59 = tail call noalias i8* @malloc(i64 %14) #1
  %60 = load i32, i32* @__data_runcontrol_MOD_l2tls, align 4, !tbaa !3, !range !5
  %61 = icmp eq i32 %60, 0
  %__data_modelconfig_MOD_dt2.val = load double, double* @__data_modelconfig_MOD_dt2, align 8
  %__data_modelconfig_MOD_dt.val = load double, double* @__data_modelconfig_MOD_dt, align 8
  %62 = select i1 %61, double %__data_modelconfig_MOD_dt2.val, double %__data_modelconfig_MOD_dt.val
  %__data_runcontrol_MOD_nold.val = load i32, i32* @__data_runcontrol_MOD_nold, align 4
  %__data_runcontrol_MOD_nnow.val = load i32, i32* @__data_runcontrol_MOD_nnow, align 4
  %63 = select i1 %61, i32 %__data_runcontrol_MOD_nold.val, i32 %__data_runcontrol_MOD_nnow.val
  %64 = load i32, i32* @__data_modelconfig_MOD_istartpar, align 4, !tbaa !0
  store i32 %64, i32* %istarts, align 4, !tbaa !0
  %65 = load i32, i32* @__data_modelconfig_MOD_iendpar, align 4, !tbaa !0
  store i32 %65, i32* %iends, align 4, !tbaa !0
  %66 = load i32, i32* @__data_modelconfig_MOD_jstartpar, align 4, !tbaa !0
  store i32 %66, i32* %jstarts, align 4, !tbaa !0
  %67 = load i32, i32* @__data_modelconfig_MOD_jendpar, align 4, !tbaa !0
  store i32 %67, i32* %jends, align 4, !tbaa !0
  %68 = fdiv double 1.000000e+00, %62
  %69 = load i32, i32* @__data_runcontrol_MOD_nlgw, align 4, !tbaa !0
  %70 = load double, double* @__data_soil_MOD_ctau1, align 8, !tbaa !6
  %71 = load double, double* @__data_soil_MOD_ctau2, align 8, !tbaa !6
  %72 = fdiv double %70, %71
  %73 = tail call double @sqrt(double %72) #2
  %74 = load double, double* @__data_constants_MOD_pi, align 8, !tbaa !6
  %75 = fmul double %74, 2.000000e+00
  %76 = fmul double %70, 8.640000e+04
  %77 = fdiv double %75, %76
  %78 = fadd double %73, 1.000000e+00
  %79 = fmul double %73, %73
  %80 = fadd double %78, %79
  %81 = fadd double %79, 1.000000e+00
  %82 = tail call double @sqrt(double %81) #2
  %83 = fdiv double %73, %78
  %84 = tail call double @exp(double %83) #2
  %85 = fmul double %82, %84
  %86 = fmul double %73, %82
  %87 = fsub double -0.000000e+00, %83
  %88 = tail call double @exp(double %87) #2
  %89 = fmul double %86, %88
  %90 = fdiv double %80, %89
  %91 = fadd double %90, -1.000000e+00
  %92 = fmul double %77, 5.000000e-01
  %93 = tail call double @sqrt(double %92) #2
  %94 = fdiv double %93, %78
  %95 = fmul double %73, %94
  %96 = fmul double %73, %95
  %97 = fdiv double %96, %89
  %98 = fsub double %80, %89
  %99 = fmul double %98, %94
  %100 = fsub double %85, %73
  %101 = fmul double %100, %94
  %102 = icmp eq i32 %69, 2
  br i1 %102, label %"8", label %"9"

"8":                                              ; preds = %entry.split
  %103 = load i64, i64* bitcast (double* @__data_soil_MOD_cdzw12 to i64*), align 8, !tbaa !6
  %104 = bitcast [4 x double]* %zdzwg to i64*
  store i64 %103, i64* %104, align 8, !tbaa !6
  br label %"10"

"9":                                              ; preds = %entry.split
  %105 = load i64, i64* bitcast (double* @__data_soil_MOD_cdzw13 to i64*), align 8, !tbaa !6
  %106 = bitcast [4 x double]* %zdzwg to i64*
  store i64 %105, i64* %106, align 8, !tbaa !6
  %107 = load i64, i64* bitcast (double* @__data_soil_MOD_cdzw23 to i64*), align 8, !tbaa !6
  %108 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 1
  %109 = bitcast double* %108 to i64*
  store i64 %107, i64* %109, align 8, !tbaa !6
  br label %"10"

"10":                                             ; preds = %"9", %"8"
  %.sink4 = phi i64* [ bitcast (double* @__data_soil_MOD_cdzw33 to i64*), %"9" ], [ bitcast (double* @__data_soil_MOD_cdzw22 to i64*), %"8" ]
  %.sink3 = phi i64 [ 2, %"9" ], [ 1, %"8" ]
  %110 = load i64, i64* %.sink4, align 8, !tbaa !6
  %111 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 %.sink3
  %112 = bitcast double* %111 to i64*
  store i64 %110, i64* %112, align 8, !tbaa !6
  %113 = add i32 %69, 1
  %114 = sext i32 %113 to i64
  %115 = add nsw i64 %114, -1
  %116 = sext i32 %69 to i64
  %117 = add nsw i64 %116, -1
  %118 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 0
  %119 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 %117
  %120 = load double, double* %119, align 8, !tbaa !6
  %121 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 %115
  store double %120, double* %121, align 8, !tbaa !6
  %122 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %123 = fdiv double %62, %122
  %124 = fdiv double %122, %62
  %125 = fmul double %62, 5.000000e-01
  %126 = load double, double* @__data_soil_MOD_ctau_i, align 8, !tbaa !6
  %127 = fcmp ogt double %62, %126
  %128 = fcmp uno double %126, 0.000000e+00
  %129 = or i1 %127, %128
  %. = select i1 %129, double %62, double %126
  store double %., double* @__data_soil_MOD_ctau_i, align 8, !tbaa !6
  %130 = load double, double* %118, align 8, !tbaa !6
  %131 = fmul double %130, 5.000000e-01
  store double %131, double* %zdzwsu157.sub, align 8, !tbaa !6
  %132 = icmp sgt i32 %69, 0
  br i1 %132, label %"13.preheader", label %"16"

"13.preheader":                                   ; preds = %"10"
  %133 = add i32 %69, -1
  %134 = zext i32 %133 to i64
  %135 = shl nuw nsw i64 %134, 3
  %136 = add nuw nsw i64 %135, 8
  call void @llvm.memset.p0i8.i64(i8* %znlgw1f198, i8 0, i64 %136, i32 8, i1 false)
  br label %"13"

"13":                                             ; preds = %"15", %"13.preheader"
  %indvars.iv194 = phi i64 [ 1, %"13.preheader" ], [ %indvars.iv.next195.pre-phi, %"15" ]
  %137 = add nsw i64 %indvars.iv194, -1
  %138 = trunc i64 %indvars.iv194 to i32
  %139 = icmp sgt i32 %69, %138
  br i1 %139, label %"14", label %"15"

"14":                                             ; preds = %"13"
  %140 = getelementptr inbounds [4 x double], [4 x double]* %zdzwsu157, i64 0, i64 %137
  %141 = load double, double* %140, align 8, !tbaa !6
  %142 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 %137
  %143 = load double, double* %142, align 8, !tbaa !6
  %144 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 %indvars.iv194
  %145 = load double, double* %144, align 8, !tbaa !6
  %146 = fadd double %143, %145
  %147 = fmul double %146, 5.000000e-01
  %148 = fadd double %141, %147
  %149 = getelementptr inbounds [4 x double], [4 x double]* %zdzwsu157, i64 0, i64 %indvars.iv194
  store double %148, double* %149, align 8, !tbaa !6
  br label %"15"

"15":                                             ; preds = %"14", %"13"
  %indvars.iv.next195.pre-phi = add nuw nsw i64 %indvars.iv194, 1
  %lftr.wideiv20 = trunc i64 %indvars.iv.next195.pre-phi to i32
  %exitcond21 = icmp eq i32 %lftr.wideiv20, %113
  br i1 %exitcond21, label %"16.loopexit", label %"13"

"16.loopexit":                                    ; preds = %"15"
  br label %"16"

"16":                                             ; preds = %"16.loopexit", %"10"
  %150 = getelementptr inbounds [4 x double], [4 x double]* %zdzwsu157, i64 0, i64 %117
  %151 = load double, double* %150, align 8, !tbaa !6
  %152 = fmul double %120, 5.000000e-01
  %153 = fadd double %152, %151
  %154 = getelementptr inbounds [4 x double], [4 x double]* %zdzwsu157, i64 0, i64 %115
  store double %153, double* %154, align 8, !tbaa !6
  %155 = getelementptr inbounds [3 x double], [3 x double]* %znlgw1f, i64 0, i64 0
  store double 1.000000e+00, double* %155, align 8, !tbaa !6
  %156 = icmp sgt i32 %66, %67
  br i1 %156, label %"77", label %"17.preheader"

"17.preheader":                                   ; preds = %"16"
  %157 = icmp sgt i32 %64, %65
  %158 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %159 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %160 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %161 = load double*, double** bitcast (%"struct.array3_real(kind=8).17"* @__data_fields_MOD_t_s to double**), align 8, !tbaa !8
  %162 = sext i32 %63 to i64
  %163 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).17", %"struct.array3_real(kind=8).17"* @__data_fields_MOD_t_s, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %164 = mul nsw i64 %163, %162
  %165 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).17", %"struct.array3_real(kind=8).17"* @__data_fields_MOD_t_s, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %166 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).17", %"struct.array3_real(kind=8).17"* @__data_fields_MOD_t_s, i64 0, i32 1), align 8, !tbaa !10
  %167 = bitcast i8* %46 to double*
  %168 = load double, double* @__data_constants_MOD_t0_melt, align 8, !tbaa !6
  %169 = bitcast i8* %47 to double*
  %170 = load double*, double** bitcast (%"struct.array3_real(kind=8).18"* @__data_fields_MOD_t_m to double**), align 8, !tbaa !8
  %171 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).18", %"struct.array3_real(kind=8).18"* @__data_fields_MOD_t_m, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %172 = mul nsw i64 %171, %162
  %173 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).18", %"struct.array3_real(kind=8).18"* @__data_fields_MOD_t_m, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %174 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).18", %"struct.array3_real(kind=8).18"* @__data_fields_MOD_t_m, i64 0, i32 1), align 8, !tbaa !10
  %175 = bitcast i8* %45 to double*
  %176 = load double*, double** bitcast (%"struct.array3_real(kind=8).19"* @__data_fields_MOD_t_snow to double**), align 8, !tbaa !8
  %177 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).19", %"struct.array3_real(kind=8).19"* @__data_fields_MOD_t_snow, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %178 = mul nsw i64 %177, %162
  %179 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).19", %"struct.array3_real(kind=8).19"* @__data_fields_MOD_t_snow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %180 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).19", %"struct.array3_real(kind=8).19"* @__data_fields_MOD_t_snow, i64 0, i32 1), align 8, !tbaa !10
  %181 = bitcast i8* %49 to double*
  %182 = bitcast i8* %50 to double*
  %183 = load double*, double** bitcast (%"struct.array3_real(kind=8).20"* @__data_fields_MOD_w_snow to double**), align 8, !tbaa !8
  %184 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).20", %"struct.array3_real(kind=8).20"* @__data_fields_MOD_w_snow, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %185 = mul nsw i64 %184, %162
  %186 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).20", %"struct.array3_real(kind=8).20"* @__data_fields_MOD_w_snow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %187 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).20", %"struct.array3_real(kind=8).20"* @__data_fields_MOD_w_snow, i64 0, i32 1), align 8, !tbaa !10
  %188 = bitcast i8* %59 to double*
  %189 = load double*, double** bitcast (%"struct.array3_real(kind=8).21"* @__data_fields_MOD_w_i to double**), align 8, !tbaa !8
  %190 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).21", %"struct.array3_real(kind=8).21"* @__data_fields_MOD_w_i, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %191 = mul nsw i64 %190, %162
  %192 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).21", %"struct.array3_real(kind=8).21"* @__data_fields_MOD_w_i, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %193 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).21", %"struct.array3_real(kind=8).21"* @__data_fields_MOD_w_i, i64 0, i32 1), align 8, !tbaa !10
  %194 = bitcast i8* %56 to double*
  %195 = load double*, double** bitcast (%"struct.array3_real(kind=8).22"* @__data_fields_MOD_w_g1 to double**), align 8, !tbaa !8
  %196 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).22", %"struct.array3_real(kind=8).22"* @__data_fields_MOD_w_g1, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %197 = mul nsw i64 %196, %162
  %198 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).22", %"struct.array3_real(kind=8).22"* @__data_fields_MOD_w_g1, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %199 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).22", %"struct.array3_real(kind=8).22"* @__data_fields_MOD_w_g1, i64 0, i32 1), align 8, !tbaa !10
  %200 = bitcast i8* %55 to double*
  %201 = shl nuw i64 %21, 1
  %202 = add i64 %27, %201
  %203 = load double*, double** bitcast (%"struct.array3_real(kind=8).23"* @__data_fields_MOD_w_g2 to double**), align 8, !tbaa !8
  %204 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).23", %"struct.array3_real(kind=8).23"* @__data_fields_MOD_w_g2, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %205 = mul nsw i64 %204, %162
  %206 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).23", %"struct.array3_real(kind=8).23"* @__data_fields_MOD_w_g2, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %207 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).23", %"struct.array3_real(kind=8).23"* @__data_fields_MOD_w_g2, i64 0, i32 1), align 8, !tbaa !10
  %208 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 1
  %209 = load double, double* %208, align 8, !tbaa !6
  %210 = add nsw i64 %27, %22
  %211 = load double*, double** bitcast (%"struct.array2_real(kind=8).24"* @__data_fields_MOD_w_cl to double**), align 8, !tbaa !8
  %212 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).24", %"struct.array2_real(kind=8).24"* @__data_fields_MOD_w_cl, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %213 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).24", %"struct.array2_real(kind=8).24"* @__data_fields_MOD_w_cl, i64 0, i32 1), align 8, !tbaa !10
  %214 = load double*, double** bitcast (%"struct.array2_real(kind=8).27"* @__data_fields_MOD_soiltyp to double**), align 8, !tbaa !8
  %215 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).27", %"struct.array2_real(kind=8).27"* @__data_fields_MOD_soiltyp, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %216 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).27", %"struct.array2_real(kind=8).27"* @__data_fields_MOD_soiltyp, i64 0, i32 1), align 8, !tbaa !10
  %217 = bitcast i8* %11 to i32*
  %218 = bitcast i8* %28 to double*
  %219 = bitcast i8* %29 to double*
  %220 = bitcast i8* %39 to double*
  %221 = bitcast i8* %15 to double*
  %222 = bitcast i8* %30 to double*
  %223 = bitcast i8* %40 to double*
  %224 = bitcast i8* %19 to double*
  %225 = bitcast i8* %20 to double*
  %226 = bitcast i8* %37 to double*
  %227 = bitcast i8* %38 to double*
  %228 = bitcast i8* %35 to double*
  %229 = load double*, double** bitcast (%"struct.array3_real(kind=8).26"* @__data_fields_MOD_w_g3 to double**), align 8, !tbaa !8
  %230 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).26", %"struct.array3_real(kind=8).26"* @__data_fields_MOD_w_g3, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %231 = mul nsw i64 %230, %162
  %232 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).26", %"struct.array3_real(kind=8).26"* @__data_fields_MOD_w_g3, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %233 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).26", %"struct.array3_real(kind=8).26"* @__data_fields_MOD_w_g3, i64 0, i32 1), align 8, !tbaa !10
  %234 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 2
  %235 = load double, double* %234, align 8, !tbaa !6
  %236 = add i64 %27, %54
  %237 = sext i32 %64 to i64
  %238 = sext i32 %66 to i64
  br label %"17"

"17":                                             ; preds = %"24", %"17.preheader"
  %indvars.iv192 = phi i64 [ %238, %"17.preheader" ], [ %indvars.iv.next193, %"24" ]
  br i1 %157, label %"24", label %"18.preheader"

"18.preheader":                                   ; preds = %"17"
  %239 = mul nsw i64 %indvars.iv192, %159
  %240 = mul nsw i64 %indvars.iv192, %3
  %241 = add i64 %240, %not
  %242 = mul nsw i64 %indvars.iv192, %165
  %243 = mul nsw i64 %indvars.iv192, %173
  %244 = mul nsw i64 %indvars.iv192, %179
  %245 = mul nsw i64 %indvars.iv192, %186
  %246 = mul nsw i64 %indvars.iv192, %192
  %247 = mul nsw i64 %indvars.iv192, %198
  %248 = add i64 %202, %240
  %249 = mul nsw i64 %indvars.iv192, %206
  %250 = add i64 %210, %240
  %251 = mul nsw i64 %indvars.iv192, %212
  %252 = mul nsw i64 %indvars.iv192, %215
  %253 = mul nsw i64 %indvars.iv192, %232
  %254 = add i64 %236, %240
  br label %"18"

"18":                                             ; preds = %"23", %"18.preheader"
  %indvars.iv190 = phi i64 [ %237, %"18.preheader" ], [ %indvars.iv.next191, %"23" ]
  %255 = add i64 %239, %160
  %256 = add i64 %255, %indvars.iv190
  %257 = getelementptr inbounds i32, i32* %158, i64 %256
  %258 = load i32, i32* %257, align 4, !tbaa !3, !range !5
  %259 = icmp eq i32 %258, 0
  br i1 %259, label %"23", label %"19"

"19":                                             ; preds = %"18"
  %260 = add i64 %241, %indvars.iv190
  %261 = add i64 %166, %164
  %262 = add i64 %261, %242
  %263 = add i64 %262, %indvars.iv190
  %264 = getelementptr inbounds double, double* %161, i64 %263
  %265 = load double, double* %264, align 8, !tbaa !6
  %266 = getelementptr inbounds double, double* %167, i64 %260
  store double %265, double* %266, align 8, !tbaa !6
  %267 = fsub double %265, %168
  %268 = tail call double @copysign(double 5.000000e-01, double %267) #2
  %269 = fadd double %268, 5.000000e-01
  %270 = getelementptr inbounds double, double* %169, i64 %260
  store double %269, double* %270, align 8, !tbaa !6
  %271 = add i64 %174, %172
  %272 = add i64 %271, %243
  %273 = add i64 %272, %indvars.iv190
  %274 = getelementptr inbounds double, double* %170, i64 %273
  %275 = bitcast double* %274 to i64*
  %276 = load i64, i64* %275, align 8, !tbaa !6
  %277 = getelementptr inbounds double, double* %175, i64 %260
  %278 = bitcast double* %277 to i64*
  store i64 %276, i64* %278, align 8, !tbaa !6
  %279 = add i64 %180, %178
  %280 = add i64 %279, %244
  %281 = add i64 %280, %indvars.iv190
  %282 = getelementptr inbounds double, double* %176, i64 %281
  %283 = load double, double* %282, align 8, !tbaa !6
  %284 = getelementptr inbounds double, double* %181, i64 %260
  store double %283, double* %284, align 8, !tbaa !6
  %285 = fsub double %283, %168
  %286 = tail call double @copysign(double 5.000000e-01, double %285) #2
  %287 = fadd double %286, 5.000000e-01
  %288 = getelementptr inbounds double, double* %182, i64 %260
  store double %287, double* %288, align 8, !tbaa !6
  %289 = add i64 %187, %185
  %290 = add i64 %289, %245
  %291 = add i64 %290, %indvars.iv190
  %292 = getelementptr inbounds double, double* %183, i64 %291
  %293 = bitcast double* %292 to i64*
  %294 = load i64, i64* %293, align 8, !tbaa !6
  %295 = getelementptr inbounds double, double* %188, i64 %260
  %296 = bitcast double* %295 to i64*
  store i64 %294, i64* %296, align 8, !tbaa !6
  %297 = add i64 %193, %191
  %298 = add i64 %297, %246
  %299 = add i64 %298, %indvars.iv190
  %300 = getelementptr inbounds double, double* %189, i64 %299
  %301 = bitcast double* %300 to i64*
  %302 = load i64, i64* %301, align 8, !tbaa !6
  %303 = getelementptr inbounds double, double* %194, i64 %260
  %304 = bitcast double* %303 to i64*
  store i64 %302, i64* %304, align 8, !tbaa !6
  %305 = add i64 %199, %197
  %306 = add i64 %305, %247
  %307 = add i64 %306, %indvars.iv190
  %308 = getelementptr inbounds double, double* %195, i64 %307
  %309 = load double, double* %308, align 8, !tbaa !6
  %310 = fdiv double %309, %130
  %311 = getelementptr inbounds double, double* %200, i64 %260
  store double %310, double* %311, align 8, !tbaa !6
  %312 = add i64 %248, %indvars.iv190
  %313 = add i64 %207, %205
  %314 = add i64 %313, %249
  %315 = add i64 %314, %indvars.iv190
  %316 = getelementptr inbounds double, double* %203, i64 %315
  %317 = load double, double* %316, align 8, !tbaa !6
  %318 = fdiv double %317, %209
  %319 = getelementptr inbounds double, double* %200, i64 %312
  store double %318, double* %319, align 8, !tbaa !6
  %320 = add i64 %250, %indvars.iv190
  br i1 %102, label %"22", label %"21"

"21":                                             ; preds = %"19"
  %321 = add i64 %233, %231
  %322 = add i64 %321, %253
  %323 = add i64 %322, %indvars.iv190
  %324 = getelementptr inbounds double, double* %229, i64 %323
  %325 = load double, double* %324, align 8, !tbaa !6
  %326 = fdiv double %325, %235
  %327 = getelementptr inbounds double, double* %200, i64 %320
  store double %326, double* %327, align 8, !tbaa !6
  %328 = add i64 %254, %indvars.iv190
  br label %"22"

"22":                                             ; preds = %"19", %"21"
  %.sink8 = phi double [ %235, %"21" ], [ %209, %"19" ]
  %.sink6 = phi i64 [ %328, %"21" ], [ %320, %"19" ]
  %329 = add i64 %251, %213
  %330 = add i64 %329, %indvars.iv190
  %331 = getelementptr inbounds double, double* %211, i64 %330
  %332 = load double, double* %331, align 8, !tbaa !6
  %333 = fdiv double %332, %.sink8
  %334 = getelementptr inbounds double, double* %200, i64 %.sink6
  store double %333, double* %334, align 8, !tbaa !6
  %335 = add i64 %252, %216
  %336 = add i64 %335, %indvars.iv190
  %337 = getelementptr inbounds double, double* %214, i64 %336
  %338 = load double, double* %337, align 8, !tbaa !6
  %339 = tail call i64 @lround(double %338) #2
  %340 = trunc i64 %339 to i32
  %341 = getelementptr inbounds i32, i32* %217, i64 %260
  store i32 %340, i32* %341, align 4, !tbaa !0
  %sext = shl i64 %339, 32
  %342 = ashr exact i64 %sext, 32
  %343 = add nsw i64 %342, -1
  %344 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cdz1, i64 0, i64 %343
  %345 = load double, double* %344, align 8, !tbaa !6
  %346 = getelementptr inbounds double, double* %218, i64 %260
  store double %345, double* %346, align 8, !tbaa !6
  %347 = fmul double %91, %345
  %348 = getelementptr inbounds double, double* %219, i64 %260
  store double %347, double* %348, align 8, !tbaa !6
  %349 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cporv, i64 0, i64 %343
  %350 = bitcast double* %349 to i64*
  %351 = load i64, i64* %350, align 8, !tbaa !6
  %352 = getelementptr inbounds double, double* %220, i64 %260
  %353 = bitcast double* %352 to i64*
  store i64 %351, i64* %353, align 8, !tbaa !6
  %354 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cadp, i64 0, i64 %343
  %355 = bitcast double* %354 to i64*
  %356 = load i64, i64* %355, align 8, !tbaa !6
  %357 = getelementptr inbounds double, double* %221, i64 %260
  %358 = bitcast double* %357 to i64*
  store i64 %356, i64* %358, align 8, !tbaa !6
  %359 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cfcap, i64 0, i64 %343
  %360 = bitcast double* %359 to i64*
  %361 = load i64, i64* %360, align 8, !tbaa !6
  %362 = getelementptr inbounds double, double* %222, i64 %260
  %363 = bitcast double* %362 to i64*
  store i64 %361, i64* %363, align 8, !tbaa !6
  %364 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_crock, i64 0, i64 %343
  %365 = bitcast double* %364 to i64*
  %366 = load i64, i64* %365, align 8, !tbaa !6
  %367 = getelementptr inbounds double, double* %223, i64 %260
  %368 = bitcast double* %367 to i64*
  store i64 %366, i64* %368, align 8, !tbaa !6
  %369 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cdw0, i64 0, i64 %343
  %370 = bitcast double* %369 to i64*
  %371 = load i64, i64* %370, align 8, !tbaa !6
  %372 = getelementptr inbounds double, double* %224, i64 %260
  %373 = bitcast double* %372 to i64*
  store i64 %371, i64* %373, align 8, !tbaa !6
  %374 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cdw1, i64 0, i64 %343
  %375 = bitcast double* %374 to i64*
  %376 = load i64, i64* %375, align 8, !tbaa !6
  %377 = getelementptr inbounds double, double* %225, i64 %260
  %378 = bitcast double* %377 to i64*
  store i64 %376, i64* %378, align 8, !tbaa !6
  %379 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_ckw0, i64 0, i64 %343
  %380 = bitcast double* %379 to i64*
  %381 = load i64, i64* %380, align 8, !tbaa !6
  %382 = getelementptr inbounds double, double* %226, i64 %260
  %383 = bitcast double* %382 to i64*
  store i64 %381, i64* %383, align 8, !tbaa !6
  %384 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_ckw1, i64 0, i64 %343
  %385 = bitcast double* %384 to i64*
  %386 = load i64, i64* %385, align 8, !tbaa !6
  %387 = getelementptr inbounds double, double* %227, i64 %260
  %388 = bitcast double* %387 to i64*
  store i64 %386, i64* %388, align 8, !tbaa !6
  %389 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cik2, i64 0, i64 %343
  %390 = bitcast double* %389 to i64*
  %391 = load i64, i64* %390, align 8, !tbaa !6
  %392 = getelementptr inbounds double, double* %228, i64 %260
  %393 = bitcast double* %392 to i64*
  store i64 %391, i64* %393, align 8, !tbaa !6
  br label %"23"

"23":                                             ; preds = %"22", %"18"
  %394 = trunc i64 %indvars.iv190 to i32
  %395 = icmp eq i32 %65, %394
  %indvars.iv.next191 = add nsw i64 %indvars.iv190, 1
  br i1 %395, label %"24.loopexit", label %"18"

"24.loopexit":                                    ; preds = %"23"
  br label %"24"

"24":                                             ; preds = %"24.loopexit", %"17"
  %396 = trunc i64 %indvars.iv192 to i32
  %397 = icmp eq i32 %67, %396
  %indvars.iv.next193 = add nsw i64 %indvars.iv192, 1
  br i1 %397, label %"25", label %"17"

"25":                                             ; preds = %"24"
  br i1 %156, label %"77", label %"26.preheader"

"26.preheader":                                   ; preds = %"25"
  %398 = load i32, i32* %istarts, align 4, !tbaa !0
  %399 = load i32, i32* %iends, align 4, !tbaa !0
  %400 = icmp sgt i32 %398, %399
  %401 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %402 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %403 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %404 = load double*, double** bitcast (%"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow to double**), align 8, !tbaa !8
  %405 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).28", %"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %406 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).28", %"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow, i64 0, i32 1), align 8, !tbaa !10
  %407 = bitcast i8* %46 to double*
  %408 = bitcast i8* %49 to double*
  %409 = load double, double* @__data_soil_MOD_ctalb, align 8, !tbaa !6
  %410 = fsub double 1.000000e+00, %409
  %411 = load double, double* @__data_constants_MOD_sigma, align 8, !tbaa !6
  %412 = fmul double %410, %411
  %413 = load double*, double** bitcast (%"struct.array2_real(kind=8).29"* @__data_fields_MOD_thbs to double**), align 8, !tbaa !8
  %414 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).29", %"struct.array2_real(kind=8).29"* @__data_fields_MOD_thbs, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %415 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).29", %"struct.array2_real(kind=8).29"* @__data_fields_MOD_thbs, i64 0, i32 1), align 8, !tbaa !10
  %416 = bitcast i8* %43 to double*
  %417 = bitcast i8* %44 to double*
  %418 = sext i32 %398 to i64
  %419 = sext i32 %66 to i64
  br label %"26"

"26":                                             ; preds = %"30", %"26.preheader"
  %indvars.iv188 = phi i64 [ %419, %"26.preheader" ], [ %indvars.iv.next189, %"30" ]
  br i1 %400, label %"30", label %"27.preheader"

"27.preheader":                                   ; preds = %"26"
  %420 = mul nsw i64 %indvars.iv188, %402
  %421 = mul nsw i64 %indvars.iv188, %405
  %422 = mul nsw i64 %indvars.iv188, %3
  %423 = add i64 %422, %not
  %424 = mul nsw i64 %indvars.iv188, %414
  br label %"27"

"27":                                             ; preds = %"29", %"27.preheader"
  %indvars.iv186 = phi i64 [ %418, %"27.preheader" ], [ %indvars.iv.next187, %"29" ]
  %425 = add i64 %420, %403
  %426 = add i64 %425, %indvars.iv186
  %427 = getelementptr inbounds i32, i32* %401, i64 %426
  %428 = load i32, i32* %427, align 4, !tbaa !3, !range !5
  %429 = icmp eq i32 %428, 0
  br i1 %429, label %"29", label %"28"

"28":                                             ; preds = %"27"
  %430 = add i64 %421, %406
  %431 = add i64 %430, %indvars.iv186
  %432 = getelementptr inbounds double, double* %404, i64 %431
  %433 = load double, double* %432, align 8, !tbaa !6
  %434 = fsub double 1.000000e+00, %433
  %435 = add i64 %423, %indvars.iv186
  %436 = getelementptr inbounds double, double* %407, i64 %435
  %437 = load double, double* %436, align 8, !tbaa !6
  %438 = fmul double %434, %437
  %439 = getelementptr inbounds double, double* %408, i64 %435
  %440 = load double, double* %439, align 8, !tbaa !6
  %441 = fmul double %433, %440
  %442 = fadd double %438, %441
  %443 = tail call double @llvm.powi.f64(double %442, i32 4)
  %444 = fmul double %412, %443
  %445 = fsub double -0.000000e+00, %444
  %446 = add i64 %424, %415
  %447 = add i64 %446, %indvars.iv186
  %448 = getelementptr inbounds double, double* %413, i64 %447
  %449 = load double, double* %448, align 8, !tbaa !6
  %450 = fsub double %445, %449
  %451 = tail call double @llvm.powi.f64(double %440, i32 4)
  %452 = fmul double %412, %451
  %453 = fsub double -0.000000e+00, %452
  %454 = fsub double %453, %450
  %455 = getelementptr inbounds double, double* %416, i64 %435
  store double %454, double* %455, align 8, !tbaa !6
  %456 = tail call double @llvm.powi.f64(double %437, i32 4)
  %457 = fmul double %412, %456
  %458 = fsub double -0.000000e+00, %457
  %459 = fsub double %458, %450
  %460 = getelementptr inbounds double, double* %417, i64 %435
  store double %459, double* %460, align 8, !tbaa !6
  br label %"29"

"29":                                             ; preds = %"28", %"27"
  %461 = trunc i64 %indvars.iv186 to i32
  %462 = icmp eq i32 %399, %461
  %indvars.iv.next187 = add nsw i64 %indvars.iv186, 1
  br i1 %462, label %"30.loopexit", label %"27"

"30.loopexit":                                    ; preds = %"29"
  br label %"30"

"30":                                             ; preds = %"30.loopexit", %"26"
  %463 = trunc i64 %indvars.iv188 to i32
  %464 = icmp eq i32 %67, %463
  %indvars.iv.next189 = add nsw i64 %indvars.iv188, 1
  br i1 %464, label %"31", label %"26"

"31":                                             ; preds = %"30"
  br i1 %156, label %"77", label %"32.preheader"

"32.preheader":                                   ; preds = %"31"
  %465 = load i32, i32* %istarts, align 4, !tbaa !0
  %466 = load i32, i32* %iends, align 4, !tbaa !0
  %467 = icmp sgt i32 %465, %466
  %468 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %469 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %470 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %471 = load double*, double** bitcast (%"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt to double**), align 32, !tbaa !8
  %472 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %473 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 1), align 8, !tbaa !10
  %474 = load double*, double** bitcast (%"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil to double**), align 32, !tbaa !8
  %475 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %476 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 1), align 8, !tbaa !10
  %477 = load double*, double** bitcast (%"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang to double**), align 32, !tbaa !8
  %478 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %479 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %480 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 1), align 8, !tbaa !10
  %481 = shl i64 %479, 1
  %482 = mul nsw i64 %479, 3
  %483 = load double*, double** bitcast (%"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow to double**), align 8, !tbaa !8
  %484 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).28", %"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %485 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).28", %"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow, i64 0, i32 1), align 8, !tbaa !10
  %486 = load double*, double** bitcast (%"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr to double**), align 32, !tbaa !8
  %487 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %488 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 1), align 8, !tbaa !10
  %489 = load double*, double** bitcast (%"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs to double**), align 32, !tbaa !8
  %490 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %491 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 1), align 8, !tbaa !10
  %492 = bitcast i8* %52 to double*
  %493 = bitcast i8* %59 to double*
  %494 = load double*, double** bitcast (%"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt to double**), align 32, !tbaa !8
  %495 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %496 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 1), align 8, !tbaa !10
  %497 = bitcast i8* %53 to double*
  %498 = load double*, double** bitcast (%"struct.array2_real(kind=8).31"* @__data_fields_MOD_prr_con to double**), align 8, !tbaa !8
  %499 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).31", %"struct.array2_real(kind=8).31"* @__data_fields_MOD_prr_con, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %500 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).31", %"struct.array2_real(kind=8).31"* @__data_fields_MOD_prr_con, i64 0, i32 1), align 8, !tbaa !10
  %501 = load double*, double** bitcast (%"struct.array2_real(kind=8).32"* @__data_fields_MOD_prr_gsp to double**), align 8, !tbaa !8
  %502 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).32", %"struct.array2_real(kind=8).32"* @__data_fields_MOD_prr_gsp, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %503 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).32", %"struct.array2_real(kind=8).32"* @__data_fields_MOD_prr_gsp, i64 0, i32 1), align 8, !tbaa !10
  %504 = load i32, i32* @__data_runcontrol_MOD_itype_gscp, align 4, !tbaa !0
  %505 = icmp sgt i32 %504, 1999
  %506 = load double*, double** bitcast (%"struct.array2_real(kind=8).33"* @__data_fields_MOD_prs_con to double**), align 8, !tbaa !8
  %507 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).33", %"struct.array2_real(kind=8).33"* @__data_fields_MOD_prs_con, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %508 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).33", %"struct.array2_real(kind=8).33"* @__data_fields_MOD_prs_con, i64 0, i32 1), align 8, !tbaa !10
  %509 = load double*, double** bitcast (%"struct.array2_real(kind=8).34"* @__data_fields_MOD_prs_gsp to double**), align 8, !tbaa !8
  %510 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).34", %"struct.array2_real(kind=8).34"* @__data_fields_MOD_prs_gsp, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %511 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).34", %"struct.array2_real(kind=8).34"* @__data_fields_MOD_prs_gsp, i64 0, i32 1), align 8, !tbaa !10
  %512 = load double*, double** bitcast (%"struct.array2_real(kind=8).35"* @__data_fields_MOD_prg_gsp to double**), align 8, !tbaa !8
  %513 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).35", %"struct.array2_real(kind=8).35"* @__data_fields_MOD_prg_gsp, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %514 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).35", %"struct.array2_real(kind=8).35"* @__data_fields_MOD_prg_gsp, i64 0, i32 1), align 8, !tbaa !10
  %515 = load double*, double** bitcast (%"struct.array2_real(kind=8).36"* @__data_fields_MOD_prh_gsp to double**), align 8, !tbaa !8
  %516 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).36", %"struct.array2_real(kind=8).36"* @__data_fields_MOD_prh_gsp, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %517 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).36", %"struct.array2_real(kind=8).36"* @__data_fields_MOD_prh_gsp, i64 0, i32 1), align 8, !tbaa !10
  %518 = bitcast i8* %56 to double*
  %519 = load double*, double** bitcast (%"struct.array2_real(kind=8).37"* @__data_fields_MOD_plcov to double**), align 8, !tbaa !8
  %520 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).37", %"struct.array2_real(kind=8).37"* @__data_fields_MOD_plcov, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %521 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).37", %"struct.array2_real(kind=8).37"* @__data_fields_MOD_plcov, i64 0, i32 1), align 8, !tbaa !10
  %522 = bitcast i8* %39 to double*
  %523 = bitcast i8* %55 to double*
  %524 = bitcast i8* %40 to double*
  %525 = bitcast i8* %47 to double*
  %526 = bitcast i8* %35 to double*
  %527 = bitcast i8* %36 to double*
  %528 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).38", %"struct.array2_real(kind=8).38"* @__data_fields_MOD_runoff_s, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %529 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).38", %"struct.array2_real(kind=8).38"* @__data_fields_MOD_runoff_s, i64 0, i32 1), align 8, !tbaa !10
  %530 = load double*, double** bitcast (%"struct.array2_real(kind=8).38"* @__data_fields_MOD_runoff_s to double**), align 8, !tbaa !8
  %531 = bitcast i8* %34 to double*
  %532 = bitcast i8* %42 to double*
  %533 = bitcast i8* %41 to double*
  %534 = icmp sgt i32 %504, 3
  %535 = sext i32 %465 to i64
  %536 = sext i32 %66 to i64
  br label %"32"

"32":                                             ; preds = %"76", %"32.preheader"
  %indvars.iv184 = phi i64 [ %536, %"32.preheader" ], [ %indvars.iv.next185, %"76" ]
  br i1 %467, label %"76", label %"33.preheader"

"33.preheader":                                   ; preds = %"32"
  %537 = mul nsw i64 %indvars.iv184, %469
  %538 = mul nsw i64 %indvars.iv184, %3
  %539 = add i64 %538, %not
  %540 = mul nsw i64 %indvars.iv184, %472
  %541 = mul nsw i64 %indvars.iv184, %475
  %542 = mul nsw i64 %indvars.iv184, %478
  %543 = mul nsw i64 %indvars.iv184, %484
  %544 = mul nsw i64 %indvars.iv184, %487
  %545 = mul nsw i64 %indvars.iv184, %490
  %546 = mul nsw i64 %indvars.iv184, %495
  %547 = mul nsw i64 %indvars.iv184, %499
  %548 = mul nsw i64 %indvars.iv184, %502
  %549 = mul nsw i64 %indvars.iv184, %507
  %550 = mul nsw i64 %indvars.iv184, %510
  %551 = mul nsw i64 %indvars.iv184, %513
  %552 = mul nsw i64 %indvars.iv184, %516
  %553 = mul nsw i64 %indvars.iv184, %520
  %554 = mul nsw i64 %indvars.iv184, %528
  br label %"33"

"33":                                             ; preds = %"75", %"33.preheader"
  %indvars.iv182 = phi i64 [ %535, %"33.preheader" ], [ %indvars.iv.next183, %"75" ]
  %555 = add i64 %537, %470
  %556 = add i64 %555, %indvars.iv182
  %557 = getelementptr inbounds i32, i32* %468, i64 %556
  %558 = load i32, i32* %557, align 4, !tbaa !3, !range !5
  %559 = icmp eq i32 %558, 0
  br i1 %559, label %"75", label %"34"

"34":                                             ; preds = %"33"
  %560 = add i64 %539, %indvars.iv182
  %561 = add i64 %540, %473
  %562 = add i64 %561, %indvars.iv182
  %563 = getelementptr inbounds double, double* %471, i64 %562
  %564 = load double, double* %563, align 8, !tbaa !6
  %565 = add i64 %541, %476
  %566 = add i64 %565, %indvars.iv182
  %567 = getelementptr inbounds double, double* %474, i64 %566
  %568 = load double, double* %567, align 8, !tbaa !6
  %569 = fadd double %564, %568
  %570 = add i64 %indvars.iv182, %542
  %571 = add i64 %480, %479
  %572 = add i64 %571, %570
  %573 = getelementptr inbounds double, double* %477, i64 %572
  %574 = load double, double* %573, align 8, !tbaa !6
  %575 = fadd double %569, %574
  %576 = add i64 %480, %481
  %577 = add i64 %576, %570
  %578 = getelementptr inbounds double, double* %477, i64 %577
  %579 = load double, double* %578, align 8, !tbaa !6
  %580 = fadd double %575, %579
  %581 = add i64 %480, %482
  %582 = add i64 %581, %570
  %583 = getelementptr inbounds double, double* %477, i64 %582
  %584 = load double, double* %583, align 8, !tbaa !6
  %585 = fadd double %580, %584
  %586 = add i64 %543, %485
  %587 = add i64 %586, %indvars.iv182
  %588 = getelementptr inbounds double, double* %483, i64 %587
  %589 = load double, double* %588, align 8, !tbaa !6
  %590 = fsub double 1.000000e+00, %589
  %591 = add i64 %544, %488
  %592 = add i64 %591, %indvars.iv182
  %593 = getelementptr inbounds double, double* %486, i64 %592
  %594 = load double, double* %593, align 8, !tbaa !6
  %595 = add i64 %545, %491
  %596 = add i64 %595, %indvars.iv182
  %597 = getelementptr inbounds double, double* %489, i64 %596
  %598 = load double, double* %597, align 8, !tbaa !6
  %599 = fadd double %594, %598
  %600 = fmul double %590, %599
  %601 = fadd double %585, %600
  %602 = getelementptr inbounds double, double* %492, i64 %560
  store double %601, double* %602, align 8, !tbaa !6
  %603 = getelementptr inbounds double, double* %493, i64 %560
  %604 = load double, double* %603, align 8, !tbaa !6
  %605 = fadd double %604, -1.000000e-06
  %606 = add i64 %546, %496
  %607 = add i64 %606, %indvars.iv182
  %608 = getelementptr inbounds double, double* %494, i64 %607
  %609 = load double, double* %608, align 8, !tbaa !6
  %610 = fadd double %598, %609
  %611 = tail call double @copysign(double 5.000000e-01, double %605) #2
  %612 = fadd double %611, 5.000000e-01
  %613 = fmul double %594, %612
  %614 = fadd double %610, %613
  %615 = getelementptr inbounds double, double* %497, i64 %560
  store double %614, double* %615, align 8, !tbaa !6
  %616 = add i64 %547, %500
  %617 = add i64 %616, %indvars.iv182
  %618 = getelementptr inbounds double, double* %498, i64 %617
  %619 = load double, double* %618, align 8, !tbaa !6
  %620 = fadd double %594, %619
  %621 = add i64 %548, %503
  %622 = add i64 %621, %indvars.iv182
  %623 = getelementptr inbounds double, double* %501, i64 %622
  %624 = load double, double* %623, align 8, !tbaa !6
  %625 = fadd double %620, %624
  store double %625, double* %593, align 8, !tbaa !6
  %626 = load double, double* %597, align 8, !tbaa !6
  %627 = add i64 %549, %508
  %628 = add i64 %627, %indvars.iv182
  %629 = getelementptr inbounds double, double* %506, i64 %628
  %630 = load double, double* %629, align 8, !tbaa !6
  %631 = fadd double %626, %630
  %632 = add i64 %550, %511
  %633 = add i64 %632, %indvars.iv182
  %634 = getelementptr inbounds double, double* %509, i64 %633
  %635 = load double, double* %634, align 8, !tbaa !6
  %636 = fadd double %631, %635
  br i1 %505, label %"35", label %"36"

"35":                                             ; preds = %"34"
  %637 = add i64 %551, %514
  %638 = add i64 %637, %indvars.iv182
  %639 = getelementptr inbounds double, double* %512, i64 %638
  %640 = load double, double* %639, align 8, !tbaa !6
  %641 = fadd double %636, %640
  br label %"39.sink.split"

"36":                                             ; preds = %"34"
  br i1 %534, label %"39.sink.split", label %"39"

"39.sink.split":                                  ; preds = %"36", %"35"
  %.sink17 = phi i64 [ %552, %"35" ], [ %551, %"36" ]
  %.sink16 = phi i64 [ %517, %"35" ], [ %514, %"36" ]
  %.sink13 = phi double* [ %515, %"35" ], [ %512, %"36" ]
  %.sink10 = phi double [ %641, %"35" ], [ %636, %"36" ]
  %642 = add nsw i64 %.sink17, %indvars.iv182
  %643 = add nsw i64 %642, %.sink16
  %644 = getelementptr inbounds double, double* %.sink13, i64 %643
  %645 = load double, double* %644, align 8, !tbaa !6
  %646 = fadd double %.sink10, %645
  br label %"39"

"39":                                             ; preds = %"39.sink.split", %"36"
  %.sink = phi double [ %636, %"36" ], [ %646, %"39.sink.split" ]
  store double %.sink, double* %597, align 8, !tbaa !6
  %647 = getelementptr inbounds double, double* %518, i64 %560
  %648 = load double, double* %647, align 8, !tbaa !6
  %649 = load double, double* %563, align 8, !tbaa !6
  %650 = fmul double %123, %649
  %651 = fadd double %648, %650
  %652 = fcmp ogt double %651, 0.000000e+00
  %.83 = select i1 %652, double %651, double 0.000000e+00
  %653 = add i64 %553, %521
  %654 = add i64 %653, %indvars.iv182
  %655 = getelementptr inbounds double, double* %519, i64 %654
  %656 = load double, double* %655, align 8, !tbaa !6
  %657 = fcmp ogt double %656, 5.000000e-01
  %658 = select i1 %657, double %656, double 5.000000e-01
  %659 = getelementptr inbounds double, double* %522, i64 %560
  %660 = load double, double* %659, align 8, !tbaa !6
  %661 = getelementptr inbounds double, double* %523, i64 %560
  %662 = load double, double* %661, align 8, !tbaa !6
  %663 = fsub double %660, %662
  %664 = fcmp ogt double %663, 0.000000e+00
  %.84 = select i1 %664, double %663, double 0.000000e+00
  %665 = getelementptr inbounds double, double* %524, i64 %560
  %666 = load double, double* %665, align 8, !tbaa !6
  %667 = getelementptr inbounds double, double* %525, i64 %560
  %668 = load double, double* %667, align 8, !tbaa !6
  %669 = fmul double %666, %668
  %670 = load double, double* @__data_soil_MOD_csvoro, align 8, !tbaa !6
  %671 = fmul double %669, %670
  %672 = load double, double* @__data_soil_MOD_cik1, align 8, !tbaa !6
  %673 = fmul double %658, %672
  %674 = fmul double %.84, %673
  %675 = fdiv double %674, %660
  %676 = getelementptr inbounds double, double* %526, i64 %560
  %677 = load double, double* %676, align 8, !tbaa !6
  %678 = fadd double %677, %675
  %679 = fmul double %671, %678
  %680 = fmul double %656, 5.000000e+00
  %681 = fadd double %680, 1.000000e+00
  %682 = load double, double* @__data_soil_MOD_cwimax, align 8, !tbaa !6
  %683 = fmul double %681, %682
  %684 = fdiv double %.83, %683
  %685 = fsub double 1.000000e+00, %684
  %686 = fcmp ogt double %685, 0.000000e+00
  %687 = select i1 %686, double %685, double 0.000000e+00
  %688 = tail call double @sqrt(double %687) #2
  %689 = fmul double %.83, %668
  %690 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %691 = fmul double %689, %690
  %692 = load double, double* @__data_soil_MOD_ctau_i, align 8, !tbaa !6
  %693 = fdiv double %691, %692
  %694 = load double, double* %593, align 8, !tbaa !6
  %695 = fadd double %694, -1.000000e-06
  %696 = fcmp ogt double %695, 0.000000e+00
  br i1 %696, label %"48", label %"58"

"48":                                             ; preds = %"39"
  %697 = fsub double %683, %.83
  %698 = fcmp ogt double %697, 0.000000e+00
  %.85 = select i1 %698, double %697, double 0.000000e+00
  %699 = fmul double %124, %.85
  %700 = fadd double %693, %699
  %701 = fdiv double %700, %694
  %702 = fcmp ogt double %701, %688
  %703 = fcmp uno double %688, 0.000000e+00
  %704 = or i1 %703, %702
  %705 = select i1 %704, double %701, double %688
  %706 = fcmp olt double %705, 1.000000e+00
  %.86 = select i1 %706, double %705, double 1.000000e+00
  %707 = fcmp ogt double %.86, 1.000000e-02
  %708 = select i1 %707, double %.86, double 1.000000e-02
  %709 = fmul double %668, %708
  %710 = fsub double 1.000000e+00, %668
  %711 = fadd double %710, %709
  %712 = fcmp ogt double %604, 0.000000e+00
  %.87 = select i1 %712, double 0.000000e+00, double %711
  br label %"58"

"58":                                             ; preds = %"48", %"39"
  %713 = phi double [ %688, %"39" ], [ %.87, %"48" ]
  %714 = fsub double 1.000000e+00, %713
  %715 = fmul double %694, %714
  %716 = fadd double %693, %715
  %717 = fcmp olt double %716, %679
  %718 = fcmp uno double %679, 0.000000e+00
  %719 = or i1 %718, %717
  %.88 = select i1 %719, double %716, double %679
  %720 = getelementptr inbounds double, double* %527, i64 %560
  store double %.88, double* %720, align 8, !tbaa !6
  %721 = fsub double %716, %.88
  %722 = fcmp ogt double %721, 0.000000e+00
  %723 = select i1 %722, double %721, double 0.000000e+00
  %724 = add i64 %554, %529
  %725 = add i64 %724, %indvars.iv182
  %726 = getelementptr inbounds double, double* %530, i64 %725
  %727 = load double, double* %726, align 8, !tbaa !6
  %728 = fmul double %125, %723
  %729 = fadd double %727, %728
  store double %729, double* %726, align 8, !tbaa !6
  %730 = fsub double -0.000000e+00, %.88
  %731 = getelementptr inbounds double, double* %531, i64 %560
  store double %730, double* %731, align 8, !tbaa !6
  %732 = load double, double* %597, align 8, !tbaa !6
  %733 = load double, double* %608, align 8, !tbaa !6
  %734 = fadd double %732, %733
  %735 = fmul double %123, %734
  %736 = fadd double %604, %735
  %737 = fcmp ogt double %736, 0.000000e+00
  %.89 = select i1 %737, double %736, double 0.000000e+00
  %738 = fcmp olt double %.89, 1.000000e-06
  %or.cond = and i1 %737, %738
  br i1 %or.cond, label %"66", label %"67"

"66":                                             ; preds = %"58"
  %739 = fmul double %124, %.89
  %740 = fmul double %125, %739
  %741 = fadd double %729, %740
  store double %741, double* %726, align 8, !tbaa !6
  %742 = fadd double %604, -1.000000e-07
  %743 = tail call double @copysign(double 5.000000e-01, double %742) #2
  %744 = fadd double %743, 5.000000e-01
  %745 = fmul double %604, %744
  %746 = fmul double %124, %745
  %747 = fsub double -0.000000e+00, %746
  br label %"67"

"67":                                             ; preds = %"66", %"58"
  %748 = phi double [ %747, %"66" ], [ %734, %"58" ]
  store double %748, double* %608, align 8, !tbaa !6
  %749 = load double, double* %593, align 8, !tbaa !6
  %750 = load double, double* %563, align 8, !tbaa !6
  %751 = fadd double %749, %750
  %752 = fsub double %751, %.88
  %753 = fsub double %752, %723
  %754 = fmul double %123, %753
  %755 = fadd double %648, %754
  %756 = fcmp ogt double %755, 0.000000e+00
  %.91 = select i1 %756, double %755, double 0.000000e+00
  %757 = fcmp olt double %.91, 1.000000e-06
  %or.cond93 = and i1 %756, %757
  br i1 %or.cond93, label %"71", label %"72"

"71":                                             ; preds = %"67"
  %758 = fmul double %124, %.91
  %759 = load double, double* %726, align 8, !tbaa !6
  %760 = fmul double %125, %758
  %761 = fadd double %760, %759
  store double %761, double* %726, align 8, !tbaa !6
  %762 = fadd double %648, -1.000000e-07
  %763 = tail call double @copysign(double 5.000000e-01, double %762) #2
  %764 = fadd double %763, 5.000000e-01
  %765 = fmul double %648, %764
  %766 = fmul double %124, %765
  %767 = fsub double -0.000000e+00, %766
  br label %"72"

"72":                                             ; preds = %"71", %"67"
  %768 = phi double [ %767, %"71" ], [ %753, %"67" ]
  %769 = phi double [ 0.000000e+00, %"71" ], [ %.91, %"67" ]
  %770 = fsub double %769, %683
  %771 = fcmp ogt double %770, 0.000000e+00
  %.94 = select i1 %771, double %770, double 0.000000e+00
  %772 = fmul double %124, %668
  %773 = fmul double %772, %.94
  %774 = fsub double %768, %773
  store double %774, double* %563, align 8, !tbaa !6
  %775 = load double, double* %726, align 8, !tbaa !6
  %776 = fmul double %125, %773
  %777 = fadd double %775, %776
  store double %777, double* %726, align 8, !tbaa !6
  %778 = getelementptr inbounds double, double* %532, i64 %560
  store double 0.000000e+00, double* %778, align 8, !tbaa !6
  %779 = getelementptr inbounds double, double* %533, i64 %560
  store double 0.000000e+00, double* %779, align 8, !tbaa !6
  br label %"75"

"75":                                             ; preds = %"72", %"33"
  %780 = trunc i64 %indvars.iv182 to i32
  %781 = icmp eq i32 %466, %780
  %indvars.iv.next183 = add nsw i64 %indvars.iv182, 1
  br i1 %781, label %"76.loopexit", label %"33"

"76.loopexit":                                    ; preds = %"75"
  br label %"76"

"76":                                             ; preds = %"76.loopexit", %"32"
  %782 = trunc i64 %indvars.iv184 to i32
  %783 = icmp eq i32 %67, %782
  %indvars.iv.next185 = add nsw i64 %indvars.iv184, 1
  br i1 %783, label %"77.loopexit", label %"32"

"77.loopexit":                                    ; preds = %"76"
  br label %"77"

"77":                                             ; preds = %"77.loopexit", %"31", %"25", %"16"
  br i1 %132, label %"78.preheader", label %"111"

"78.preheader":                                   ; preds = %"77"
  %784 = sitofp i32 %69 to double
  %785 = load i32, i32* %istarts, align 4, !tbaa !0
  %786 = load i32, i32* %iends, align 4, !tbaa !0
  %787 = icmp sgt i32 %785, %786
  %788 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %789 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %790 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %791 = bitcast i8* %26 to double*
  %792 = bitcast i8* %34 to double*
  %793 = bitcast i8* %11 to i32*
  %794 = bitcast i8* %45 to double*
  %795 = bitcast i8* %55 to double*
  %796 = bitcast i8* %19 to double*
  %797 = bitcast i8* %20 to double*
  %798 = bitcast i8* %39 to double*
  %799 = bitcast i8* %15 to double*
  %800 = bitcast i8* %37 to double*
  %801 = bitcast i8* %38 to double*
  %802 = bitcast i8* %40 to double*
  %803 = shl nuw i64 %21, 1
  %804 = add i64 %27, %803
  %805 = bitcast i8* %36 to double*
  %806 = fmul double %124, 1.000000e-01
  %807 = mul nsw i64 %21, %114
  %808 = bitcast i8* %30 to double*
  %809 = load double*, double** bitcast (%"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil to double**), align 32, !tbaa !8
  %810 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %811 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 1), align 8, !tbaa !10
  %812 = load double*, double** bitcast (%"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang to double**), align 32, !tbaa !8
  %813 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %814 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %815 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 1), align 8, !tbaa !10
  %816 = bitcast i8* %42 to double*
  %817 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).38", %"struct.array2_real(kind=8).38"* @__data_fields_MOD_runoff_s, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %818 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).38", %"struct.array2_real(kind=8).38"* @__data_fields_MOD_runoff_s, i64 0, i32 1), align 8, !tbaa !10
  %819 = load double*, double** bitcast (%"struct.array2_real(kind=8).38"* @__data_fields_MOD_runoff_s to double**), align 8, !tbaa !8
  %820 = bitcast i8* %41 to double*
  %821 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).39", %"struct.array2_real(kind=8).39"* @__data_fields_MOD_runoff_g, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %822 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).39", %"struct.array2_real(kind=8).39"* @__data_fields_MOD_runoff_g, i64 0, i32 1), align 8, !tbaa !10
  %823 = load double*, double** bitcast (%"struct.array2_real(kind=8).39"* @__data_fields_MOD_runoff_g to double**), align 8, !tbaa !8
  %824 = sext i32 %785 to i64
  %825 = sext i32 %66 to i64
  br label %"78"

"78":                                             ; preds = %"110", %"78.preheader"
  %indvars.iv180 = phi i64 [ 1, %"78.preheader" ], [ %indvars.iv.next181.pre-phi, %"110" ]
  %826 = trunc i64 %indvars.iv180 to i32
  %827 = sitofp i32 %826 to double
  %828 = fsub double 5.000000e-01, %827
  %829 = tail call double @copysign(double 5.000000e-01, double %828) #2
  %830 = fadd double %829, 5.000000e-01
  %831 = fsub double 1.000000e+00, %830
  %832 = fadd double %827, 5.000000e-01
  %833 = fsub double %832, %784
  %834 = tail call double @copysign(double 5.000000e-01, double %833) #2
  %835 = fadd double %834, 5.000000e-01
  br i1 %156, label %"78.110_crit_edge", label %"79.preheader"

"78.110_crit_edge":                               ; preds = %"78"
  %indvars.iv.next181.pre = add i64 %indvars.iv180, 1
  br label %"110"

"79.preheader":                                   ; preds = %"78"
  %836 = mul nsw i64 %indvars.iv180, %21
  %837 = add i64 %836, %27
  %838 = add nsw i64 %indvars.iv180, 1
  %839 = mul nsw i64 %838, %21
  %840 = add i64 %839, %27
  %841 = add nsw i64 %indvars.iv180, -1
  %842 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 %841
  %843 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 %indvars.iv180
  %844 = icmp eq i32 %826, 1
  %845 = getelementptr inbounds [3 x double], [3 x double]* %znlgw1f, i64 0, i64 %841
  %846 = mul nsw i64 %indvars.iv180, %813
  br label %"79"

"79":                                             ; preds = %"109", %"79.preheader"
  %indvars.iv178 = phi i64 [ %825, %"79.preheader" ], [ %indvars.iv.next179, %"109" ]
  br i1 %787, label %"109", label %"80.preheader"

"80.preheader":                                   ; preds = %"79"
  %847 = mul nsw i64 %indvars.iv178, %789
  %848 = mul nsw i64 %indvars.iv178, %3
  %849 = add i64 %837, %848
  %850 = add i64 %840, %848
  %851 = add i64 %848, %not
  %852 = add i64 %804, %848
  %853 = mul nsw i64 %indvars.iv178, %810
  %854 = mul nsw i64 %indvars.iv178, %814
  %855 = mul nsw i64 %indvars.iv178, %817
  %856 = mul nsw i64 %indvars.iv178, %821
  br label %"80"

"80":                                             ; preds = %"108", %"80.preheader"
  %indvars.iv176 = phi i64 [ %824, %"80.preheader" ], [ %indvars.iv.next177, %"108" ]
  %857 = add i64 %847, %790
  %858 = add i64 %857, %indvars.iv176
  %859 = getelementptr inbounds i32, i32* %788, i64 %858
  %860 = load i32, i32* %859, align 4, !tbaa !3, !range !5
  %861 = icmp eq i32 %860, 0
  br i1 %861, label %"108", label %"81"

"81":                                             ; preds = %"80"
  %862 = add i64 %849, %indvars.iv176
  %863 = getelementptr inbounds double, double* %791, i64 %862
  store double 0.000000e+00, double* %863, align 8, !tbaa !6
  %864 = add i64 %850, %indvars.iv176
  %865 = getelementptr inbounds double, double* %792, i64 %864
  store double 0.000000e+00, double* %865, align 8, !tbaa !6
  %866 = add i64 %851, %indvars.iv176
  %867 = getelementptr inbounds i32, i32* %793, i64 %866
  %868 = load i32, i32* %867, align 4, !tbaa !0
  %869 = icmp sgt i32 %868, 2
  br i1 %869, label %"82", label %"108"

"82":                                             ; preds = %"81"
  %870 = getelementptr inbounds double, double* %794, i64 %866
  %871 = load double, double* @__data_constants_MOD_t0_melt, align 8, !tbaa !6
  %872 = load double, double* %870, align 8, !tbaa !6
  %873 = fsub double %872, %871
  %874 = tail call double @copysign(double 5.000000e-01, double %873) #2
  %875 = fadd double %874, 5.000000e-01
  %876 = getelementptr inbounds double, double* %795, i64 %862
  %877 = load double, double* %876, align 8, !tbaa !6
  %878 = getelementptr inbounds double, double* %795, i64 %864
  %879 = load double, double* %878, align 8, !tbaa !6
  %880 = fcmp olt double %879, %877
  %881 = fcmp uno double %877, 0.000000e+00
  %882 = or i1 %881, %880
  %.95 = select i1 %882, double %879, double %877
  %883 = fcmp ogt double %879, %877
  %884 = or i1 %881, %883
  %885 = select i1 %884, double %879, double %877
  %886 = getelementptr inbounds double, double* %796, i64 %866
  %887 = load double, double* %886, align 8, !tbaa !6
  %888 = getelementptr inbounds double, double* %797, i64 %866
  %889 = load double, double* %888, align 8, !tbaa !6
  %890 = getelementptr inbounds double, double* %798, i64 %866
  %891 = load double, double* %890, align 8, !tbaa !6
  %892 = load double, double* @__data_soil_MOD_cakw, align 8, !tbaa !6
  %893 = fmul double %.95, %892
  %894 = fsub double %891, %893
  %895 = fsub double 1.000000e+00, %892
  %896 = fmul double %885, %895
  %897 = fsub double %894, %896
  %898 = fmul double %889, %897
  %899 = getelementptr inbounds double, double* %799, i64 %866
  %900 = load double, double* %899, align 8, !tbaa !6
  %901 = fsub double %891, %900
  %902 = fdiv double %898, %901
  %903 = tail call double @exp(double %902) #2
  %904 = fmul double %887, %903
  %905 = getelementptr inbounds double, double* %800, i64 %866
  %906 = load double, double* %905, align 8, !tbaa !6
  %907 = getelementptr inbounds double, double* %801, i64 %866
  %908 = load double, double* %907, align 8, !tbaa !6
  %909 = fmul double %897, %908
  %910 = fdiv double %909, %901
  %911 = tail call double @exp(double %910) #2
  %912 = fmul double %906, %911
  %913 = getelementptr inbounds double, double* %802, i64 %866
  %914 = load double, double* %913, align 8, !tbaa !6
  %915 = fmul double %875, %914
  %916 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %917 = fmul double %915, %916
  %918 = fsub double %879, %877
  %919 = fmul double %918, %904
  %920 = load double, double* %842, align 8, !tbaa !6
  %921 = load double, double* %843, align 8, !tbaa !6
  %922 = fadd double %920, %921
  %923 = fmul double %922, 5.000000e-01
  %924 = fdiv double %919, %923
  %925 = fsub double %924, %912
  %926 = fmul double %917, %925
  store double %926, double* %865, align 8, !tbaa !6
  br i1 %844, label %"87", label %"97.critedge"

"87":                                             ; preds = %"82"
  %927 = add i64 %indvars.iv176, %852
  %928 = getelementptr inbounds double, double* %792, i64 %927
  %929 = load double, double* %928, align 8, !tbaa !6
  %930 = fcmp olt double %929, 0.000000e+00
  br i1 %930, label %"88", label %"92"

"88":                                             ; preds = %"87"
  %931 = getelementptr inbounds double, double* %805, i64 %866
  %932 = load double, double* %931, align 8, !tbaa !6
  %933 = fcmp ogt double %932, 0.000000e+00
  br i1 %933, label %"89", label %"92"

"89":                                             ; preds = %"88"
  %934 = fsub double -0.000000e+00, %932
  %935 = fcmp olt double %929, %934
  %936 = fcmp uno double %929, 0.000000e+00
  %937 = or i1 %936, %935
  %.96 = select i1 %937, double %934, double %929
  store double %.96, double* %928, align 8, !tbaa !6
  %.pre208 = load double, double* %865, align 8, !tbaa !6
  br label %"92"

"92":                                             ; preds = %"89", %"88", %"87"
  %938 = phi double [ %.pre208, %"89" ], [ %926, %"88" ], [ %926, %"87" ]
  %939 = fmul double %806, %920
  %940 = fmul double %891, %939
  %941 = fsub double -0.000000e+00, %940
  %942 = fcmp olt double %938, %941
  %943 = fcmp uno double %938, 0.000000e+00
  %944 = or i1 %942, %943
  %.97 = select i1 %944, double %941, double %938
  store double %.97, double* %865, align 8, !tbaa !6
  br i1 %844, label %"95", label %"97"

"95":                                             ; preds = %"92"
  %945 = add i64 %indvars.iv176, %852
  %946 = getelementptr inbounds double, double* %792, i64 %945
  %947 = load double, double* %946, align 8, !tbaa !6
  %948 = fcmp ogt double %947, 0.000000e+00
  br i1 %948, label %"96", label %"97"

"96":                                             ; preds = %"95"
  %949 = fmul double %947, 5.000000e-01
  store double %949, double* %946, align 8, !tbaa !6
  br label %"97"

"97.critedge":                                    ; preds = %"82"
  %950 = fmul double %806, %920
  %951 = fmul double %891, %950
  %952 = fsub double -0.000000e+00, %951
  %953 = fcmp olt double %926, %952
  %954 = fcmp uno double %926, 0.000000e+00
  %955 = or i1 %953, %954
  %.97.c = select i1 %955, double %952, double %926
  store double %.97.c, double* %865, align 8, !tbaa !6
  br label %"97"

"97":                                             ; preds = %"97.critedge", %"96", %"95", %"92"
  %956 = add i64 %807, %27
  %957 = add i64 %956, %848
  %958 = add i64 %957, %indvars.iv176
  %959 = getelementptr inbounds double, double* %792, i64 %958
  store double 0.000000e+00, double* %959, align 8, !tbaa !6
  %960 = load double, double* %865, align 8, !tbaa !6
  %961 = getelementptr inbounds double, double* %792, i64 %862
  %962 = load double, double* %961, align 8, !tbaa !6
  %963 = fsub double %960, %962
  %964 = getelementptr inbounds double, double* %808, i64 %866
  %965 = load double, double* %964, align 8, !tbaa !6
  %966 = fsub double %891, %965
  %967 = fcmp olt double %966, 1.000000e-06
  %968 = fcmp uno double %966, 0.000000e+00
  %969 = or i1 %967, %968
  %.98 = select i1 %969, double 1.000000e-06, double %966
  %970 = fsub double %877, %965
  %971 = fdiv double %970, %.98
  %972 = fcmp olt double %971, 1.000000e+00
  %973 = select i1 %972, double %971, double 1.000000e+00
  %974 = fcmp ogt double %973, 0.000000e+00
  %.99 = select i1 %974, double %973, double 0.000000e+00
  %975 = tail call double @copysign(double 5.000000e-01, double %963) #2
  %976 = fadd double %975, 5.000000e-01
  %977 = fmul double %976, %.99
  %978 = fmul double %963, %977
  %979 = fsub double 1.000000e+00, %977
  %980 = fmul double %963, %979
  %981 = load double, double* %845, align 8, !tbaa !6
  %982 = add i64 %853, %811
  %983 = add i64 %982, %indvars.iv176
  %984 = getelementptr inbounds double, double* %809, i64 %983
  %985 = load double, double* %984, align 8, !tbaa !6
  %986 = fmul double %981, %985
  %987 = fmul double %914, %986
  %988 = fadd double %987, %980
  %989 = add i64 %846, %815
  %990 = add i64 %989, %854
  %991 = add i64 %990, %indvars.iv176
  %992 = getelementptr inbounds double, double* %812, i64 %991
  %993 = load double, double* %992, align 8, !tbaa !6
  %994 = fadd double %993, %988
  %995 = fmul double %123, %994
  %996 = fdiv double %995, %920
  %997 = fadd double %877, %996
  %998 = fsub double %997, %891
  %999 = fcmp ogt double %998, 0.000000e+00
  %1000 = select i1 %999, double %998, double 0.000000e+00
  %1001 = fmul double %124, %920
  %1002 = fmul double %1001, %1000
  %1003 = fmul double %914, %1002
  %1004 = fsub double %900, %997
  %1005 = fcmp ogt double %1004, 0.000000e+00
  %.100 = select i1 %1005, double %1004, double 0.000000e+00
  %1006 = fmul double %1001, %.100
  %1007 = fmul double %914, %1006
  %1008 = fadd double %994, %1007
  %1009 = fsub double %1008, %1003
  store double %1009, double* %863, align 8, !tbaa !6
  %1010 = fadd double %978, %1003
  %1011 = fadd double %960, %1007
  store double %1011, double* %865, align 8, !tbaa !6
  %1012 = getelementptr inbounds double, double* %816, i64 %866
  %1013 = load double, double* %1012, align 8, !tbaa !6
  %1014 = fmul double %830, %1010
  %1015 = fadd double %1013, %1014
  store double %1015, double* %1012, align 8, !tbaa !6
  %1016 = add i64 %855, %818
  %1017 = add i64 %1016, %indvars.iv176
  %1018 = getelementptr inbounds double, double* %819, i64 %1017
  %1019 = load double, double* %1018, align 8, !tbaa !6
  %1020 = fmul double %125, %1014
  %1021 = fadd double %1019, %1020
  store double %1021, double* %1018, align 8, !tbaa !6
  %1022 = getelementptr inbounds double, double* %820, i64 %866
  %1023 = load double, double* %1022, align 8, !tbaa !6
  %1024 = fmul double %831, %1010
  %1025 = fadd double %1023, %1024
  store double %1025, double* %1022, align 8, !tbaa !6
  %1026 = add i64 %856, %822
  %1027 = add i64 %1026, %indvars.iv176
  %1028 = getelementptr inbounds double, double* %823, i64 %1027
  %1029 = load double, double* %1028, align 8, !tbaa !6
  %1030 = fmul double %125, %1024
  %1031 = fadd double %1029, %1030
  %1032 = load double, double* %959, align 8, !tbaa !6
  %1033 = fmul double %125, %1032
  %1034 = fmul double %835, %1033
  %1035 = fsub double %1031, %1034
  store double %1035, double* %1028, align 8, !tbaa !6
  br label %"108"

"108":                                            ; preds = %"97", %"81", %"80"
  %1036 = trunc i64 %indvars.iv176 to i32
  %1037 = icmp eq i32 %786, %1036
  %indvars.iv.next177 = add nsw i64 %indvars.iv176, 1
  br i1 %1037, label %"109.loopexit", label %"80"

"109.loopexit":                                   ; preds = %"108"
  br label %"109"

"109":                                            ; preds = %"109.loopexit", %"79"
  %1038 = trunc i64 %indvars.iv178 to i32
  %1039 = icmp eq i32 %67, %1038
  %indvars.iv.next179 = add nsw i64 %indvars.iv178, 1
  br i1 %1039, label %"110.loopexit", label %"79"

"110.loopexit":                                   ; preds = %"109"
  br label %"110"

"110":                                            ; preds = %"110.loopexit", %"78.110_crit_edge"
  %indvars.iv.next181.pre-phi = phi i64 [ %indvars.iv.next181.pre, %"78.110_crit_edge" ], [ %838, %"110.loopexit" ]
  %lftr.wideiv = trunc i64 %indvars.iv.next181.pre-phi to i32
  %exitcond = icmp eq i32 %113, %lftr.wideiv
  br i1 %exitcond, label %"111.loopexit", label %"78"

"111.loopexit":                                   ; preds = %"110"
  br label %"111"

"111":                                            ; preds = %"111.loopexit", %"77"
  br i1 %156, label %"141", label %"112.preheader"

"112.preheader":                                  ; preds = %"111"
  %1040 = load i32, i32* %istarts, align 4, !tbaa !0
  %1041 = load i32, i32* %iends, align 4, !tbaa !0
  %1042 = icmp sgt i32 %1040, %1041
  %1043 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %1044 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1045 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %1046 = load double*, double** bitcast (%"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam to double**), align 32, !tbaa !8
  %1047 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1048 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 1), align 8, !tbaa !10
  %1049 = load double*, double** bitcast (%"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg to double**), align 32, !tbaa !8
  %1050 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1051 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 1), align 8, !tbaa !10
  %1052 = bitcast i8* %57 to double*
  %1053 = bitcast i8* %28 to double*
  %1054 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1055 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 1), align 8, !tbaa !10
  %1056 = load double*, double** bitcast (%"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm to double**), align 32, !tbaa !8
  %1057 = bitcast i8* %29 to double*
  br i1 %1042, label %"118.preheader", label %"112.preheader.112.preheader.split_crit_edge"

"112.preheader.112.preheader.split_crit_edge":    ; preds = %"112.preheader"
  %1058 = sext i32 %1040 to i64
  %1059 = sext i32 %66 to i64
  br label %"113.preheader"

"113.preheader":                                  ; preds = %"116", %"112.preheader.112.preheader.split_crit_edge"
  %indvars.iv174 = phi i64 [ %1059, %"112.preheader.112.preheader.split_crit_edge" ], [ %indvars.iv.next175, %"116" ]
  %1060 = mul nsw i64 %indvars.iv174, %1044
  %1061 = mul nsw i64 %indvars.iv174, %3
  %1062 = add i64 %1061, %not
  %1063 = mul nsw i64 %indvars.iv174, %1047
  %1064 = mul nsw i64 %indvars.iv174, %1050
  %1065 = mul nsw i64 %indvars.iv174, %1054
  br label %"113"

"113":                                            ; preds = %"115", %"113.preheader"
  %indvars.iv172 = phi i64 [ %1058, %"113.preheader" ], [ %indvars.iv.next173, %"115" ]
  %1066 = add i64 %1060, %1045
  %1067 = add i64 %1066, %indvars.iv172
  %1068 = getelementptr inbounds i32, i32* %1043, i64 %1067
  %1069 = load i32, i32* %1068, align 4, !tbaa !3, !range !5
  %1070 = icmp eq i32 %1069, 0
  br i1 %1070, label %"115", label %"114"

"114":                                            ; preds = %"113"
  %1071 = add i64 %1062, %indvars.iv172
  %1072 = add i64 %1063, %1048
  %1073 = add i64 %1072, %indvars.iv172
  %1074 = getelementptr inbounds double, double* %1046, i64 %1073
  %1075 = load double, double* %1074, align 8, !tbaa !6
  %1076 = add i64 %1064, %1051
  %1077 = add i64 %1076, %indvars.iv172
  %1078 = getelementptr inbounds double, double* %1049, i64 %1077
  %1079 = load double, double* %1078, align 8, !tbaa !6
  %1080 = fmul double %1075, %1079
  %1081 = tail call double @sqrt(double %1080) #2
  %1082 = getelementptr inbounds double, double* %1052, i64 %1071
  store double %1081, double* %1082, align 8, !tbaa !6
  %1083 = getelementptr inbounds double, double* %1053, i64 %1071
  %1084 = load double, double* %1083, align 8, !tbaa !6
  %1085 = fmul double %1079, %1084
  store double %1085, double* %1078, align 8, !tbaa !6
  %1086 = add i64 %1065, %1055
  %1087 = add i64 %1086, %indvars.iv172
  %1088 = getelementptr inbounds double, double* %1056, i64 %1087
  %1089 = load double, double* %1088, align 8, !tbaa !6
  %1090 = getelementptr inbounds double, double* %1057, i64 %1071
  %1091 = load double, double* %1090, align 8, !tbaa !6
  %1092 = fmul double %1089, %1091
  store double %1092, double* %1088, align 8, !tbaa !6
  br label %"115"

"115":                                            ; preds = %"114", %"113"
  %1093 = trunc i64 %indvars.iv172 to i32
  %1094 = icmp eq i32 %1041, %1093
  %indvars.iv.next173 = add nsw i64 %indvars.iv172, 1
  br i1 %1094, label %"116", label %"113"

"116":                                            ; preds = %"115"
  %1095 = trunc i64 %indvars.iv174 to i32
  %1096 = icmp eq i32 %67, %1095
  %indvars.iv.next175 = add nsw i64 %indvars.iv174, 1
  br i1 %1096, label %"117", label %"113.preheader"

"117":                                            ; preds = %"116"
  br i1 %156, label %"141", label %"118.preheader"

"118.preheader":                                  ; preds = %"117", %"112.preheader"
  %1097 = load i32, i32* %istarts, align 4, !tbaa !0
  %1098 = load i32, i32* %iends, align 4, !tbaa !0
  %1099 = icmp sgt i32 %1097, %1098
  %1100 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %1101 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1102 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %1103 = bitcast i8* %57 to double*
  %1104 = load double*, double** bitcast (%"struct.array2_real(kind=8).40"* @__data_fields_MOD_t_cl to double**), align 8, !tbaa !8
  %1105 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).40", %"struct.array2_real(kind=8).40"* @__data_fields_MOD_t_cl, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1106 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).40", %"struct.array2_real(kind=8).40"* @__data_fields_MOD_t_cl, i64 0, i32 1), align 8, !tbaa !10
  %1107 = bitcast i8* %45 to double*
  %1108 = bitcast i8* %46 to double*
  %1109 = load double*, double** bitcast (%"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow to double**), align 8, !tbaa !8
  %1110 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).28", %"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1111 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).28", %"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow, i64 0, i32 1), align 8, !tbaa !10
  %1112 = load double*, double** bitcast (%"struct.array2_real(kind=8).41"* @__data_fields_MOD_sobs to double**), align 8, !tbaa !8
  %1113 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).41", %"struct.array2_real(kind=8).41"* @__data_fields_MOD_sobs, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1114 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).41", %"struct.array2_real(kind=8).41"* @__data_fields_MOD_sobs, i64 0, i32 1), align 8, !tbaa !10
  %1115 = bitcast i8* %44 to double*
  %1116 = load double*, double** bitcast (%"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch to double**), align 32, !tbaa !8
  %1117 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1118 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 1), align 8, !tbaa !10
  %1119 = load double*, double** bitcast (%"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low to double**), align 32, !tbaa !8
  %1120 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8)", %"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1121 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8)", %"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low, i64 0, i32 1), align 8, !tbaa !10
  %1122 = bitcast i8* %47 to double*
  %1123 = bitcast i8* %52 to double*
  %1124 = bitcast i8* %50 to double*
  %1125 = load double*, double** bitcast (%"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs to double**), align 32, !tbaa !8
  %1126 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1127 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 1), align 8, !tbaa !10
  %1128 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1129 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 1), align 8, !tbaa !10
  %1130 = load double*, double** bitcast (%"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt to double**), align 32, !tbaa !8
  %1131 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1132 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 1), align 8, !tbaa !10
  %1133 = load double*, double** bitcast (%"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt to double**), align 32, !tbaa !8
  %1134 = load double*, double** bitcast (%"struct.array2_real(kind=8).37"* @__data_fields_MOD_plcov to double**), align 8, !tbaa !8
  %1135 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).37", %"struct.array2_real(kind=8).37"* @__data_fields_MOD_plcov, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1136 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).37", %"struct.array2_real(kind=8).37"* @__data_fields_MOD_plcov, i64 0, i32 1), align 8, !tbaa !10
  %1137 = bitcast i8* %56 to double*
  %1138 = bitcast i8* %36 to double*
  %1139 = bitcast i8* %26 to double*
  %1140 = bitcast i8* %59 to double*
  %1141 = bitcast i8* %49 to double*
  %1142 = load double*, double** bitcast (%"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs to double**), align 32, !tbaa !8
  %1143 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1144 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 1), align 8, !tbaa !10
  %1145 = bitcast i8* %43 to double*
  %1146 = bitcast i8* %53 to double*
  %1147 = fmul double %62, 2.000000e+00
  %1148 = load double*, double** bitcast (%"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm to double**), align 32, !tbaa !8
  %1149 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1150 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 1), align 8, !tbaa !10
  %1151 = load double*, double** bitcast (%"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg to double**), align 32, !tbaa !8
  %1152 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1153 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 1), align 8, !tbaa !10
  %1154 = bitcast i8* %48 to double*
  %1155 = load double*, double** bitcast (%"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts to double**), align 32, !tbaa !8
  %1156 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).11", %"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1157 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).11", %"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts, i64 0, i32 1), align 8, !tbaa !10
  %1158 = bitcast i8* %51 to double*
  %1159 = load double*, double** bitcast (%"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs to double**), align 32, !tbaa !8
  %1160 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1161 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 1), align 8, !tbaa !10
  %1162 = load double*, double** bitcast (%"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow to double**), align 32, !tbaa !8
  %1163 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).10", %"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1164 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).10", %"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow, i64 0, i32 1), align 8, !tbaa !10
  %1165 = bitcast i8* %18 to double*
  %1166 = bitcast i8* %17 to double*
  %1167 = bitcast i8* %16 to double*
  %1168 = bitcast i8* %58 to double*
  %1169 = load double*, double** bitcast (%"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr to double**), align 32, !tbaa !8
  %1170 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1171 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 1), align 8, !tbaa !10
  %1172 = sext i32 %1097 to i64
  %1173 = sext i32 %66 to i64
  br label %"118"

"118":                                            ; preds = %"140", %"118.preheader"
  %indvars.iv170 = phi i64 [ %1173, %"118.preheader" ], [ %indvars.iv.next171, %"140" ]
  br i1 %1099, label %"140", label %"119.preheader"

"119.preheader":                                  ; preds = %"118"
  %1174 = mul nsw i64 %indvars.iv170, %1101
  %1175 = mul nsw i64 %indvars.iv170, %3
  %1176 = add i64 %1175, %not
  %1177 = mul nsw i64 %indvars.iv170, %1105
  %1178 = mul nsw i64 %indvars.iv170, %1110
  %1179 = mul nsw i64 %indvars.iv170, %1113
  %1180 = mul nsw i64 %indvars.iv170, %1117
  %1181 = mul nsw i64 %indvars.iv170, %1120
  %1182 = mul nsw i64 %indvars.iv170, %1126
  %1183 = mul nsw i64 %indvars.iv170, %1128
  %1184 = mul nsw i64 %indvars.iv170, %1131
  %1185 = mul nsw i64 %indvars.iv170, %1135
  %1186 = mul nsw i64 %indvars.iv170, %1143
  %1187 = mul nsw i64 %indvars.iv170, %1149
  %1188 = mul nsw i64 %indvars.iv170, %1152
  %1189 = mul nsw i64 %indvars.iv170, %1156
  %1190 = mul nsw i64 %indvars.iv170, %1160
  %1191 = mul nsw i64 %indvars.iv170, %1163
  %1192 = mul nsw i64 %indvars.iv170, %1170
  br label %"119"

"119":                                            ; preds = %"139", %"119.preheader"
  %indvars.iv168 = phi i64 [ %1172, %"119.preheader" ], [ %indvars.iv.next169, %"139" ]
  %1193 = add i64 %1174, %1102
  %1194 = add i64 %1193, %indvars.iv168
  %1195 = getelementptr inbounds i32, i32* %1100, i64 %1194
  %1196 = load i32, i32* %1195, align 4, !tbaa !3, !range !5
  %1197 = icmp eq i32 %1196, 0
  br i1 %1197, label %"139", label %"120"

"120":                                            ; preds = %"119"
  %1198 = add i64 %1176, %indvars.iv168
  %1199 = getelementptr inbounds double, double* %1103, i64 %1198
  %1200 = load double, double* %1199, align 8, !tbaa !6
  %1201 = fmul double %97, %1200
  %1202 = add i64 %1177, %1106
  %1203 = add i64 %1202, %indvars.iv168
  %1204 = getelementptr inbounds double, double* %1104, i64 %1203
  %1205 = load double, double* %1204, align 8, !tbaa !6
  %1206 = getelementptr inbounds double, double* %1107, i64 %1198
  %1207 = load double, double* %1206, align 8, !tbaa !6
  %1208 = fsub double %1205, %1207
  %1209 = fmul double %1201, %1208
  %1210 = getelementptr inbounds double, double* %1108, i64 %1198
  %1211 = load double, double* %1210, align 8, !tbaa !6
  %1212 = fsub double %1205, %1211
  %1213 = fmul double %99, %1212
  %1214 = fmul double %101, %1208
  %1215 = fsub double %1213, %1214
  %1216 = fmul double %1200, %1215
  %1217 = add i64 %1178, %1111
  %1218 = add i64 %1217, %indvars.iv168
  %1219 = getelementptr inbounds double, double* %1109, i64 %1218
  %1220 = load double, double* %1219, align 8, !tbaa !6
  %1221 = fsub double 1.000000e+00, %1220
  %1222 = add i64 %1179, %1114
  %1223 = add i64 %1222, %indvars.iv168
  %1224 = getelementptr inbounds double, double* %1112, i64 %1223
  %1225 = load double, double* %1224, align 8, !tbaa !6
  %1226 = getelementptr inbounds double, double* %1115, i64 %1198
  %1227 = load double, double* %1226, align 8, !tbaa !6
  %1228 = fadd double %1225, %1227
  %1229 = fmul double %1221, %1228
  %1230 = load double, double* @__data_constants_MOD_cp_d, align 8, !tbaa !6
  %1231 = fmul double %1221, %1230
  %1232 = add i64 %1180, %1118
  %1233 = add i64 %1232, %indvars.iv168
  %1234 = getelementptr inbounds double, double* %1116, i64 %1233
  %1235 = load double, double* %1234, align 8, !tbaa !6
  %1236 = fmul double %1231, %1235
  %1237 = add i64 %1181, %1121
  %1238 = add i64 %1237, %indvars.iv168
  %1239 = getelementptr inbounds double, double* %1119, i64 %1238
  %1240 = load double, double* %1239, align 8, !tbaa !6
  %1241 = fsub double %1240, %1211
  %1242 = fmul double %1236, %1241
  %1243 = getelementptr inbounds double, double* %1122, i64 %1198
  %1244 = load double, double* %1243, align 8, !tbaa !6
  %1245 = load double, double* @__data_constants_MOD_lh_v, align 8, !tbaa !6
  %1246 = fmul double %1244, %1245
  %1247 = fsub double 1.000000e+00, %1244
  %1248 = load double, double* @__data_constants_MOD_lh_s, align 8, !tbaa !6
  %1249 = fmul double %1247, %1248
  %1250 = fadd double %1246, %1249
  %1251 = getelementptr inbounds double, double* %1123, i64 %1198
  %1252 = load double, double* %1251, align 8, !tbaa !6
  %1253 = fmul double %1252, %1250
  %1254 = getelementptr inbounds double, double* %1124, i64 %1198
  %1255 = load double, double* %1254, align 8, !tbaa !6
  %1256 = add i64 %1182, %1127
  %1257 = add i64 %1256, %indvars.iv168
  %1258 = getelementptr inbounds double, double* %1125, i64 %1257
  %1259 = load double, double* %1258, align 8, !tbaa !6
  %1260 = fmul double %1255, %1259
  %1261 = fcmp ogt double %1260, 0.000000e+00
  br i1 %1261, label %"121", label %"123"

"121":                                            ; preds = %"120"
  %1262 = load double, double* @__data_constants_MOD_lh_f, align 8, !tbaa !6
  %1263 = fmul double %1259, %1262
  %1264 = fsub double -0.000000e+00, %1263
  %1265 = add i64 %1183, %1129
  %1266 = add i64 %1265, %indvars.iv168
  %1267 = getelementptr inbounds double, double* %1130, i64 %1266
  %1268 = load double, double* %1267, align 8, !tbaa !6
  %1269 = fadd double %1259, %1268
  store double %1269, double* %1267, align 8, !tbaa !6
  %1270 = add i64 %1184, %1132
  %1271 = add i64 %1270, %indvars.iv168
  %1272 = getelementptr inbounds double, double* %1133, i64 %1271
  %1273 = load double, double* %1272, align 8, !tbaa !6
  %1274 = load double, double* %1258, align 8, !tbaa !6
  %1275 = fsub double %1273, %1274
  store double %1275, double* %1272, align 8, !tbaa !6
  %1276 = add i64 %1185, %1136
  %1277 = add i64 %1276, %indvars.iv168
  %1278 = getelementptr inbounds double, double* %1134, i64 %1277
  %1279 = load double, double* %1278, align 8, !tbaa !6
  %1280 = fmul double %1279, 5.000000e+00
  %1281 = fadd double %1280, 1.000000e+00
  %1282 = load double, double* @__data_soil_MOD_cwimax, align 8, !tbaa !6
  %1283 = fmul double %1282, %1281
  %1284 = getelementptr inbounds double, double* %1137, i64 %1198
  %1285 = load double, double* %1284, align 8, !tbaa !6
  %1286 = load double, double* %1267, align 8, !tbaa !6
  %1287 = fmul double %123, %1286
  %1288 = fadd double %1285, %1287
  %1289 = fcmp ogt double %1288, %1283
  br i1 %1289, label %"122", label %"126"

"122":                                            ; preds = %"121"
  %1290 = fsub double %1288, %1283
  %1291 = fmul double %124, %1290
  %1292 = getelementptr inbounds double, double* %1138, i64 %1198
  %1293 = load double, double* %1292, align 8, !tbaa !6
  %1294 = fadd double %1291, %1293
  store double %1294, double* %1292, align 8, !tbaa !6
  %1295 = fsub double %1286, %1291
  store double %1295, double* %1267, align 8, !tbaa !6
  %1296 = getelementptr inbounds double, double* %1139, i64 %1198
  %1297 = load double, double* %1296, align 8, !tbaa !6
  %1298 = fadd double %1291, %1297
  store double %1298, double* %1296, align 8, !tbaa !6
  br label %"126"

"123":                                            ; preds = %"120"
  %1299 = getelementptr inbounds double, double* %1140, i64 %1198
  %1300 = load double, double* %1299, align 8, !tbaa !6
  %1301 = fcmp oeq double %1300, 0.000000e+00
  br i1 %1301, label %"124", label %"126"

"124":                                            ; preds = %"123"
  %1302 = fsub double 1.000000e+00, %1255
  %1303 = add i64 %1192, %1171
  %1304 = add i64 %1303, %indvars.iv168
  %1305 = getelementptr inbounds double, double* %1169, i64 %1304
  %1306 = load double, double* %1305, align 8, !tbaa !6
  %1307 = fmul double %1302, %1306
  %1308 = fcmp ogt double %1307, 0.000000e+00
  br i1 %1308, label %"125", label %"126"

"125":                                            ; preds = %"124"
  %1309 = load double, double* @__data_constants_MOD_lh_f, align 8, !tbaa !6
  %1310 = fmul double %1306, %1309
  %1311 = add i64 %1183, %1129
  %1312 = add i64 %1311, %indvars.iv168
  %1313 = getelementptr inbounds double, double* %1130, i64 %1312
  %1314 = load double, double* %1313, align 8, !tbaa !6
  %1315 = fsub double %1314, %1306
  store double %1315, double* %1313, align 8, !tbaa !6
  %1316 = add i64 %1184, %1132
  %1317 = add i64 %1316, %indvars.iv168
  %1318 = getelementptr inbounds double, double* %1133, i64 %1317
  %1319 = load double, double* %1318, align 8, !tbaa !6
  %1320 = load double, double* %1305, align 8, !tbaa !6
  %1321 = fadd double %1319, %1320
  store double %1321, double* %1318, align 8, !tbaa !6
  br label %"126"

"126":                                            ; preds = %"125", %"124", %"123", %"122", %"121"
  %1322 = phi double [ %1310, %"125" ], [ %1264, %"122" ], [ %1264, %"121" ], [ 0.000000e+00, %"123" ], [ 0.000000e+00, %"124" ]
  %1323 = load double, double* @__data_soil_MOD_calasmax, align 8, !tbaa !6
  %1324 = getelementptr inbounds double, double* %1140, i64 %1198
  %1325 = load double, double* %1324, align 8, !tbaa !6
  %1326 = load double, double* @__data_soil_MOD_calas_dw, align 8, !tbaa !6
  %1327 = fmul double %1325, %1326
  %1328 = load double, double* @__data_soil_MOD_calasmin, align 8, !tbaa !6
  %1329 = fadd double %1327, %1328
  %1330 = fcmp olt double %1329, %1323
  %1331 = fcmp uno double %1323, 0.000000e+00
  %1332 = or i1 %1331, %1330
  %.101 = select i1 %1332, double %1329, double %1323
  %1333 = fcmp ogt double %.101, %1328
  %1334 = fcmp uno double %1328, 0.000000e+00
  %1335 = or i1 %1334, %1333
  %1336 = select i1 %1335, double %.101, double %1328
  %1337 = getelementptr inbounds double, double* %1141, i64 %1198
  %1338 = load double, double* %1337, align 8, !tbaa !6
  %1339 = fsub double %1338, %1211
  %1340 = fmul double %1339, %1336
  %1341 = add i64 %1186, %1144
  %1342 = add i64 %1341, %indvars.iv168
  %1343 = getelementptr inbounds double, double* %1142, i64 %1342
  %1344 = load double, double* %1343, align 8, !tbaa !6
  %1345 = fdiv double %1340, %1344
  %1346 = fadd double %1229, %1242
  %1347 = fadd double %1346, %1253
  %1348 = fadd double %1347, %1322
  %1349 = load double, double* %1219, align 8, !tbaa !6
  %1350 = fsub double 1.000000e+00, %1255
  %1351 = fmul double %1350, %1349
  %1352 = fmul double %1351, %1345
  %1353 = fadd double %1348, %1352
  %1354 = load double, double* %1224, align 8, !tbaa !6
  %1355 = getelementptr inbounds double, double* %1145, i64 %1198
  %1356 = load double, double* %1355, align 8, !tbaa !6
  %1357 = fadd double %1354, %1356
  %1358 = load double, double* %1234, align 8, !tbaa !6
  %1359 = load double, double* @__data_constants_MOD_cp_d, align 8, !tbaa !6
  %1360 = fmul double %1358, %1359
  %1361 = load double, double* %1239, align 8, !tbaa !6
  %1362 = fsub double %1361, %1338
  %1363 = fmul double %1360, %1362
  %1364 = getelementptr inbounds double, double* %1146, i64 %1198
  %1365 = load double, double* %1364, align 8, !tbaa !6
  %1366 = load double, double* @__data_constants_MOD_lh_s, align 8, !tbaa !6
  %1367 = fmul double %1365, %1366
  %1368 = fadd double %1357, %1363
  %1369 = fadd double %1368, %1367
  %1370 = fsub double %1209, %1216
  %1371 = fmul double %1147, %1370
  %1372 = add i64 %1187, %1150
  %1373 = add i64 %1372, %indvars.iv168
  %1374 = getelementptr inbounds double, double* %1148, i64 %1373
  %1375 = load double, double* %1374, align 8, !tbaa !6
  %1376 = fdiv double %1371, %1375
  %1377 = fadd double %1207, %1376
  %1378 = fadd double %1216, %1353
  %1379 = fmul double %1147, %1378
  %1380 = add i64 %1188, %1153
  %1381 = add i64 %1380, %indvars.iv168
  %1382 = getelementptr inbounds double, double* %1151, i64 %1381
  %1383 = load double, double* %1382, align 8, !tbaa !6
  %1384 = fdiv double %1379, %1383
  %1385 = fadd double %1211, %1384
  %1386 = fsub double %1385, %1376
  %1387 = getelementptr inbounds double, double* %1154, i64 %1198
  %1388 = fsub double 1.000000e+00, %1349
  %1389 = fmul double %1388, %1358
  %1390 = add i64 %1189, %1157
  %1391 = add i64 %1390, %indvars.iv168
  %1392 = getelementptr inbounds double, double* %1155, i64 %1391
  %1393 = load double, double* %1392, align 8, !tbaa !6
  %1394 = load double, double* @__data_constants_MOD_lh_f, align 8, !tbaa !6
  %1395 = fmul double %1244, %1394
  %1396 = fmul double %1247, %1366
  %1397 = fadd double %1396, %1395
  %1398 = fmul double %1393, %1397
  %1399 = fadd double %1359, %1398
  %1400 = fmul double %1389, %1399
  %1401 = fsub double -0.000000e+00, %1400
  %1402 = fmul double %99, %1200
  %1403 = fsub double %1401, %1402
  %1404 = fmul double %1349, %1336
  %1405 = fdiv double %1404, %1344
  %1406 = fsub double %1403, %1405
  %1407 = fmul double %62, %1406
  %1408 = fdiv double %1407, %1383
  %1409 = fsub double 1.000000e+00, %1408
  %1410 = fcmp ogt double %1409, 1.000000e-06
  %.102 = select i1 %1410, double %1409, double 1.000000e-06
  %1411 = fsub double %1386, %1211
  %1412 = fdiv double %1411, %.102
  %1413 = fadd double %1211, %1412
  store double %1413, double* %1387, align 8, !tbaa !6
  %1414 = getelementptr inbounds double, double* %1158, i64 %1198
  store double %1413, double* %1414, align 8, !tbaa !6
  %1415 = load double, double* @__data_constants_MOD_t0_melt, align 8, !tbaa !6
  %1416 = fcmp olt double %1338, %1415
  br i1 %1416, label %"133", label %"126.137_crit_edge"

"126.137_crit_edge":                              ; preds = %"126"
  %.pre207.pre = load double, double* %1324, align 8, !tbaa !6
  %.pre.pre = add i64 %1184, %1132
  %.pre211.pre = add i64 %.pre.pre, %indvars.iv168
  %.pre213.pre = getelementptr inbounds double, double* %1133, i64 %.pre211.pre
  br label %"137"

"133":                                            ; preds = %"126"
  %1417 = add i64 %1184, %1132
  %1418 = add i64 %1417, %indvars.iv168
  %1419 = getelementptr inbounds double, double* %1133, i64 %1418
  %1420 = load double, double* %1419, align 8, !tbaa !6
  %1421 = fmul double %123, %1420
  %1422 = load double, double* %1324, align 8, !tbaa !6
  %1423 = fadd double %1422, %1421
  %1424 = fcmp ogt double %1423, 1.000000e-06
  br i1 %1424, label %"134", label %"137"

"134":                                            ; preds = %"133"
  %1425 = fsub double %1369, %1345
  %1426 = fmul double %1147, %1425
  %1427 = add i64 %1190, %1161
  %1428 = add i64 %1427, %indvars.iv168
  %1429 = getelementptr inbounds double, double* %1159, i64 %1428
  %1430 = load double, double* %1429, align 8, !tbaa !6
  %1431 = fdiv double %1426, %1430
  %1432 = fadd double %1338, %1431
  %1433 = load double, double* %1210, align 8, !tbaa !6
  %1434 = fsub double %1413, %1433
  %1435 = fsub double %1432, %1434
  store double %1435, double* %1414, align 8, !tbaa !6
  %1436 = add i64 %1191, %1164
  %1437 = add i64 %1436, %indvars.iv168
  %1438 = getelementptr inbounds double, double* %1162, i64 %1437
  %1439 = load double, double* %1438, align 8, !tbaa !6
  %1440 = fmul double %1366, %1439
  %1441 = fadd double %1359, %1440
  %1442 = fmul double %1358, %1441
  %1443 = fsub double -0.000000e+00, %1442
  %1444 = fdiv double %1336, %1344
  %1445 = fsub double %1443, %1444
  %1446 = fmul double %62, %1445
  %1447 = fdiv double %1446, %1430
  %1448 = fsub double 1.000000e+00, %1447
  %1449 = fcmp ogt double %1448, 1.000000e-06
  %.103 = select i1 %1449, double %1448, double 1.000000e-06
  %1450 = fsub double %1435, %1338
  %1451 = fdiv double %1450, %.103
  %1452 = fadd double %1338, %1451
  br label %"138"

"137":                                            ; preds = %"133", %"126.137_crit_edge"
  %.pre213.pre-phi = phi double* [ %.pre213.pre, %"126.137_crit_edge" ], [ %1419, %"133" ]
  %.pre207 = phi double [ %.pre207.pre, %"126.137_crit_edge" ], [ %1422, %"133" ]
  %.pre206 = load double, double* %1210, align 8, !tbaa !6
  br label %"138"

"138":                                            ; preds = %"137", %"134"
  %.pre-phi214 = phi double* [ %.pre213.pre-phi, %"137" ], [ %1419, %"134" ]
  %1453 = phi double [ %.pre207, %"137" ], [ %1422, %"134" ]
  %1454 = phi double [ %.pre206, %"137" ], [ %1433, %"134" ]
  %storemerge = phi double [ %1413, %"137" ], [ %1452, %"134" ]
  store double %storemerge, double* %1414, align 8, !tbaa !6
  %1455 = fsub double %storemerge, %1338
  %1456 = fmul double %68, %1455
  %1457 = getelementptr inbounds double, double* %1165, i64 %1198
  store double %1456, double* %1457, align 8, !tbaa !6
  %1458 = fsub double %1413, %1454
  %1459 = fmul double %68, %1458
  %1460 = getelementptr inbounds double, double* %1166, i64 %1198
  store double %1459, double* %1460, align 8, !tbaa !6
  %1461 = load double, double* %1206, align 8, !tbaa !6
  %1462 = fsub double %1377, %1461
  %1463 = fmul double %68, %1462
  %1464 = getelementptr inbounds double, double* %1167, i64 %1198
  store double %1463, double* %1464, align 8, !tbaa !6
  %1465 = load double, double* %.pre-phi214, align 8, !tbaa !6
  %1466 = fmul double %123, %1465
  %1467 = fadd double %1453, %1466
  %1468 = getelementptr inbounds double, double* %1168, i64 %1198
  store double %1467, double* %1468, align 8, !tbaa !6
  br label %"139"

"139":                                            ; preds = %"138", %"119"
  %1469 = trunc i64 %indvars.iv168 to i32
  %1470 = icmp eq i32 %1098, %1469
  %indvars.iv.next169 = add nsw i64 %indvars.iv168, 1
  br i1 %1470, label %"140.loopexit", label %"119"

"140.loopexit":                                   ; preds = %"139"
  br label %"140"

"140":                                            ; preds = %"140.loopexit", %"118"
  %1471 = trunc i64 %indvars.iv170 to i32
  %1472 = icmp eq i32 %67, %1471
  %indvars.iv.next171 = add nsw i64 %indvars.iv170, 1
  br i1 %1472, label %"141.loopexit", label %"118"

"141.loopexit":                                   ; preds = %"140"
  %.pre201 = load i32, i32* %jstarts, align 4, !tbaa !0
  %.pre202 = load i32, i32* %jends, align 4, !tbaa !0
  br label %"141"

"141":                                            ; preds = %"141.loopexit", %"117", %"111"
  %1473 = phi i32 [ %.pre202, %"141.loopexit" ], [ %67, %"117" ], [ %67, %"111" ]
  %1474 = phi i32 [ %.pre201, %"141.loopexit" ], [ %66, %"117" ], [ %66, %"111" ]
  %1475 = icmp sgt i32 %1474, %1473
  br i1 %1475, label %"188", label %"142.preheader"

"142.preheader":                                  ; preds = %"141"
  %1476 = load i32, i32* %istarts, align 4, !tbaa !0
  %1477 = load i32, i32* %iends, align 4, !tbaa !0
  %1478 = icmp sgt i32 %1476, %1477
  %1479 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %1480 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1481 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %1482 = bitcast i8* %11 to i32*
  %1483 = bitcast i8* %59 to double*
  %1484 = load double*, double** bitcast (%"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt to double**), align 32, !tbaa !8
  %1485 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1486 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 1), align 8, !tbaa !10
  %1487 = bitcast i8* %42 to double*
  %1488 = bitcast i8* %41 to double*
  %1489 = bitcast i8* %49 to double*
  %1490 = bitcast i8* %48 to double*
  %1491 = bitcast i8* %51 to double*
  %1492 = load double*, double** bitcast (%"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg to double**), align 32, !tbaa !8
  %1493 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1494 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 1), align 8, !tbaa !10
  %1495 = load double*, double** bitcast (%"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs to double**), align 32, !tbaa !8
  %1496 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1497 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 1), align 8, !tbaa !10
  %1498 = bitcast i8* %18 to double*
  %1499 = bitcast i8* %17 to double*
  %1500 = bitcast i8* %58 to double*
  %1501 = bitcast i8* %46 to double*
  %1502 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).42", %"struct.array2_real(kind=8).42"* @__data_fields_MOD_snow_melt, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1503 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).42", %"struct.array2_real(kind=8).42"* @__data_fields_MOD_snow_melt, i64 0, i32 1), align 8, !tbaa !10
  %1504 = load double*, double** bitcast (%"struct.array2_real(kind=8).42"* @__data_fields_MOD_snow_melt to double**), align 8, !tbaa !8
  %1505 = bitcast i8* %40 to double*
  %1506 = bitcast i8* %39 to double*
  %1507 = bitcast i8* %30 to double*
  %1508 = bitcast i8* %55 to double*
  %1509 = bitcast i8* %36 to double*
  %1510 = bitcast i8* %26 to double*
  %1511 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).38", %"struct.array2_real(kind=8).38"* @__data_fields_MOD_runoff_s, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1512 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).38", %"struct.array2_real(kind=8).38"* @__data_fields_MOD_runoff_s, i64 0, i32 1), align 8, !tbaa !10
  %1513 = load double*, double** bitcast (%"struct.array2_real(kind=8).38"* @__data_fields_MOD_runoff_s to double**), align 8, !tbaa !8
  %1514 = bitcast i8* %56 to double*
  %1515 = load double*, double** bitcast (%"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt to double**), align 32, !tbaa !8
  %1516 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1517 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 1), align 8, !tbaa !10
  %1518 = sext i32 %1476 to i64
  %1519 = sext i32 %1474 to i64
  br label %"142"

"142":                                            ; preds = %"173", %"142.preheader"
  %indvars.iv166 = phi i64 [ %1519, %"142.preheader" ], [ %indvars.iv.next167, %"173" ]
  br i1 %1478, label %"173", label %"143.preheader"

"143.preheader":                                  ; preds = %"142"
  %1520 = mul nsw i64 %indvars.iv166, %1480
  %1521 = mul nsw i64 %indvars.iv166, %3
  %1522 = add i64 %1521, %not
  %1523 = mul nsw i64 %indvars.iv166, %1485
  %1524 = mul nsw i64 %indvars.iv166, %1493
  %1525 = mul nsw i64 %indvars.iv166, %1496
  %1526 = mul nsw i64 %indvars.iv166, %1502
  %1527 = mul nsw i64 %indvars.iv166, %1511
  %1528 = mul nsw i64 %indvars.iv166, %1516
  br label %"143"

"143":                                            ; preds = %"172", %"143.preheader"
  %indvars.iv164 = phi i64 [ %1518, %"143.preheader" ], [ %indvars.iv.next165, %"172" ]
  %1529 = add i64 %1520, %1481
  %1530 = add i64 %1529, %indvars.iv164
  %1531 = getelementptr inbounds i32, i32* %1479, i64 %1530
  %1532 = load i32, i32* %1531, align 4, !tbaa !3, !range !5
  %1533 = icmp eq i32 %1532, 0
  br i1 %1533, label %"172", label %"144"

"144":                                            ; preds = %"143"
  %1534 = add i64 %1522, %indvars.iv164
  %1535 = getelementptr inbounds i32, i32* %1482, i64 %1534
  %1536 = load i32, i32* %1535, align 4, !tbaa !0
  %1537 = sitofp i32 %1536 to double
  %1538 = fadd double %1537, -1.500000e+00
  %1539 = tail call double @copysign(double 5.000000e-01, double %1538) #2
  %1540 = fadd double %1539, 5.000000e-01
  %1541 = getelementptr inbounds double, double* %1483, i64 %1534
  %1542 = load double, double* %1541, align 8, !tbaa !6
  %1543 = add i64 %1523, %1486
  %1544 = add i64 %1543, %indvars.iv164
  %1545 = getelementptr inbounds double, double* %1484, i64 %1544
  %1546 = load double, double* %1545, align 8, !tbaa !6
  %1547 = fmul double %123, %1546
  %1548 = fadd double %1542, %1547
  %1549 = getelementptr inbounds double, double* %1487, i64 %1534
  store double 0.000000e+00, double* %1549, align 8, !tbaa !6
  %1550 = getelementptr inbounds double, double* %1488, i64 %1534
  store double 0.000000e+00, double* %1550, align 8, !tbaa !6
  %1551 = getelementptr inbounds double, double* %1489, i64 %1534
  %1552 = load double, double* %1551, align 8, !tbaa !6
  %1553 = load double, double* @__data_constants_MOD_t0_melt, align 8, !tbaa !6
  %1554 = fcmp olt double %1552, %1553
  %1555 = fcmp ogt double %1548, 0.000000e+00
  %or.cond158 = and i1 %1555, %1554
  br i1 %or.cond158, label %"146", label %"168"

"146":                                            ; preds = %"144"
  %1556 = getelementptr inbounds double, double* %1490, i64 %1534
  %1557 = load double, double* %1556, align 8, !tbaa !6
  %1558 = getelementptr inbounds double, double* %1491, i64 %1534
  %1559 = load double, double* %1558, align 8, !tbaa !6
  %1560 = fcmp ogt double %1559, %1553
  br i1 %1560, label %"147", label %"148"

"147":                                            ; preds = %"146"
  %1561 = fadd double %1553, -1.000000e-06
  %1562 = fsub double %1559, %1561
  %1563 = fmul double %1540, %1562
  %1564 = add i64 %1524, %1494
  %1565 = add i64 %1564, %indvars.iv164
  %1566 = getelementptr inbounds double, double* %1492, i64 %1565
  %1567 = load double, double* %1566, align 8, !tbaa !6
  %1568 = add i64 %1525, %1497
  %1569 = add i64 %1568, %indvars.iv164
  %1570 = getelementptr inbounds double, double* %1495, i64 %1569
  %1571 = load double, double* %1570, align 8, !tbaa !6
  %1572 = fdiv double %1567, %1571
  %1573 = fadd double %1572, 1.000000e+00
  %1574 = fdiv double %1563, %1573
  %1575 = fadd double %1557, %1574
  %1576 = getelementptr inbounds double, double* %1498, i64 %1534
  %1577 = load double, double* %1576, align 8, !tbaa !6
  %1578 = fsub double %1561, %1559
  %1579 = fmul double %68, %1578
  %1580 = fadd double %1579, %1577
  store double %1580, double* %1576, align 8, !tbaa !6
  %1581 = getelementptr inbounds double, double* %1499, i64 %1534
  %1582 = load double, double* %1581, align 8, !tbaa !6
  %1583 = fsub double %1575, %1557
  %1584 = fmul double %68, %1583
  %1585 = fadd double %1582, %1584
  store double %1585, double* %1581, align 8, !tbaa !6
  br label %"148"

"148":                                            ; preds = %"147", %"146"
  %1586 = phi double [ %1575, %"147" ], [ %1557, %"146" ]
  %1587 = phi double [ %1561, %"147" ], [ %1559, %"146" ]
  %1588 = fcmp ogt double %1586, %1553
  br i1 %1588, label %"149", label %"168"

"149":                                            ; preds = %"148"
  %1589 = add i64 %1525, %1497
  %1590 = add i64 %1589, %indvars.iv164
  %1591 = getelementptr inbounds double, double* %1495, i64 %1590
  %1592 = load double, double* %1591, align 8, !tbaa !6
  %1593 = fadd double %1586, %1587
  %1594 = fmul double %1593, 5.000000e-01
  %1595 = fadd double %1553, -1.000000e-06
  %1596 = fsub double %1594, %1595
  %1597 = fmul double %1596, %1592
  %1598 = add i64 %1524, %1494
  %1599 = add i64 %1598, %indvars.iv164
  %1600 = getelementptr inbounds double, double* %1492, i64 %1599
  %1601 = load double, double* %1600, align 8, !tbaa !6
  %1602 = fmul double %1601, 5.000000e-01
  %1603 = fadd double %1553, 1.000000e-06
  %1604 = fsub double %1586, %1603
  %1605 = fmul double %1604, %1602
  %1606 = fadd double %1597, %1605
  %1607 = fcmp ugt double %1606, 0.000000e+00
  br i1 %1607, label %"151", label %"150"

"150":                                            ; preds = %"149"
  %1608 = getelementptr inbounds double, double* %1498, i64 %1534
  %1609 = load double, double* %1608, align 8, !tbaa !6
  %1610 = fsub double %1586, %1595
  %1611 = fmul double %68, %1610
  %1612 = fdiv double %1601, %1592
  %1613 = fadd double %1612, 1.000000e+00
  %1614 = fmul double %1611, %1613
  %1615 = fadd double %1614, %1609
  store double %1615, double* %1608, align 8, !tbaa !6
  %1616 = getelementptr inbounds double, double* %1499, i64 %1534
  %1617 = load double, double* %1616, align 8, !tbaa !6
  %1618 = fmul double %1540, %1611
  %1619 = fsub double %1617, %1618
  store double %1619, double* %1616, align 8, !tbaa !6
  br label %"168"

"151":                                            ; preds = %"149"
  %1620 = getelementptr inbounds double, double* %1500, i64 %1534
  %1621 = load double, double* %1620, align 8, !tbaa !6
  %1622 = load double, double* @__data_constants_MOD_lh_f, align 8, !tbaa !6
  %1623 = fmul double %1621, %1622
  %1624 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %1625 = fmul double %1623, %1624
  %1626 = fcmp olt double %1606, %1625
  %1627 = fcmp uno double %1625, 0.000000e+00
  %1628 = or i1 %1626, %1627
  %.104 = select i1 %1628, double %1606, double %1625
  %1629 = fdiv double %.104, %1625
  %1630 = fcmp ogt double %1629, 9.999000e-01
  %1631 = select i1 %1630, double 1.000000e+00, double %1629
  %1632 = fmul double %68, %1604
  %1633 = fsub double %1625, %1597
  %1634 = fmul double %1633, 2.000000e+00
  %1635 = fmul double %68, %1634
  %1636 = fdiv double %1635, %1601
  %1637 = fcmp olt double %1636, %1632
  %1638 = fcmp uno double %1632, 0.000000e+00
  %1639 = or i1 %1638, %1637
  %.105 = select i1 %1639, double %1636, double %1632
  %1640 = getelementptr inbounds double, double* %1499, i64 %1534
  %1641 = load double, double* %1640, align 8, !tbaa !6
  %1642 = fmul double %1540, %.105
  %1643 = fsub double %1641, %1642
  store double %1643, double* %1640, align 8, !tbaa !6
  %1644 = getelementptr inbounds double, double* %1501, i64 %1534
  %1645 = load double, double* %1644, align 8, !tbaa !6
  %1646 = fmul double %62, %1643
  %1647 = fadd double %1645, %1646
  %1648 = fmul double %1595, 2.000000e+00
  %1649 = fsub double %1648, %1647
  %1650 = fmul double %1548, %1631
  %1651 = fmul double %68, %1650
  %1652 = fmul double %1624, %1651
  %1653 = add i64 %1526, %1503
  %1654 = add i64 %1653, %indvars.iv164
  %1655 = getelementptr inbounds double, double* %1504, i64 %1654
  %1656 = load double, double* %1655, align 8, !tbaa !6
  %1657 = fdiv double %1652, %68
  %1658 = fadd double %1656, %1657
  store double %1658, double* %1655, align 8, !tbaa !6
  %1659 = getelementptr inbounds double, double* %1505, i64 %1534
  %1660 = load double, double* %1659, align 8, !tbaa !6
  %1661 = fmul double %1660, %1652
  %1662 = fsub double 1.000000e+00, %1660
  %1663 = fmul double %1662, %1652
  store double %1663, double* %1549, align 8, !tbaa !6
  %1664 = getelementptr inbounds double, double* %1506, i64 %1534
  %1665 = load double, double* %1664, align 8, !tbaa !6
  %1666 = getelementptr inbounds double, double* %1507, i64 %1534
  %1667 = load double, double* %1666, align 8, !tbaa !6
  %1668 = fsub double %1665, %1667
  %1669 = fcmp olt double %1668, 1.000000e-06
  %1670 = fcmp uno double %1668, 0.000000e+00
  %1671 = or i1 %1669, %1670
  %1672 = select i1 %1671, double 1.000000e-06, double %1668
  %1673 = getelementptr inbounds double, double* %1508, i64 %1534
  %1674 = load double, double* %1673, align 8, !tbaa !6
  %1675 = fsub double %1674, %1667
  %1676 = fdiv double %1675, %1672
  %1677 = fcmp olt double %1676, 1.000000e+00
  %.106 = select i1 %1677, double %1676, double 1.000000e+00
  %1678 = fcmp ogt double %.106, 0.000000e+00
  %1679 = select i1 %1678, double %.106, double 0.000000e+00
  %1680 = fmul double %1661, %1679
  store double %1680, double* %1550, align 8, !tbaa !6
  %1681 = getelementptr inbounds double, double* %1509, i64 %1534
  %1682 = load double, double* %1681, align 8, !tbaa !6
  %1683 = fsub double 1.000000e+00, %1679
  %1684 = fmul double %1661, %1683
  %1685 = fadd double %1682, %1684
  store double %1685, double* %1681, align 8, !tbaa !6
  %1686 = getelementptr inbounds double, double* %1510, i64 %1534
  %1687 = load double, double* %1686, align 8, !tbaa !6
  %1688 = fadd double %1687, %1684
  store double %1688, double* %1686, align 8, !tbaa !6
  %1689 = load double, double* %1545, align 8, !tbaa !6
  %1690 = fsub double %1689, %1652
  %1691 = fmul double %124, %1542
  %1692 = fsub double -0.000000e+00, %1691
  %storemerge215 = select i1 %1630, double %1692, double %1690
  store double %storemerge215, double* %1545, align 8, !tbaa !6
  %1693 = fsub double %1606, %1625
  %1694 = tail call double @copysign(double 5.000000e-01, double %1693) #2
  %1695 = fadd double %1694, 5.000000e-01
  %1696 = load double, double* @__data_constants_MOD_t0_melt, align 8, !tbaa !6
  %1697 = fadd double %1696, 1.000000e-06
  %1698 = fcmp ogt double %1647, %1697
  %1699 = fcmp uno double %1697, 0.000000e+00
  %1700 = or i1 %1698, %1699
  %.107 = select i1 %1700, double %1647, double %1697
  %1701 = fsub double 1.000000e+00, %1695
  %1702 = fmul double %1649, %1701
  %1703 = fmul double %1695, %.107
  %1704 = fadd double %1702, %1703
  %1705 = fsub double %1704, %1552
  %1706 = fmul double %68, %1705
  %1707 = getelementptr inbounds double, double* %1498, i64 %1534
  store double %1706, double* %1707, align 8, !tbaa !6
  %1708 = add i64 %1527, %1512
  %1709 = add i64 %1708, %indvars.iv164
  %1710 = getelementptr inbounds double, double* %1513, i64 %1709
  %1711 = load double, double* %1710, align 8, !tbaa !6
  %1712 = fadd double %1663, %1680
  %1713 = fmul double %125, %1712
  %1714 = fadd double %1711, %1713
  store double %1714, double* %1710, align 8, !tbaa !6
  %.pre205 = load double, double* @__data_constants_MOD_t0_melt, align 8, !tbaa !6
  br label %"168"

"168":                                            ; preds = %"151", %"150", %"148", %"144"
  %1715 = phi double [ %.pre205, %"151" ], [ %1553, %"150" ], [ %1553, %"148" ], [ %1553, %"144" ]
  %1716 = getelementptr inbounds double, double* %1514, i64 %1534
  %1717 = load double, double* %1716, align 8, !tbaa !6
  %1718 = add i64 %1528, %1517
  %1719 = add i64 %1718, %indvars.iv164
  %1720 = getelementptr inbounds double, double* %1515, i64 %1719
  %1721 = load double, double* %1720, align 8, !tbaa !6
  %1722 = fmul double %123, %1721
  %1723 = fadd double %1717, %1722
  %1724 = fcmp ogt double %1552, %1715
  br i1 %1724, label %"169", label %"172"

"169":                                            ; preds = %"168"
  %1725 = getelementptr inbounds double, double* %1491, i64 %1534
  %1726 = load double, double* %1725, align 8, !tbaa !6
  %1727 = fcmp olt double %1726, %1715
  %1728 = fcmp ogt double %1723, 0.000000e+00
  %or.cond159 = and i1 %1728, %1727
  br i1 %or.cond159, label %"171", label %"172"

"171":                                            ; preds = %"169"
  %1729 = fmul double %124, %1723
  store double %1729, double* %1549, align 8, !tbaa !6
  %1730 = add i64 %1527, %1512
  %1731 = add i64 %1730, %indvars.iv164
  %1732 = getelementptr inbounds double, double* %1513, i64 %1731
  %1733 = load double, double* %1732, align 8, !tbaa !6
  %1734 = fmul double %125, %1729
  %1735 = fadd double %1734, %1733
  store double %1735, double* %1732, align 8, !tbaa !6
  %1736 = load double, double* %1720, align 8, !tbaa !6
  %1737 = fsub double %1736, %1729
  store double %1737, double* %1720, align 8, !tbaa !6
  br label %"172"

"172":                                            ; preds = %"171", %"169", %"168", %"143"
  %1738 = trunc i64 %indvars.iv164 to i32
  %1739 = icmp eq i32 %1477, %1738
  %indvars.iv.next165 = add nsw i64 %indvars.iv164, 1
  br i1 %1739, label %"173.loopexit", label %"143"

"173.loopexit":                                   ; preds = %"172"
  br label %"173"

"173":                                            ; preds = %"173.loopexit", %"142"
  %1740 = trunc i64 %indvars.iv166 to i32
  %1741 = icmp eq i32 %1473, %1740
  %indvars.iv.next167 = add nsw i64 %indvars.iv166, 1
  br i1 %1741, label %"174", label %"142"

"174":                                            ; preds = %"173"
  br i1 %1475, label %"188", label %"175.preheader"

"175.preheader":                                  ; preds = %"174"
  %1742 = load i32, i32* %istarts, align 4, !tbaa !0
  %1743 = load i32, i32* %iends, align 4, !tbaa !0
  %1744 = icmp sgt i32 %1742, %1743
  %1745 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %1746 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1747 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %1748 = load i32, i32* @__data_runcontrol_MOD_nnew, align 4, !tbaa !0
  %1749 = sext i32 %1748 to i64
  %1750 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).19", %"struct.array3_real(kind=8).19"* @__data_fields_MOD_t_snow, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1751 = mul nsw i64 %1750, %1749
  %1752 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).19", %"struct.array3_real(kind=8).19"* @__data_fields_MOD_t_snow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1753 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).19", %"struct.array3_real(kind=8).19"* @__data_fields_MOD_t_snow, i64 0, i32 1), align 8, !tbaa !10
  %1754 = load double*, double** bitcast (%"struct.array3_real(kind=8).19"* @__data_fields_MOD_t_snow to double**), align 8, !tbaa !8
  %1755 = sext i32 %63 to i64
  %1756 = mul nsw i64 %1750, %1755
  %1757 = bitcast i8* %18 to double*
  %1758 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).17", %"struct.array3_real(kind=8).17"* @__data_fields_MOD_t_s, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1759 = mul nsw i64 %1758, %1749
  %1760 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).17", %"struct.array3_real(kind=8).17"* @__data_fields_MOD_t_s, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1761 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).17", %"struct.array3_real(kind=8).17"* @__data_fields_MOD_t_s, i64 0, i32 1), align 8, !tbaa !10
  %1762 = load double*, double** bitcast (%"struct.array3_real(kind=8).17"* @__data_fields_MOD_t_s to double**), align 8, !tbaa !8
  %1763 = mul nsw i64 %1758, %1755
  %1764 = bitcast i8* %17 to double*
  %1765 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).18", %"struct.array3_real(kind=8).18"* @__data_fields_MOD_t_m, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1766 = mul nsw i64 %1765, %1749
  %1767 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).18", %"struct.array3_real(kind=8).18"* @__data_fields_MOD_t_m, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1768 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).18", %"struct.array3_real(kind=8).18"* @__data_fields_MOD_t_m, i64 0, i32 1), align 8, !tbaa !10
  %1769 = load double*, double** bitcast (%"struct.array3_real(kind=8).18"* @__data_fields_MOD_t_m to double**), align 8, !tbaa !8
  %1770 = mul nsw i64 %1765, %1755
  %1771 = bitcast i8* %16 to double*
  %1772 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).20", %"struct.array3_real(kind=8).20"* @__data_fields_MOD_w_snow, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1773 = mul nsw i64 %1772, %1749
  %1774 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).20", %"struct.array3_real(kind=8).20"* @__data_fields_MOD_w_snow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1775 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).20", %"struct.array3_real(kind=8).20"* @__data_fields_MOD_w_snow, i64 0, i32 1), align 8, !tbaa !10
  %1776 = load double*, double** bitcast (%"struct.array3_real(kind=8).20"* @__data_fields_MOD_w_snow to double**), align 8, !tbaa !8
  %1777 = mul nsw i64 %1772, %1755
  %1778 = load double*, double** bitcast (%"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt to double**), align 32, !tbaa !8
  %1779 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1780 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 1), align 8, !tbaa !10
  %1781 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).21", %"struct.array3_real(kind=8).21"* @__data_fields_MOD_w_i, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1782 = mul nsw i64 %1781, %1749
  %1783 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).21", %"struct.array3_real(kind=8).21"* @__data_fields_MOD_w_i, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1784 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).21", %"struct.array3_real(kind=8).21"* @__data_fields_MOD_w_i, i64 0, i32 1), align 8, !tbaa !10
  %1785 = load double*, double** bitcast (%"struct.array3_real(kind=8).21"* @__data_fields_MOD_w_i to double**), align 8, !tbaa !8
  %1786 = mul nsw i64 %1781, %1755
  %1787 = load double*, double** bitcast (%"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt to double**), align 32, !tbaa !8
  %1788 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1789 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 1), align 8, !tbaa !10
  %1790 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).22", %"struct.array3_real(kind=8).22"* @__data_fields_MOD_w_g1, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1791 = mul nsw i64 %1790, %1749
  %1792 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).22", %"struct.array3_real(kind=8).22"* @__data_fields_MOD_w_g1, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1793 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).22", %"struct.array3_real(kind=8).22"* @__data_fields_MOD_w_g1, i64 0, i32 1), align 8, !tbaa !10
  %1794 = load double*, double** bitcast (%"struct.array3_real(kind=8).22"* @__data_fields_MOD_w_g1 to double**), align 8, !tbaa !8
  %1795 = mul nsw i64 %1790, %1755
  %1796 = bitcast i8* %26 to double*
  %1797 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).23", %"struct.array3_real(kind=8).23"* @__data_fields_MOD_w_g2, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1798 = mul nsw i64 %1797, %1749
  %1799 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).23", %"struct.array3_real(kind=8).23"* @__data_fields_MOD_w_g2, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1800 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).23", %"struct.array3_real(kind=8).23"* @__data_fields_MOD_w_g2, i64 0, i32 1), align 8, !tbaa !10
  %1801 = load double*, double** bitcast (%"struct.array3_real(kind=8).23"* @__data_fields_MOD_w_g2 to double**), align 8, !tbaa !8
  %1802 = mul nsw i64 %1797, %1755
  %1803 = shl nuw i64 %21, 1
  %1804 = add i64 %27, %1803
  %1805 = load i32, i32* @__data_runcontrol_MOD_nlgw, align 4, !tbaa !0
  %1806 = icmp eq i32 %1805, 3
  %1807 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).26", %"struct.array3_real(kind=8).26"* @__data_fields_MOD_w_g3, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1808 = mul nsw i64 %1807, %1749
  %1809 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).26", %"struct.array3_real(kind=8).26"* @__data_fields_MOD_w_g3, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1810 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).26", %"struct.array3_real(kind=8).26"* @__data_fields_MOD_w_g3, i64 0, i32 1), align 8, !tbaa !10
  %1811 = load double*, double** bitcast (%"struct.array3_real(kind=8).26"* @__data_fields_MOD_w_g3 to double**), align 8, !tbaa !8
  %1812 = mul nsw i64 %1807, %1755
  %1813 = add nsw i64 %27, %22
  %1814 = sext i32 %1742 to i64
  %1815 = sext i32 %1474 to i64
  br label %"175"

"175":                                            ; preds = %"187", %"175.preheader"
  %indvars.iv162 = phi i64 [ %1815, %"175.preheader" ], [ %indvars.iv.next163, %"187" ]
  br i1 %1744, label %"187", label %"176.preheader"

"176.preheader":                                  ; preds = %"175"
  %1816 = mul nsw i64 %indvars.iv162, %1746
  %1817 = mul nsw i64 %indvars.iv162, %1752
  %1818 = mul nsw i64 %indvars.iv162, %3
  %1819 = add i64 %1818, %not
  %1820 = mul nsw i64 %indvars.iv162, %1760
  %1821 = mul nsw i64 %indvars.iv162, %1767
  %1822 = mul nsw i64 %indvars.iv162, %1774
  %1823 = mul nsw i64 %indvars.iv162, %1779
  %1824 = mul nsw i64 %indvars.iv162, %1783
  %1825 = mul nsw i64 %indvars.iv162, %1788
  %1826 = mul nsw i64 %indvars.iv162, %1792
  %1827 = mul nsw i64 %indvars.iv162, %1799
  %1828 = add i64 %1804, %1818
  %1829 = mul nsw i64 %indvars.iv162, %1809
  %1830 = add i64 %1813, %1818
  br i1 %1806, label %"176.us.preheader", label %"176.preheader18"

"176.preheader18":                                ; preds = %"176.preheader"
  br label %"176"

"176.us.preheader":                               ; preds = %"176.preheader"
  br label %"176.us"

"176.us":                                         ; preds = %"176.us.preheader", %"186.us"
  %indvars.iv160 = phi i64 [ %indvars.iv.next161, %"186.us" ], [ %1814, %"176.us.preheader" ]
  %1831 = add i64 %1816, %1747
  %1832 = add i64 %1831, %indvars.iv160
  %1833 = getelementptr inbounds i32, i32* %1745, i64 %1832
  %1834 = load i32, i32* %1833, align 4, !tbaa !3, !range !5
  %1835 = icmp eq i32 %1834, 0
  br i1 %1835, label %"186.us", label %"179.us"

"179.us":                                         ; preds = %"176.us"
  %1836 = add i64 %1753, %1751
  %1837 = add i64 %1836, %1817
  %1838 = add i64 %1837, %indvars.iv160
  %1839 = add i64 %1753, %1756
  %1840 = add i64 %1839, %1817
  %1841 = add i64 %1840, %indvars.iv160
  %1842 = getelementptr inbounds double, double* %1754, i64 %1841
  %1843 = load double, double* %1842, align 8, !tbaa !6
  %1844 = add i64 %indvars.iv160, %1819
  %1845 = getelementptr inbounds double, double* %1757, i64 %1844
  %1846 = load double, double* %1845, align 8, !tbaa !6
  %1847 = fmul double %62, %1846
  %1848 = fadd double %1843, %1847
  %1849 = getelementptr inbounds double, double* %1754, i64 %1838
  store double %1848, double* %1849, align 8, !tbaa !6
  %1850 = add i64 %1761, %1759
  %1851 = add i64 %1850, %1820
  %1852 = add i64 %1851, %indvars.iv160
  %1853 = add i64 %1761, %1763
  %1854 = add i64 %1853, %1820
  %1855 = add i64 %1854, %indvars.iv160
  %1856 = getelementptr inbounds double, double* %1762, i64 %1855
  %1857 = load double, double* %1856, align 8, !tbaa !6
  %1858 = getelementptr inbounds double, double* %1764, i64 %1844
  %1859 = load double, double* %1858, align 8, !tbaa !6
  %1860 = fmul double %62, %1859
  %1861 = fadd double %1857, %1860
  %1862 = getelementptr inbounds double, double* %1762, i64 %1852
  store double %1861, double* %1862, align 8, !tbaa !6
  %1863 = add i64 %1768, %1766
  %1864 = add i64 %1863, %1821
  %1865 = add i64 %1864, %indvars.iv160
  %1866 = add i64 %1768, %1770
  %1867 = add i64 %1866, %1821
  %1868 = add i64 %1867, %indvars.iv160
  %1869 = getelementptr inbounds double, double* %1769, i64 %1868
  %1870 = load double, double* %1869, align 8, !tbaa !6
  %1871 = getelementptr inbounds double, double* %1771, i64 %1844
  %1872 = load double, double* %1871, align 8, !tbaa !6
  %1873 = fmul double %62, %1872
  %1874 = fadd double %1870, %1873
  %1875 = getelementptr inbounds double, double* %1769, i64 %1865
  store double %1874, double* %1875, align 8, !tbaa !6
  %1876 = add i64 %1775, %1773
  %1877 = add i64 %1876, %1822
  %1878 = add i64 %1877, %indvars.iv160
  %1879 = add i64 %1775, %1777
  %1880 = add i64 %1879, %1822
  %1881 = add i64 %1880, %indvars.iv160
  %1882 = getelementptr inbounds double, double* %1776, i64 %1881
  %1883 = load double, double* %1882, align 8, !tbaa !6
  %1884 = add i64 %1823, %1780
  %1885 = add i64 %1884, %indvars.iv160
  %1886 = getelementptr inbounds double, double* %1778, i64 %1885
  %1887 = load double, double* %1886, align 8, !tbaa !6
  %1888 = fmul double %62, %1887
  %1889 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %1890 = fdiv double %1888, %1889
  %1891 = fadd double %1883, %1890
  %1892 = getelementptr inbounds double, double* %1776, i64 %1878
  store double %1891, double* %1892, align 8, !tbaa !6
  %1893 = add i64 %1784, %1782
  %1894 = add i64 %1893, %1824
  %1895 = add i64 %1894, %indvars.iv160
  %1896 = add i64 %1784, %1786
  %1897 = add i64 %1896, %1824
  %1898 = add i64 %1897, %indvars.iv160
  %1899 = getelementptr inbounds double, double* %1785, i64 %1898
  %1900 = load double, double* %1899, align 8, !tbaa !6
  %1901 = add i64 %1825, %1789
  %1902 = add i64 %1901, %indvars.iv160
  %1903 = getelementptr inbounds double, double* %1787, i64 %1902
  %1904 = load double, double* %1903, align 8, !tbaa !6
  %1905 = fmul double %62, %1904
  %1906 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %1907 = fdiv double %1905, %1906
  %1908 = fadd double %1900, %1907
  %1909 = getelementptr inbounds double, double* %1785, i64 %1895
  store double %1908, double* %1909, align 8, !tbaa !6
  %1910 = add i64 %1793, %1791
  %1911 = add i64 %1910, %1826
  %1912 = add i64 %1911, %indvars.iv160
  %1913 = add i64 %1793, %1795
  %1914 = add i64 %1913, %1826
  %1915 = add i64 %1914, %indvars.iv160
  %1916 = getelementptr inbounds double, double* %1794, i64 %1915
  %1917 = load double, double* %1916, align 8, !tbaa !6
  %1918 = getelementptr inbounds double, double* %1796, i64 %1844
  %1919 = load double, double* %1918, align 8, !tbaa !6
  %1920 = fmul double %62, %1919
  %1921 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %1922 = fdiv double %1920, %1921
  %1923 = fadd double %1917, %1922
  %1924 = getelementptr inbounds double, double* %1794, i64 %1912
  store double %1923, double* %1924, align 8, !tbaa !6
  %1925 = add i64 %1800, %1798
  %1926 = add i64 %1925, %1827
  %1927 = add i64 %1926, %indvars.iv160
  %1928 = add i64 %1800, %1802
  %1929 = add i64 %1928, %1827
  %1930 = add i64 %1929, %indvars.iv160
  %1931 = getelementptr inbounds double, double* %1801, i64 %1930
  %1932 = load double, double* %1931, align 8, !tbaa !6
  %1933 = add i64 %indvars.iv160, %1828
  %1934 = getelementptr inbounds double, double* %1796, i64 %1933
  %1935 = load double, double* %1934, align 8, !tbaa !6
  %1936 = fmul double %62, %1935
  %1937 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %1938 = fdiv double %1936, %1937
  %1939 = fadd double %1932, %1938
  %1940 = getelementptr inbounds double, double* %1801, i64 %1927
  store double %1939, double* %1940, align 8, !tbaa !6
  %1941 = add i64 %1810, %1808
  %1942 = add i64 %1941, %1829
  %1943 = add i64 %1942, %indvars.iv160
  %1944 = add i64 %1810, %1812
  %1945 = add i64 %1944, %1829
  %1946 = add i64 %1945, %indvars.iv160
  %1947 = getelementptr inbounds double, double* %1811, i64 %1946
  %1948 = load double, double* %1947, align 8, !tbaa !6
  %1949 = add i64 %1830, %indvars.iv160
  %1950 = getelementptr inbounds double, double* %1796, i64 %1949
  %1951 = load double, double* %1950, align 8, !tbaa !6
  %1952 = fmul double %62, %1951
  %1953 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %1954 = fdiv double %1952, %1953
  %1955 = fadd double %1948, %1954
  %1956 = getelementptr inbounds double, double* %1811, i64 %1943
  store double %1955, double* %1956, align 8, !tbaa !6
  %1957 = load double, double* %1892, align 8, !tbaa !6
  %1958 = fcmp ugt double %1957, 1.000000e-06
  br i1 %1958, label %"181.us", label %"180.us"

"180.us":                                         ; preds = %"179.us"
  store double 0.000000e+00, double* %1892, align 8, !tbaa !6
  br label %"181.us"

"181.us":                                         ; preds = %"180.us", %"179.us"
  %1959 = phi double [ 0.000000e+00, %"180.us" ], [ %1957, %"179.us" ]
  %1960 = load double, double* %1909, align 8, !tbaa !6
  %1961 = fcmp ugt double %1960, 1.000000e-06
  br i1 %1961, label %"183.us", label %"182.us"

"182.us":                                         ; preds = %"181.us"
  store double 0.000000e+00, double* %1909, align 8, !tbaa !6
  %.pre203 = load double, double* %1892, align 8, !tbaa !6
  br label %"183.us"

"183.us":                                         ; preds = %"182.us", %"181.us"
  %1962 = phi double [ %.pre203, %"182.us" ], [ %1959, %"181.us" ]
  %1963 = fcmp ogt double %1962, 0.000000e+00
  br i1 %1963, label %"184.us", label %"186.us"

"184.us":                                         ; preds = %"183.us"
  %1964 = load double, double* %1849, align 8, !tbaa !6
  %1965 = load double, double* @__data_constants_MOD_t0_melt, align 8, !tbaa !6
  %1966 = fcmp ogt double %1964, %1965
  br i1 %1966, label %"185.us", label %"186.us"

"185.us":                                         ; preds = %"184.us"
  store double %1962, double* %1909, align 8, !tbaa !6
  store double 0.000000e+00, double* %1892, align 8, !tbaa !6
  br label %"186.us"

"186.us":                                         ; preds = %"185.us", %"184.us", %"183.us", %"176.us"
  %1967 = trunc i64 %indvars.iv160 to i32
  %1968 = icmp eq i32 %1743, %1967
  %indvars.iv.next161 = add nsw i64 %indvars.iv160, 1
  br i1 %1968, label %"187.loopexit", label %"176.us"

"176":                                            ; preds = %"176.preheader18", %"186"
  %indvars.iv = phi i64 [ %indvars.iv.next, %"186" ], [ %1814, %"176.preheader18" ]
  %1969 = add i64 %1816, %1747
  %1970 = add i64 %1969, %indvars.iv
  %1971 = getelementptr inbounds i32, i32* %1745, i64 %1970
  %1972 = load i32, i32* %1971, align 4, !tbaa !3, !range !5
  %1973 = icmp eq i32 %1972, 0
  br i1 %1973, label %"186", label %"179"

"179":                                            ; preds = %"176"
  %1974 = add i64 %1753, %1751
  %1975 = add i64 %1974, %1817
  %1976 = add i64 %1975, %indvars.iv
  %1977 = add i64 %1753, %1756
  %1978 = add i64 %1977, %1817
  %1979 = add i64 %1978, %indvars.iv
  %1980 = getelementptr inbounds double, double* %1754, i64 %1979
  %1981 = load double, double* %1980, align 8, !tbaa !6
  %1982 = add i64 %indvars.iv, %1819
  %1983 = getelementptr inbounds double, double* %1757, i64 %1982
  %1984 = load double, double* %1983, align 8, !tbaa !6
  %1985 = fmul double %62, %1984
  %1986 = fadd double %1981, %1985
  %1987 = getelementptr inbounds double, double* %1754, i64 %1976
  store double %1986, double* %1987, align 8, !tbaa !6
  %1988 = add i64 %1761, %1759
  %1989 = add i64 %1988, %1820
  %1990 = add i64 %1989, %indvars.iv
  %1991 = add i64 %1761, %1763
  %1992 = add i64 %1991, %1820
  %1993 = add i64 %1992, %indvars.iv
  %1994 = getelementptr inbounds double, double* %1762, i64 %1993
  %1995 = load double, double* %1994, align 8, !tbaa !6
  %1996 = getelementptr inbounds double, double* %1764, i64 %1982
  %1997 = load double, double* %1996, align 8, !tbaa !6
  %1998 = fmul double %62, %1997
  %1999 = fadd double %1995, %1998
  %2000 = getelementptr inbounds double, double* %1762, i64 %1990
  store double %1999, double* %2000, align 8, !tbaa !6
  %2001 = add i64 %1768, %1766
  %2002 = add i64 %2001, %1821
  %2003 = add i64 %2002, %indvars.iv
  %2004 = add i64 %1768, %1770
  %2005 = add i64 %2004, %1821
  %2006 = add i64 %2005, %indvars.iv
  %2007 = getelementptr inbounds double, double* %1769, i64 %2006
  %2008 = load double, double* %2007, align 8, !tbaa !6
  %2009 = getelementptr inbounds double, double* %1771, i64 %1982
  %2010 = load double, double* %2009, align 8, !tbaa !6
  %2011 = fmul double %62, %2010
  %2012 = fadd double %2008, %2011
  %2013 = getelementptr inbounds double, double* %1769, i64 %2003
  store double %2012, double* %2013, align 8, !tbaa !6
  %2014 = add i64 %1775, %1773
  %2015 = add i64 %2014, %1822
  %2016 = add i64 %2015, %indvars.iv
  %2017 = add i64 %1775, %1777
  %2018 = add i64 %2017, %1822
  %2019 = add i64 %2018, %indvars.iv
  %2020 = getelementptr inbounds double, double* %1776, i64 %2019
  %2021 = load double, double* %2020, align 8, !tbaa !6
  %2022 = add i64 %1823, %1780
  %2023 = add i64 %2022, %indvars.iv
  %2024 = getelementptr inbounds double, double* %1778, i64 %2023
  %2025 = load double, double* %2024, align 8, !tbaa !6
  %2026 = fmul double %62, %2025
  %2027 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %2028 = fdiv double %2026, %2027
  %2029 = fadd double %2021, %2028
  %2030 = getelementptr inbounds double, double* %1776, i64 %2016
  store double %2029, double* %2030, align 8, !tbaa !6
  %2031 = add i64 %1784, %1782
  %2032 = add i64 %2031, %1824
  %2033 = add i64 %2032, %indvars.iv
  %2034 = add i64 %1784, %1786
  %2035 = add i64 %2034, %1824
  %2036 = add i64 %2035, %indvars.iv
  %2037 = getelementptr inbounds double, double* %1785, i64 %2036
  %2038 = load double, double* %2037, align 8, !tbaa !6
  %2039 = add i64 %1825, %1789
  %2040 = add i64 %2039, %indvars.iv
  %2041 = getelementptr inbounds double, double* %1787, i64 %2040
  %2042 = load double, double* %2041, align 8, !tbaa !6
  %2043 = fmul double %62, %2042
  %2044 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %2045 = fdiv double %2043, %2044
  %2046 = fadd double %2038, %2045
  %2047 = getelementptr inbounds double, double* %1785, i64 %2033
  store double %2046, double* %2047, align 8, !tbaa !6
  %2048 = add i64 %1793, %1791
  %2049 = add i64 %2048, %1826
  %2050 = add i64 %2049, %indvars.iv
  %2051 = add i64 %1793, %1795
  %2052 = add i64 %2051, %1826
  %2053 = add i64 %2052, %indvars.iv
  %2054 = getelementptr inbounds double, double* %1794, i64 %2053
  %2055 = load double, double* %2054, align 8, !tbaa !6
  %2056 = getelementptr inbounds double, double* %1796, i64 %1982
  %2057 = load double, double* %2056, align 8, !tbaa !6
  %2058 = fmul double %62, %2057
  %2059 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %2060 = fdiv double %2058, %2059
  %2061 = fadd double %2055, %2060
  %2062 = getelementptr inbounds double, double* %1794, i64 %2050
  store double %2061, double* %2062, align 8, !tbaa !6
  %2063 = add i64 %1800, %1798
  %2064 = add i64 %2063, %1827
  %2065 = add i64 %2064, %indvars.iv
  %2066 = add i64 %1800, %1802
  %2067 = add i64 %2066, %1827
  %2068 = add i64 %2067, %indvars.iv
  %2069 = getelementptr inbounds double, double* %1801, i64 %2068
  %2070 = load double, double* %2069, align 8, !tbaa !6
  %2071 = add i64 %indvars.iv, %1828
  %2072 = getelementptr inbounds double, double* %1796, i64 %2071
  %2073 = load double, double* %2072, align 8, !tbaa !6
  %2074 = fmul double %62, %2073
  %2075 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %2076 = fdiv double %2074, %2075
  %2077 = fadd double %2070, %2076
  %2078 = getelementptr inbounds double, double* %1801, i64 %2065
  store double %2077, double* %2078, align 8, !tbaa !6
  %2079 = load double, double* %2030, align 8, !tbaa !6
  %2080 = fcmp ugt double %2079, 1.000000e-06
  br i1 %2080, label %"181", label %"180"

"180":                                            ; preds = %"179"
  store double 0.000000e+00, double* %2030, align 8, !tbaa !6
  br label %"181"

"181":                                            ; preds = %"180", %"179"
  %2081 = phi double [ %2079, %"179" ], [ 0.000000e+00, %"180" ]
  %2082 = load double, double* %2047, align 8, !tbaa !6
  %2083 = fcmp ugt double %2082, 1.000000e-06
  br i1 %2083, label %"183", label %"182"

"182":                                            ; preds = %"181"
  store double 0.000000e+00, double* %2047, align 8, !tbaa !6
  %.pre204 = load double, double* %2030, align 8, !tbaa !6
  br label %"183"

"183":                                            ; preds = %"182", %"181"
  %2084 = phi double [ %2081, %"181" ], [ %.pre204, %"182" ]
  %2085 = fcmp ogt double %2084, 0.000000e+00
  br i1 %2085, label %"184", label %"186"

"184":                                            ; preds = %"183"
  %2086 = load double, double* %1987, align 8, !tbaa !6
  %2087 = load double, double* @__data_constants_MOD_t0_melt, align 8, !tbaa !6
  %2088 = fcmp ogt double %2086, %2087
  br i1 %2088, label %"185", label %"186"

"185":                                            ; preds = %"184"
  store double %2084, double* %2047, align 8, !tbaa !6
  store double 0.000000e+00, double* %2030, align 8, !tbaa !6
  br label %"186"

"186":                                            ; preds = %"185", %"184", %"183", %"176"
  %2089 = trunc i64 %indvars.iv to i32
  %2090 = icmp eq i32 %1743, %2089
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  br i1 %2090, label %"187.loopexit19", label %"176"

"187.loopexit":                                   ; preds = %"186.us"
  br label %"187"

"187.loopexit19":                                 ; preds = %"186"
  br label %"187"

"187":                                            ; preds = %"187.loopexit19", %"187.loopexit", %"175"
  %2091 = trunc i64 %indvars.iv162 to i32
  %2092 = icmp eq i32 %1473, %2091
  %indvars.iv.next163 = add nsw i64 %indvars.iv162, 1
  br i1 %2092, label %"188.loopexit", label %"175"

"188.loopexit":                                   ; preds = %"187"
  br label %"188"

"188":                                            ; preds = %"188.loopexit", %"174", %"141"
  %2093 = load i32, i32* @__data_runcontrol_MOD_nnew, align 4, !tbaa !0
  %2094 = sext i32 %2093 to i64
  %2095 = load double*, double** bitcast (%"struct.array3_real(kind=8).43"* @__data_fields_MOD_t_g to double**), align 8, !tbaa !8
  %2096 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).43", %"struct.array3_real(kind=8).43"* @__data_fields_MOD_t_g, i64 0, i32 3, i64 2, i32 1), align 8, !tbaa !10
  %2097 = sub nsw i64 %2094, %2096
  %2098 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).43", %"struct.array3_real(kind=8).43"* @__data_fields_MOD_t_g, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %2099 = mul nsw i64 %2097, %2098
  %2100 = getelementptr inbounds double, double* %2095, i64 %2099
  %2101 = load double*, double** bitcast (%"struct.array3_real(kind=8).19"* @__data_fields_MOD_t_snow to double**), align 8, !tbaa !8
  %2102 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).19", %"struct.array3_real(kind=8).19"* @__data_fields_MOD_t_snow, i64 0, i32 3, i64 2, i32 1), align 8, !tbaa !10
  %2103 = sub nsw i64 %2094, %2102
  %2104 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).19", %"struct.array3_real(kind=8).19"* @__data_fields_MOD_t_snow, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %2105 = mul nsw i64 %2103, %2104
  %2106 = getelementptr inbounds double, double* %2101, i64 %2105
  %2107 = load double*, double** bitcast (%"struct.array3_real(kind=8).17"* @__data_fields_MOD_t_s to double**), align 8, !tbaa !8
  %2108 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).17", %"struct.array3_real(kind=8).17"* @__data_fields_MOD_t_s, i64 0, i32 3, i64 2, i32 1), align 8, !tbaa !10
  %2109 = sub nsw i64 %2094, %2108
  %2110 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).17", %"struct.array3_real(kind=8).17"* @__data_fields_MOD_t_s, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %2111 = mul nsw i64 %2109, %2110
  %2112 = getelementptr inbounds double, double* %2107, i64 %2111
  %2113 = load double*, double** bitcast (%"struct.array3_real(kind=8).20"* @__data_fields_MOD_w_snow to double**), align 8, !tbaa !8
  %2114 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).20", %"struct.array3_real(kind=8).20"* @__data_fields_MOD_w_snow, i64 0, i32 3, i64 2, i32 1), align 8, !tbaa !10
  %2115 = sub nsw i64 %2094, %2114
  %2116 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).20", %"struct.array3_real(kind=8).20"* @__data_fields_MOD_w_snow, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %2117 = mul nsw i64 %2115, %2116
  %2118 = getelementptr inbounds double, double* %2113, i64 %2117
  %2119 = load [0 x i32]*, [0 x i32]** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to [0 x i32]**), align 8, !tbaa !8
  %2120 = bitcast double* %2100 to [0 x double]*
  %2121 = bitcast double* %2106 to [0 x double]*
  %2122 = bitcast double* %2112 to [0 x double]*
  %2123 = bitcast double* %2118 to [0 x double]*
  call void @__meteo_utilities_MOD_tgcom([0 x double]* %2120, [0 x double]* %2121, [0 x double]* %2122, [0 x double]* %2123, [0 x i32]* noalias %2119, i32* nonnull @__data_modelconfig_MOD_ie, i32* nonnull @__data_modelconfig_MOD_je, double* nonnull @__data_soil_MOD_cf_snow, i32* nonnull %istarts, i32* nonnull %iends, i32* nonnull %jstarts, i32* nonnull %jends, [0 x i32]* null, i32* null) #1
  %2124 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 0), align 32, !tbaa !8
  %2125 = icmp eq i8* %2124, null
  br i1 %2125, label %"191", label %"190"

"190":                                            ; preds = %"188"
  call void @free(i8* noalias %2124) #1
  br label %"191"

"191":                                            ; preds = %"190", %"188"
  store i8* null, i8** getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 0), align 32, !tbaa !8
  %2126 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 0), align 32, !tbaa !8
  %2127 = icmp eq i8* %2126, null
  br i1 %2127, label %"194", label %"193"

"193":                                            ; preds = %"191"
  call void @free(i8* noalias %2126) #1
  br label %"194"

"194":                                            ; preds = %"193", %"191"
  store i8* null, i8** getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 0), align 32, !tbaa !8
  %2128 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).11", %"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts, i64 0, i32 0), align 32, !tbaa !8
  %2129 = icmp eq i8* %2128, null
  br i1 %2129, label %"197", label %"196"

"196":                                            ; preds = %"194"
  call void @free(i8* noalias %2128) #1
  br label %"197"

"197":                                            ; preds = %"196", %"194"
  store i8* null, i8** getelementptr inbounds (%"struct.array2_real(kind=8).11", %"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts, i64 0, i32 0), align 32, !tbaa !8
  %2130 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).10", %"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow, i64 0, i32 0), align 32, !tbaa !8
  %2131 = icmp eq i8* %2130, null
  br i1 %2131, label %"200", label %"199"

"199":                                            ; preds = %"197"
  call void @free(i8* noalias %2130) #1
  br label %"200"

"200":                                            ; preds = %"199", %"197"
  store i8* null, i8** getelementptr inbounds (%"struct.array2_real(kind=8).10", %"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow, i64 0, i32 0), align 32, !tbaa !8
  %2132 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 0), align 32, !tbaa !8
  %2133 = icmp eq i8* %2132, null
  br i1 %2133, label %"203", label %"202"

"202":                                            ; preds = %"200"
  call void @free(i8* noalias %2132) #1
  br label %"203"

"203":                                            ; preds = %"202", %"200"
  store i8* null, i8** getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 0), align 32, !tbaa !8
  %2134 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 0), align 32, !tbaa !8
  %2135 = icmp eq i8* %2134, null
  br i1 %2135, label %"206", label %"205"

"205":                                            ; preds = %"203"
  call void @free(i8* noalias %2134) #1
  br label %"206"

"206":                                            ; preds = %"205", %"203"
  store i8* null, i8** getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 0), align 32, !tbaa !8
  %2136 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 0), align 32, !tbaa !8
  %2137 = icmp eq i8* %2136, null
  br i1 %2137, label %"209", label %"208"

"208":                                            ; preds = %"206"
  call void @free(i8* noalias %2136) #1
  br label %"209"

"209":                                            ; preds = %"208", %"206"
  store i8* null, i8** getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 0), align 32, !tbaa !8
  %2138 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 0), align 32, !tbaa !8
  %2139 = icmp eq i8* %2138, null
  br i1 %2139, label %"212", label %"211"

"211":                                            ; preds = %"209"
  call void @free(i8* noalias %2138) #1
  br label %"212"

"212":                                            ; preds = %"211", %"209"
  store i8* null, i8** getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 0), align 32, !tbaa !8
  %2140 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 0), align 32, !tbaa !8
  %2141 = icmp eq i8* %2140, null
  br i1 %2141, label %"215", label %"214"

"214":                                            ; preds = %"212"
  call void @free(i8* noalias %2140) #1
  br label %"215"

"215":                                            ; preds = %"214", %"212"
  store i8* null, i8** getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 0), align 32, !tbaa !8
  %2142 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 0), align 32, !tbaa !8
  %2143 = icmp eq i8* %2142, null
  br i1 %2143, label %"218", label %"217"

"217":                                            ; preds = %"215"
  call void @free(i8* noalias %2142) #1
  br label %"218"

"218":                                            ; preds = %"217", %"215"
  store i8* null, i8** getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 0), align 32, !tbaa !8
  %2144 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 0), align 32, !tbaa !8
  %2145 = icmp eq i8* %2144, null
  br i1 %2145, label %"221", label %"220"

"220":                                            ; preds = %"218"
  call void @free(i8* noalias %2144) #1
  br label %"221"

"221":                                            ; preds = %"220", %"218"
  store i8* null, i8** getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 0), align 32, !tbaa !8
  %2146 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 0), align 32, !tbaa !8
  %2147 = icmp eq i8* %2146, null
  br i1 %2147, label %"224", label %"223"

"223":                                            ; preds = %"221"
  call void @free(i8* noalias %2146) #1
  br label %"224"

"224":                                            ; preds = %"223", %"221"
  store i8* null, i8** getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 0), align 32, !tbaa !8
  %2148 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 0), align 32, !tbaa !8
  %2149 = icmp eq i8* %2148, null
  br i1 %2149, label %"227", label %"226"

"226":                                            ; preds = %"224"
  call void @free(i8* noalias %2148) #1
  br label %"227"

"227":                                            ; preds = %"226", %"224"
  store i8* null, i8** getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 0), align 32, !tbaa !8
  %2150 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8)", %"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low, i64 0, i32 0), align 32, !tbaa !8
  %2151 = icmp eq i8* %2150, null
  br i1 %2151, label %"230", label %"229"

"229":                                            ; preds = %"227"
  call void @free(i8* noalias %2150) #1
  br label %"230"

"230":                                            ; preds = %"229", %"227"
  store i8* null, i8** getelementptr inbounds (%"struct.array2_real(kind=8)", %"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low, i64 0, i32 0), align 32, !tbaa !8
  %2152 = load i8*, i8** getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 0), align 32, !tbaa !8
  %2153 = icmp eq i8* %2152, null
  br i1 %2153, label %"233", label %"232"

"232":                                            ; preds = %"230"
  call void @free(i8* noalias %2152) #1
  br label %"233"

"233":                                            ; preds = %"232", %"230"
  store i8* null, i8** getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 0), align 32, !tbaa !8
  %2154 = icmp eq i8* %59, null
  br i1 %2154, label %"235", label %"234"

"234":                                            ; preds = %"233"
  call void @free(i8* %59) #1
  br label %"235"

"235":                                            ; preds = %"234", %"233"
  %2155 = icmp eq i8* %58, null
  br i1 %2155, label %"237", label %"236"

"236":                                            ; preds = %"235"
  call void @free(i8* %58) #1
  br label %"237"

"237":                                            ; preds = %"236", %"235"
  %2156 = icmp eq i8* %57, null
  br i1 %2156, label %"239", label %"238"

"238":                                            ; preds = %"237"
  call void @free(i8* %57) #1
  br label %"239"

"239":                                            ; preds = %"238", %"237"
  %2157 = icmp eq i8* %56, null
  br i1 %2157, label %"241", label %"240"

"240":                                            ; preds = %"239"
  call void @free(i8* %56) #1
  br label %"241"

"241":                                            ; preds = %"240", %"239"
  %2158 = icmp eq i8* %55, null
  br i1 %2158, label %"243", label %"242"

"242":                                            ; preds = %"241"
  call void @free(i8* %55) #1
  br label %"243"

"243":                                            ; preds = %"242", %"241"
  %2159 = icmp eq i8* %53, null
  br i1 %2159, label %"245", label %"244"

"244":                                            ; preds = %"243"
  call void @free(i8* %53) #1
  br label %"245"

"245":                                            ; preds = %"244", %"243"
  %2160 = icmp eq i8* %52, null
  br i1 %2160, label %"247", label %"246"

"246":                                            ; preds = %"245"
  call void @free(i8* %52) #1
  br label %"247"

"247":                                            ; preds = %"246", %"245"
  %2161 = icmp eq i8* %51, null
  br i1 %2161, label %"249", label %"248"

"248":                                            ; preds = %"247"
  call void @free(i8* %51) #1
  br label %"249"

"249":                                            ; preds = %"248", %"247"
  %2162 = icmp eq i8* %50, null
  br i1 %2162, label %"251", label %"250"

"250":                                            ; preds = %"249"
  call void @free(i8* %50) #1
  br label %"251"

"251":                                            ; preds = %"250", %"249"
  %2163 = icmp eq i8* %49, null
  br i1 %2163, label %"253", label %"252"

"252":                                            ; preds = %"251"
  call void @free(i8* %49) #1
  br label %"253"

"253":                                            ; preds = %"252", %"251"
  %2164 = icmp eq i8* %48, null
  br i1 %2164, label %"255", label %"254"

"254":                                            ; preds = %"253"
  call void @free(i8* %48) #1
  br label %"255"

"255":                                            ; preds = %"254", %"253"
  %2165 = icmp eq i8* %47, null
  br i1 %2165, label %"257", label %"256"

"256":                                            ; preds = %"255"
  call void @free(i8* %47) #1
  br label %"257"

"257":                                            ; preds = %"256", %"255"
  %2166 = icmp eq i8* %46, null
  br i1 %2166, label %"261", label %"258"

"258":                                            ; preds = %"257"
  call void @free(i8* %46) #1
  br label %"261"

"261":                                            ; preds = %"258", %"257"
  %2167 = icmp eq i8* %45, null
  br i1 %2167, label %"263", label %"262"

"262":                                            ; preds = %"261"
  call void @free(i8* %45) #1
  br label %"263"

"263":                                            ; preds = %"262", %"261"
  %2168 = icmp eq i8* %44, null
  br i1 %2168, label %"265", label %"264"

"264":                                            ; preds = %"263"
  call void @free(i8* %44) #1
  br label %"265"

"265":                                            ; preds = %"264", %"263"
  %2169 = icmp eq i8* %43, null
  br i1 %2169, label %"267", label %"266"

"266":                                            ; preds = %"265"
  call void @free(i8* %43) #1
  br label %"267"

"267":                                            ; preds = %"266", %"265"
  %2170 = icmp eq i8* %42, null
  br i1 %2170, label %"269", label %"268"

"268":                                            ; preds = %"267"
  call void @free(i8* %42) #1
  br label %"269"

"269":                                            ; preds = %"268", %"267"
  %2171 = icmp eq i8* %41, null
  br i1 %2171, label %"271", label %"270"

"270":                                            ; preds = %"269"
  call void @free(i8* %41) #1
  br label %"271"

"271":                                            ; preds = %"270", %"269"
  %2172 = icmp eq i8* %40, null
  br i1 %2172, label %"273", label %"272"

"272":                                            ; preds = %"271"
  call void @free(i8* %40) #1
  br label %"273"

"273":                                            ; preds = %"272", %"271"
  %2173 = icmp eq i8* %39, null
  br i1 %2173, label %"275", label %"274"

"274":                                            ; preds = %"273"
  call void @free(i8* %39) #1
  br label %"275"

"275":                                            ; preds = %"274", %"273"
  %2174 = icmp eq i8* %38, null
  br i1 %2174, label %"277", label %"276"

"276":                                            ; preds = %"275"
  call void @free(i8* %38) #1
  br label %"277"

"277":                                            ; preds = %"276", %"275"
  %2175 = icmp eq i8* %37, null
  br i1 %2175, label %"279", label %"278"

"278":                                            ; preds = %"277"
  call void @free(i8* %37) #1
  br label %"279"

"279":                                            ; preds = %"278", %"277"
  %2176 = icmp eq i8* %36, null
  br i1 %2176, label %"281", label %"280"

"280":                                            ; preds = %"279"
  call void @free(i8* %36) #1
  br label %"281"

"281":                                            ; preds = %"280", %"279"
  %2177 = icmp eq i8* %35, null
  br i1 %2177, label %"283", label %"282"

"282":                                            ; preds = %"281"
  call void @free(i8* %35) #1
  br label %"283"

"283":                                            ; preds = %"282", %"281"
  %2178 = icmp eq i8* %34, null
  br i1 %2178, label %"285", label %"284"

"284":                                            ; preds = %"283"
  call void @free(i8* %34) #1
  br label %"285"

"285":                                            ; preds = %"284", %"283"
  %2179 = icmp eq i8* %30, null
  br i1 %2179, label %"287", label %"286"

"286":                                            ; preds = %"285"
  call void @free(i8* %30) #1
  br label %"287"

"287":                                            ; preds = %"286", %"285"
  %2180 = icmp eq i8* %29, null
  br i1 %2180, label %"289", label %"288"

"288":                                            ; preds = %"287"
  call void @free(i8* %29) #1
  br label %"289"

"289":                                            ; preds = %"288", %"287"
  %2181 = icmp eq i8* %28, null
  br i1 %2181, label %"291", label %"290"

"290":                                            ; preds = %"289"
  call void @free(i8* %28) #1
  br label %"291"

"291":                                            ; preds = %"290", %"289"
  %2182 = icmp eq i8* %26, null
  br i1 %2182, label %"293", label %"292"

"292":                                            ; preds = %"291"
  call void @free(i8* %26) #1
  br label %"293"

"293":                                            ; preds = %"292", %"291"
  %2183 = icmp eq i8* %20, null
  br i1 %2183, label %"295", label %"294"

"294":                                            ; preds = %"293"
  call void @free(i8* %20) #1
  br label %"295"

"295":                                            ; preds = %"294", %"293"
  %2184 = icmp eq i8* %19, null
  br i1 %2184, label %"297", label %"296"

"296":                                            ; preds = %"295"
  call void @free(i8* %19) #1
  br label %"297"

"297":                                            ; preds = %"296", %"295"
  %2185 = icmp eq i8* %18, null
  br i1 %2185, label %"299", label %"298"

"298":                                            ; preds = %"297"
  call void @free(i8* %18) #1
  br label %"299"

"299":                                            ; preds = %"298", %"297"
  %2186 = icmp eq i8* %17, null
  br i1 %2186, label %"301", label %"300"

"300":                                            ; preds = %"299"
  call void @free(i8* %17) #1
  br label %"301"

"301":                                            ; preds = %"300", %"299"
  %2187 = icmp eq i8* %16, null
  br i1 %2187, label %"303", label %"302"

"302":                                            ; preds = %"301"
  call void @free(i8* %16) #1
  br label %"303"

"303":                                            ; preds = %"302", %"301"
  %2188 = icmp eq i8* %15, null
  br i1 %2188, label %"305", label %"304"

"304":                                            ; preds = %"303"
  call void @free(i8* %15) #1
  br label %"305"

"305":                                            ; preds = %"304", %"303"
  %2189 = icmp eq i8* %11, null
  br i1 %2189, label %return, label %"306"

"306":                                            ; preds = %"305"
  call void @free(i8* %11) #1
  br label %return

return:                                           ; preds = %"306", %"305"
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind readnone
declare double @sqrt(double) #2

; Function Attrs: nounwind readnone
declare double @exp(double) #2

; Function Attrs: nounwind readnone
declare double @copysign(double, double) #2

declare i64 @lround(double)

; Function Attrs: nounwind readnone
declare double @llvm.powi.f64(double, i32) #2

declare void @__meteo_utilities_MOD_tgcom([0 x double]* noalias, [0 x double]* noalias, [0 x double]* noalias, [0 x double]* noalias, [0 x i32]* noalias, i32* noalias, i32* noalias, double* noalias, i32* noalias, i32* noalias, i32* noalias, i32* noalias, [0 x i32]* noalias, i32*)

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @__src_soil_MOD_terra1() unnamed_addr #0 {
entry:
  %izerror = alloca i32, align 4
  %nx = alloca i32, align 4
  %yzerrmsg = alloca [80 x i8], align 1
  %yzroutine = alloca [80 x i8], align 1
  %zdzwg = alloca [4 x double], align 8
  %zdzwsu257 = alloca [4 x double], align 8
  %str.448 = alloca [255 x i8], align 1
  br label %entry.split

entry.split:                                      ; preds = %entry
  %zdzwsu257.sub = getelementptr inbounds [4 x double], [4 x double]* %zdzwsu257, i64 0, i64 0
  %0 = getelementptr inbounds [80 x i8], [80 x i8]* %yzroutine, i64 0, i64 0
  %1 = getelementptr inbounds [80 x i8], [80 x i8]* %yzroutine, i64 0, i64 6
  %2 = load i32, i32* @__data_modelconfig_MOD_ie, align 4, !tbaa !0
  %3 = sext i32 %2 to i64
  %4 = icmp sgt i64 %3, 0
  %5 = select i1 %4, i64 %3, i64 0
  %6 = load i32, i32* @__data_modelconfig_MOD_je, align 4, !tbaa !0
  %7 = sext i32 %6 to i64
  %8 = mul nsw i64 %5, %7
  %9 = icmp slt i64 %8, 0
  %.op = shl i64 %8, 2
  %10 = select i1 %9, i64 0, i64 %.op
  %11 = icmp ne i64 %10, 0
  %12 = select i1 %11, i64 %10, i64 1
  %13 = tail call noalias i8* @malloc(i64 %12) #1
  %not = xor i64 %5, -1
  %.op233 = shl i64 %8, 3
  %14 = select i1 %9, i64 0, i64 %.op233
  %15 = icmp ne i64 %14, 0
  %16 = select i1 %15, i64 %14, i64 1
  %17 = tail call noalias i8* @malloc(i64 %16) #1
  %18 = tail call noalias i8* @malloc(i64 %16) #1
  %19 = tail call noalias i8* @malloc(i64 %16) #1
  %20 = tail call noalias i8* @malloc(i64 %16) #1
  %21 = tail call noalias i8* @malloc(i64 %16) #1
  %22 = tail call noalias i8* @malloc(i64 %16) #1
  %23 = tail call noalias i8* @malloc(i64 %16) #1
  %24 = tail call noalias i8* @malloc(i64 %16) #1
  %25 = tail call noalias i8* @malloc(i64 %16) #1
  %26 = tail call noalias i8* @malloc(i64 %16) #1
  %27 = tail call noalias i8* @malloc(i64 %16) #1
  %28 = tail call noalias i8* @malloc(i64 %16) #1
  %29 = select i1 %9, i64 0, i64 %8
  %30 = mul i64 %29, 24
  %31 = icmp ne i64 %30, 0
  %32 = select i1 %31, i64 %30, i64 1
  %33 = tail call noalias i8* @malloc(i64 %32) #1
  %34 = sub nuw nsw i64 %not, %29
  %35 = tail call noalias i8* @malloc(i64 %16) #1
  %36 = tail call noalias i8* @malloc(i64 %16) #1
  %37 = tail call noalias i8* @malloc(i64 %16) #1
  %38 = tail call noalias i8* @malloc(i64 %16) #1
  %39 = tail call noalias i8* @malloc(i64 %16) #1
  %40 = tail call noalias i8* @malloc(i64 %16) #1
  %41 = tail call noalias i8* @malloc(i64 %16) #1
  %42 = shl i64 %29, 2
  %43 = shl i64 %29, 5
  %44 = icmp ne i64 %43, 0
  %45 = select i1 %44, i64 %43, i64 1
  %46 = tail call noalias i8* @malloc(i64 %45) #1
  %47 = tail call noalias i8* @malloc(i64 %16) #1
  %48 = tail call noalias i8* @malloc(i64 %16) #1
  %49 = tail call noalias i8* @malloc(i64 %16) #1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.cst, i64 0, i64 0), i64 6, i32 1, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %1, i8 32, i64 74, i32 1, i1 false)
  store i64 538, i64* getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 2), align 16, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !10
  store i64 %3, i64* getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %50 = icmp sgt i32 %2, 0
  %51 = select i1 %50, i32 %2, i32 0
  %52 = zext i32 %51 to i64
  %53 = icmp slt i32 %2, 1
  br i1 %53, label %"8", label %"4"

"4":                                              ; preds = %entry.split
  %54 = sdiv i64 9223372036854775807, %3
  %55 = icmp slt i64 %54, 1
  %. = zext i1 %55 to i32
  br label %"8"

"8":                                              ; preds = %"4", %entry.split
  %56 = phi i32 [ %., %"4" ], [ 0, %entry.split ]
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 3, i64 1, i32 1), align 8, !tbaa !10
  store i64 %52, i64* getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %57 = icmp sgt i32 %6, 0
  %58 = select i1 %57, i32 %6, i32 0
  %59 = zext i32 %58 to i64
  %60 = icmp slt i32 %6, 1
  br i1 %60, label %"14", label %"10"

"10":                                             ; preds = %"8"
  %61 = sdiv i64 9223372036854775807, %7
  %62 = icmp slt i64 %61, %52
  %.155 = zext i1 %62 to i32
  br label %"14"

"14":                                             ; preds = %"10", %"8"
  %63 = phi i32 [ %.155, %"10" ], [ 0, %"8" ]
  %64 = add nuw nsw i32 %56, %63
  %65 = mul nuw nsw i64 %59, %52
  %66 = icmp ugt i64 %65, 2305843009213693951
  %.156 = zext i1 %66 to i32
  %not27 = xor i64 %52, -1
  %67 = icmp slt i32 %2, 1
  %68 = icmp slt i32 %6, 1
  %69 = or i1 %67, %68
  %70 = shl i64 %65, 3
  %.258 = select i1 %69, i64 0, i64 %70
  %71 = sub nsw i32 0, %64
  %72 = icmp eq i32 %.156, %71
  br i1 %72, label %"22", label %"30"

"22":                                             ; preds = %"14"
  %73 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 0), align 32, !tbaa !8
  %74 = icmp eq i8* %73, null
  br i1 %74, label %"23", label %"26"

"23":                                             ; preds = %"22"
  %75 = icmp ne i64 %.258, 0
  %76 = select i1 %75, i64 %.258, i64 1
  %77 = tail call noalias i8* @malloc(i64 %76) #1
  br label %"29"

"26":                                             ; preds = %"22"
  tail call void @free(i8* noalias %73) #1
  %78 = icmp ne i64 %.258, 0
  %79 = select i1 %78, i64 %.258, i64 1
  %80 = tail call noalias i8* @malloc(i64 %79) #1
  %.pre.pre = load i32, i32* @__data_modelconfig_MOD_ie, align 4, !tbaa !0
  br label %"29"

"29":                                             ; preds = %"26", %"23"
  %.pre = phi i32 [ %.pre.pre, %"26" ], [ %2, %"23" ]
  %81 = phi i8* [ %80, %"26" ], [ %77, %"23" ]
  store i8* %81, i8** getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 0), align 32, !tbaa !8
  br label %"30"

"30":                                             ; preds = %"29", %"14"
  %82 = phi i32 [ %2, %"14" ], [ %.pre, %"29" ]
  store i64 %not27, i64* getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 1), align 8, !tbaa !10
  store i64 538, i64* getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 2), align 16, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !10
  %83 = sext i32 %82 to i64
  store i64 %83, i64* getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %84 = icmp sgt i32 %82, 0
  %85 = select i1 %84, i32 %82, i32 0
  %86 = zext i32 %85 to i64
  %87 = icmp slt i32 %82, 1
  br i1 %87, label %"36", label %"32"

"32":                                             ; preds = %"30"
  %88 = sdiv i64 9223372036854775807, %83
  %89 = icmp slt i64 %88, 1
  %.157 = zext i1 %89 to i32
  br label %"36"

"36":                                             ; preds = %"32", %"30"
  %90 = phi i32 [ %.157, %"32" ], [ 0, %"30" ]
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 3, i64 1, i32 1), align 8, !tbaa !10
  %91 = load i32, i32* @__data_modelconfig_MOD_je, align 4, !tbaa !0
  %92 = sext i32 %91 to i64
  store i64 %92, i64* getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 3, i64 1, i32 2), align 8, !tbaa !10
  store i64 %86, i64* getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %93 = icmp sgt i32 %91, 0
  %94 = select i1 %93, i32 %91, i32 0
  %95 = zext i32 %94 to i64
  %96 = icmp slt i32 %91, 1
  br i1 %96, label %"42", label %"38"

"38":                                             ; preds = %"36"
  %97 = sdiv i64 9223372036854775807, %92
  %98 = icmp slt i64 %97, %86
  %.158 = zext i1 %98 to i32
  br label %"42"

"42":                                             ; preds = %"38", %"36"
  %99 = phi i32 [ %.158, %"38" ], [ 0, %"36" ]
  %100 = add nuw nsw i32 %90, %99
  %101 = mul nuw nsw i64 %95, %86
  %102 = icmp ugt i64 %101, 2305843009213693951
  %.159 = zext i1 %102 to i32
  %not29 = xor i64 %86, -1
  %103 = icmp slt i32 %82, 1
  %104 = icmp slt i32 %91, 1
  %105 = or i1 %103, %104
  %106 = shl i64 %101, 3
  %.259 = select i1 %105, i64 0, i64 %106
  %107 = sub nsw i32 0, %100
  %108 = icmp eq i32 %.159, %107
  br i1 %108, label %"50", label %"58"

"50":                                             ; preds = %"42"
  %109 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 0), align 32, !tbaa !8
  %110 = icmp eq i8* %109, null
  br i1 %110, label %"51", label %"54"

"51":                                             ; preds = %"50"
  %111 = icmp ne i64 %.259, 0
  %112 = select i1 %111, i64 %.259, i64 1
  %113 = tail call noalias i8* @malloc(i64 %112) #1
  br label %"57"

"54":                                             ; preds = %"50"
  tail call void @free(i8* noalias %109) #1
  %114 = icmp ne i64 %.259, 0
  %115 = select i1 %114, i64 %.259, i64 1
  %116 = tail call noalias i8* @malloc(i64 %115) #1
  %.pre386.pre = load i32, i32* @__data_modelconfig_MOD_ie, align 4, !tbaa !0
  br label %"57"

"57":                                             ; preds = %"54", %"51"
  %.pre386 = phi i32 [ %.pre386.pre, %"54" ], [ %82, %"51" ]
  %117 = phi i8* [ %116, %"54" ], [ %113, %"51" ]
  store i8* %117, i8** getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 0), align 32, !tbaa !8
  br label %"58"

"58":                                             ; preds = %"57", %"42"
  %118 = phi i32 [ %82, %"42" ], [ %.pre386, %"57" ]
  store i64 %not29, i64* getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 1), align 8, !tbaa !10
  store i64 538, i64* getelementptr inbounds (%"struct.array2_real(kind=8).11", %"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts, i64 0, i32 2), align 16, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).11", %"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !10
  %119 = sext i32 %118 to i64
  store i64 %119, i64* getelementptr inbounds (%"struct.array2_real(kind=8).11", %"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).11", %"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %120 = icmp sgt i32 %118, 0
  %121 = select i1 %120, i32 %118, i32 0
  %122 = zext i32 %121 to i64
  %123 = icmp slt i32 %118, 1
  br i1 %123, label %"64", label %"60"

"60":                                             ; preds = %"58"
  %124 = sdiv i64 9223372036854775807, %119
  %125 = icmp slt i64 %124, 1
  %.160 = zext i1 %125 to i32
  br label %"64"

"64":                                             ; preds = %"60", %"58"
  %126 = phi i32 [ %.160, %"60" ], [ 0, %"58" ]
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).11", %"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts, i64 0, i32 3, i64 1, i32 1), align 8, !tbaa !10
  %127 = load i32, i32* @__data_modelconfig_MOD_je, align 4, !tbaa !0
  %128 = sext i32 %127 to i64
  store i64 %128, i64* getelementptr inbounds (%"struct.array2_real(kind=8).11", %"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts, i64 0, i32 3, i64 1, i32 2), align 8, !tbaa !10
  store i64 %122, i64* getelementptr inbounds (%"struct.array2_real(kind=8).11", %"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %129 = icmp sgt i32 %127, 0
  %130 = select i1 %129, i32 %127, i32 0
  %131 = zext i32 %130 to i64
  %132 = icmp slt i32 %127, 1
  br i1 %132, label %"70", label %"66"

"66":                                             ; preds = %"64"
  %133 = sdiv i64 9223372036854775807, %128
  %134 = icmp slt i64 %133, %122
  %.161 = zext i1 %134 to i32
  br label %"70"

"70":                                             ; preds = %"66", %"64"
  %135 = phi i32 [ %.161, %"66" ], [ 0, %"64" ]
  %136 = add nuw nsw i32 %126, %135
  %137 = mul nuw nsw i64 %131, %122
  %138 = icmp ugt i64 %137, 2305843009213693951
  %.162 = zext i1 %138 to i32
  %not32 = xor i64 %122, -1
  %139 = icmp slt i32 %118, 1
  %140 = icmp slt i32 %127, 1
  %141 = or i1 %139, %140
  %142 = shl i64 %137, 3
  %.260 = select i1 %141, i64 0, i64 %142
  %143 = sub nsw i32 0, %136
  %144 = icmp eq i32 %.162, %143
  br i1 %144, label %"78", label %"86"

"78":                                             ; preds = %"70"
  %145 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).11", %"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts, i64 0, i32 0), align 32, !tbaa !8
  %146 = icmp eq i8* %145, null
  br i1 %146, label %"79", label %"82"

"79":                                             ; preds = %"78"
  %147 = icmp ne i64 %.260, 0
  %148 = select i1 %147, i64 %.260, i64 1
  %149 = tail call noalias i8* @malloc(i64 %148) #1
  br label %"85"

"82":                                             ; preds = %"78"
  tail call void @free(i8* noalias %145) #1
  %150 = icmp ne i64 %.260, 0
  %151 = select i1 %150, i64 %.260, i64 1
  %152 = tail call noalias i8* @malloc(i64 %151) #1
  %.pre387.pre = load i32, i32* @__data_modelconfig_MOD_ie, align 4, !tbaa !0
  br label %"85"

"85":                                             ; preds = %"82", %"79"
  %.pre387 = phi i32 [ %.pre387.pre, %"82" ], [ %118, %"79" ]
  %153 = phi i8* [ %152, %"82" ], [ %149, %"79" ]
  store i8* %153, i8** getelementptr inbounds (%"struct.array2_real(kind=8).11", %"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts, i64 0, i32 0), align 32, !tbaa !8
  br label %"86"

"86":                                             ; preds = %"85", %"70"
  %154 = phi i32 [ %118, %"70" ], [ %.pre387, %"85" ]
  store i64 %not32, i64* getelementptr inbounds (%"struct.array2_real(kind=8).11", %"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts, i64 0, i32 1), align 8, !tbaa !10
  store i64 538, i64* getelementptr inbounds (%"struct.array2_real(kind=8).10", %"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow, i64 0, i32 2), align 16, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).10", %"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !10
  %155 = sext i32 %154 to i64
  store i64 %155, i64* getelementptr inbounds (%"struct.array2_real(kind=8).10", %"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).10", %"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %156 = icmp sgt i32 %154, 0
  %157 = select i1 %156, i32 %154, i32 0
  %158 = zext i32 %157 to i64
  %159 = icmp slt i32 %154, 1
  br i1 %159, label %"92", label %"88"

"88":                                             ; preds = %"86"
  %160 = sdiv i64 9223372036854775807, %155
  %161 = icmp slt i64 %160, 1
  %.163 = zext i1 %161 to i32
  br label %"92"

"92":                                             ; preds = %"88", %"86"
  %162 = phi i32 [ %.163, %"88" ], [ 0, %"86" ]
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).10", %"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow, i64 0, i32 3, i64 1, i32 1), align 8, !tbaa !10
  %163 = load i32, i32* @__data_modelconfig_MOD_je, align 4, !tbaa !0
  %164 = sext i32 %163 to i64
  store i64 %164, i64* getelementptr inbounds (%"struct.array2_real(kind=8).10", %"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow, i64 0, i32 3, i64 1, i32 2), align 8, !tbaa !10
  store i64 %158, i64* getelementptr inbounds (%"struct.array2_real(kind=8).10", %"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %165 = icmp sgt i32 %163, 0
  %166 = select i1 %165, i32 %163, i32 0
  %167 = zext i32 %166 to i64
  %168 = icmp slt i32 %163, 1
  br i1 %168, label %"98", label %"94"

"94":                                             ; preds = %"92"
  %169 = sdiv i64 9223372036854775807, %164
  %170 = icmp slt i64 %169, %158
  %.164 = zext i1 %170 to i32
  br label %"98"

"98":                                             ; preds = %"94", %"92"
  %171 = phi i32 [ %.164, %"94" ], [ 0, %"92" ]
  %172 = add nuw nsw i32 %162, %171
  %173 = mul nuw nsw i64 %167, %158
  %174 = icmp ugt i64 %173, 2305843009213693951
  %.165 = zext i1 %174 to i32
  %not35 = xor i64 %158, -1
  %175 = icmp slt i32 %154, 1
  %176 = icmp slt i32 %163, 1
  %177 = or i1 %175, %176
  %178 = shl i64 %173, 3
  %.261 = select i1 %177, i64 0, i64 %178
  %179 = sub nsw i32 0, %172
  %180 = icmp eq i32 %.165, %179
  br i1 %180, label %"106", label %"114"

"106":                                            ; preds = %"98"
  %181 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).10", %"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow, i64 0, i32 0), align 32, !tbaa !8
  %182 = icmp eq i8* %181, null
  br i1 %182, label %"107", label %"110"

"107":                                            ; preds = %"106"
  %183 = icmp ne i64 %.261, 0
  %184 = select i1 %183, i64 %.261, i64 1
  %185 = tail call noalias i8* @malloc(i64 %184) #1
  br label %"113"

"110":                                            ; preds = %"106"
  tail call void @free(i8* noalias %181) #1
  %186 = icmp ne i64 %.261, 0
  %187 = select i1 %186, i64 %.261, i64 1
  %188 = tail call noalias i8* @malloc(i64 %187) #1
  %.pre388.pre = load i32, i32* @__data_modelconfig_MOD_ie, align 4, !tbaa !0
  br label %"113"

"113":                                            ; preds = %"110", %"107"
  %.pre388 = phi i32 [ %.pre388.pre, %"110" ], [ %154, %"107" ]
  %189 = phi i8* [ %188, %"110" ], [ %185, %"107" ]
  store i8* %189, i8** getelementptr inbounds (%"struct.array2_real(kind=8).10", %"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow, i64 0, i32 0), align 32, !tbaa !8
  br label %"114"

"114":                                            ; preds = %"113", %"98"
  %190 = phi i32 [ %154, %"98" ], [ %.pre388, %"113" ]
  store i64 %not35, i64* getelementptr inbounds (%"struct.array2_real(kind=8).10", %"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow, i64 0, i32 1), align 8, !tbaa !10
  store i64 538, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 2), align 16, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !10
  %191 = sext i32 %190 to i64
  store i64 %191, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %192 = icmp sgt i32 %190, 0
  %193 = select i1 %192, i32 %190, i32 0
  %194 = zext i32 %193 to i64
  %195 = icmp slt i32 %190, 1
  br i1 %195, label %"120", label %"116"

"116":                                            ; preds = %"114"
  %196 = sdiv i64 9223372036854775807, %191
  %197 = icmp slt i64 %196, 1
  %.166 = zext i1 %197 to i32
  br label %"120"

"120":                                            ; preds = %"116", %"114"
  %198 = phi i32 [ %.166, %"116" ], [ 0, %"114" ]
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 3, i64 1, i32 1), align 8, !tbaa !10
  %199 = load i32, i32* @__data_modelconfig_MOD_je, align 4, !tbaa !0
  %200 = sext i32 %199 to i64
  store i64 %200, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 3, i64 1, i32 2), align 8, !tbaa !10
  store i64 %194, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %201 = icmp sgt i32 %199, 0
  %202 = select i1 %201, i32 %199, i32 0
  %203 = zext i32 %202 to i64
  %204 = icmp slt i32 %199, 1
  br i1 %204, label %"126", label %"122"

"122":                                            ; preds = %"120"
  %205 = sdiv i64 9223372036854775807, %200
  %206 = icmp slt i64 %205, %194
  %.167 = zext i1 %206 to i32
  br label %"126"

"126":                                            ; preds = %"122", %"120"
  %207 = phi i32 [ %.167, %"122" ], [ 0, %"120" ]
  %208 = add nuw nsw i32 %198, %207
  %209 = mul nuw nsw i64 %203, %194
  %210 = icmp ugt i64 %209, 2305843009213693951
  %.168 = zext i1 %210 to i32
  %not38 = xor i64 %194, -1
  %211 = icmp slt i32 %190, 1
  %212 = icmp slt i32 %199, 1
  %213 = or i1 %211, %212
  %214 = shl i64 %209, 3
  %.262 = select i1 %213, i64 0, i64 %214
  %215 = sub nsw i32 0, %208
  %216 = icmp eq i32 %.168, %215
  br i1 %216, label %"134", label %"142"

"134":                                            ; preds = %"126"
  %217 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 0), align 32, !tbaa !8
  %218 = icmp eq i8* %217, null
  br i1 %218, label %"135", label %"138"

"135":                                            ; preds = %"134"
  %219 = icmp ne i64 %.262, 0
  %220 = select i1 %219, i64 %.262, i64 1
  %221 = tail call noalias i8* @malloc(i64 %220) #1
  br label %"141"

"138":                                            ; preds = %"134"
  tail call void @free(i8* noalias %217) #1
  %222 = icmp ne i64 %.262, 0
  %223 = select i1 %222, i64 %.262, i64 1
  %224 = tail call noalias i8* @malloc(i64 %223) #1
  %.pre389.pre = load i32, i32* @__data_modelconfig_MOD_ie, align 4, !tbaa !0
  br label %"141"

"141":                                            ; preds = %"138", %"135"
  %.pre389 = phi i32 [ %.pre389.pre, %"138" ], [ %190, %"135" ]
  %225 = phi i8* [ %224, %"138" ], [ %221, %"135" ]
  store i8* %225, i8** getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 0), align 32, !tbaa !8
  br label %"142"

"142":                                            ; preds = %"141", %"126"
  %226 = phi i32 [ %190, %"126" ], [ %.pre389, %"141" ]
  store i64 %not38, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 1), align 8, !tbaa !10
  store i64 538, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 2), align 16, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !10
  %227 = sext i32 %226 to i64
  store i64 %227, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %228 = icmp sgt i32 %226, 0
  %229 = select i1 %228, i32 %226, i32 0
  %230 = zext i32 %229 to i64
  %231 = icmp slt i32 %226, 1
  br i1 %231, label %"148", label %"144"

"144":                                            ; preds = %"142"
  %232 = sdiv i64 9223372036854775807, %227
  %233 = icmp slt i64 %232, 1
  %.169 = zext i1 %233 to i32
  br label %"148"

"148":                                            ; preds = %"144", %"142"
  %234 = phi i32 [ %.169, %"144" ], [ 0, %"142" ]
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 3, i64 1, i32 1), align 8, !tbaa !10
  %235 = load i32, i32* @__data_modelconfig_MOD_je, align 4, !tbaa !0
  %236 = sext i32 %235 to i64
  store i64 %236, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 3, i64 1, i32 2), align 8, !tbaa !10
  store i64 %230, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %237 = icmp sgt i32 %235, 0
  %238 = select i1 %237, i32 %235, i32 0
  %239 = zext i32 %238 to i64
  %240 = icmp slt i32 %235, 1
  br i1 %240, label %"154", label %"150"

"150":                                            ; preds = %"148"
  %241 = sdiv i64 9223372036854775807, %236
  %242 = icmp slt i64 %241, %230
  %.170 = zext i1 %242 to i32
  br label %"154"

"154":                                            ; preds = %"150", %"148"
  %243 = phi i32 [ %.170, %"150" ], [ 0, %"148" ]
  %244 = add nuw nsw i32 %234, %243
  %245 = mul nuw nsw i64 %239, %230
  %246 = icmp ugt i64 %245, 2305843009213693951
  %.171 = zext i1 %246 to i32
  %not41 = xor i64 %230, -1
  %247 = icmp slt i32 %226, 1
  %248 = icmp slt i32 %235, 1
  %249 = or i1 %247, %248
  %250 = shl i64 %245, 3
  %.263 = select i1 %249, i64 0, i64 %250
  %251 = sub nsw i32 0, %244
  %252 = icmp eq i32 %.171, %251
  br i1 %252, label %"162", label %"170"

"162":                                            ; preds = %"154"
  %253 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 0), align 32, !tbaa !8
  %254 = icmp eq i8* %253, null
  br i1 %254, label %"163", label %"166"

"163":                                            ; preds = %"162"
  %255 = icmp ne i64 %.263, 0
  %256 = select i1 %255, i64 %.263, i64 1
  %257 = tail call noalias i8* @malloc(i64 %256) #1
  br label %"169"

"166":                                            ; preds = %"162"
  tail call void @free(i8* noalias %253) #1
  %258 = icmp ne i64 %.263, 0
  %259 = select i1 %258, i64 %.263, i64 1
  %260 = tail call noalias i8* @malloc(i64 %259) #1
  %.pre390.pre = load i32, i32* @__data_modelconfig_MOD_ie, align 4, !tbaa !0
  br label %"169"

"169":                                            ; preds = %"166", %"163"
  %.pre390 = phi i32 [ %.pre390.pre, %"166" ], [ %226, %"163" ]
  %261 = phi i8* [ %260, %"166" ], [ %257, %"163" ]
  store i8* %261, i8** getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 0), align 32, !tbaa !8
  br label %"170"

"170":                                            ; preds = %"169", %"154"
  %262 = phi i32 [ %226, %"154" ], [ %.pre390, %"169" ]
  store i64 %not41, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 1), align 8, !tbaa !10
  store i64 538, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 2), align 16, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !10
  %263 = sext i32 %262 to i64
  store i64 %263, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %264 = icmp sgt i32 %262, 0
  %265 = select i1 %264, i32 %262, i32 0
  %266 = zext i32 %265 to i64
  %267 = icmp slt i32 %262, 1
  br i1 %267, label %"176", label %"172"

"172":                                            ; preds = %"170"
  %268 = sdiv i64 9223372036854775807, %263
  %269 = icmp slt i64 %268, 1
  %.172 = zext i1 %269 to i32
  br label %"176"

"176":                                            ; preds = %"172", %"170"
  %270 = phi i32 [ %.172, %"172" ], [ 0, %"170" ]
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 3, i64 1, i32 1), align 8, !tbaa !10
  %271 = load i32, i32* @__data_modelconfig_MOD_je, align 4, !tbaa !0
  %272 = sext i32 %271 to i64
  store i64 %272, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 3, i64 1, i32 2), align 8, !tbaa !10
  store i64 %266, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %273 = icmp sgt i32 %271, 0
  %274 = select i1 %273, i32 %271, i32 0
  %275 = zext i32 %274 to i64
  %276 = icmp slt i32 %271, 1
  br i1 %276, label %"182", label %"178"

"178":                                            ; preds = %"176"
  %277 = sdiv i64 9223372036854775807, %272
  %278 = icmp slt i64 %277, %266
  %.173 = zext i1 %278 to i32
  br label %"182"

"182":                                            ; preds = %"178", %"176"
  %279 = phi i32 [ %.173, %"178" ], [ 0, %"176" ]
  %280 = add nuw nsw i32 %270, %279
  %281 = mul nuw nsw i64 %275, %266
  %282 = icmp ugt i64 %281, 2305843009213693951
  %.174 = zext i1 %282 to i32
  %not44 = xor i64 %266, -1
  %283 = icmp slt i32 %262, 1
  %284 = icmp slt i32 %271, 1
  %285 = or i1 %283, %284
  %286 = shl i64 %281, 3
  %.264 = select i1 %285, i64 0, i64 %286
  %287 = sub nsw i32 0, %280
  %288 = icmp eq i32 %.174, %287
  br i1 %288, label %"190", label %"198"

"190":                                            ; preds = %"182"
  %289 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 0), align 32, !tbaa !8
  %290 = icmp eq i8* %289, null
  br i1 %290, label %"191", label %"194"

"191":                                            ; preds = %"190"
  %291 = icmp ne i64 %.264, 0
  %292 = select i1 %291, i64 %.264, i64 1
  %293 = tail call noalias i8* @malloc(i64 %292) #1
  br label %"197"

"194":                                            ; preds = %"190"
  tail call void @free(i8* noalias %289) #1
  %294 = icmp ne i64 %.264, 0
  %295 = select i1 %294, i64 %.264, i64 1
  %296 = tail call noalias i8* @malloc(i64 %295) #1
  %.pre391.pre = load i32, i32* @__data_modelconfig_MOD_ie, align 4, !tbaa !0
  br label %"197"

"197":                                            ; preds = %"194", %"191"
  %.pre391 = phi i32 [ %.pre391.pre, %"194" ], [ %262, %"191" ]
  %297 = phi i8* [ %296, %"194" ], [ %293, %"191" ]
  store i8* %297, i8** getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 0), align 32, !tbaa !8
  br label %"198"

"198":                                            ; preds = %"197", %"182"
  %298 = phi i32 [ %262, %"182" ], [ %.pre391, %"197" ]
  store i64 %not44, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 1), align 8, !tbaa !10
  store i64 538, i64* getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 2), align 16, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !10
  %299 = sext i32 %298 to i64
  store i64 %299, i64* getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %300 = icmp sgt i32 %298, 0
  %301 = select i1 %300, i32 %298, i32 0
  %302 = zext i32 %301 to i64
  %303 = icmp slt i32 %298, 1
  br i1 %303, label %"204", label %"200"

"200":                                            ; preds = %"198"
  %304 = sdiv i64 9223372036854775807, %299
  %305 = icmp slt i64 %304, 1
  %.175 = zext i1 %305 to i32
  br label %"204"

"204":                                            ; preds = %"200", %"198"
  %306 = phi i32 [ %.175, %"200" ], [ 0, %"198" ]
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 3, i64 1, i32 1), align 8, !tbaa !10
  %307 = load i32, i32* @__data_modelconfig_MOD_je, align 4, !tbaa !0
  %308 = sext i32 %307 to i64
  store i64 %308, i64* getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 3, i64 1, i32 2), align 8, !tbaa !10
  store i64 %302, i64* getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %309 = icmp sgt i32 %307, 0
  %310 = select i1 %309, i32 %307, i32 0
  %311 = zext i32 %310 to i64
  %312 = icmp slt i32 %307, 1
  br i1 %312, label %"210", label %"206"

"206":                                            ; preds = %"204"
  %313 = sdiv i64 9223372036854775807, %308
  %314 = icmp slt i64 %313, %302
  %.176 = zext i1 %314 to i32
  br label %"210"

"210":                                            ; preds = %"206", %"204"
  %315 = phi i32 [ %.176, %"206" ], [ 0, %"204" ]
  %316 = add nuw nsw i32 %306, %315
  %317 = mul nuw nsw i64 %311, %302
  %318 = icmp ugt i64 %317, 2305843009213693951
  %.177 = zext i1 %318 to i32
  %not47 = xor i64 %302, -1
  %319 = icmp slt i32 %298, 1
  %320 = icmp slt i32 %307, 1
  %321 = or i1 %319, %320
  %322 = shl i64 %317, 3
  %.265 = select i1 %321, i64 0, i64 %322
  %323 = sub nsw i32 0, %316
  %324 = icmp eq i32 %.177, %323
  br i1 %324, label %"218", label %"226"

"218":                                            ; preds = %"210"
  %325 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 0), align 32, !tbaa !8
  %326 = icmp eq i8* %325, null
  br i1 %326, label %"219", label %"222"

"219":                                            ; preds = %"218"
  %327 = icmp ne i64 %.265, 0
  %328 = select i1 %327, i64 %.265, i64 1
  %329 = tail call noalias i8* @malloc(i64 %328) #1
  br label %"225"

"222":                                            ; preds = %"218"
  tail call void @free(i8* noalias %325) #1
  %330 = icmp ne i64 %.265, 0
  %331 = select i1 %330, i64 %.265, i64 1
  %332 = tail call noalias i8* @malloc(i64 %331) #1
  %.pre392.pre = load i32, i32* @__data_modelconfig_MOD_ie, align 4, !tbaa !0
  br label %"225"

"225":                                            ; preds = %"222", %"219"
  %.pre392 = phi i32 [ %.pre392.pre, %"222" ], [ %298, %"219" ]
  %333 = phi i8* [ %332, %"222" ], [ %329, %"219" ]
  store i8* %333, i8** getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 0), align 32, !tbaa !8
  br label %"226"

"226":                                            ; preds = %"225", %"210"
  %334 = phi i32 [ %298, %"210" ], [ %.pre392, %"225" ]
  store i64 %not47, i64* getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 1), align 8, !tbaa !10
  store i64 538, i64* getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 2), align 16, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !10
  %335 = sext i32 %334 to i64
  store i64 %335, i64* getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %336 = icmp sgt i32 %334, 0
  %337 = select i1 %336, i32 %334, i32 0
  %338 = zext i32 %337 to i64
  %339 = icmp slt i32 %334, 1
  br i1 %339, label %"232", label %"228"

"228":                                            ; preds = %"226"
  %340 = sdiv i64 9223372036854775807, %335
  %341 = icmp slt i64 %340, 1
  %.178 = zext i1 %341 to i32
  br label %"232"

"232":                                            ; preds = %"228", %"226"
  %342 = phi i32 [ %.178, %"228" ], [ 0, %"226" ]
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 3, i64 1, i32 1), align 8, !tbaa !10
  %343 = load i32, i32* @__data_modelconfig_MOD_je, align 4, !tbaa !0
  %344 = sext i32 %343 to i64
  store i64 %344, i64* getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 3, i64 1, i32 2), align 8, !tbaa !10
  store i64 %338, i64* getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %345 = icmp sgt i32 %343, 0
  %346 = select i1 %345, i32 %343, i32 0
  %347 = zext i32 %346 to i64
  %348 = icmp slt i32 %343, 1
  br i1 %348, label %"238", label %"234"

"234":                                            ; preds = %"232"
  %349 = sdiv i64 9223372036854775807, %344
  %350 = icmp slt i64 %349, %338
  %.179 = zext i1 %350 to i32
  br label %"238"

"238":                                            ; preds = %"234", %"232"
  %351 = phi i32 [ %.179, %"234" ], [ 0, %"232" ]
  %352 = add nuw nsw i32 %342, %351
  %353 = mul nuw nsw i64 %347, %338
  %354 = icmp ugt i64 %353, 2305843009213693951
  %.180 = zext i1 %354 to i32
  %not50 = xor i64 %338, -1
  %355 = icmp slt i32 %334, 1
  %356 = icmp slt i32 %343, 1
  %357 = or i1 %355, %356
  %358 = shl i64 %353, 3
  %.266 = select i1 %357, i64 0, i64 %358
  %359 = sub nsw i32 0, %352
  %360 = icmp eq i32 %.180, %359
  br i1 %360, label %"246", label %"254"

"246":                                            ; preds = %"238"
  %361 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 0), align 32, !tbaa !8
  %362 = icmp eq i8* %361, null
  br i1 %362, label %"247", label %"250"

"247":                                            ; preds = %"246"
  %363 = icmp ne i64 %.266, 0
  %364 = select i1 %363, i64 %.266, i64 1
  %365 = tail call noalias i8* @malloc(i64 %364) #1
  br label %"253"

"250":                                            ; preds = %"246"
  tail call void @free(i8* noalias %361) #1
  %366 = icmp ne i64 %.266, 0
  %367 = select i1 %366, i64 %.266, i64 1
  %368 = tail call noalias i8* @malloc(i64 %367) #1
  %.pre393.pre = load i32, i32* @__data_modelconfig_MOD_ie, align 4, !tbaa !0
  br label %"253"

"253":                                            ; preds = %"250", %"247"
  %.pre393 = phi i32 [ %.pre393.pre, %"250" ], [ %334, %"247" ]
  %369 = phi i8* [ %368, %"250" ], [ %365, %"247" ]
  store i8* %369, i8** getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 0), align 32, !tbaa !8
  br label %"254"

"254":                                            ; preds = %"253", %"238"
  %370 = phi i32 [ %334, %"238" ], [ %.pre393, %"253" ]
  store i64 %not50, i64* getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 1), align 8, !tbaa !10
  store i64 538, i64* getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 2), align 16, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !10
  %371 = sext i32 %370 to i64
  store i64 %371, i64* getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %372 = icmp sgt i32 %370, 0
  %373 = select i1 %372, i32 %370, i32 0
  %374 = zext i32 %373 to i64
  %375 = icmp slt i32 %370, 1
  br i1 %375, label %"260", label %"256"

"256":                                            ; preds = %"254"
  %376 = sdiv i64 9223372036854775807, %371
  %377 = icmp slt i64 %376, 1
  %.181 = zext i1 %377 to i32
  br label %"260"

"260":                                            ; preds = %"256", %"254"
  %378 = phi i32 [ %.181, %"256" ], [ 0, %"254" ]
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 3, i64 1, i32 1), align 8, !tbaa !10
  %379 = load i32, i32* @__data_modelconfig_MOD_je, align 4, !tbaa !0
  %380 = sext i32 %379 to i64
  store i64 %380, i64* getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 3, i64 1, i32 2), align 8, !tbaa !10
  store i64 %374, i64* getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %381 = icmp sgt i32 %379, 0
  %382 = select i1 %381, i32 %379, i32 0
  %383 = zext i32 %382 to i64
  %384 = icmp slt i32 %379, 1
  br i1 %384, label %"266", label %"262"

"262":                                            ; preds = %"260"
  %385 = sdiv i64 9223372036854775807, %380
  %386 = icmp slt i64 %385, %374
  %.182 = zext i1 %386 to i32
  br label %"266"

"266":                                            ; preds = %"262", %"260"
  %387 = phi i32 [ %.182, %"262" ], [ 0, %"260" ]
  %388 = add nuw nsw i32 %378, %387
  %389 = mul nuw nsw i64 %383, %374
  %390 = icmp ugt i64 %389, 2305843009213693951
  %.183 = zext i1 %390 to i32
  %not53 = xor i64 %374, -1
  %391 = icmp slt i32 %370, 1
  %392 = icmp slt i32 %379, 1
  %393 = or i1 %391, %392
  %394 = shl i64 %389, 3
  %.267 = select i1 %393, i64 0, i64 %394
  %395 = sub nsw i32 0, %388
  %396 = icmp eq i32 %.183, %395
  br i1 %396, label %"274", label %"282"

"274":                                            ; preds = %"266"
  %397 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 0), align 32, !tbaa !8
  %398 = icmp eq i8* %397, null
  br i1 %398, label %"275", label %"278"

"275":                                            ; preds = %"274"
  %399 = icmp ne i64 %.267, 0
  %400 = select i1 %399, i64 %.267, i64 1
  %401 = tail call noalias i8* @malloc(i64 %400) #1
  br label %"281"

"278":                                            ; preds = %"274"
  tail call void @free(i8* noalias %397) #1
  %402 = icmp ne i64 %.267, 0
  %403 = select i1 %402, i64 %.267, i64 1
  %404 = tail call noalias i8* @malloc(i64 %403) #1
  %.pre394.pre = load i32, i32* @__data_modelconfig_MOD_ie, align 4, !tbaa !0
  br label %"281"

"281":                                            ; preds = %"278", %"275"
  %.pre394 = phi i32 [ %.pre394.pre, %"278" ], [ %370, %"275" ]
  %405 = phi i8* [ %404, %"278" ], [ %401, %"275" ]
  store i8* %405, i8** getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 0), align 32, !tbaa !8
  br label %"282"

"282":                                            ; preds = %"281", %"266"
  %406 = phi i32 [ %370, %"266" ], [ %.pre394, %"281" ]
  store i64 %not53, i64* getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 1), align 8, !tbaa !10
  store i64 538, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 2), align 16, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !10
  %407 = sext i32 %406 to i64
  store i64 %407, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %408 = icmp sgt i32 %406, 0
  %409 = select i1 %408, i32 %406, i32 0
  %410 = zext i32 %409 to i64
  %411 = icmp slt i32 %406, 1
  br i1 %411, label %"288", label %"284"

"284":                                            ; preds = %"282"
  %412 = sdiv i64 9223372036854775807, %407
  %413 = icmp slt i64 %412, 1
  %.184 = zext i1 %413 to i32
  br label %"288"

"288":                                            ; preds = %"284", %"282"
  %414 = phi i32 [ %.184, %"284" ], [ 0, %"282" ]
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 3, i64 1, i32 1), align 8, !tbaa !10
  %415 = load i32, i32* @__data_modelconfig_MOD_je, align 4, !tbaa !0
  %416 = sext i32 %415 to i64
  store i64 %416, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 3, i64 1, i32 2), align 8, !tbaa !10
  store i64 %410, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %417 = icmp sgt i32 %415, 0
  %418 = select i1 %417, i32 %415, i32 0
  %419 = zext i32 %418 to i64
  %420 = icmp slt i32 %415, 1
  br i1 %420, label %"294", label %"290"

"290":                                            ; preds = %"288"
  %421 = sdiv i64 9223372036854775807, %416
  %422 = icmp slt i64 %421, %410
  %.185 = zext i1 %422 to i32
  br label %"294"

"294":                                            ; preds = %"290", %"288"
  %423 = phi i32 [ %.185, %"290" ], [ 0, %"288" ]
  %424 = add nuw nsw i32 %414, %423
  %425 = mul nuw nsw i64 %419, %410
  %426 = icmp ugt i64 %425, 2305843009213693951
  %.186 = zext i1 %426 to i32
  %not56 = xor i64 %410, -1
  %427 = icmp slt i32 %406, 1
  %428 = icmp slt i32 %415, 1
  %429 = or i1 %427, %428
  %430 = shl i64 %425, 3
  %.268 = select i1 %429, i64 0, i64 %430
  %431 = sub nsw i32 0, %424
  %432 = icmp eq i32 %.186, %431
  br i1 %432, label %"302", label %"310"

"302":                                            ; preds = %"294"
  %433 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 0), align 32, !tbaa !8
  %434 = icmp eq i8* %433, null
  br i1 %434, label %"303", label %"306"

"303":                                            ; preds = %"302"
  %435 = icmp ne i64 %.268, 0
  %436 = select i1 %435, i64 %.268, i64 1
  %437 = tail call noalias i8* @malloc(i64 %436) #1
  br label %"309"

"306":                                            ; preds = %"302"
  tail call void @free(i8* noalias %433) #1
  %438 = icmp ne i64 %.268, 0
  %439 = select i1 %438, i64 %.268, i64 1
  %440 = tail call noalias i8* @malloc(i64 %439) #1
  %.pre395.pre = load i32, i32* @__data_modelconfig_MOD_ie, align 4, !tbaa !0
  br label %"309"

"309":                                            ; preds = %"306", %"303"
  %.pre395 = phi i32 [ %.pre395.pre, %"306" ], [ %406, %"303" ]
  %441 = phi i8* [ %440, %"306" ], [ %437, %"303" ]
  store i8* %441, i8** getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 0), align 32, !tbaa !8
  br label %"310"

"310":                                            ; preds = %"309", %"294"
  %442 = phi i32 [ %406, %"294" ], [ %.pre395, %"309" ]
  store i64 %not56, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 1), align 8, !tbaa !10
  store i64 538, i64* getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 2), align 16, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !10
  %443 = sext i32 %442 to i64
  store i64 %443, i64* getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %444 = icmp sgt i32 %442, 0
  %445 = select i1 %444, i32 %442, i32 0
  %446 = zext i32 %445 to i64
  %447 = icmp slt i32 %442, 1
  br i1 %447, label %"316", label %"312"

"312":                                            ; preds = %"310"
  %448 = sdiv i64 9223372036854775807, %443
  %449 = icmp slt i64 %448, 1
  %.187 = zext i1 %449 to i32
  br label %"316"

"316":                                            ; preds = %"312", %"310"
  %450 = phi i32 [ %.187, %"312" ], [ 0, %"310" ]
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 3, i64 1, i32 1), align 8, !tbaa !10
  %451 = load i32, i32* @__data_modelconfig_MOD_je, align 4, !tbaa !0
  %452 = sext i32 %451 to i64
  store i64 %452, i64* getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 3, i64 1, i32 2), align 8, !tbaa !10
  store i64 %446, i64* getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %453 = icmp sgt i32 %451, 0
  %454 = select i1 %453, i32 %451, i32 0
  %455 = zext i32 %454 to i64
  %456 = icmp slt i32 %451, 1
  br i1 %456, label %"322", label %"318"

"318":                                            ; preds = %"316"
  %457 = sdiv i64 9223372036854775807, %452
  %458 = icmp slt i64 %457, %446
  %.188 = zext i1 %458 to i32
  br label %"322"

"322":                                            ; preds = %"318", %"316"
  %459 = phi i32 [ %.188, %"318" ], [ 0, %"316" ]
  %460 = add nuw nsw i32 %450, %459
  %461 = mul nuw nsw i64 %455, %446
  %462 = icmp ugt i64 %461, 2305843009213693951
  %.189 = zext i1 %462 to i32
  %not59 = xor i64 %446, -1
  %463 = icmp slt i32 %442, 1
  %464 = icmp slt i32 %451, 1
  %465 = or i1 %463, %464
  %466 = shl i64 %461, 3
  %.269 = select i1 %465, i64 0, i64 %466
  %467 = sub nsw i32 0, %460
  %468 = icmp eq i32 %.189, %467
  br i1 %468, label %"330", label %"338"

"330":                                            ; preds = %"322"
  %469 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 0), align 32, !tbaa !8
  %470 = icmp eq i8* %469, null
  br i1 %470, label %"331", label %"334"

"331":                                            ; preds = %"330"
  %471 = icmp ne i64 %.269, 0
  %472 = select i1 %471, i64 %.269, i64 1
  %473 = tail call noalias i8* @malloc(i64 %472) #1
  br label %"337"

"334":                                            ; preds = %"330"
  tail call void @free(i8* noalias %469) #1
  %474 = icmp ne i64 %.269, 0
  %475 = select i1 %474, i64 %.269, i64 1
  %476 = tail call noalias i8* @malloc(i64 %475) #1
  %.pre396.pre = load i32, i32* @__data_modelconfig_MOD_ie, align 4, !tbaa !0
  br label %"337"

"337":                                            ; preds = %"334", %"331"
  %.pre396 = phi i32 [ %.pre396.pre, %"334" ], [ %442, %"331" ]
  %477 = phi i8* [ %476, %"334" ], [ %473, %"331" ]
  store i8* %477, i8** getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 0), align 32, !tbaa !8
  br label %"338"

"338":                                            ; preds = %"337", %"322"
  %478 = phi i32 [ %442, %"322" ], [ %.pre396, %"337" ]
  store i64 %not59, i64* getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 1), align 8, !tbaa !10
  store i64 538, i64* getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 2), align 16, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !10
  %479 = sext i32 %478 to i64
  store i64 %479, i64* getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %480 = icmp sgt i32 %478, 0
  %481 = select i1 %480, i32 %478, i32 0
  %482 = zext i32 %481 to i64
  %483 = icmp slt i32 %478, 1
  br i1 %483, label %"344", label %"340"

"340":                                            ; preds = %"338"
  %484 = sdiv i64 9223372036854775807, %479
  %485 = icmp slt i64 %484, 1
  %.190 = zext i1 %485 to i32
  br label %"344"

"344":                                            ; preds = %"340", %"338"
  %486 = phi i32 [ %.190, %"340" ], [ 0, %"338" ]
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 3, i64 1, i32 1), align 8, !tbaa !10
  %487 = load i32, i32* @__data_modelconfig_MOD_je, align 4, !tbaa !0
  %488 = sext i32 %487 to i64
  store i64 %488, i64* getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 3, i64 1, i32 2), align 8, !tbaa !10
  store i64 %482, i64* getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %489 = icmp sgt i32 %487, 0
  %490 = select i1 %489, i32 %487, i32 0
  %491 = zext i32 %490 to i64
  %492 = icmp slt i32 %487, 1
  br i1 %492, label %"350", label %"346"

"346":                                            ; preds = %"344"
  %493 = sdiv i64 9223372036854775807, %488
  %494 = icmp slt i64 %493, %482
  %.191 = zext i1 %494 to i32
  br label %"350"

"350":                                            ; preds = %"346", %"344"
  %495 = phi i32 [ %.191, %"346" ], [ 0, %"344" ]
  %496 = add nuw nsw i32 %486, %495
  %497 = mul nuw nsw i64 %491, %482
  %498 = icmp ugt i64 %497, 2305843009213693951
  %.192 = zext i1 %498 to i32
  %not62 = xor i64 %482, -1
  %499 = icmp slt i32 %478, 1
  %500 = icmp slt i32 %487, 1
  %501 = or i1 %499, %500
  %502 = shl i64 %497, 3
  %.270 = select i1 %501, i64 0, i64 %502
  %503 = sub nsw i32 0, %496
  %504 = icmp eq i32 %.192, %503
  br i1 %504, label %"358", label %"366"

"358":                                            ; preds = %"350"
  %505 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 0), align 32, !tbaa !8
  %506 = icmp eq i8* %505, null
  br i1 %506, label %"359", label %"362"

"359":                                            ; preds = %"358"
  %507 = icmp ne i64 %.270, 0
  %508 = select i1 %507, i64 %.270, i64 1
  %509 = tail call noalias i8* @malloc(i64 %508) #1
  br label %"365"

"362":                                            ; preds = %"358"
  tail call void @free(i8* noalias %505) #1
  %510 = icmp ne i64 %.270, 0
  %511 = select i1 %510, i64 %.270, i64 1
  %512 = tail call noalias i8* @malloc(i64 %511) #1
  %.pre397.pre = load i32, i32* @__data_modelconfig_MOD_ie, align 4, !tbaa !0
  br label %"365"

"365":                                            ; preds = %"362", %"359"
  %.pre397 = phi i32 [ %.pre397.pre, %"362" ], [ %478, %"359" ]
  %513 = phi i8* [ %512, %"362" ], [ %509, %"359" ]
  store i8* %513, i8** getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 0), align 32, !tbaa !8
  br label %"366"

"366":                                            ; preds = %"365", %"350"
  %514 = phi i32 [ %478, %"350" ], [ %.pre397, %"365" ]
  store i64 %not62, i64* getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 1), align 8, !tbaa !10
  store i64 538, i64* getelementptr inbounds (%"struct.array2_real(kind=8)", %"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low, i64 0, i32 2), align 16, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8)", %"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !10
  %515 = sext i32 %514 to i64
  store i64 %515, i64* getelementptr inbounds (%"struct.array2_real(kind=8)", %"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8)", %"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %516 = icmp sgt i32 %514, 0
  %517 = select i1 %516, i32 %514, i32 0
  %518 = zext i32 %517 to i64
  %519 = icmp slt i32 %514, 1
  br i1 %519, label %"372", label %"368"

"368":                                            ; preds = %"366"
  %520 = sdiv i64 9223372036854775807, %515
  %521 = icmp slt i64 %520, 1
  %.193 = zext i1 %521 to i32
  br label %"372"

"372":                                            ; preds = %"368", %"366"
  %522 = phi i32 [ %.193, %"368" ], [ 0, %"366" ]
  store i64 1, i64* getelementptr inbounds (%"struct.array2_real(kind=8)", %"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low, i64 0, i32 3, i64 1, i32 1), align 8, !tbaa !10
  %523 = load i32, i32* @__data_modelconfig_MOD_je, align 4, !tbaa !0
  %524 = sext i32 %523 to i64
  store i64 %524, i64* getelementptr inbounds (%"struct.array2_real(kind=8)", %"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low, i64 0, i32 3, i64 1, i32 2), align 8, !tbaa !10
  store i64 %518, i64* getelementptr inbounds (%"struct.array2_real(kind=8)", %"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %525 = icmp sgt i32 %523, 0
  %526 = select i1 %525, i32 %523, i32 0
  %527 = zext i32 %526 to i64
  %528 = icmp slt i32 %523, 1
  br i1 %528, label %"378", label %"374"

"374":                                            ; preds = %"372"
  %529 = sdiv i64 9223372036854775807, %524
  %530 = icmp slt i64 %529, %518
  %.194 = zext i1 %530 to i32
  br label %"378"

"378":                                            ; preds = %"374", %"372"
  %531 = phi i32 [ %.194, %"374" ], [ 0, %"372" ]
  %532 = add nuw nsw i32 %522, %531
  %533 = mul nuw nsw i64 %527, %518
  %534 = icmp ugt i64 %533, 2305843009213693951
  %.195 = zext i1 %534 to i32
  %not65 = xor i64 %518, -1
  %535 = icmp slt i32 %514, 1
  %536 = icmp slt i32 %523, 1
  %537 = or i1 %535, %536
  %538 = shl i64 %533, 3
  %.271 = select i1 %537, i64 0, i64 %538
  %539 = sub nsw i32 0, %532
  %540 = icmp eq i32 %.195, %539
  br i1 %540, label %"386", label %"394"

"386":                                            ; preds = %"378"
  %541 = load i8*, i8** getelementptr inbounds (%"struct.array2_real(kind=8)", %"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low, i64 0, i32 0), align 32, !tbaa !8
  %542 = icmp eq i8* %541, null
  br i1 %542, label %"387", label %"390"

"387":                                            ; preds = %"386"
  %543 = icmp ne i64 %.271, 0
  %544 = select i1 %543, i64 %.271, i64 1
  %545 = tail call noalias i8* @malloc(i64 %544) #1
  br label %"393"

"390":                                            ; preds = %"386"
  tail call void @free(i8* noalias %541) #1
  %546 = icmp ne i64 %.271, 0
  %547 = select i1 %546, i64 %.271, i64 1
  %548 = tail call noalias i8* @malloc(i64 %547) #1
  %.pre398.pre = load i32, i32* @__data_modelconfig_MOD_ie, align 4, !tbaa !0
  br label %"393"

"393":                                            ; preds = %"390", %"387"
  %.pre398 = phi i32 [ %.pre398.pre, %"390" ], [ %514, %"387" ]
  %549 = phi i8* [ %548, %"390" ], [ %545, %"387" ]
  store i8* %549, i8** getelementptr inbounds (%"struct.array2_real(kind=8)", %"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low, i64 0, i32 0), align 32, !tbaa !8
  br label %"394"

"394":                                            ; preds = %"393", %"378"
  %550 = phi i32 [ %514, %"378" ], [ %.pre398, %"393" ]
  store i64 %not65, i64* getelementptr inbounds (%"struct.array2_real(kind=8)", %"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low, i64 0, i32 1), align 8, !tbaa !10
  store i64 539, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 2), align 16, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 0, i32 1), align 8, !tbaa !10
  %551 = sext i32 %550 to i64
  store i64 %551, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 0, i32 2), align 8, !tbaa !10
  store i64 1, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %552 = icmp sgt i32 %550, 0
  %553 = select i1 %552, i32 %550, i32 0
  %554 = zext i32 %553 to i64
  %555 = icmp slt i32 %550, 1
  br i1 %555, label %"400", label %"396"

"396":                                            ; preds = %"394"
  %556 = sdiv i64 9223372036854775807, %551
  %557 = icmp slt i64 %556, 1
  %.196 = zext i1 %557 to i32
  br label %"400"

"400":                                            ; preds = %"396", %"394"
  %558 = phi i32 [ %.196, %"396" ], [ 0, %"394" ]
  store i64 1, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 1, i32 1), align 8, !tbaa !10
  %559 = load i32, i32* @__data_modelconfig_MOD_je, align 4, !tbaa !0
  %560 = sext i32 %559 to i64
  store i64 %560, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 1, i32 2), align 8, !tbaa !10
  store i64 %554, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %561 = icmp sgt i32 %559, 0
  %562 = select i1 %561, i32 %559, i32 0
  %563 = zext i32 %562 to i64
  %564 = icmp slt i32 %559, 1
  br i1 %564, label %"406", label %"402"

"402":                                            ; preds = %"400"
  %565 = sdiv i64 9223372036854775807, %560
  %566 = icmp slt i64 %565, %554
  %.197 = zext i1 %566 to i32
  br label %"406"

"406":                                            ; preds = %"402", %"400"
  %567 = phi i32 [ %.197, %"402" ], [ 0, %"400" ]
  %568 = add nuw nsw i32 %558, %567
  %569 = mul nuw nsw i64 %563, %554
  store i64 1, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 2, i32 1), align 8, !tbaa !10
  store i64 3, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 2, i32 2), align 8, !tbaa !10
  store i64 %569, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %570 = icmp ugt i64 %569, 3074457345618258602
  %.198 = zext i1 %570 to i32
  %571 = add nuw nsw i32 %568, %.198
  %572 = mul nuw nsw i64 %569, 3
  %573 = icmp ugt i64 %572, 2305843009213693951
  %574 = zext i1 %573 to i32
  %not68 = xor i64 %554, -1
  %575 = sub nuw nsw i64 %not68, %569
  %576 = icmp slt i32 %550, 1
  %577 = icmp slt i32 %559, 1
  %578 = or i1 %576, %577
  %579 = mul i64 %569, 24
  %.2 = select i1 %578, i64 0, i64 %579
  %580 = sub nsw i32 0, %571
  %581 = icmp eq i32 %574, %580
  br i1 %581, label %"417", label %"425"

"417":                                            ; preds = %"406"
  %582 = load i8*, i8** getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 0), align 32, !tbaa !8
  %583 = icmp eq i8* %582, null
  br i1 %583, label %"424", label %"421"

"421":                                            ; preds = %"417"
  tail call void @free(i8* noalias %582) #1
  br label %"424"

"424":                                            ; preds = %"417", %"421"
  %584 = icmp ne i64 %.2, 0
  %585 = select i1 %584, i64 %.2, i64 1
  %586 = tail call noalias i8* @malloc(i64 %585) #1
  store i8* %586, i8** getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 0), align 32, !tbaa !8
  br label %"425"

"425":                                            ; preds = %"424", %"406"
  store i64 %575, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 1), align 8, !tbaa !10
  %587 = load i32, i32* @__data_runcontrol_MOD_l2tls, align 4, !tbaa !3, !range !5
  %588 = icmp eq i32 %587, 0
  %__data_runcontrol_MOD_nold.val = load i32, i32* @__data_runcontrol_MOD_nold, align 4
  %__data_runcontrol_MOD_nnow.val = load i32, i32* @__data_runcontrol_MOD_nnow, align 4
  %storemerge = select i1 %588, i32 %__data_runcontrol_MOD_nold.val, i32 %__data_runcontrol_MOD_nnow.val
  store i32 %storemerge, i32* %nx, align 4, !tbaa !0
  %__data_modelconfig_MOD_dt2.val = load double, double* @__data_modelconfig_MOD_dt2, align 8
  %__data_modelconfig_MOD_dt.val = load double, double* @__data_modelconfig_MOD_dt, align 8
  %589 = select i1 %588, double %__data_modelconfig_MOD_dt2.val, double %__data_modelconfig_MOD_dt.val
  %590 = load i32, i32* @__data_modelconfig_MOD_istartpar, align 4, !tbaa !0
  %591 = load i32, i32* @__data_modelconfig_MOD_iendpar, align 4, !tbaa !0
  %592 = load i32, i32* @__data_modelconfig_MOD_jstartpar, align 4, !tbaa !0
  %593 = load i32, i32* @__data_modelconfig_MOD_jendpar, align 4, !tbaa !0
  call void @__src_tracer_MOD_trcr_get_byindex(i32* nonnull %izerror, i32* nonnull @__data_modelconfig_MOD_idt_qv, %"struct.array3_real(kind=8).45"* bitcast (%"struct.array3_real(kind=8).44"* @qv.2641 to %"struct.array3_real(kind=8).45"*), %"struct.array4_real(kind=8)"* null, %"struct.array3_real(kind=8).46"* null, %"struct.array3_real(kind=8).47"* null, i32* nonnull %nx) #1
  %594 = load i32, i32* %izerror, align 4, !tbaa !0
  %595 = icmp eq i32 %594, 0
  br i1 %595, label %"430", label %"429"

"429":                                            ; preds = %"425"
  call void @__src_tracer_MOD_trcr_errorstr([255 x i8]* nonnull %str.448, i32 255, i32* noalias nonnull %izerror) #1
  %596 = getelementptr inbounds [80 x i8], [80 x i8]* %yzerrmsg, i64 0, i64 0
  %597 = getelementptr inbounds [255 x i8], [255 x i8]* %str.448, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %596, i8* %597, i64 80, i32 1, i1 false)
  %598 = bitcast [80 x i8]* %yzerrmsg to [0 x i8]*
  %599 = bitcast [80 x i8]* %yzroutine to [0 x i8]*
  call void @__environment_MOD_model_abort(i32* nonnull @__data_parallel_MOD_my_cart_id, i32* nonnull %izerror, [0 x i8]* %598, [0 x i8]* %599, i32* null, i32 80, i32 80) #1
  br label %"430"

"430":                                            ; preds = %"429", %"425"
  %600 = load i32, i32* @__data_runcontrol_MOD_nlgw, align 4, !tbaa !0
  %601 = icmp eq i32 %600, 2
  br i1 %601, label %"431", label %"432"

"431":                                            ; preds = %"430"
  %602 = load i64, i64* bitcast (double* @__data_soil_MOD_cdzw12 to i64*), align 8, !tbaa !6
  %603 = bitcast [4 x double]* %zdzwg to i64*
  store i64 %602, i64* %603, align 8, !tbaa !6
  br label %"433"

"432":                                            ; preds = %"430"
  %604 = load i64, i64* bitcast (double* @__data_soil_MOD_cdzw13 to i64*), align 8, !tbaa !6
  %605 = bitcast [4 x double]* %zdzwg to i64*
  store i64 %604, i64* %605, align 8, !tbaa !6
  %606 = load i64, i64* bitcast (double* @__data_soil_MOD_cdzw23 to i64*), align 8, !tbaa !6
  %607 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 1
  %608 = bitcast double* %607 to i64*
  store i64 %606, i64* %608, align 8, !tbaa !6
  br label %"433"

"433":                                            ; preds = %"432", %"431"
  %.sink7 = phi i64* [ bitcast (double* @__data_soil_MOD_cdzw33 to i64*), %"432" ], [ bitcast (double* @__data_soil_MOD_cdzw22 to i64*), %"431" ]
  %.sink6 = phi i64 [ 2, %"432" ], [ 1, %"431" ]
  %609 = load i64, i64* %.sink7, align 8, !tbaa !6
  %610 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 %.sink6
  %611 = bitcast double* %610 to i64*
  store i64 %609, i64* %611, align 8, !tbaa !6
  %612 = add i32 %600, 1
  %613 = sext i32 %612 to i64
  %614 = add nsw i64 %613, -1
  %615 = sext i32 %600 to i64
  %616 = add nsw i64 %615, -1
  %617 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 0
  %618 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 %616
  %619 = load double, double* %618, align 8, !tbaa !6
  %620 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 %614
  store double %619, double* %620, align 8, !tbaa !6
  %621 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %622 = fdiv double %621, %589
  %623 = load double, double* @__data_soil_MOD_ctau_i, align 8, !tbaa !6
  %624 = fcmp ogt double %589, %623
  %625 = fcmp uno double %623, 0.000000e+00
  %626 = or i1 %624, %625
  %.199 = select i1 %626, double %589, double %623
  store double %.199, double* @__data_soil_MOD_ctau_i, align 8, !tbaa !6
  %627 = load double, double* %617, align 8, !tbaa !6
  %628 = fmul double %627, 5.000000e-01
  store double %628, double* %zdzwsu257.sub, align 8, !tbaa !6
  %629 = icmp sgt i32 %600, 0
  br i1 %629, label %"436.preheader", label %"439"

"436.preheader":                                  ; preds = %"433"
  br label %"436"

"436":                                            ; preds = %"436.preheader", %"438"
  %indvars.iv382 = phi i64 [ %indvars.iv.next383.pre-phi, %"438" ], [ 1, %"436.preheader" ]
  %630 = add nsw i64 %indvars.iv382, -1
  %631 = trunc i64 %indvars.iv382 to i32
  %632 = icmp sgt i32 %600, %631
  br i1 %632, label %"437", label %"438"

"437":                                            ; preds = %"436"
  %633 = getelementptr inbounds [4 x double], [4 x double]* %zdzwsu257, i64 0, i64 %630
  %634 = load double, double* %633, align 8, !tbaa !6
  %635 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 %630
  %636 = load double, double* %635, align 8, !tbaa !6
  %637 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 %indvars.iv382
  %638 = load double, double* %637, align 8, !tbaa !6
  %639 = fadd double %636, %638
  %640 = fmul double %639, 5.000000e-01
  %641 = fadd double %634, %640
  %642 = getelementptr inbounds [4 x double], [4 x double]* %zdzwsu257, i64 0, i64 %indvars.iv382
  store double %641, double* %642, align 8, !tbaa !6
  br label %"438"

"438":                                            ; preds = %"437", %"436"
  %indvars.iv.next383.pre-phi = add nuw nsw i64 %indvars.iv382, 1
  %lftr.wideiv26 = trunc i64 %indvars.iv.next383.pre-phi to i32
  %exitcond27 = icmp eq i32 %lftr.wideiv26, %612
  br i1 %exitcond27, label %"439.loopexit", label %"436"

"439.loopexit":                                   ; preds = %"438"
  br label %"439"

"439":                                            ; preds = %"439.loopexit", %"433"
  %643 = getelementptr inbounds [4 x double], [4 x double]* %zdzwsu257, i64 0, i64 %616
  %644 = load double, double* %643, align 8, !tbaa !6
  %645 = fmul double %619, 5.000000e-01
  %646 = fadd double %645, %644
  %647 = getelementptr inbounds [4 x double], [4 x double]* %zdzwsu257, i64 0, i64 %614
  store double %646, double* %647, align 8, !tbaa !6
  %648 = icmp sle i32 %592, %593
  br i1 %648, label %"440.preheader", label %"447"

"440.preheader":                                  ; preds = %"439"
  %649 = icmp sgt i32 %590, %591
  %650 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %651 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %652 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %653 = load double*, double** bitcast (%"struct.array2_real(kind=8).27"* @__data_fields_MOD_soiltyp to double**), align 8, !tbaa !8
  %654 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).27", %"struct.array2_real(kind=8).27"* @__data_fields_MOD_soiltyp, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %655 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).27", %"struct.array2_real(kind=8).27"* @__data_fields_MOD_soiltyp, i64 0, i32 1), align 8, !tbaa !10
  %656 = bitcast i8* %13 to i32*
  %657 = load double*, double** bitcast (%"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs to double**), align 32, !tbaa !8
  %658 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %659 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 1), align 8, !tbaa !10
  %660 = bitcast i8* %26 to double*
  %661 = bitcast i8* %27 to double*
  %662 = bitcast i8* %17 to double*
  %663 = bitcast i8* %24 to double*
  %664 = bitcast i8* %28 to double*
  %665 = load double*, double** bitcast (%"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg to double**), align 32, !tbaa !8
  %666 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %667 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 1), align 8, !tbaa !10
  %668 = bitcast i8* %21 to double*
  %669 = load double*, double** bitcast (%"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam to double**), align 32, !tbaa !8
  %670 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %671 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 1), align 8, !tbaa !10
  %672 = bitcast i8* %25 to double*
  %673 = bitcast i8* %18 to double*
  %674 = load double*, double** bitcast (%"struct.array2_real(kind=8).48"* @__data_fields_MOD_rootdp to double**), align 8, !tbaa !8
  %675 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).48", %"struct.array2_real(kind=8).48"* @__data_fields_MOD_rootdp, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %676 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).48", %"struct.array2_real(kind=8).48"* @__data_fields_MOD_rootdp, i64 0, i32 1), align 8, !tbaa !10
  %677 = bitcast i8* %19 to double*
  %678 = sext i32 %590 to i64
  %679 = sext i32 %592 to i64
  br label %"440"

"440":                                            ; preds = %"446", %"440.preheader"
  %indvars.iv380 = phi i64 [ %679, %"440.preheader" ], [ %indvars.iv.next381, %"446" ]
  br i1 %649, label %"446", label %"441.preheader"

"441.preheader":                                  ; preds = %"440"
  %680 = mul nsw i64 %indvars.iv380, %651
  %681 = mul nsw i64 %indvars.iv380, %654
  %682 = mul nsw i64 %indvars.iv380, %5
  %683 = add i64 %682, %not
  %684 = mul nsw i64 %indvars.iv380, %658
  %685 = mul nsw i64 %indvars.iv380, %666
  %686 = mul nsw i64 %indvars.iv380, %670
  %687 = mul nsw i64 %indvars.iv380, %675
  br label %"441"

"441":                                            ; preds = %"445", %"441.preheader"
  %indvars.iv378 = phi i64 [ %678, %"441.preheader" ], [ %indvars.iv.next379, %"445" ]
  %688 = add i64 %680, %652
  %689 = add i64 %688, %indvars.iv378
  %690 = getelementptr inbounds i32, i32* %650, i64 %689
  %691 = load i32, i32* %690, align 4, !tbaa !3, !range !5
  %692 = icmp eq i32 %691, 0
  br i1 %692, label %"445", label %"442"

"442":                                            ; preds = %"441"
  %693 = add i64 %681, %655
  %694 = add i64 %693, %indvars.iv378
  %695 = getelementptr inbounds double, double* %653, i64 %694
  %696 = load double, double* %695, align 8, !tbaa !6
  %697 = call i64 @lround(double %696) #2
  %698 = trunc i64 %697 to i32
  %699 = add i64 %683, %indvars.iv378
  %700 = getelementptr inbounds i32, i32* %656, i64 %699
  store i32 %698, i32* %700, align 4, !tbaa !0
  %701 = add i64 %684, %659
  %702 = add i64 %701, %indvars.iv378
  %703 = load i64, i64* bitcast (double* @__data_soil_MOD_cdsmin to i64*), align 8, !tbaa !6
  %704 = getelementptr inbounds double, double* %657, i64 %702
  %705 = bitcast double* %704 to i64*
  store i64 %703, i64* %705, align 8, !tbaa !6
  %sext = shl i64 %697, 32
  %706 = ashr exact i64 %sext, 32
  %707 = add nsw i64 %706, -1
  %708 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cporv, i64 0, i64 %707
  %709 = bitcast double* %708 to i64*
  %710 = load i64, i64* %709, align 8, !tbaa !6
  %711 = getelementptr inbounds double, double* %660, i64 %699
  %712 = bitcast double* %711 to i64*
  store i64 %710, i64* %712, align 8, !tbaa !6
  %713 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cpwp, i64 0, i64 %707
  %714 = bitcast double* %713 to i64*
  %715 = load i64, i64* %714, align 8, !tbaa !6
  %716 = getelementptr inbounds double, double* %661, i64 %699
  %717 = bitcast double* %716 to i64*
  store i64 %715, i64* %717, align 8, !tbaa !6
  %718 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cadp, i64 0, i64 %707
  %719 = bitcast double* %718 to i64*
  %720 = load i64, i64* %719, align 8, !tbaa !6
  %721 = getelementptr inbounds double, double* %662, i64 %699
  %722 = bitcast double* %721 to i64*
  store i64 %720, i64* %722, align 8, !tbaa !6
  %723 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cfcap, i64 0, i64 %707
  %724 = bitcast double* %723 to i64*
  %725 = load i64, i64* %724, align 8, !tbaa !6
  %726 = getelementptr inbounds double, double* %663, i64 %699
  %727 = bitcast double* %726 to i64*
  store i64 %725, i64* %727, align 8, !tbaa !6
  %728 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_crock, i64 0, i64 %707
  %729 = bitcast double* %728 to i64*
  %730 = load i64, i64* %729, align 8, !tbaa !6
  %731 = getelementptr inbounds double, double* %664, i64 %699
  %732 = bitcast double* %731 to i64*
  store i64 %730, i64* %732, align 8, !tbaa !6
  %733 = add i64 %685, %667
  %734 = add i64 %733, %indvars.iv378
  %735 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_crhoc, i64 0, i64 %707
  %736 = bitcast double* %735 to i64*
  %737 = load i64, i64* %736, align 8, !tbaa !6
  %738 = getelementptr inbounds double, double* %665, i64 %734
  %739 = bitcast double* %738 to i64*
  store i64 %737, i64* %739, align 8, !tbaa !6
  %740 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cala1, i64 0, i64 %707
  %741 = load double, double* %740, align 8, !tbaa !6
  %742 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cala0, i64 0, i64 %707
  %743 = load double, double* %742, align 8, !tbaa !6
  %744 = fsub double %741, %743
  %745 = getelementptr inbounds double, double* %668, i64 %699
  store double %744, double* %745, align 8, !tbaa !6
  %746 = add i64 %686, %671
  %747 = add i64 %746, %indvars.iv378
  %748 = getelementptr inbounds double, double* %669, i64 %747
  store double %743, double* %748, align 8, !tbaa !6
  %749 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_ck0di, i64 0, i64 %707
  %750 = bitcast double* %749 to i64*
  %751 = load i64, i64* %750, align 8, !tbaa !6
  %752 = getelementptr inbounds double, double* %672, i64 %699
  %753 = bitcast double* %752 to i64*
  store i64 %751, i64* %753, align 8, !tbaa !6
  %754 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cbedi, i64 0, i64 %707
  %755 = bitcast double* %754 to i64*
  %756 = load i64, i64* %755, align 8, !tbaa !6
  %757 = getelementptr inbounds double, double* %673, i64 %699
  %758 = bitcast double* %757 to i64*
  store i64 %756, i64* %758, align 8, !tbaa !6
  %759 = add i64 %687, %676
  %760 = add i64 %759, %indvars.iv378
  %761 = getelementptr inbounds double, double* %674, i64 %760
  %762 = load double, double* %761, align 8, !tbaa !6
  %763 = fcmp ogt double %762, 1.000000e-01
  %.200 = select i1 %763, double %762, double 1.000000e-01
  %764 = getelementptr inbounds double, double* %677, i64 %699
  store double %.200, double* %764, align 8, !tbaa !6
  br label %"445"

"445":                                            ; preds = %"442", %"441"
  %765 = trunc i64 %indvars.iv378 to i32
  %766 = icmp eq i32 %591, %765
  %indvars.iv.next379 = add nsw i64 %indvars.iv378, 1
  br i1 %766, label %"446.loopexit", label %"441"

"446.loopexit":                                   ; preds = %"445"
  br label %"446"

"446":                                            ; preds = %"446.loopexit", %"440"
  %767 = trunc i64 %indvars.iv380 to i32
  %768 = icmp eq i32 %593, %767
  %indvars.iv.next381 = add nsw i64 %indvars.iv380, 1
  br i1 %768, label %"447.loopexit", label %"440"

"447.loopexit":                                   ; preds = %"446"
  br label %"447"

"447":                                            ; preds = %"447.loopexit", %"439"
  %769 = load i32, i32* @__data_runcontrol_MOD_ntstep, align 4, !tbaa !0
  %770 = load i32, i32* @__data_runcontrol_MOD_nstart, align 4, !tbaa !0
  %771 = icmp eq i32 %769, %770
  br i1 %771, label %"448", label %"454"

"448":                                            ; preds = %"447"
  %772 = load double, double* @__data_soil_MOD_ctau1, align 8, !tbaa !6
  %773 = load double, double* @__data_soil_MOD_ctau2, align 8, !tbaa !6
  %774 = fdiv double %772, %773
  %775 = call double @sqrt(double %774) #2
  %776 = load double, double* @__data_constants_MOD_pi, align 8, !tbaa !6
  %777 = fmul double %776, 2.000000e+00
  %778 = fmul double %772, 8.640000e+04
  %779 = fdiv double %777, %778
  %780 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %781 = load double, double* @__data_soil_MOD_chc_w, align 8, !tbaa !6
  %782 = fadd double %775, 1.000000e+00
  %783 = load double, double* @__data_soil_MOD_ckrdi, align 8, !tbaa !6
  br label %"449"

"449":                                            ; preds = %"449", %"448"
  %indvars.iv374 = phi i64 [ 1, %"448" ], [ %indvars.iv.next375, %"449" ]
  %784 = add nsw i64 %indvars.iv374, -1
  %785 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cala1, i64 0, i64 %784
  %786 = load double, double* %785, align 8, !tbaa !6
  %787 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cala0, i64 0, i64 %784
  %788 = load double, double* %787, align 8, !tbaa !6
  %789 = fsub double %786, %788
  %790 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cfcap, i64 0, i64 %784
  %791 = load double, double* %790, align 8, !tbaa !6
  %792 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cpwp, i64 0, i64 %784
  %793 = load double, double* %792, align 8, !tbaa !6
  %794 = fadd double %791, %793
  %795 = fmul double %794, 5.000000e-01
  %796 = fmul double %795, 4.000000e+00
  %797 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cporv, i64 0, i64 %784
  %798 = load double, double* %797, align 8, !tbaa !6
  %799 = fdiv double %796, %798
  %800 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_crhoc, i64 0, i64 %784
  %801 = load double, double* %800, align 8, !tbaa !6
  %802 = fmul double %780, %795
  %803 = fmul double %781, %802
  %804 = fadd double %801, %803
  %805 = fadd double %799, -1.000000e+00
  %806 = fmul double %789, 3.500000e-01
  %807 = fadd double %806, 1.000000e+00
  %808 = fmul double %807, %805
  %809 = fmul double %789, 1.950000e+00
  %810 = fadd double %809, 1.000000e+00
  %811 = fdiv double %808, %810
  %812 = fadd double %811, 1.000000e+00
  %813 = fcmp olt double %812, %799
  %814 = fcmp uno double %799, 0.000000e+00
  %815 = or i1 %814, %813
  %.201 = select i1 %815, double %812, double %799
  %816 = fmul double %789, 3.000000e-01
  %817 = fmul double %789, 7.500000e-01
  %818 = fadd double %817, 1.000000e+00
  %819 = fdiv double %816, %818
  %820 = fadd double %819, 2.500000e-01
  %821 = fmul double %789, %820
  %822 = fmul double %821, %.201
  %823 = fadd double %788, %822
  %824 = fmul double %823, 2.000000e+00
  %825 = fmul double %779, %804
  %826 = fdiv double %824, %825
  %827 = call double @sqrt(double %826) #2
  %828 = fdiv double %827, %782
  %829 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_cdz1, i64 0, i64 %784
  store double %828, double* %829, align 8, !tbaa !6
  %830 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_ck0di, i64 0, i64 %784
  %831 = load double, double* %830, align 8, !tbaa !6
  %832 = fdiv double %831, %783
  %833 = fcmp ogt double %832, 1.000000e-06
  %834 = select i1 %833, double %832, double 1.000000e-06
  %835 = call double @log10(double %834) #2
  %836 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_clgk0, i64 0, i64 %784
  store double %835, double* %836, align 8, !tbaa !6
  %indvars.iv.next375 = add nuw nsw i64 %indvars.iv374, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next375, 11
  br i1 %exitcond25, label %"454.loopexit", label %"449"

"454.loopexit":                                   ; preds = %"449"
  br label %"454"

"454":                                            ; preds = %"454.loopexit", %"447"
  %837 = icmp ne i32 %769, 0
  %838 = load i32, i32* @__data_soil_MOD_lsoilinit_dfi, align 4, !tbaa !3, !range !5
  %839 = icmp eq i32 %838, 0
  %or.cond273 = and i1 %837, %839
  br i1 %or.cond273, label %"496", label %"456"

"456":                                            ; preds = %"454"
  store i32 0, i32* @__data_soil_MOD_lsoilinit_dfi, align 4, !tbaa !3
  br i1 %648, label %"457.preheader", label %"585thread-pre-split"

"457.preheader":                                  ; preds = %"456"
  %840 = icmp sgt i32 %590, %591
  %841 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %842 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %843 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %844 = bitcast i8* %17 to double*
  %845 = bitcast i8* %26 to double*
  %846 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 1
  %847 = load double, double* %846, align 8, !tbaa !6
  %848 = load double*, double** bitcast (%"struct.array3_real(kind=8).22"* @__data_fields_MOD_w_g1 to double**), align 8, !tbaa !8
  %849 = load i32, i32* %nx, align 4, !tbaa !0
  %850 = sext i32 %849 to i64
  %851 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).22", %"struct.array3_real(kind=8).22"* @__data_fields_MOD_w_g1, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %852 = mul nsw i64 %851, %850
  %853 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).22", %"struct.array3_real(kind=8).22"* @__data_fields_MOD_w_g1, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %854 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).22", %"struct.array3_real(kind=8).22"* @__data_fields_MOD_w_g1, i64 0, i32 1), align 8, !tbaa !10
  %855 = load i32, i32* @__data_runcontrol_MOD_nnow, align 4, !tbaa !0
  %856 = sext i32 %855 to i64
  %857 = mul nsw i64 %851, %856
  %858 = load double*, double** bitcast (%"struct.array3_real(kind=8).23"* @__data_fields_MOD_w_g2 to double**), align 8, !tbaa !8
  %859 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).23", %"struct.array3_real(kind=8).23"* @__data_fields_MOD_w_g2, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %860 = mul nsw i64 %859, %850
  %861 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).23", %"struct.array3_real(kind=8).23"* @__data_fields_MOD_w_g2, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %862 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).23", %"struct.array3_real(kind=8).23"* @__data_fields_MOD_w_g2, i64 0, i32 1), align 8, !tbaa !10
  %863 = mul nsw i64 %859, %856
  %864 = load double*, double** bitcast (%"struct.array2_real(kind=8).24"* @__data_fields_MOD_w_cl to double**), align 8, !tbaa !8
  %865 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).24", %"struct.array2_real(kind=8).24"* @__data_fields_MOD_w_cl, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %866 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).24", %"struct.array2_real(kind=8).24"* @__data_fields_MOD_w_cl, i64 0, i32 1), align 8, !tbaa !10
  %867 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 2
  %868 = load double, double* %867, align 8, !tbaa !6
  %869 = load double*, double** bitcast (%"struct.array3_real(kind=8).26"* @__data_fields_MOD_w_g3 to double**), align 8, !tbaa !8
  %870 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).26", %"struct.array3_real(kind=8).26"* @__data_fields_MOD_w_g3, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %871 = mul nsw i64 %870, %850
  %872 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).26", %"struct.array3_real(kind=8).26"* @__data_fields_MOD_w_g3, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %873 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).26", %"struct.array3_real(kind=8).26"* @__data_fields_MOD_w_g3, i64 0, i32 1), align 8, !tbaa !10
  %874 = mul nsw i64 %870, %856
  %875 = sext i32 %590 to i64
  %876 = sext i32 %592 to i64
  br label %"457"

"457":                                            ; preds = %"495", %"457.preheader"
  %indvars.iv372 = phi i64 [ %876, %"457.preheader" ], [ %indvars.iv.next373, %"495" ]
  br i1 %840, label %"495", label %"458.preheader"

"458.preheader":                                  ; preds = %"457"
  %877 = mul nsw i64 %indvars.iv372, %842
  %878 = mul nsw i64 %indvars.iv372, %5
  %879 = add i64 %878, %not
  %880 = mul nsw i64 %indvars.iv372, %853
  %881 = mul nsw i64 %indvars.iv372, %861
  %882 = mul nsw i64 %indvars.iv372, %865
  %883 = mul nsw i64 %indvars.iv372, %872
  br label %"458"

"458":                                            ; preds = %"494", %"458.preheader"
  %indvars.iv370 = phi i64 [ %875, %"458.preheader" ], [ %indvars.iv.next371, %"494" ]
  %884 = add i64 %877, %843
  %885 = add i64 %884, %indvars.iv370
  %886 = getelementptr inbounds i32, i32* %841, i64 %885
  %887 = load i32, i32* %886, align 4, !tbaa !3, !range !5
  %888 = icmp eq i32 %887, 0
  br i1 %888, label %"494", label %"459"

"459":                                            ; preds = %"458"
  %889 = add i64 %879, %indvars.iv370
  %890 = getelementptr inbounds double, double* %844, i64 %889
  %891 = load double, double* %890, align 8, !tbaa !6
  %892 = fmul double %627, %891
  %893 = getelementptr inbounds double, double* %845, i64 %889
  %894 = load double, double* %893, align 8, !tbaa !6
  %895 = fmul double %627, %894
  %896 = fmul double %847, %891
  %897 = fmul double %847, %894
  %898 = add i64 %854, %852
  %899 = add i64 %898, %880
  %900 = add i64 %899, %indvars.iv370
  %901 = getelementptr inbounds double, double* %848, i64 %900
  %902 = load double, double* %901, align 8, !tbaa !6
  %903 = fcmp olt double %902, %895
  %904 = fcmp uno double %895, 0.000000e+00
  %905 = or i1 %903, %904
  %.202 = select i1 %905, double %902, double %895
  %906 = fcmp ogt double %.202, %892
  %907 = fcmp uno double %892, 0.000000e+00
  %908 = or i1 %907, %906
  %909 = select i1 %908, double %.202, double %892
  store double %909, double* %901, align 8, !tbaa !6
  %910 = add i64 %857, %854
  %911 = add i64 %910, %880
  %912 = add i64 %911, %indvars.iv370
  %913 = getelementptr inbounds double, double* %848, i64 %912
  %914 = load double, double* %913, align 8, !tbaa !6
  %915 = fcmp olt double %914, %895
  %916 = or i1 %904, %915
  %.203 = select i1 %916, double %914, double %895
  %917 = fcmp ogt double %.203, %892
  %918 = or i1 %907, %917
  %919 = select i1 %918, double %.203, double %892
  store double %919, double* %913, align 8, !tbaa !6
  %920 = add i64 %862, %860
  %921 = add i64 %920, %881
  %922 = add i64 %921, %indvars.iv370
  %923 = getelementptr inbounds double, double* %858, i64 %922
  %924 = load double, double* %923, align 8, !tbaa !6
  %925 = fcmp olt double %924, %897
  %926 = fcmp uno double %897, 0.000000e+00
  %927 = or i1 %926, %925
  %.204 = select i1 %927, double %924, double %897
  %928 = fcmp ogt double %.204, %896
  %929 = fcmp uno double %896, 0.000000e+00
  %930 = or i1 %929, %928
  %931 = select i1 %930, double %.204, double %896
  store double %931, double* %923, align 8, !tbaa !6
  %932 = add i64 %862, %863
  %933 = add i64 %932, %881
  %934 = add i64 %933, %indvars.iv370
  %935 = getelementptr inbounds double, double* %858, i64 %934
  %936 = load double, double* %935, align 8, !tbaa !6
  %937 = fcmp olt double %936, %897
  %938 = or i1 %926, %937
  %.205 = select i1 %938, double %936, double %897
  %939 = fcmp ogt double %.205, %896
  %940 = or i1 %929, %939
  %941 = select i1 %940, double %.205, double %896
  store double %941, double* %935, align 8, !tbaa !6
  br i1 %601, label %"476", label %"481"

"476":                                            ; preds = %"459"
  %942 = add i64 %882, %866
  %943 = add i64 %942, %indvars.iv370
  %944 = getelementptr inbounds double, double* %864, i64 %943
  %945 = load double, double* %944, align 8, !tbaa !6
  %946 = fcmp olt double %945, %897
  %947 = or i1 %926, %946
  %.206 = select i1 %947, double %945, double %897
  %948 = fcmp ogt double %.206, %896
  %949 = or i1 %929, %948
  %950 = select i1 %949, double %.206, double %896
  br label %"494.sink.split"

"481":                                            ; preds = %"459"
  %951 = fmul double %868, %891
  %952 = fmul double %868, %894
  %953 = add i64 %873, %871
  %954 = add i64 %953, %883
  %955 = add i64 %954, %indvars.iv370
  %956 = getelementptr inbounds double, double* %869, i64 %955
  %957 = load double, double* %956, align 8, !tbaa !6
  %958 = fcmp olt double %957, %952
  %959 = fcmp uno double %952, 0.000000e+00
  %960 = or i1 %959, %958
  %.207 = select i1 %960, double %957, double %952
  %961 = fcmp ogt double %.207, %951
  %962 = fcmp uno double %951, 0.000000e+00
  %963 = or i1 %962, %961
  %964 = select i1 %963, double %.207, double %951
  store double %964, double* %956, align 8, !tbaa !6
  %965 = add i64 %873, %874
  %966 = add i64 %965, %883
  %967 = add i64 %966, %indvars.iv370
  %968 = getelementptr inbounds double, double* %869, i64 %967
  %969 = load double, double* %968, align 8, !tbaa !6
  %970 = fcmp olt double %969, %952
  %971 = or i1 %959, %970
  %.208 = select i1 %971, double %969, double %952
  %972 = fcmp ogt double %.208, %951
  %973 = or i1 %962, %972
  %974 = select i1 %973, double %.208, double %951
  store double %974, double* %968, align 8, !tbaa !6
  %975 = add i64 %882, %866
  %976 = add i64 %975, %indvars.iv370
  %977 = getelementptr inbounds double, double* %864, i64 %976
  %978 = load double, double* %977, align 8, !tbaa !6
  %979 = fcmp olt double %978, %952
  %980 = or i1 %959, %979
  %.209 = select i1 %980, double %978, double %952
  %981 = fcmp ogt double %.209, %951
  %982 = or i1 %962, %981
  %983 = select i1 %982, double %.209, double %951
  br label %"494.sink.split"

"494.sink.split":                                 ; preds = %"476", %"481"
  %.sink8 = phi double* [ %977, %"481" ], [ %944, %"476" ]
  %.sink = phi double [ %983, %"481" ], [ %950, %"476" ]
  store double %.sink, double* %.sink8, align 8, !tbaa !6
  br label %"494"

"494":                                            ; preds = %"494.sink.split", %"458"
  %984 = trunc i64 %indvars.iv370 to i32
  %985 = icmp eq i32 %591, %984
  %indvars.iv.next371 = add nsw i64 %indvars.iv370, 1
  br i1 %985, label %"495.loopexit", label %"458"

"495.loopexit":                                   ; preds = %"494"
  br label %"495"

"495":                                            ; preds = %"495.loopexit", %"457"
  %986 = trunc i64 %indvars.iv372 to i32
  %987 = icmp eq i32 %593, %986
  %indvars.iv.next373 = add nsw i64 %indvars.iv372, 1
  br i1 %987, label %"496.loopexit", label %"457"

"496.loopexit":                                   ; preds = %"495"
  br label %"496"

"496":                                            ; preds = %"496.loopexit", %"454"
  br i1 %648, label %"497.preheader", label %"585thread-pre-split"

"497.preheader":                                  ; preds = %"496"
  %988 = icmp sgt i32 %590, %591
  %989 = load double*, double** bitcast (%"struct.array4_real(kind=8).49"* @__data_fields_MOD_u to double**), align 8, !tbaa !8
  %990 = load i32, i32* @__data_modelconfig_MOD_ke, align 4, !tbaa !0
  %991 = sext i32 %990 to i64
  %992 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).49", %"struct.array4_real(kind=8).49"* @__data_fields_MOD_u, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %993 = mul nsw i64 %992, %991
  %994 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).49", %"struct.array4_real(kind=8).49"* @__data_fields_MOD_u, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %995 = load i32, i32* %nx, align 4, !tbaa !0
  %996 = sext i32 %995 to i64
  %997 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).49", %"struct.array4_real(kind=8).49"* @__data_fields_MOD_u, i64 0, i32 3, i64 3, i32 0), align 8, !tbaa !10
  %998 = mul nsw i64 %997, %996
  %999 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).49", %"struct.array4_real(kind=8).49"* @__data_fields_MOD_u, i64 0, i32 1), align 8, !tbaa !10
  %1000 = load double*, double** bitcast (%"struct.array4_real(kind=8).50"* @__data_fields_MOD_v to double**), align 8, !tbaa !8
  %1001 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).50", %"struct.array4_real(kind=8).50"* @__data_fields_MOD_v, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1002 = mul nsw i64 %1001, %991
  %1003 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).50", %"struct.array4_real(kind=8).50"* @__data_fields_MOD_v, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1004 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).50", %"struct.array4_real(kind=8).50"* @__data_fields_MOD_v, i64 0, i32 3, i64 3, i32 0), align 8, !tbaa !10
  %1005 = mul nsw i64 %1004, %996
  %1006 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).50", %"struct.array4_real(kind=8).50"* @__data_fields_MOD_v, i64 0, i32 1), align 8, !tbaa !10
  %1007 = load double*, double** bitcast (%"struct.array3_real(kind=8).17"* @__data_fields_MOD_t_s to double**), align 8, !tbaa !8
  %1008 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).17", %"struct.array3_real(kind=8).17"* @__data_fields_MOD_t_s, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1009 = mul nsw i64 %1008, %996
  %1010 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).17", %"struct.array3_real(kind=8).17"* @__data_fields_MOD_t_s, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1011 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).17", %"struct.array3_real(kind=8).17"* @__data_fields_MOD_t_s, i64 0, i32 1), align 8, !tbaa !10
  %1012 = load double*, double** bitcast (%"struct.array3_real(kind=8).51"* @__data_fields_MOD_qv_s to double**), align 8, !tbaa !8
  %1013 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).51", %"struct.array3_real(kind=8).51"* @__data_fields_MOD_qv_s, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1014 = mul nsw i64 %1013, %996
  %1015 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).51", %"struct.array3_real(kind=8).51"* @__data_fields_MOD_qv_s, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1016 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).51", %"struct.array3_real(kind=8).51"* @__data_fields_MOD_qv_s, i64 0, i32 1), align 8, !tbaa !10
  %1017 = load double, double* @__data_constants_MOD_rvd_m_o, align 8, !tbaa !6
  %1018 = load double*, double** bitcast (%"struct.array2_real(kind=8).52"* @__data_fields_MOD_tch to double**), align 8, !tbaa !8
  %1019 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).52", %"struct.array2_real(kind=8).52"* @__data_fields_MOD_tch, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1020 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).52", %"struct.array2_real(kind=8).52"* @__data_fields_MOD_tch, i64 0, i32 1), align 8, !tbaa !10
  %1021 = load double, double* @__data_constants_MOD_g, align 8, !tbaa !6
  %1022 = load double*, double** bitcast (%"struct.array3_real(kind=8).53"* @__data_fields_MOD_ps to double**), align 8, !tbaa !8
  %1023 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).53", %"struct.array3_real(kind=8).53"* @__data_fields_MOD_ps, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1024 = mul nsw i64 %1023, %996
  %1025 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).53", %"struct.array3_real(kind=8).53"* @__data_fields_MOD_ps, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1026 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).53", %"struct.array3_real(kind=8).53"* @__data_fields_MOD_ps, i64 0, i32 1), align 8, !tbaa !10
  %1027 = load double, double* @__data_constants_MOD_r_d, align 8, !tbaa !6
  %1028 = bitcast i8* %37 to double*
  %1029 = sext i32 %590 to i64
  %1030 = sext i32 %592 to i64
  br label %"497"

"497":                                            ; preds = %"503", %"497.preheader"
  %indvars.iv368 = phi i64 [ %1030, %"497.preheader" ], [ %indvars.iv.next369, %"503" ]
  %1031 = add nsw i64 %indvars.iv368, -1
  br i1 %988, label %"503", label %"500.preheader"

"500.preheader":                                  ; preds = %"497"
  %1032 = trunc i64 %1031 to i32
  %1033 = icmp sgt i32 %1032, 1
  %1034 = mul nsw i64 %indvars.iv368, %994
  %1035 = add nsw i64 %1034, %993
  %1036 = mul nsw i64 %indvars.iv368, %1003
  %1037 = select i1 %1033, i64 %1031, i64 1
  %1038 = mul nsw i64 %1037, %1003
  %1039 = mul nsw i64 %indvars.iv368, %1010
  %1040 = mul nsw i64 %indvars.iv368, %1015
  %1041 = mul nsw i64 %indvars.iv368, %5
  %1042 = add i64 %1041, %not
  %1043 = mul nsw i64 %indvars.iv368, %1019
  %1044 = mul nsw i64 %indvars.iv368, %1025
  br label %"500"

"500":                                            ; preds = %"500", %"500.preheader"
  %indvars.iv366 = phi i64 [ %1029, %"500.preheader" ], [ %indvars.iv.next367, %"500" ]
  %1045 = add nsw i64 %indvars.iv366, -1
  %1046 = trunc i64 %1045 to i32
  %1047 = icmp sgt i32 %1046, 1
  %1048 = add i64 %999, %998
  %1049 = add i64 %1048, %1035
  %1050 = add i64 %1049, %indvars.iv366
  %1051 = getelementptr inbounds double, double* %989, i64 %1050
  %1052 = load double, double* %1051, align 8, !tbaa !6
  %1053 = select i1 %1047, i64 %1045, i64 1
  %1054 = add i64 %999, %998
  %1055 = add i64 %1054, %1035
  %1056 = add i64 %1055, %1053
  %1057 = getelementptr inbounds double, double* %989, i64 %1056
  %1058 = load double, double* %1057, align 8, !tbaa !6
  %1059 = fadd double %1052, %1058
  %1060 = fmul double %1059, %1059
  %1061 = add i64 %indvars.iv366, %1002
  %1062 = add i64 %1006, %1005
  %1063 = add i64 %1062, %1036
  %1064 = add i64 %1063, %1061
  %1065 = getelementptr inbounds double, double* %1000, i64 %1064
  %1066 = load double, double* %1065, align 8, !tbaa !6
  %1067 = add i64 %1006, %1005
  %1068 = add i64 %1067, %1038
  %1069 = add i64 %1068, %1061
  %1070 = getelementptr inbounds double, double* %1000, i64 %1069
  %1071 = load double, double* %1070, align 8, !tbaa !6
  %1072 = fadd double %1066, %1071
  %1073 = fmul double %1072, %1072
  %1074 = fadd double %1060, %1073
  %1075 = call double @sqrt(double %1074) #2
  %1076 = fmul double %1075, 5.000000e-01
  %1077 = add i64 %1011, %1009
  %1078 = add i64 %1077, %1039
  %1079 = add i64 %1078, %indvars.iv366
  %1080 = getelementptr inbounds double, double* %1007, i64 %1079
  %1081 = load double, double* %1080, align 8, !tbaa !6
  %1082 = add i64 %1016, %1014
  %1083 = add i64 %1082, %1040
  %1084 = add i64 %1083, %indvars.iv366
  %1085 = getelementptr inbounds double, double* %1012, i64 %1084
  %1086 = load double, double* %1085, align 8, !tbaa !6
  %1087 = fmul double %1017, %1086
  %1088 = fadd double %1087, 1.000000e+00
  %1089 = fmul double %1081, %1088
  %1090 = add i64 %1042, %indvars.iv366
  %1091 = add i64 %1043, %1020
  %1092 = add i64 %1091, %indvars.iv366
  %1093 = getelementptr inbounds double, double* %1018, i64 %1092
  %1094 = load double, double* %1093, align 8, !tbaa !6
  %1095 = fmul double %1076, %1094
  %1096 = fmul double %1021, %1095
  %1097 = add i64 %1026, %1024
  %1098 = add i64 %1097, %1044
  %1099 = add i64 %1098, %indvars.iv366
  %1100 = getelementptr inbounds double, double* %1022, i64 %1099
  %1101 = load double, double* %1100, align 8, !tbaa !6
  %1102 = fmul double %1101, %1096
  %1103 = fmul double %1027, %1089
  %1104 = fdiv double %1102, %1103
  %1105 = getelementptr inbounds double, double* %1028, i64 %1090
  store double %1104, double* %1105, align 8, !tbaa !6
  %1106 = trunc i64 %indvars.iv366 to i32
  %1107 = icmp eq i32 %591, %1106
  %indvars.iv.next367 = add nsw i64 %indvars.iv366, 1
  br i1 %1107, label %"503.loopexit", label %"500"

"503.loopexit":                                   ; preds = %"500"
  br label %"503"

"503":                                            ; preds = %"503.loopexit", %"497"
  %1108 = trunc i64 %indvars.iv368 to i32
  %1109 = icmp eq i32 %593, %1108
  %indvars.iv.next369 = add nsw i64 %indvars.iv368, 1
  br i1 %1109, label %"505.preheader", label %"497"

"505.preheader":                                  ; preds = %"503"
  %1110 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %1111 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1112 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %1113 = load double*, double** bitcast (%"struct.array3_real(kind=8).20"* @__data_fields_MOD_w_snow to double**), align 8, !tbaa !8
  %1114 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).20", %"struct.array3_real(kind=8).20"* @__data_fields_MOD_w_snow, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1115 = mul nsw i64 %1114, %996
  %1116 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).20", %"struct.array3_real(kind=8).20"* @__data_fields_MOD_w_snow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1117 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).20", %"struct.array3_real(kind=8).20"* @__data_fields_MOD_w_snow, i64 0, i32 1), align 8, !tbaa !10
  %1118 = load double*, double** bitcast (%"struct.array3_real(kind=8).21"* @__data_fields_MOD_w_i to double**), align 8, !tbaa !8
  %1119 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).21", %"struct.array3_real(kind=8).21"* @__data_fields_MOD_w_i, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1120 = mul nsw i64 %1119, %996
  %1121 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).21", %"struct.array3_real(kind=8).21"* @__data_fields_MOD_w_i, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1122 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).21", %"struct.array3_real(kind=8).21"* @__data_fields_MOD_w_i, i64 0, i32 1), align 8, !tbaa !10
  %1123 = load double*, double** bitcast (%"struct.array3_real(kind=8).19"* @__data_fields_MOD_t_snow to double**), align 8, !tbaa !8
  %1124 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).19", %"struct.array3_real(kind=8).19"* @__data_fields_MOD_t_snow, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1125 = mul nsw i64 %1124, %996
  %1126 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).19", %"struct.array3_real(kind=8).19"* @__data_fields_MOD_t_snow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1127 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).19", %"struct.array3_real(kind=8).19"* @__data_fields_MOD_t_snow, i64 0, i32 1), align 8, !tbaa !10
  %1128 = load double*, double** bitcast (%"struct.array3_real(kind=8).22"* @__data_fields_MOD_w_g1 to double**), align 8, !tbaa !8
  %1129 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).22", %"struct.array3_real(kind=8).22"* @__data_fields_MOD_w_g1, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1130 = mul nsw i64 %1129, %996
  %1131 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).22", %"struct.array3_real(kind=8).22"* @__data_fields_MOD_w_g1, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1132 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).22", %"struct.array3_real(kind=8).22"* @__data_fields_MOD_w_g1, i64 0, i32 1), align 8, !tbaa !10
  %1133 = bitcast i8* %46 to double*
  %1134 = shl nuw i64 %29, 1
  %1135 = add i64 %34, %1134
  %1136 = load double*, double** bitcast (%"struct.array3_real(kind=8).23"* @__data_fields_MOD_w_g2 to double**), align 8, !tbaa !8
  %1137 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).23", %"struct.array3_real(kind=8).23"* @__data_fields_MOD_w_g2, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1138 = mul nsw i64 %1137, %996
  %1139 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).23", %"struct.array3_real(kind=8).23"* @__data_fields_MOD_w_g2, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1140 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).23", %"struct.array3_real(kind=8).23"* @__data_fields_MOD_w_g2, i64 0, i32 1), align 8, !tbaa !10
  %1141 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 1
  %1142 = load double, double* %1141, align 8, !tbaa !6
  %1143 = mul nsw i64 %29, 3
  %1144 = add nsw i64 %34, %1143
  %1145 = load double*, double** bitcast (%"struct.array2_real(kind=8).24"* @__data_fields_MOD_w_cl to double**), align 8, !tbaa !8
  %1146 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).24", %"struct.array2_real(kind=8).24"* @__data_fields_MOD_w_cl, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1147 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).24", %"struct.array2_real(kind=8).24"* @__data_fields_MOD_w_cl, i64 0, i32 1), align 8, !tbaa !10
  %1148 = load double*, double** bitcast (%"struct.array3_real(kind=8).26"* @__data_fields_MOD_w_g3 to double**), align 8, !tbaa !8
  %1149 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).26", %"struct.array3_real(kind=8).26"* @__data_fields_MOD_w_g3, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1150 = mul nsw i64 %1149, %996
  %1151 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).26", %"struct.array3_real(kind=8).26"* @__data_fields_MOD_w_g3, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1152 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).26", %"struct.array3_real(kind=8).26"* @__data_fields_MOD_w_g3, i64 0, i32 1), align 8, !tbaa !10
  %1153 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 2
  %1154 = load double, double* %1153, align 8, !tbaa !6
  %1155 = add i64 %34, %42
  br label %"505"

"505":                                            ; preds = %"522", %"505.preheader"
  %indvars.iv364 = phi i64 [ %1030, %"505.preheader" ], [ %indvars.iv.next365, %"522" ]
  br i1 %988, label %"522", label %"506.preheader"

"506.preheader":                                  ; preds = %"505"
  %1156 = mul nsw i64 %indvars.iv364, %1111
  %1157 = mul nsw i64 %indvars.iv364, %1116
  %1158 = mul nsw i64 %indvars.iv364, %1121
  %1159 = mul nsw i64 %indvars.iv364, %1126
  %1160 = mul nsw i64 %indvars.iv364, %5
  %1161 = add i64 %1160, %not
  %1162 = mul nsw i64 %indvars.iv364, %1131
  %1163 = add i64 %1135, %1160
  %1164 = mul nsw i64 %indvars.iv364, %1139
  %1165 = add i64 %1144, %1160
  %1166 = mul nsw i64 %indvars.iv364, %1146
  %1167 = mul nsw i64 %indvars.iv364, %1151
  %1168 = add i64 %1155, %1160
  %1169 = mul nsw i64 %indvars.iv364, %1010
  br label %"506"

"506":                                            ; preds = %"521", %"506.preheader"
  %indvars.iv362 = phi i64 [ %1029, %"506.preheader" ], [ %indvars.iv.next363, %"521" ]
  %1170 = add i64 %1156, %1112
  %1171 = add i64 %1170, %indvars.iv362
  %1172 = getelementptr inbounds i32, i32* %1110, i64 %1171
  %1173 = load i32, i32* %1172, align 4, !tbaa !3, !range !5
  %1174 = icmp eq i32 %1173, 0
  br i1 %1174, label %"521", label %"507"

"507":                                            ; preds = %"506"
  %1175 = add i64 %1117, %1115
  %1176 = add i64 %1175, %1157
  %1177 = add i64 %1176, %indvars.iv362
  %1178 = getelementptr inbounds double, double* %1113, i64 %1177
  %1179 = load double, double* %1178, align 8, !tbaa !6
  %1180 = fcmp ogt double %1179, 0.000000e+00
  br i1 %1180, label %"508", label %"511"

"508":                                            ; preds = %"507"
  %1181 = add i64 %1122, %1120
  %1182 = add i64 %1181, %1158
  %1183 = add i64 %1182, %indvars.iv362
  %1184 = getelementptr inbounds double, double* %1118, i64 %1183
  store double 0.000000e+00, double* %1184, align 8, !tbaa !6
  %1185 = load double, double* @__data_constants_MOD_t0_melt, align 8, !tbaa !6
  %1186 = fadd double %1185, -1.000000e-06
  %1187 = add i64 %1127, %1125
  %1188 = add i64 %1187, %1159
  %1189 = add i64 %1188, %indvars.iv362
  %1190 = getelementptr inbounds double, double* %1123, i64 %1189
  %1191 = load double, double* %1190, align 8, !tbaa !6
  %1192 = fcmp olt double %1191, %1186
  %1193 = fcmp uno double %1186, 0.000000e+00
  %1194 = or i1 %1192, %1193
  %.212 = select i1 %1194, double %1191, double %1186
  store double %.212, double* %1190, align 8, !tbaa !6
  br label %"518"

"511":                                            ; preds = %"507"
  %1195 = add i64 %1127, %1125
  %1196 = add i64 %1195, %1159
  %1197 = add i64 %1196, %indvars.iv362
  %1198 = getelementptr inbounds double, double* %1123, i64 %1197
  %1199 = load double, double* %1198, align 8, !tbaa !6
  %1200 = load double, double* @__data_constants_MOD_t0_melt, align 8, !tbaa !6
  %1201 = fcmp ult double %1199, %1200
  br i1 %1201, label %"515", label %"512"

"512":                                            ; preds = %"511"
  %1202 = fadd double %1200, 1.000000e-06
  %1203 = add i64 %1011, %1009
  %1204 = add i64 %1203, %1169
  %1205 = add i64 %1204, %indvars.iv362
  %1206 = getelementptr inbounds double, double* %1007, i64 %1205
  %1207 = load double, double* %1206, align 8, !tbaa !6
  %1208 = fcmp ogt double %1207, %1202
  %1209 = fcmp uno double %1202, 0.000000e+00
  %1210 = or i1 %1209, %1208
  %.213 = select i1 %1210, double %1207, double %1202
  store double %.213, double* %1206, align 8, !tbaa !6
  store double %.213, double* %1198, align 8, !tbaa !6
  br label %"518"

"515":                                            ; preds = %"511"
  %1211 = fadd double %1200, -1.000000e-06
  %1212 = add i64 %1011, %1009
  %1213 = add i64 %1212, %1169
  %1214 = add i64 %1213, %indvars.iv362
  %1215 = getelementptr inbounds double, double* %1007, i64 %1214
  %1216 = load double, double* %1215, align 8, !tbaa !6
  %1217 = fcmp olt double %1216, %1211
  %1218 = fcmp uno double %1211, 0.000000e+00
  %1219 = or i1 %1218, %1217
  %.214 = select i1 %1219, double %1216, double %1211
  store double %.214, double* %1215, align 8, !tbaa !6
  store double %.214, double* %1198, align 8, !tbaa !6
  %1220 = add i64 %1122, %1120
  %1221 = add i64 %1220, %1158
  %1222 = add i64 %1221, %indvars.iv362
  %1223 = getelementptr inbounds double, double* %1118, i64 %1222
  store double 0.000000e+00, double* %1223, align 8, !tbaa !6
  br label %"518"

"518":                                            ; preds = %"515", %"512", %"508"
  %1224 = add i64 %1161, %indvars.iv362
  %1225 = add i64 %1132, %1130
  %1226 = add i64 %1225, %1162
  %1227 = add i64 %1226, %indvars.iv362
  %1228 = getelementptr inbounds double, double* %1128, i64 %1227
  %1229 = load double, double* %1228, align 8, !tbaa !6
  %1230 = fdiv double %1229, %627
  %1231 = getelementptr inbounds double, double* %1133, i64 %1224
  store double %1230, double* %1231, align 8, !tbaa !6
  %1232 = add i64 %1163, %indvars.iv362
  %1233 = add i64 %1140, %1138
  %1234 = add i64 %1233, %1164
  %1235 = add i64 %1234, %indvars.iv362
  %1236 = getelementptr inbounds double, double* %1136, i64 %1235
  %1237 = load double, double* %1236, align 8, !tbaa !6
  %1238 = fdiv double %1237, %1142
  %1239 = getelementptr inbounds double, double* %1133, i64 %1232
  store double %1238, double* %1239, align 8, !tbaa !6
  %1240 = add i64 %1165, %indvars.iv362
  br i1 %601, label %"521.sink.split", label %"520"

"520":                                            ; preds = %"518"
  %1241 = add i64 %1152, %1150
  %1242 = add i64 %1241, %1167
  %1243 = add i64 %1242, %indvars.iv362
  %1244 = getelementptr inbounds double, double* %1148, i64 %1243
  %1245 = load double, double* %1244, align 8, !tbaa !6
  %1246 = fdiv double %1245, %1154
  %1247 = getelementptr inbounds double, double* %1133, i64 %1240
  store double %1246, double* %1247, align 8, !tbaa !6
  %1248 = add i64 %1168, %indvars.iv362
  br label %"521.sink.split"

"521.sink.split":                                 ; preds = %"518", %"520"
  %.sink13 = phi double [ %1154, %"520" ], [ %1142, %"518" ]
  %.sink11 = phi i64 [ %1248, %"520" ], [ %1240, %"518" ]
  %1249 = add i64 %1166, %1147
  %1250 = add i64 %1249, %indvars.iv362
  %1251 = getelementptr inbounds double, double* %1145, i64 %1250
  %1252 = load double, double* %1251, align 8, !tbaa !6
  %1253 = fdiv double %1252, %.sink13
  %1254 = getelementptr inbounds double, double* %1133, i64 %.sink11
  store double %1253, double* %1254, align 8, !tbaa !6
  br label %"521"

"521":                                            ; preds = %"521.sink.split", %"506"
  %1255 = trunc i64 %indvars.iv362 to i32
  %1256 = icmp eq i32 %591, %1255
  %indvars.iv.next363 = add nsw i64 %indvars.iv362, 1
  br i1 %1256, label %"522.loopexit", label %"506"

"522.loopexit":                                   ; preds = %"521"
  br label %"522"

"522":                                            ; preds = %"522.loopexit", %"505"
  %1257 = trunc i64 %indvars.iv364 to i32
  %1258 = icmp eq i32 %593, %1257
  %indvars.iv.next365 = add nsw i64 %indvars.iv364, 1
  br i1 %1258, label %"524.preheader", label %"505"

"524.preheader":                                  ; preds = %"522"
  %1259 = load double*, double** bitcast (%"struct.array3_real(kind=8).54"* @__data_fields_MOD_p0 to double**), align 8, !tbaa !8
  %1260 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).54", %"struct.array3_real(kind=8).54"* @__data_fields_MOD_p0, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1261 = mul nsw i64 %1260, %991
  %1262 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).54", %"struct.array3_real(kind=8).54"* @__data_fields_MOD_p0, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1263 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).54", %"struct.array3_real(kind=8).54"* @__data_fields_MOD_p0, i64 0, i32 1), align 8, !tbaa !10
  %1264 = load double*, double** bitcast (%"struct.array4_real(kind=8).55"* @__data_fields_MOD_pp to double**), align 8, !tbaa !8
  %1265 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).55", %"struct.array4_real(kind=8).55"* @__data_fields_MOD_pp, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1266 = mul nsw i64 %1265, %991
  %1267 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).55", %"struct.array4_real(kind=8).55"* @__data_fields_MOD_pp, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1268 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).55", %"struct.array4_real(kind=8).55"* @__data_fields_MOD_pp, i64 0, i32 3, i64 3, i32 0), align 8, !tbaa !10
  %1269 = mul nsw i64 %1268, %996
  %1270 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).55", %"struct.array4_real(kind=8).55"* @__data_fields_MOD_pp, i64 0, i32 1), align 8, !tbaa !10
  %1271 = bitcast i8* %40 to double*
  %1272 = bitcast i8* %39 to double*
  %1273 = bitcast i8* %41 to double*
  %1274 = bitcast i8* %49 to double*
  %1275 = bitcast i8* %47 to double*
  %1276 = load double*, double** bitcast (%"struct.array3_real(kind=8).44"* @qv.2641 to double**), align 32, !tbaa !8
  %1277 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).44", %"struct.array3_real(kind=8).44"* @qv.2641, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %1278 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).44", %"struct.array3_real(kind=8).44"* @qv.2641, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1279 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).44", %"struct.array3_real(kind=8).44"* @qv.2641, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1280 = mul nsw i64 %1279, %991
  %1281 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).44", %"struct.array3_real(kind=8).44"* @qv.2641, i64 0, i32 1), align 8, !tbaa !10
  %1282 = load double*, double** bitcast (%"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low to double**), align 32, !tbaa !8
  %1283 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8)", %"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1284 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8)", %"struct.array2_real(kind=8)"* @__src_soil_MOD_xth_low, i64 0, i32 1), align 8, !tbaa !10
  %1285 = load double*, double** bitcast (%"struct.array4_real(kind=8).56"* @__data_fields_MOD_t to double**), align 8, !tbaa !8
  %1286 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).56", %"struct.array4_real(kind=8).56"* @__data_fields_MOD_t, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1287 = mul nsw i64 %1286, %991
  %1288 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).56", %"struct.array4_real(kind=8).56"* @__data_fields_MOD_t, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1289 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).56", %"struct.array4_real(kind=8).56"* @__data_fields_MOD_t, i64 0, i32 3, i64 3, i32 0), align 8, !tbaa !10
  %1290 = mul nsw i64 %1289, %996
  %1291 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).56", %"struct.array4_real(kind=8).56"* @__data_fields_MOD_t, i64 0, i32 1), align 8, !tbaa !10
  %1292 = load double*, double** bitcast (%"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch to double**), align 32, !tbaa !8
  %1293 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1294 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 1), align 8, !tbaa !10
  %1295 = load double*, double** bitcast (%"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts to double**), align 32, !tbaa !8
  %1296 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).11", %"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1297 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).11", %"struct.array2_real(kind=8).11"* @__src_soil_MOD_xdqvts, i64 0, i32 1), align 8, !tbaa !10
  %1298 = load double*, double** bitcast (%"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow to double**), align 32, !tbaa !8
  %1299 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).10", %"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1300 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).10", %"struct.array2_real(kind=8).10"* @__src_soil_MOD_xdqvtsnow, i64 0, i32 1), align 8, !tbaa !10
  %1301 = load double*, double** bitcast (%"struct.array2_real(kind=8).57"* @__data_fields_MOD_tfv to double**), align 8, !tbaa !8
  %1302 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).57", %"struct.array2_real(kind=8).57"* @__data_fields_MOD_tfv, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1303 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).57", %"struct.array2_real(kind=8).57"* @__data_fields_MOD_tfv, i64 0, i32 1), align 8, !tbaa !10
  %1304 = bitcast i8* %23 to double*
  %1305 = bitcast i8* %22 to double*
  br label %"524"

"524":                                            ; preds = %"532", %"524.preheader"
  %indvars.iv360 = phi i64 [ %1030, %"524.preheader" ], [ %indvars.iv.next361, %"532" ]
  br i1 %988, label %"532", label %"525.preheader"

"525.preheader":                                  ; preds = %"524"
  %1306 = mul nsw i64 %indvars.iv360, %1111
  %1307 = mul nsw i64 %indvars.iv360, %1262
  %1308 = mul nsw i64 %indvars.iv360, %1267
  %1309 = mul nsw i64 %indvars.iv360, %5
  %1310 = add i64 %1309, %not
  %1311 = mul nsw i64 %indvars.iv360, %1126
  %1312 = mul nsw i64 %indvars.iv360, %1010
  %1313 = mul nsw i64 %indvars.iv360, %1116
  %1314 = mul nsw i64 %indvars.iv360, %1121
  %1315 = mul nsw i64 %indvars.iv360, %1278
  %1316 = mul nsw i64 %indvars.iv360, %1025
  %1317 = mul nsw i64 %indvars.iv360, %1283
  %1318 = mul nsw i64 %indvars.iv360, %1288
  %1319 = mul nsw i64 %indvars.iv360, %1293
  %1320 = mul nsw i64 %indvars.iv360, %1296
  %1321 = mul nsw i64 %indvars.iv360, %1299
  %1322 = mul nsw i64 %indvars.iv360, %1302
  br label %"525"

"525":                                            ; preds = %"531", %"525.preheader"
  %indvars.iv358 = phi i64 [ %1029, %"525.preheader" ], [ %indvars.iv.next359, %"531" ]
  %1323 = add i64 %1306, %1112
  %1324 = add i64 %1323, %indvars.iv358
  %1325 = getelementptr inbounds i32, i32* %1110, i64 %1324
  %1326 = load i32, i32* %1325, align 4, !tbaa !3, !range !5
  %1327 = icmp eq i32 %1326, 0
  br i1 %1327, label %"531", label %"526"

"526":                                            ; preds = %"525"
  %1328 = add i64 %1263, %1261
  %1329 = add i64 %1328, %1307
  %1330 = add i64 %1329, %indvars.iv358
  %1331 = getelementptr inbounds double, double* %1259, i64 %1330
  %1332 = load double, double* %1331, align 8, !tbaa !6
  %1333 = add i64 %1269, %1266
  %1334 = add i64 %1333, %1270
  %1335 = add i64 %1334, %1308
  %1336 = add i64 %1335, %indvars.iv358
  %1337 = getelementptr inbounds double, double* %1264, i64 %1336
  %1338 = load double, double* %1337, align 8, !tbaa !6
  %1339 = fadd double %1332, %1338
  %1340 = add i64 %1310, %indvars.iv358
  %1341 = add i64 %1127, %1125
  %1342 = add i64 %1341, %1311
  %1343 = add i64 %1342, %indvars.iv358
  %1344 = getelementptr inbounds double, double* %1123, i64 %1343
  %1345 = load double, double* %1344, align 8, !tbaa !6
  %1346 = getelementptr inbounds double, double* %1271, i64 %1340
  store double %1345, double* %1346, align 8, !tbaa !6
  %1347 = add i64 %1011, %1009
  %1348 = add i64 %1347, %1312
  %1349 = add i64 %1348, %indvars.iv358
  %1350 = getelementptr inbounds double, double* %1007, i64 %1349
  %1351 = load double, double* %1350, align 8, !tbaa !6
  %1352 = load double, double* @__data_constants_MOD_t0_melt, align 8, !tbaa !6
  %1353 = fsub double %1351, %1352
  %1354 = call double @copysign(double 5.000000e-01, double %1353) #2
  %1355 = fadd double %1354, 5.000000e-01
  %1356 = getelementptr inbounds double, double* %1272, i64 %1340
  store double %1355, double* %1356, align 8, !tbaa !6
  %1357 = fsub double %1345, %1352
  %1358 = call double @copysign(double 5.000000e-01, double %1357) #2
  %1359 = fadd double %1358, 5.000000e-01
  %1360 = getelementptr inbounds double, double* %1273, i64 %1340
  store double %1359, double* %1360, align 8, !tbaa !6
  %1361 = add i64 %1117, %1115
  %1362 = add i64 %1361, %1313
  %1363 = add i64 %1362, %indvars.iv358
  %1364 = getelementptr inbounds double, double* %1113, i64 %1363
  %1365 = bitcast double* %1364 to i64*
  %1366 = load i64, i64* %1365, align 8, !tbaa !6
  %1367 = getelementptr inbounds double, double* %1274, i64 %1340
  %1368 = bitcast double* %1367 to i64*
  store i64 %1366, i64* %1368, align 8, !tbaa !6
  %1369 = add i64 %1122, %1120
  %1370 = add i64 %1369, %1314
  %1371 = add i64 %1370, %indvars.iv358
  %1372 = getelementptr inbounds double, double* %1118, i64 %1371
  %1373 = bitcast double* %1372 to i64*
  %1374 = load i64, i64* %1373, align 8, !tbaa !6
  %1375 = getelementptr inbounds double, double* %1275, i64 %1340
  %1376 = bitcast double* %1375 to i64*
  store i64 %1374, i64* %1376, align 8, !tbaa !6
  %1377 = mul nsw i64 %indvars.iv358, %1277
  %1378 = add i64 %1281, %1280
  %1379 = add i64 %1378, %1315
  %1380 = add i64 %1379, %1377
  %1381 = getelementptr inbounds double, double* %1276, i64 %1380
  %1382 = load double, double* %1381, align 8, !tbaa !6
  %1383 = add i64 %1026, %1024
  %1384 = add i64 %1383, %1316
  %1385 = add i64 %1384, %indvars.iv358
  %1386 = getelementptr inbounds double, double* %1022, i64 %1385
  %1387 = load double, double* %1386, align 8, !tbaa !6
  %1388 = fdiv double %1387, %1339
  %1389 = add i64 %1317, %1284
  %1390 = add i64 %1389, %indvars.iv358
  %1391 = add i64 %1290, %1287
  %1392 = add i64 %1391, %1291
  %1393 = add i64 %1392, %1318
  %1394 = add i64 %1393, %indvars.iv358
  %1395 = getelementptr inbounds double, double* %1285, i64 %1394
  %1396 = load double, double* %1395, align 8, !tbaa !6
  %1397 = load double, double* @__data_constants_MOD_rdocp, align 8, !tbaa !6
  %1398 = call double @pow(double %1388, double %1397) #2
  %1399 = fmul double %1396, %1398
  %1400 = getelementptr inbounds double, double* %1282, i64 %1390
  store double %1399, double* %1400, align 8, !tbaa !6
  %1401 = add i64 %1319, %1294
  %1402 = add i64 %1401, %indvars.iv358
  %1403 = getelementptr inbounds double, double* %1028, i64 %1340
  %1404 = load double, double* %1403, align 8, !tbaa !6
  %1405 = load double, double* @__data_constants_MOD_g, align 8, !tbaa !6
  %1406 = fdiv double 1.000000e+00, %1405
  %1407 = fmul double %1404, %1406
  %1408 = fadd double %1407, 1.000000e-06
  %1409 = getelementptr inbounds double, double* %1292, i64 %1402
  store double %1408, double* %1409, align 8, !tbaa !6
  %1410 = load double, double* @__data_constants_MOD_b2w, align 8, !tbaa !6
  %1411 = fmul double %1355, %1410
  %1412 = fsub double 1.000000e+00, %1355
  %1413 = load double, double* @__data_constants_MOD_b2i, align 8, !tbaa !6
  %1414 = fmul double %1412, %1413
  %1415 = fadd double %1411, %1414
  %1416 = load double, double* @__data_constants_MOD_b4w, align 8, !tbaa !6
  %1417 = fmul double %1355, %1416
  %1418 = load double, double* @__data_constants_MOD_b4i, align 8, !tbaa !6
  %1419 = fmul double %1412, %1418
  %1420 = fadd double %1417, %1419
  %1421 = load double, double* @__data_constants_MOD_b3, align 8, !tbaa !6
  %1422 = fsub double %1421, %1420
  %1423 = fmul double %1415, %1422
  %1424 = fsub double %1351, %1421
  %1425 = fmul double %1415, %1424
  %1426 = fsub double %1351, %1420
  %1427 = fdiv double %1425, %1426
  %1428 = call double @exp(double %1427) #2
  %1429 = load double, double* @__data_constants_MOD_b1, align 8, !tbaa !6
  %1430 = fmul double %1428, %1429
  %1431 = load double, double* %1386, align 8, !tbaa !6
  %1432 = load double, double* @__data_constants_MOD_rdv, align 8, !tbaa !6
  %1433 = fmul double %1430, %1432
  %1434 = load double, double* @__data_constants_MOD_o_m_rdv, align 8, !tbaa !6
  %1435 = fmul double %1430, %1434
  %1436 = fsub double %1431, %1435
  %1437 = fdiv double %1433, %1436
  %1438 = fmul double %1426, %1426
  %1439 = add i64 %1320, %1297
  %1440 = add i64 %1439, %indvars.iv358
  %1441 = load double, double* @__data_constants_MOD_rvd_m_o, align 8, !tbaa !6
  %1442 = fmul double %1441, %1437
  %1443 = fadd double %1442, 1.000000e+00
  %1444 = fmul double %1423, %1443
  %1445 = fmul double %1437, %1444
  %1446 = fdiv double %1445, %1438
  %1447 = getelementptr inbounds double, double* %1295, i64 %1440
  store double %1446, double* %1447, align 8, !tbaa !6
  %1448 = fsub double %1382, %1437
  %1449 = call double @llvm.fabs.f64(double %1448)
  %1450 = fcmp olt double %1449, 1.000000e-06
  %.215 = select i1 %1450, double 0.000000e+00, double %1448
  %1451 = load double, double* @__data_constants_MOD_b2w, align 8, !tbaa !6
  %1452 = fmul double %1359, %1451
  %1453 = fsub double 1.000000e+00, %1359
  %1454 = load double, double* @__data_constants_MOD_b2i, align 8, !tbaa !6
  %1455 = fmul double %1453, %1454
  %1456 = fadd double %1452, %1455
  %1457 = load double, double* @__data_constants_MOD_b4w, align 8, !tbaa !6
  %1458 = fmul double %1359, %1457
  %1459 = load double, double* @__data_constants_MOD_b4i, align 8, !tbaa !6
  %1460 = fmul double %1453, %1459
  %1461 = fadd double %1458, %1460
  %1462 = load double, double* @__data_constants_MOD_b3, align 8, !tbaa !6
  %1463 = fsub double %1462, %1461
  %1464 = fmul double %1456, %1463
  %1465 = load double, double* %1346, align 8, !tbaa !6
  %1466 = fsub double %1465, %1462
  %1467 = fmul double %1456, %1466
  %1468 = fsub double %1465, %1461
  %1469 = fdiv double %1467, %1468
  %1470 = call double @exp(double %1469) #2
  %1471 = load double, double* @__data_constants_MOD_b1, align 8, !tbaa !6
  %1472 = fmul double %1470, %1471
  %1473 = load double, double* %1386, align 8, !tbaa !6
  %1474 = load double, double* @__data_constants_MOD_rdv, align 8, !tbaa !6
  %1475 = fmul double %1472, %1474
  %1476 = load double, double* @__data_constants_MOD_o_m_rdv, align 8, !tbaa !6
  %1477 = fmul double %1472, %1476
  %1478 = fsub double %1473, %1477
  %1479 = fdiv double %1475, %1478
  %1480 = fmul double %1468, %1468
  %1481 = add i64 %1321, %1300
  %1482 = add i64 %1481, %indvars.iv358
  %1483 = load double, double* @__data_constants_MOD_rvd_m_o, align 8, !tbaa !6
  %1484 = fmul double %1483, %1479
  %1485 = fadd double %1484, 1.000000e+00
  %1486 = fmul double %1464, %1485
  %1487 = fmul double %1479, %1486
  %1488 = fdiv double %1487, %1480
  %1489 = getelementptr inbounds double, double* %1298, i64 %1482
  store double %1488, double* %1489, align 8, !tbaa !6
  %1490 = fsub double %1382, %1479
  %1491 = call double @llvm.fabs.f64(double %1490)
  %1492 = fcmp olt double %1491, 1.000000e-06
  %1493 = select i1 %1492, double 0.000000e+00, double %1490
  %1494 = load double, double* %1360, align 8, !tbaa !6
  %1495 = fsub double 1.000000e+00, %1494
  %1496 = add i64 %1322, %1303
  %1497 = add i64 %1496, %indvars.iv358
  %1498 = getelementptr inbounds double, double* %1301, i64 %1497
  %1499 = load double, double* %1498, align 8, !tbaa !6
  %1500 = fmul double %1495, %1499
  %1501 = load double, double* %1409, align 8, !tbaa !6
  %1502 = fmul double %1500, %1501
  %1503 = fmul double %1502, %1493
  %1504 = getelementptr inbounds double, double* %1304, i64 %1340
  store double %1503, double* %1504, align 8, !tbaa !6
  %1505 = fmul double %1499, %1501
  %1506 = fmul double %.215, %1505
  %1507 = getelementptr inbounds double, double* %1305, i64 %1340
  store double %1506, double* %1507, align 8, !tbaa !6
  br label %"531"

"531":                                            ; preds = %"526", %"525"
  %1508 = trunc i64 %indvars.iv358 to i32
  %1509 = icmp eq i32 %591, %1508
  %indvars.iv.next359 = add nsw i64 %indvars.iv358, 1
  br i1 %1509, label %"532.loopexit", label %"525"

"532.loopexit":                                   ; preds = %"531"
  br label %"532"

"532":                                            ; preds = %"532.loopexit", %"524"
  %1510 = trunc i64 %indvars.iv360 to i32
  %1511 = icmp eq i32 %593, %1510
  %indvars.iv.next361 = add nsw i64 %indvars.iv360, 1
  br i1 %1511, label %"534.preheader", label %"524"

"534.preheader":                                  ; preds = %"532"
  %1512 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %1513 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1514 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %1515 = bitcast i8* %24 to double*
  %1516 = bitcast i8* %27 to double*
  %1517 = bitcast i8* %26 to double*
  %1518 = bitcast i8* %21 to double*
  %1519 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1520 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).12", %"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam, i64 0, i32 1), align 8, !tbaa !10
  %1521 = load double*, double** bitcast (%"struct.array2_real(kind=8).12"* @__src_soil_MOD_xalam to double**), align 32, !tbaa !8
  %1522 = load double*, double** bitcast (%"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm to double**), align 32, !tbaa !8
  %1523 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1524 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).3", %"struct.array2_real(kind=8).3"* @__src_soil_MOD_xrocm, i64 0, i32 1), align 8, !tbaa !10
  %1525 = load double*, double** bitcast (%"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg to double**), align 32, !tbaa !8
  %1526 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1527 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).4", %"struct.array2_real(kind=8).4"* @__src_soil_MOD_xrocg, i64 0, i32 1), align 8, !tbaa !10
  %1528 = load double*, double** bitcast (%"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow to double**), align 8, !tbaa !8
  %1529 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).28", %"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1530 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).28", %"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow, i64 0, i32 1), align 8, !tbaa !10
  %1531 = load double*, double** bitcast (%"struct.array2_real(kind=8).58"* @__data_fields_MOD_fr_wi to double**), align 8, !tbaa !8
  %1532 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).58", %"struct.array2_real(kind=8).58"* @__data_fields_MOD_fr_wi, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1533 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).58", %"struct.array2_real(kind=8).58"* @__data_fields_MOD_fr_wi, i64 0, i32 1), align 8, !tbaa !10
  %1534 = load double*, double** bitcast (%"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs to double**), align 32, !tbaa !8
  %1535 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1536 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).7", %"struct.array2_real(kind=8).7"* @__src_soil_MOD_xdzs, i64 0, i32 1), align 8, !tbaa !10
  %1537 = load double*, double** bitcast (%"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs to double**), align 32, !tbaa !8
  %1538 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1539 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).2", %"struct.array2_real(kind=8).2"* @__src_soil_MOD_xrocs, i64 0, i32 1), align 8, !tbaa !10
  br label %"534"

"534":                                            ; preds = %"562", %"534.preheader"
  %indvars.iv356 = phi i64 [ %1030, %"534.preheader" ], [ %indvars.iv.next357, %"562" ]
  br i1 %988, label %"562", label %"535.preheader"

"535.preheader":                                  ; preds = %"534"
  %1540 = mul nsw i64 %indvars.iv356, %1513
  %1541 = mul nsw i64 %indvars.iv356, %5
  %1542 = add i64 %1541, %not
  %1543 = mul nsw i64 %indvars.iv356, %1519
  %1544 = mul nsw i64 %indvars.iv356, %1523
  %1545 = mul nsw i64 %indvars.iv356, %1526
  %1546 = mul nsw i64 %indvars.iv356, %1529
  %1547 = mul nsw i64 %indvars.iv356, %1532
  %1548 = mul nsw i64 %indvars.iv356, %1535
  %1549 = mul nsw i64 %indvars.iv356, %1538
  br label %"535"

"535":                                            ; preds = %"561", %"535.preheader"
  %indvars.iv354 = phi i64 [ %1029, %"535.preheader" ], [ %indvars.iv.next355, %"561" ]
  %1550 = add i64 %1540, %1514
  %1551 = add i64 %1550, %indvars.iv354
  %1552 = getelementptr inbounds i32, i32* %1512, i64 %1551
  %1553 = load i32, i32* %1552, align 4, !tbaa !3, !range !5
  %1554 = icmp eq i32 %1553, 0
  br i1 %1554, label %"561", label %"536"

"536":                                            ; preds = %"535"
  %1555 = add i64 %1542, %indvars.iv354
  %1556 = getelementptr inbounds double, double* %1515, i64 %1555
  %1557 = load double, double* %1556, align 8, !tbaa !6
  %1558 = getelementptr inbounds double, double* %1516, i64 %1555
  %1559 = load double, double* %1558, align 8, !tbaa !6
  %1560 = fadd double %1557, %1559
  %1561 = fmul double %1560, 5.000000e-01
  %1562 = fmul double %1561, 4.000000e+00
  %1563 = getelementptr inbounds double, double* %1517, i64 %1555
  %1564 = load double, double* %1563, align 8, !tbaa !6
  %1565 = fdiv double %1562, %1564
  %1566 = fadd double %1565, -1.000000e+00
  %1567 = getelementptr inbounds double, double* %1518, i64 %1555
  %1568 = load double, double* %1567, align 8, !tbaa !6
  %1569 = fmul double %1568, 3.500000e-01
  %1570 = fadd double %1569, 1.000000e+00
  %1571 = fmul double %1570, %1566
  %1572 = fmul double %1568, 1.950000e+00
  %1573 = fadd double %1572, 1.000000e+00
  %1574 = fdiv double %1571, %1573
  %1575 = fadd double %1574, 1.000000e+00
  %1576 = fcmp olt double %1575, %1565
  %1577 = fcmp uno double %1565, 0.000000e+00
  %1578 = or i1 %1577, %1576
  %.216 = select i1 %1578, double %1575, double %1565
  %1579 = add i64 %1543, %1520
  %1580 = add i64 %1579, %indvars.iv354
  %1581 = getelementptr inbounds double, double* %1521, i64 %1580
  %1582 = load double, double* %1581, align 8, !tbaa !6
  %1583 = fmul double %1568, 3.000000e-01
  %1584 = fmul double %1568, 7.500000e-01
  %1585 = fadd double %1584, 1.000000e+00
  %1586 = fdiv double %1583, %1585
  %1587 = fadd double %1586, 2.500000e-01
  %1588 = fmul double %1568, %1587
  %1589 = fmul double %1588, %.216
  %1590 = fadd double %1582, %1589
  store double %1590, double* %1581, align 8, !tbaa !6
  %1591 = add i64 %1544, %1524
  %1592 = add i64 %1591, %indvars.iv354
  %1593 = add i64 %1545, %1527
  %1594 = add i64 %1593, %indvars.iv354
  %1595 = getelementptr inbounds double, double* %1525, i64 %1594
  %1596 = load double, double* %1595, align 8, !tbaa !6
  %1597 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %1598 = fmul double %1561, %1597
  %1599 = load double, double* @__data_soil_MOD_chc_w, align 8, !tbaa !6
  %1600 = fmul double %1598, %1599
  %1601 = fadd double %1596, %1600
  %1602 = getelementptr inbounds double, double* %1522, i64 %1592
  store double %1601, double* %1602, align 8, !tbaa !6
  %1603 = load double, double* %1595, align 8, !tbaa !6
  %1604 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %1605 = fmul double %1561, %1604
  %1606 = load double, double* @__data_soil_MOD_chc_w, align 8, !tbaa !6
  %1607 = fmul double %1605, %1606
  %1608 = fadd double %1603, %1607
  store double %1608, double* %1595, align 8, !tbaa !6
  %1609 = getelementptr inbounds double, double* %1274, i64 %1555
  %1610 = load double, double* %1609, align 8, !tbaa !6
  %1611 = load double, double* @__data_soil_MOD_cf_snow, align 8, !tbaa !6
  %1612 = fdiv double %1610, %1611
  %1613 = fcmp olt double %1612, 1.000000e+00
  %1614 = select i1 %1613, double %1612, double 1.000000e+00
  %1615 = fcmp ogt double %1614, 1.000000e-02
  %.217 = select i1 %1615, double %1614, double 1.000000e-02
  %1616 = getelementptr inbounds double, double* %1275, i64 %1555
  %1617 = load double, double* %1616, align 8, !tbaa !6
  %1618 = load double, double* @__data_soil_MOD_cf_w, align 8, !tbaa !6
  %1619 = fdiv double %1617, %1618
  %1620 = fsub double -0.000000e+00, %1619
  %1621 = fcmp olt double %1619, 5.000000e+00
  %1622 = select i1 %1621, double %1620, double -5.000000e+00
  %1623 = call double @exp(double %1622) #2
  %1624 = fsub double 1.000000e+00, %1623
  %1625 = fcmp ogt double %1624, 1.000000e-02
  %.218 = select i1 %1625, double %1624, double 1.000000e-02
  %1626 = getelementptr inbounds double, double* %1273, i64 %1555
  %1627 = load double, double* %1626, align 8, !tbaa !6
  %1628 = fmul double %1627, %.218
  %1629 = fcmp ogt double %.217, 9.900000e-01
  %1630 = select i1 %1629, double 1.000000e+00, double %.217
  %1631 = fcmp ogt double %1628, 9.900000e-01
  %.219 = select i1 %1631, double 1.000000e+00, double %1628
  %1632 = fadd double %1610, -5.000000e-07
  %1633 = add i64 %1546, %1530
  %1634 = add i64 %1633, %indvars.iv354
  %1635 = call double @copysign(double 5.000000e-01, double %1632) #2
  %1636 = fadd double %1635, 5.000000e-01
  %1637 = fmul double %1636, %1630
  %1638 = getelementptr inbounds double, double* %1528, i64 %1634
  store double %1637, double* %1638, align 8, !tbaa !6
  %1639 = fadd double %1617, -5.000000e-07
  %1640 = add i64 %1547, %1533
  %1641 = add i64 %1640, %indvars.iv354
  %1642 = call double @copysign(double 5.000000e-01, double %1639) #2
  %1643 = fadd double %1642, 5.000000e-01
  %1644 = fmul double %1643, %.219
  %1645 = getelementptr inbounds double, double* %1531, i64 %1641
  store double %1644, double* %1645, align 8, !tbaa !6
  %1646 = load double, double* @__data_soil_MOD_crhosmax, align 8, !tbaa !6
  %1647 = load double, double* @__data_soil_MOD_crhos_dw, align 8, !tbaa !6
  %1648 = fmul double %1610, %1647
  %1649 = load double, double* @__data_soil_MOD_crhosmin, align 8, !tbaa !6
  %1650 = fadd double %1648, %1649
  %1651 = fcmp olt double %1650, %1646
  %1652 = fcmp uno double %1646, 0.000000e+00
  %1653 = or i1 %1652, %1651
  %1654 = select i1 %1653, double %1650, double %1646
  %1655 = fcmp ogt double %1654, %1649
  %1656 = fcmp uno double %1649, 0.000000e+00
  %1657 = or i1 %1656, %1655
  %.220 = select i1 %1657, double %1654, double %1649
  %1658 = load double, double* %1638, align 8, !tbaa !6
  %1659 = fcmp ogt double %1658, 1.000000e-02
  %1660 = select i1 %1659, double %1658, double 1.000000e-02
  %1661 = load double, double* @__data_soil_MOD_cdsmin, align 8, !tbaa !6
  %1662 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %1663 = fmul double %1610, %1662
  %1664 = fdiv double %1663, %.220
  %1665 = fdiv double %1664, %1660
  %1666 = fcmp ogt double %1665, %1661
  %1667 = fcmp uno double %1661, 0.000000e+00
  %1668 = or i1 %1667, %1666
  %.221 = select i1 %1668, double %1665, double %1661
  %1669 = fcmp olt double %.221, 1.500000e+00
  %1670 = select i1 %1669, double %.221, double 1.500000e+00
  %1671 = add i64 %1548, %1536
  %1672 = add i64 %1671, %indvars.iv354
  %1673 = getelementptr inbounds double, double* %1534, i64 %1672
  store double %1670, double* %1673, align 8, !tbaa !6
  %1674 = add i64 %1549, %1539
  %1675 = add i64 %1674, %indvars.iv354
  %1676 = load double, double* @__data_soil_MOD_chc_i, align 8, !tbaa !6
  %1677 = fmul double %1676, %1670
  %1678 = fmul double %.220, %1677
  %1679 = getelementptr inbounds double, double* %1537, i64 %1675
  store double %1678, double* %1679, align 8, !tbaa !6
  br label %"561"

"561":                                            ; preds = %"536", %"535"
  %1680 = trunc i64 %indvars.iv354 to i32
  %1681 = icmp eq i32 %591, %1680
  %indvars.iv.next355 = add nsw i64 %indvars.iv354, 1
  br i1 %1681, label %"562.loopexit", label %"535"

"562.loopexit":                                   ; preds = %"561"
  br label %"562"

"562":                                            ; preds = %"562.loopexit", %"534"
  %1682 = trunc i64 %indvars.iv356 to i32
  %1683 = icmp eq i32 %593, %1682
  %indvars.iv.next357 = add nsw i64 %indvars.iv356, 1
  br i1 %1683, label %"564.preheader", label %"534"

"564.preheader":                                  ; preds = %"562"
  %1684 = load double*, double** bitcast (%"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt to double**), align 32, !tbaa !8
  %1685 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1686 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 1), align 8, !tbaa !10
  %1687 = load double*, double** bitcast (%"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt to double**), align 32, !tbaa !8
  %1688 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1689 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 1), align 8, !tbaa !10
  %1690 = load double*, double** bitcast (%"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil to double**), align 32, !tbaa !8
  %1691 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1692 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 1), align 8, !tbaa !10
  %1693 = load double*, double** bitcast (%"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr to double**), align 32, !tbaa !8
  %1694 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1695 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 1), align 8, !tbaa !10
  %1696 = load double*, double** bitcast (%"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs to double**), align 32, !tbaa !8
  %1697 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1698 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 1), align 8, !tbaa !10
  %1699 = load double*, double** bitcast (%"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang to double**), align 32, !tbaa !8
  %1700 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1701 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %1702 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 1), align 8, !tbaa !10
  %1703 = shl i64 %1701, 1
  %1704 = mul nsw i64 %1701, 3
  %1705 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %1706 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1707 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %1708 = load double*, double** bitcast (%"struct.array2_real(kind=8).58"* @__data_fields_MOD_fr_wi to double**), align 8, !tbaa !8
  %1709 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).58", %"struct.array2_real(kind=8).58"* @__data_fields_MOD_fr_wi, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1710 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).58", %"struct.array2_real(kind=8).58"* @__data_fields_MOD_fr_wi, i64 0, i32 1), align 8, !tbaa !10
  %1711 = load double*, double** bitcast (%"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow to double**), align 8, !tbaa !8
  %1712 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).28", %"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1713 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).28", %"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow, i64 0, i32 1), align 8, !tbaa !10
  %1714 = sub i32 1, %592
  %1715 = add i32 %1714, %593
  br label %"564"

"564":                                            ; preds = %"572", %"564.preheader"
  %indvars.iv350 = phi i64 [ %1030, %"564.preheader" ], [ %indvars.iv.next351, %"572" ]
  %indvar = phi i64 [ 0, %"564.preheader" ], [ %indvar.next, %"572" ]
  br i1 %988, label %"572", label %"565.preheader"

"565.preheader":                                  ; preds = %"564"
  %1716 = mul nsw i64 %indvars.iv350, %1685
  %1717 = mul nsw i64 %indvars.iv350, %1688
  %1718 = mul nsw i64 %indvars.iv350, %1691
  %1719 = mul nsw i64 %indvars.iv350, %1694
  %1720 = mul nsw i64 %indvars.iv350, %1697
  %1721 = mul nsw i64 %indvars.iv350, %1700
  %1722 = mul nsw i64 %indvars.iv350, %1706
  %1723 = mul nsw i64 %indvars.iv350, %5
  %1724 = add i64 %1723, %not
  %1725 = mul nsw i64 %indvars.iv350, %1709
  %1726 = mul nsw i64 %indvars.iv350, %1712
  br label %"565"

"565":                                            ; preds = %"571", %"565.preheader"
  %indvars.iv348 = phi i64 [ %1029, %"565.preheader" ], [ %indvars.iv.next349, %"571" ]
  %1727 = add i64 %1716, %1686
  %1728 = add i64 %1727, %indvars.iv348
  %1729 = getelementptr inbounds double, double* %1684, i64 %1728
  store double 0.000000e+00, double* %1729, align 8, !tbaa !6
  %1730 = add i64 %1717, %1689
  %1731 = add i64 %1730, %indvars.iv348
  %1732 = getelementptr inbounds double, double* %1687, i64 %1731
  store double 0.000000e+00, double* %1732, align 8, !tbaa !6
  %1733 = add i64 %1718, %1692
  %1734 = add i64 %1733, %indvars.iv348
  %1735 = getelementptr inbounds double, double* %1690, i64 %1734
  store double 0.000000e+00, double* %1735, align 8, !tbaa !6
  %1736 = add i64 %1719, %1695
  %1737 = add i64 %1736, %indvars.iv348
  %1738 = getelementptr inbounds double, double* %1693, i64 %1737
  store double 0.000000e+00, double* %1738, align 8, !tbaa !6
  %1739 = add i64 %1720, %1698
  %1740 = add i64 %1739, %indvars.iv348
  %1741 = getelementptr inbounds double, double* %1696, i64 %1740
  store double 0.000000e+00, double* %1741, align 8, !tbaa !6
  %1742 = add i64 %1702, %1701
  %1743 = add i64 %1742, %1721
  %1744 = add i64 %1743, %indvars.iv348
  %1745 = getelementptr inbounds double, double* %1699, i64 %1744
  store double 0.000000e+00, double* %1745, align 8, !tbaa !6
  %1746 = add i64 %1702, %1703
  %1747 = add i64 %1746, %1721
  %1748 = add i64 %1747, %indvars.iv348
  %1749 = getelementptr inbounds double, double* %1699, i64 %1748
  store double 0.000000e+00, double* %1749, align 8, !tbaa !6
  %1750 = add i64 %1702, %1704
  %1751 = add i64 %1750, %1721
  %1752 = add i64 %1751, %indvars.iv348
  %1753 = getelementptr inbounds double, double* %1699, i64 %1752
  store double 0.000000e+00, double* %1753, align 8, !tbaa !6
  %1754 = add i64 %1722, %1707
  %1755 = add i64 %1754, %indvars.iv348
  %1756 = getelementptr inbounds i32, i32* %1705, i64 %1755
  %1757 = load i32, i32* %1756, align 4, !tbaa !3, !range !5
  %1758 = icmp eq i32 %1757, 0
  br i1 %1758, label %"571", label %"566"

"566":                                            ; preds = %"565"
  %1759 = add i64 %1724, %indvars.iv348
  %1760 = getelementptr inbounds double, double* %1305, i64 %1759
  %1761 = load double, double* %1760, align 8, !tbaa !6
  %1762 = fsub double -0.000000e+00, %1761
  %1763 = getelementptr inbounds double, double* %1275, i64 %1759
  %1764 = load double, double* %1763, align 8, !tbaa !6
  %1765 = fmul double %622, %1764
  %1766 = fsub double -0.000000e+00, %1765
  %1767 = add i64 %1725, %1710
  %1768 = add i64 %1767, %indvars.iv348
  %1769 = getelementptr inbounds double, double* %1708, i64 %1768
  %1770 = load double, double* %1769, align 8, !tbaa !6
  %1771 = fmul double %1761, %1770
  %1772 = fcmp ogt double %1771, %1766
  %1773 = fcmp uno double %1765, -0.000000e+00
  %1774 = or i1 %1773, %1772
  %.222 = select i1 %1774, double %1771, double %1766
  %1775 = call double @copysign(double 5.000000e-01, double %1762) #2
  %1776 = fadd double %1775, 5.000000e-01
  %1777 = fmul double %1776, %.222
  store double %1777, double* %1729, align 8, !tbaa !6
  %1778 = getelementptr inbounds double, double* %1304, i64 %1759
  %1779 = load double, double* %1778, align 8, !tbaa !6
  %1780 = fsub double -0.000000e+00, %1779
  %1781 = getelementptr inbounds double, double* %1274, i64 %1759
  %1782 = load double, double* %1781, align 8, !tbaa !6
  %1783 = fmul double %622, %1782
  %1784 = fsub double -0.000000e+00, %1783
  %1785 = add i64 %1726, %1713
  %1786 = add i64 %1785, %indvars.iv348
  %1787 = getelementptr inbounds double, double* %1711, i64 %1786
  %1788 = load double, double* %1787, align 8, !tbaa !6
  %1789 = fmul double %1779, %1788
  %1790 = fcmp ogt double %1789, %1784
  %1791 = fcmp uno double %1783, -0.000000e+00
  %1792 = or i1 %1791, %1790
  %1793 = select i1 %1792, double %1789, double %1784
  %1794 = call double @copysign(double 5.000000e-01, double %1780) #2
  %1795 = fadd double %1794, 5.000000e-01
  %1796 = fmul double %1795, %1793
  store double %1796, double* %1732, align 8, !tbaa !6
  %1797 = call double @copysign(double 5.000000e-01, double %1761) #2
  %1798 = fadd double %1797, 5.000000e-01
  %1799 = fmul double %1761, %1798
  %1800 = getelementptr inbounds double, double* %1272, i64 %1759
  %1801 = load double, double* %1800, align 8, !tbaa !6
  %1802 = fmul double %1801, %1799
  store double %1802, double* %1738, align 8, !tbaa !6
  %1803 = call double @copysign(double 5.000000e-01, double %1779) #2
  %1804 = fadd double %1803, 5.000000e-01
  %1805 = fmul double %1779, %1804
  %1806 = fsub double 1.000000e+00, %1801
  %1807 = fmul double %1806, %1805
  store double %1807, double* %1741, align 8, !tbaa !6
  br label %"571"

"571":                                            ; preds = %"566", %"565"
  %1808 = trunc i64 %indvars.iv348 to i32
  %1809 = icmp eq i32 %591, %1808
  %indvars.iv.next349 = add nsw i64 %indvars.iv348, 1
  br i1 %1809, label %"572.loopexit", label %"565"

"572.loopexit":                                   ; preds = %"571"
  br label %"572"

"572":                                            ; preds = %"572.loopexit", %"564"
  %indvars.iv.next351 = add nsw i64 %indvars.iv350, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %lftr.wideiv23 = trunc i64 %indvar.next to i32
  %exitcond24 = icmp eq i32 %lftr.wideiv23, %1715
  br i1 %exitcond24, label %"573", label %"564"

"573":                                            ; preds = %"572"
  %1810 = load i32, i32* @__data_runcontrol_MOD_itype_evsl, align 4, !tbaa !0
  %1811 = icmp eq i32 %1810, 1
  br i1 %1811, label %"575.preheader", label %"585"

"575.preheader":                                  ; preds = %"573"
  %1812 = bitcast i8* %17 to double*
  %1813 = bitcast i8* %13 to i32*
  %1814 = bitcast i8* %28 to double*
  %1815 = load double*, double** bitcast (%"struct.array2_real(kind=8).59"* @__data_fields_MOD_eai to double**), align 8, !tbaa !8
  %1816 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).59", %"struct.array2_real(kind=8).59"* @__data_fields_MOD_eai, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1817 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).59", %"struct.array2_real(kind=8).59"* @__data_fields_MOD_eai, i64 0, i32 1), align 8, !tbaa !10
  %1818 = load double*, double** bitcast (%"struct.array2_real(kind=8).60"* @__data_fields_MOD_sai to double**), align 8, !tbaa !8
  %1819 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).60", %"struct.array2_real(kind=8).60"* @__data_fields_MOD_sai, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1820 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).60", %"struct.array2_real(kind=8).60"* @__data_fields_MOD_sai, i64 0, i32 1), align 8, !tbaa !10
  br label %"575"

"575":                                            ; preds = %"584", %"575.preheader"
  %indvars.iv346 = phi i64 [ %1030, %"575.preheader" ], [ %indvars.iv.next347, %"584" ]
  br i1 %988, label %"584", label %"576.preheader"

"576.preheader":                                  ; preds = %"575"
  %1821 = mul nsw i64 %indvars.iv346, %1706
  %1822 = mul nsw i64 %indvars.iv346, %5
  %1823 = add i64 %1822, %not
  %1824 = mul nsw i64 %indvars.iv346, %1691
  %1825 = mul nsw i64 %indvars.iv346, %1709
  %1826 = mul nsw i64 %indvars.iv346, %1712
  %1827 = mul nsw i64 %indvars.iv346, %1816
  %1828 = mul nsw i64 %indvars.iv346, %1819
  br label %"576"

"576":                                            ; preds = %"583", %"576.preheader"
  %indvars.iv344 = phi i64 [ %1029, %"576.preheader" ], [ %indvars.iv.next345, %"583" ]
  %1829 = add i64 %1821, %1707
  %1830 = add i64 %1829, %indvars.iv344
  %1831 = getelementptr inbounds i32, i32* %1705, i64 %1830
  %1832 = load i32, i32* %1831, align 4, !tbaa !3, !range !5
  %1833 = icmp eq i32 %1832, 0
  br i1 %1833, label %"583", label %"577"

"577":                                            ; preds = %"576"
  %1834 = add i64 %1823, %indvars.iv344
  %1835 = getelementptr inbounds double, double* %1305, i64 %1834
  %1836 = load double, double* %1835, align 8, !tbaa !6
  %1837 = fcmp olt double %1836, 0.000000e+00
  br i1 %1837, label %"578", label %"583"

"578":                                            ; preds = %"577"
  %1838 = getelementptr inbounds double, double* %1133, i64 %1834
  %1839 = load double, double* %1838, align 8, !tbaa !6
  %1840 = getelementptr inbounds double, double* %1812, i64 %1834
  %1841 = load double, double* %1840, align 8, !tbaa !6
  %1842 = fsub double %1839, %1841
  %1843 = getelementptr inbounds double, double* %1515, i64 %1834
  %1844 = load double, double* %1843, align 8, !tbaa !6
  %1845 = fsub double %1844, %1841
  %1846 = fdiv double %1842, %1845
  %1847 = fcmp olt double %1846, 1.000000e+00
  %.223 = select i1 %1847, double %1846, double 1.000000e+00
  %1848 = fcmp ogt double %.223, 0.000000e+00
  %1849 = select i1 %1848, double %.223, double 0.000000e+00
  %1850 = fmul double %1849, %1849
  %1851 = getelementptr inbounds i32, i32* %1813, i64 %1834
  %1852 = load i32, i32* %1851, align 4, !tbaa !0
  %1853 = sitofp i32 %1852 to double
  %1854 = fsub double 1.500000e+00, %1853
  %1855 = call double @copysign(double 5.000000e-01, double %1854) #2
  %1856 = fadd double %1855, 5.000000e-01
  %1857 = getelementptr inbounds double, double* %1814, i64 %1834
  %1858 = load double, double* %1857, align 8, !tbaa !6
  %1859 = fadd double %1858, %1856
  %1860 = fsub double 1.000000e+00, %1850
  %1861 = fmul double %1856, %1860
  %1862 = fadd double %1850, %1861
  %1863 = add i64 %1824, %1692
  %1864 = add i64 %1863, %indvars.iv344
  %1865 = fmul double %1859, %1862
  %1866 = fmul double %1836, %1865
  %1867 = add i64 %1825, %1710
  %1868 = add i64 %1867, %indvars.iv344
  %1869 = getelementptr inbounds double, double* %1708, i64 %1868
  %1870 = load double, double* %1869, align 8, !tbaa !6
  %1871 = fsub double 1.000000e+00, %1870
  %1872 = fmul double %1871, %1866
  %1873 = add i64 %1826, %1713
  %1874 = add i64 %1873, %indvars.iv344
  %1875 = getelementptr inbounds double, double* %1711, i64 %1874
  %1876 = load double, double* %1875, align 8, !tbaa !6
  %1877 = fsub double 1.000000e+00, %1876
  %1878 = fmul double %1877, %1872
  %1879 = add i64 %1827, %1817
  %1880 = add i64 %1879, %indvars.iv344
  %1881 = getelementptr inbounds double, double* %1815, i64 %1880
  %1882 = load double, double* %1881, align 8, !tbaa !6
  %1883 = fmul double %1882, %1878
  %1884 = add i64 %1828, %1820
  %1885 = add i64 %1884, %indvars.iv344
  %1886 = getelementptr inbounds double, double* %1818, i64 %1885
  %1887 = load double, double* %1886, align 8, !tbaa !6
  %1888 = fdiv double %1883, %1887
  %1889 = getelementptr inbounds double, double* %1690, i64 %1864
  store double %1888, double* %1889, align 8, !tbaa !6
  br label %"583"

"583":                                            ; preds = %"578", %"577", %"576"
  %1890 = trunc i64 %indvars.iv344 to i32
  %1891 = icmp eq i32 %591, %1890
  %indvars.iv.next345 = add nsw i64 %indvars.iv344, 1
  br i1 %1891, label %"584.loopexit", label %"576"

"584.loopexit":                                   ; preds = %"583"
  br label %"584"

"584":                                            ; preds = %"584.loopexit", %"575"
  %1892 = trunc i64 %indvars.iv346 to i32
  %1893 = icmp eq i32 %593, %1892
  %indvars.iv.next347 = add nsw i64 %indvars.iv346, 1
  br i1 %1893, label %"585thread-pre-split.loopexit", label %"575"

"585thread-pre-split.loopexit":                   ; preds = %"584"
  br label %"585thread-pre-split"

"585thread-pre-split":                            ; preds = %"585thread-pre-split.loopexit", %"496", %"456"
  %.pr = load i32, i32* @__data_runcontrol_MOD_itype_evsl, align 4, !tbaa !0
  br label %"585"

"585":                                            ; preds = %"585thread-pre-split", %"573"
  %1894 = phi i32 [ %.pr, %"585thread-pre-split" ], [ %1810, %"573" ]
  %1895 = icmp eq i32 %1894, 2
  br i1 %1895, label %"586", label %"619"

"586":                                            ; preds = %"585"
  br i1 %648, label %"587.preheader", label %"592"

"587.preheader":                                  ; preds = %"586"
  %1896 = icmp sgt i32 %590, %591
  %1897 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %1898 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1899 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %1900 = bitcast i8* %36 to double*
  %1901 = sext i32 %590 to i64
  %1902 = sext i32 %592 to i64
  br label %"587"

"587":                                            ; preds = %"591", %"587.preheader"
  %indvars.iv342 = phi i64 [ %1902, %"587.preheader" ], [ %indvars.iv.next343, %"591" ]
  br i1 %1896, label %"591", label %"588.preheader"

"588.preheader":                                  ; preds = %"587"
  %1903 = mul nsw i64 %indvars.iv342, %1898
  %1904 = mul nsw i64 %indvars.iv342, %5
  %1905 = add i64 %1904, %not
  br label %"588"

"588":                                            ; preds = %"590", %"588.preheader"
  %indvars.iv340 = phi i64 [ %1901, %"588.preheader" ], [ %indvars.iv.next341, %"590" ]
  %1906 = add i64 %1903, %1899
  %1907 = add i64 %1906, %indvars.iv340
  %1908 = getelementptr inbounds i32, i32* %1897, i64 %1907
  %1909 = load i32, i32* %1908, align 4, !tbaa !3, !range !5
  %1910 = icmp eq i32 %1909, 0
  br i1 %1910, label %"590", label %"589"

"589":                                            ; preds = %"588"
  %1911 = add i64 %1905, %indvars.iv340
  %1912 = getelementptr inbounds double, double* %1900, i64 %1911
  store double 0.000000e+00, double* %1912, align 8, !tbaa !6
  br label %"590"

"590":                                            ; preds = %"589", %"588"
  %1913 = trunc i64 %indvars.iv340 to i32
  %1914 = icmp eq i32 %591, %1913
  %indvars.iv.next341 = add nsw i64 %indvars.iv340, 1
  br i1 %1914, label %"591.loopexit", label %"588"

"591.loopexit":                                   ; preds = %"590"
  br label %"591"

"591":                                            ; preds = %"591.loopexit", %"587"
  %1915 = trunc i64 %indvars.iv342 to i32
  %1916 = icmp eq i32 %593, %1915
  %indvars.iv.next343 = add nsw i64 %indvars.iv342, 1
  br i1 %1916, label %"592.loopexit", label %"587"

"592.loopexit":                                   ; preds = %"591"
  br label %"592"

"592":                                            ; preds = %"592.loopexit", %"586"
  %1917 = load i32, i32* @__data_runcontrol_MOD_nlgw, align 4, !tbaa !0
  %1918 = icmp sgt i32 %1917, 0
  br i1 %1918, label %"593.preheader", label %"600"

"593.preheader":                                  ; preds = %"592"
  %1919 = icmp sgt i32 %590, %591
  %1920 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %1921 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1922 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %1923 = bitcast i8* %36 to double*
  %1924 = bitcast i8* %46 to double*
  %1925 = sext i32 %590 to i64
  %1926 = sext i32 %592 to i64
  %1927 = add i32 %1917, 1
  br label %"593"

"593":                                            ; preds = %"599", %"593.preheader"
  %indvars.iv336 = phi i64 [ 1, %"593.preheader" ], [ %indvars.iv.next337, %"599" ]
  br i1 %648, label %"594.preheader", label %"599"

"594.preheader":                                  ; preds = %"593"
  %1928 = mul nsw i64 %indvars.iv336, %29
  %1929 = add i64 %1928, %34
  %1930 = add nsw i64 %indvars.iv336, -1
  %1931 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 %1930
  br label %"594"

"594":                                            ; preds = %"598", %"594.preheader"
  %indvars.iv334 = phi i64 [ %1926, %"594.preheader" ], [ %indvars.iv.next335, %"598" ]
  br i1 %1919, label %"598", label %"595.preheader"

"595.preheader":                                  ; preds = %"594"
  %1932 = mul nsw i64 %indvars.iv334, %1921
  %1933 = mul nsw i64 %indvars.iv334, %5
  %1934 = add i64 %1933, %not
  %1935 = add i64 %1929, %1933
  br label %"595"

"595":                                            ; preds = %"597", %"595.preheader"
  %indvars.iv332 = phi i64 [ %1925, %"595.preheader" ], [ %indvars.iv.next333, %"597" ]
  %1936 = add i64 %1932, %1922
  %1937 = add i64 %1936, %indvars.iv332
  %1938 = getelementptr inbounds i32, i32* %1920, i64 %1937
  %1939 = load i32, i32* %1938, align 4, !tbaa !3, !range !5
  %1940 = icmp eq i32 %1939, 0
  br i1 %1940, label %"597", label %"596"

"596":                                            ; preds = %"595"
  %1941 = add i64 %1934, %indvars.iv332
  %1942 = getelementptr inbounds double, double* %1923, i64 %1941
  %1943 = load double, double* %1942, align 8, !tbaa !6
  %1944 = add i64 %1935, %indvars.iv332
  %1945 = getelementptr inbounds double, double* %1924, i64 %1944
  %1946 = load double, double* %1945, align 8, !tbaa !6
  %1947 = load double, double* %1931, align 8, !tbaa !6
  %1948 = fmul double %1946, %1947
  %1949 = fadd double %1943, %1948
  store double %1949, double* %1942, align 8, !tbaa !6
  br label %"597"

"597":                                            ; preds = %"596", %"595"
  %1950 = trunc i64 %indvars.iv332 to i32
  %1951 = icmp eq i32 %591, %1950
  %indvars.iv.next333 = add nsw i64 %indvars.iv332, 1
  br i1 %1951, label %"598.loopexit", label %"595"

"598.loopexit":                                   ; preds = %"597"
  br label %"598"

"598":                                            ; preds = %"598.loopexit", %"594"
  %1952 = trunc i64 %indvars.iv334 to i32
  %1953 = icmp eq i32 %593, %1952
  %indvars.iv.next335 = add nsw i64 %indvars.iv334, 1
  br i1 %1953, label %"599.loopexit", label %"594"

"599.loopexit":                                   ; preds = %"598"
  br label %"599"

"599":                                            ; preds = %"599.loopexit", %"593"
  %indvars.iv.next337 = add nuw nsw i64 %indvars.iv336, 1
  %lftr.wideiv21 = trunc i64 %indvars.iv.next337 to i32
  %exitcond22 = icmp eq i32 %lftr.wideiv21, %1927
  br i1 %exitcond22, label %"600.loopexit", label %"593"

"600.loopexit":                                   ; preds = %"599"
  br label %"600"

"600":                                            ; preds = %"600.loopexit", %"592"
  br i1 %648, label %"601.preheader", label %"619"

"601.preheader":                                  ; preds = %"600"
  %1954 = icmp sgt i32 %590, %591
  %1955 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %1956 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1957 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %1958 = bitcast i8* %36 to double*
  %1959 = bitcast i8* %26 to double*
  %1960 = add nsw i32 %1917, 1
  %1961 = sext i32 %1960 to i64
  %1962 = add nsw i64 %1961, -1
  %1963 = getelementptr inbounds [4 x double], [4 x double]* %zdzwsu257, i64 0, i64 %1962
  %1964 = sext i32 %590 to i64
  %1965 = sext i32 %592 to i64
  br label %"601"

"601":                                            ; preds = %"605", %"601.preheader"
  %indvars.iv330 = phi i64 [ %1965, %"601.preheader" ], [ %indvars.iv.next331, %"605" ]
  br i1 %1954, label %"605", label %"602.preheader"

"602.preheader":                                  ; preds = %"601"
  %1966 = mul nsw i64 %indvars.iv330, %1956
  %1967 = mul nsw i64 %indvars.iv330, %5
  %1968 = add i64 %1967, %not
  br label %"602"

"602":                                            ; preds = %"604", %"602.preheader"
  %indvars.iv328 = phi i64 [ %1964, %"602.preheader" ], [ %indvars.iv.next329, %"604" ]
  %1969 = add i64 %1966, %1957
  %1970 = add i64 %1969, %indvars.iv328
  %1971 = getelementptr inbounds i32, i32* %1955, i64 %1970
  %1972 = load i32, i32* %1971, align 4, !tbaa !3, !range !5
  %1973 = icmp eq i32 %1972, 0
  br i1 %1973, label %"604", label %"603"

"603":                                            ; preds = %"602"
  %1974 = add i64 %1968, %indvars.iv328
  %1975 = getelementptr inbounds double, double* %1958, i64 %1974
  %1976 = load double, double* %1975, align 8, !tbaa !6
  %1977 = getelementptr inbounds double, double* %1959, i64 %1974
  %1978 = load double, double* %1977, align 8, !tbaa !6
  %1979 = load double, double* %1963, align 8, !tbaa !6
  %1980 = fmul double %1978, %1979
  %1981 = fdiv double %1976, %1980
  store double %1981, double* %1975, align 8, !tbaa !6
  br label %"604"

"604":                                            ; preds = %"603", %"602"
  %1982 = trunc i64 %indvars.iv328 to i32
  %1983 = icmp eq i32 %591, %1982
  %indvars.iv.next329 = add nsw i64 %indvars.iv328, 1
  br i1 %1983, label %"605.loopexit", label %"602"

"605.loopexit":                                   ; preds = %"604"
  br label %"605"

"605":                                            ; preds = %"605.loopexit", %"601"
  %1984 = trunc i64 %indvars.iv330 to i32
  %1985 = icmp eq i32 %593, %1984
  %indvars.iv.next331 = add nsw i64 %indvars.iv330, 1
  br i1 %1985, label %"607.preheader", label %"601"

"607.preheader":                                  ; preds = %"605"
  %1986 = bitcast i8* %22 to double*
  %1987 = bitcast i8* %13 to i32*
  %1988 = bitcast i8* %28 to double*
  %1989 = bitcast i8* %18 to double*
  %1990 = bitcast i8* %25 to double*
  %1991 = bitcast i8* %46 to double*
  %1992 = load double, double* %617, align 8, !tbaa !6
  %1993 = bitcast i8* %39 to double*
  %1994 = load double*, double** bitcast (%"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil to double**), align 32, !tbaa !8
  %1995 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1996 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 1), align 8, !tbaa !10
  %1997 = load double*, double** bitcast (%"struct.array2_real(kind=8).58"* @__data_fields_MOD_fr_wi to double**), align 8, !tbaa !8
  %1998 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).58", %"struct.array2_real(kind=8).58"* @__data_fields_MOD_fr_wi, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %1999 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).58", %"struct.array2_real(kind=8).58"* @__data_fields_MOD_fr_wi, i64 0, i32 1), align 8, !tbaa !10
  %2000 = load double*, double** bitcast (%"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow to double**), align 8, !tbaa !8
  %2001 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).28", %"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2002 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).28", %"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow, i64 0, i32 1), align 8, !tbaa !10
  %2003 = load double*, double** bitcast (%"struct.array2_real(kind=8).59"* @__data_fields_MOD_eai to double**), align 8, !tbaa !8
  %2004 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).59", %"struct.array2_real(kind=8).59"* @__data_fields_MOD_eai, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2005 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).59", %"struct.array2_real(kind=8).59"* @__data_fields_MOD_eai, i64 0, i32 1), align 8, !tbaa !10
  %2006 = load double*, double** bitcast (%"struct.array2_real(kind=8).60"* @__data_fields_MOD_sai to double**), align 8, !tbaa !8
  %2007 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).60", %"struct.array2_real(kind=8).60"* @__data_fields_MOD_sai, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2008 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).60", %"struct.array2_real(kind=8).60"* @__data_fields_MOD_sai, i64 0, i32 1), align 8, !tbaa !10
  br label %"607"

"607":                                            ; preds = %"618", %"607.preheader"
  %indvars.iv326 = phi i64 [ %1965, %"607.preheader" ], [ %indvars.iv.next327, %"618" ]
  br i1 %1954, label %"618", label %"608.preheader"

"608.preheader":                                  ; preds = %"607"
  %2009 = mul nsw i64 %indvars.iv326, %1956
  %2010 = mul nsw i64 %indvars.iv326, %5
  %2011 = add i64 %2010, %not
  %2012 = mul nsw i64 %indvars.iv326, %1995
  %2013 = mul nsw i64 %indvars.iv326, %1998
  %2014 = mul nsw i64 %indvars.iv326, %2001
  %2015 = mul nsw i64 %indvars.iv326, %2004
  %2016 = mul nsw i64 %indvars.iv326, %2007
  br label %"608"

"608":                                            ; preds = %"617", %"608.preheader"
  %indvars.iv324 = phi i64 [ %1964, %"608.preheader" ], [ %indvars.iv.next325, %"617" ]
  %2017 = add i64 %2009, %1957
  %2018 = add i64 %2017, %indvars.iv324
  %2019 = getelementptr inbounds i32, i32* %1955, i64 %2018
  %2020 = load i32, i32* %2019, align 4, !tbaa !3, !range !5
  %2021 = icmp eq i32 %2020, 0
  br i1 %2021, label %"617", label %"609"

"609":                                            ; preds = %"608"
  %2022 = add i64 %2011, %indvars.iv324
  %2023 = getelementptr inbounds double, double* %1986, i64 %2022
  %2024 = load double, double* %2023, align 8, !tbaa !6
  %2025 = fcmp olt double %2024, 0.000000e+00
  br i1 %2025, label %"610", label %"617"

"610":                                            ; preds = %"609"
  %2026 = getelementptr inbounds i32, i32* %1987, i64 %2022
  %2027 = load i32, i32* %2026, align 4, !tbaa !0
  %2028 = sitofp i32 %2027 to double
  %2029 = fsub double 1.500000e+00, %2028
  %2030 = call double @copysign(double 5.000000e-01, double %2029) #2
  %2031 = fadd double %2030, 5.000000e-01
  %2032 = getelementptr inbounds double, double* %1988, i64 %2022
  %2033 = load double, double* %2032, align 8, !tbaa !6
  %2034 = fadd double %2033, %2031
  %2035 = icmp sgt i32 %2027, 2
  br i1 %2035, label %"611", label %"616"

"611":                                            ; preds = %"610"
  %2036 = getelementptr inbounds double, double* %1989, i64 %2022
  %2037 = load double, double* %2036, align 8, !tbaa !6
  %2038 = fmul double %2037, 8.000000e-01
  %2039 = fadd double %2037, -4.000000e+00
  %2040 = fmul double %2039, 1.000000e-01
  %2041 = sext i32 %2027 to i64
  %2042 = add nsw i64 %2041, -1
  %2043 = getelementptr inbounds [10 x double], [10 x double]* @__data_soil_MOD_clgk0, i64 0, i64 %2042
  %2044 = load double, double* %2043, align 8, !tbaa !6
  %2045 = fmul double %2044, %2040
  %2046 = fadd double %2045, 1.000000e+00
  %2047 = fmul double %2038, %2046
  %2048 = fsub double 5.500000e+00, %2047
  %2049 = fadd double %2037, -3.700000e+00
  %2050 = fdiv double 5.000000e+00, %2037
  %2051 = fadd double %2049, %2050
  %2052 = fadd double %2037, 5.000000e+00
  %2053 = fdiv double %2051, %2052
  %2054 = load double, double* @__data_soil_MOD_cfinull, align 8, !tbaa !6
  %2055 = fmul double %2037, %2054
  %2056 = getelementptr inbounds double, double* %1990, i64 %2022
  %2057 = load double, double* %2056, align 8, !tbaa !6
  %2058 = fmul double %2055, %2057
  %2059 = load double, double* @__data_soil_MOD_crhowm, align 8, !tbaa !6
  %2060 = fdiv double %2058, %2059
  %2061 = getelementptr inbounds double, double* %1991, i64 %2022
  %2062 = load double, double* %2061, align 8, !tbaa !6
  %2063 = getelementptr inbounds double, double* %1959, i64 %2022
  %2064 = load double, double* %2063, align 8, !tbaa !6
  %2065 = fdiv double %2062, %2064
  %2066 = getelementptr inbounds double, double* %1958, i64 %2022
  %2067 = load double, double* %2066, align 8, !tbaa !6
  %2068 = fdiv double %2067, %2065
  %2069 = fmul double %2060, 1.020000e+00
  %2070 = fadd double %2037, 2.000000e+00
  %2071 = call double @pow(double %2065, double %2070) #2
  %2072 = fmul double %2069, %2071
  %2073 = call double @pow(double %2068, double %2048) #2
  %2074 = fmul double %2072, %2073
  %2075 = load double, double* @__data_soil_MOD_cdmin, align 8, !tbaa !6
  %2076 = fmul double %2075, 1.550000e+03
  %2077 = fdiv double %2076, %2060
  %2078 = fadd double %2077, 1.000000e+00
  %2079 = fmul double %2053, %2078
  %2080 = load double, double* @__data_constants_MOD_rho_w, align 8, !tbaa !6
  %2081 = fmul double %2080, %2079
  %2082 = fmul double %2074, %2081
  %2083 = fmul double %2065, %2082
  %2084 = load double, double* %1963, align 8, !tbaa !6
  %2085 = fmul double %1992, %2084
  %2086 = call double @sqrt(double %2085) #2
  %2087 = fdiv double %2083, %2086
  %2088 = getelementptr inbounds double, double* %1993, i64 %2022
  %2089 = load double, double* %2088, align 8, !tbaa !6
  %2090 = fsub double 1.000000e+00, %2089
  %2091 = fmul double %2090, 9.000000e-01
  %2092 = fsub double 1.000000e+00, %2091
  %2093 = fmul double %2092, %2087
  %2094 = fsub double -0.000000e+00, %2093
  %2095 = fcmp olt double %2024, %2094
  %2096 = fcmp uno double %2024, 0.000000e+00
  %2097 = or i1 %2096, %2095
  %.224 = select i1 %2097, double %2094, double %2024
  %2098 = fcmp ogt double %2024, -1.000000e-06
  %2099 = or i1 %2098, %2096
  %2100 = select i1 %2099, double -1.000000e-06, double %2024
  %2101 = fdiv double %.224, %2100
  br label %"616"

"616":                                            ; preds = %"611", %"610"
  %2102 = phi double [ %2101, %"611" ], [ 0.000000e+00, %"610" ]
  %2103 = fsub double 1.000000e+00, %2102
  %2104 = fmul double %2031, %2103
  %2105 = fadd double %2102, %2104
  %2106 = add i64 %2012, %1996
  %2107 = add i64 %2106, %indvars.iv324
  %2108 = fmul double %2034, %2105
  %2109 = fmul double %2024, %2108
  %2110 = add i64 %2013, %1999
  %2111 = add i64 %2110, %indvars.iv324
  %2112 = getelementptr inbounds double, double* %1997, i64 %2111
  %2113 = load double, double* %2112, align 8, !tbaa !6
  %2114 = fsub double 1.000000e+00, %2113
  %2115 = fmul double %2114, %2109
  %2116 = add i64 %2014, %2002
  %2117 = add i64 %2116, %indvars.iv324
  %2118 = getelementptr inbounds double, double* %2000, i64 %2117
  %2119 = load double, double* %2118, align 8, !tbaa !6
  %2120 = fsub double 1.000000e+00, %2119
  %2121 = fmul double %2120, %2115
  %2122 = add i64 %2015, %2005
  %2123 = add i64 %2122, %indvars.iv324
  %2124 = getelementptr inbounds double, double* %2003, i64 %2123
  %2125 = load double, double* %2124, align 8, !tbaa !6
  %2126 = fmul double %2125, %2121
  %2127 = add i64 %2016, %2008
  %2128 = add i64 %2127, %indvars.iv324
  %2129 = getelementptr inbounds double, double* %2006, i64 %2128
  %2130 = load double, double* %2129, align 8, !tbaa !6
  %2131 = fdiv double %2126, %2130
  %2132 = getelementptr inbounds double, double* %1994, i64 %2107
  store double %2131, double* %2132, align 8, !tbaa !6
  br label %"617"

"617":                                            ; preds = %"616", %"609", %"608"
  %2133 = trunc i64 %indvars.iv324 to i32
  %2134 = icmp eq i32 %591, %2133
  %indvars.iv.next325 = add nsw i64 %indvars.iv324, 1
  br i1 %2134, label %"618.loopexit", label %"608"

"618.loopexit":                                   ; preds = %"617"
  br label %"618"

"618":                                            ; preds = %"618.loopexit", %"607"
  %2135 = trunc i64 %indvars.iv326 to i32
  %2136 = icmp eq i32 %593, %2135
  %indvars.iv.next327 = add nsw i64 %indvars.iv326, 1
  br i1 %2136, label %"619.loopexit", label %"607"

"619.loopexit":                                   ; preds = %"618"
  br label %"619"

"619":                                            ; preds = %"619.loopexit", %"600", %"585"
  %2137 = load i32, i32* @__data_runcontrol_MOD_itype_trvg, align 4, !tbaa !0
  switch i32 %2137, label %"706" [
    i32 1, label %"620"
    i32 2, label %"639"
  ]

"620":                                            ; preds = %"619"
  %2138 = load i32, i32* @__data_runcontrol_MOD_nlgw, align 4, !tbaa !0
  %2139 = icmp sgt i32 %2138, 0
  br i1 %2139, label %"621.preheader", label %"706"

"621.preheader":                                  ; preds = %"620"
  %2140 = icmp sgt i32 %590, %591
  %2141 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %2142 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2143 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %2144 = bitcast i8* %22 to double*
  %2145 = bitcast i8* %13 to i32*
  %2146 = bitcast i8* %24 to double*
  %2147 = bitcast i8* %27 to double*
  %2148 = load double*, double** bitcast (%"struct.array3_real(kind=8).18"* @__data_fields_MOD_t_m to double**), align 8, !tbaa !8
  %2149 = load i32, i32* %nx, align 4, !tbaa !0
  %2150 = sext i32 %2149 to i64
  %2151 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).18", %"struct.array3_real(kind=8).18"* @__data_fields_MOD_t_m, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %2152 = mul nsw i64 %2151, %2150
  %2153 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).18", %"struct.array3_real(kind=8).18"* @__data_fields_MOD_t_m, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2154 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).18", %"struct.array3_real(kind=8).18"* @__data_fields_MOD_t_m, i64 0, i32 1), align 8, !tbaa !10
  %2155 = bitcast i8* %39 to double*
  %2156 = bitcast i8* %46 to double*
  %2157 = bitcast i8* %19 to double*
  %2158 = add i32 %2138, 1
  %2159 = sext i32 %2158 to i64
  %2160 = add nsw i64 %2159, -1
  %2161 = getelementptr inbounds [4 x double], [4 x double]* %zdzwsu257, i64 0, i64 %2160
  %2162 = load double*, double** bitcast (%"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang to double**), align 32, !tbaa !8
  %2163 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %2164 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2165 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 1), align 8, !tbaa !10
  %2166 = bitcast i8* %28 to double*
  %2167 = load double*, double** bitcast (%"struct.array2_real(kind=8).58"* @__data_fields_MOD_fr_wi to double**), align 8, !tbaa !8
  %2168 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).58", %"struct.array2_real(kind=8).58"* @__data_fields_MOD_fr_wi, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2169 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).58", %"struct.array2_real(kind=8).58"* @__data_fields_MOD_fr_wi, i64 0, i32 1), align 8, !tbaa !10
  %2170 = load double*, double** bitcast (%"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow to double**), align 8, !tbaa !8
  %2171 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).28", %"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2172 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).28", %"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow, i64 0, i32 1), align 8, !tbaa !10
  %2173 = load double*, double** bitcast (%"struct.array2_real(kind=8).61"* @__data_fields_MOD_tai to double**), align 8, !tbaa !8
  %2174 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).61", %"struct.array2_real(kind=8).61"* @__data_fields_MOD_tai, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2175 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).61", %"struct.array2_real(kind=8).61"* @__data_fields_MOD_tai, i64 0, i32 1), align 8, !tbaa !10
  %2176 = load double*, double** bitcast (%"struct.array2_real(kind=8).60"* @__data_fields_MOD_sai to double**), align 8, !tbaa !8
  %2177 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).60", %"struct.array2_real(kind=8).60"* @__data_fields_MOD_sai, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2178 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).60", %"struct.array2_real(kind=8).60"* @__data_fields_MOD_sai, i64 0, i32 1), align 8, !tbaa !10
  %2179 = sext i32 %590 to i64
  %2180 = sext i32 %592 to i64
  br label %"621"

"621":                                            ; preds = %"637", %"621.preheader"
  %indvars.iv320 = phi i64 [ 1, %"621.preheader" ], [ %indvars.iv.next321, %"637" ]
  br i1 %648, label %"622.preheader", label %"637"

"622.preheader":                                  ; preds = %"621"
  %2181 = mul nsw i64 %indvars.iv320, %29
  %2182 = add i64 %2181, %34
  %2183 = add nsw i64 %indvars.iv320, -1
  %2184 = getelementptr inbounds [4 x double], [4 x double]* %zdzwsu257, i64 0, i64 %2183
  %2185 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 %2183
  %2186 = mul nsw i64 %indvars.iv320, %2163
  br label %"622"

"622":                                            ; preds = %"636", %"622.preheader"
  %indvars.iv318 = phi i64 [ %2180, %"622.preheader" ], [ %indvars.iv.next319, %"636" ]
  br i1 %2140, label %"636", label %"623.preheader"

"623.preheader":                                  ; preds = %"622"
  %2187 = mul nsw i64 %indvars.iv318, %2142
  %2188 = mul nsw i64 %indvars.iv318, %5
  %2189 = add i64 %2188, %not
  %2190 = mul nsw i64 %indvars.iv318, %2153
  %2191 = add i64 %2182, %2188
  %2192 = mul nsw i64 %indvars.iv318, %2164
  %2193 = mul nsw i64 %indvars.iv318, %2168
  %2194 = mul nsw i64 %indvars.iv318, %2171
  %2195 = mul nsw i64 %indvars.iv318, %2174
  %2196 = mul nsw i64 %indvars.iv318, %2177
  br label %"623"

"623":                                            ; preds = %"635", %"623.preheader"
  %indvars.iv316 = phi i64 [ %2179, %"623.preheader" ], [ %indvars.iv.next317, %"635" ]
  %2197 = add i64 %2187, %2143
  %2198 = add i64 %2197, %indvars.iv316
  %2199 = getelementptr inbounds i32, i32* %2141, i64 %2198
  %2200 = load i32, i32* %2199, align 4, !tbaa !3, !range !5
  %2201 = icmp eq i32 %2200, 0
  br i1 %2201, label %"635", label %"624"

"624":                                            ; preds = %"623"
  %2202 = add i64 %2189, %indvars.iv316
  %2203 = getelementptr inbounds double, double* %2144, i64 %2202
  %2204 = load double, double* %2203, align 8, !tbaa !6
  %2205 = fcmp olt double %2204, 0.000000e+00
  br i1 %2205, label %"625", label %"635"

"625":                                            ; preds = %"624"
  %2206 = getelementptr inbounds i32, i32* %2145, i64 %2202
  %2207 = load i32, i32* %2206, align 4, !tbaa !0
  %2208 = icmp sgt i32 %2207, 2
  br i1 %2208, label %"626", label %"635"

"626":                                            ; preds = %"625"
  %2209 = getelementptr inbounds double, double* %2146, i64 %2202
  %2210 = load double, double* %2209, align 8, !tbaa !6
  %2211 = getelementptr inbounds double, double* %2147, i64 %2202
  %2212 = load double, double* %2211, align 8, !tbaa !6
  %2213 = fsub double %2210, %2212
  %2214 = fmul double %2204, 8.640000e+04
  %2215 = fsub double -4.750000e+00, %2214
  %2216 = call double @atan(double %2215) #2
  %2217 = fmul double %2216, 1.210000e-01
  %2218 = fadd double %2217, 8.100000e-01
  %2219 = fmul double %2213, %2218
  %2220 = add i64 %2154, %2152
  %2221 = add i64 %2220, %2190
  %2222 = add i64 %2221, %indvars.iv316
  %2223 = getelementptr inbounds double, double* %2148, i64 %2222
  %2224 = load double, double* %2223, align 8, !tbaa !6
  %2225 = load double, double* @__data_constants_MOD_t0_melt, align 8, !tbaa !6
  %2226 = fsub double %2224, %2225
  %2227 = getelementptr inbounds double, double* %2155, i64 %2202
  %2228 = load double, double* %2227, align 8, !tbaa !6
  %2229 = call double @copysign(double 5.000000e-01, double %2226) #2
  %2230 = fadd double %2229, 5.000000e-01
  %2231 = fmul double %2228, %2230
  %2232 = add i64 %2191, %indvars.iv316
  %2233 = getelementptr inbounds double, double* %2156, i64 %2232
  %2234 = load double, double* %2233, align 8, !tbaa !6
  %2235 = fsub double %2234, %2212
  %2236 = fdiv double %2235, %2219
  %2237 = fcmp olt double %2236, 1.000000e+00
  %.225 = select i1 %2237, double %2236, double 1.000000e+00
  %2238 = fcmp ogt double %.225, 0.000000e+00
  %2239 = select i1 %2238, double %.225, double 0.000000e+00
  %2240 = fmul double %2231, %2239
  %2241 = fmul double %2240, %2240
  %2242 = getelementptr inbounds double, double* %2157, i64 %2202
  %2243 = load double, double* %2242, align 8, !tbaa !6
  %2244 = load double, double* %2184, align 8, !tbaa !6
  %2245 = load double, double* %2185, align 8, !tbaa !6
  %2246 = fmul double %2245, 5.000000e-01
  %2247 = fsub double %2244, %2246
  %2248 = fsub double %2243, %2247
  %2249 = fcmp ogt double %2248, 0.000000e+00
  %.226 = select i1 %2249, double %2248, double 0.000000e+00
  %2250 = fcmp olt double %.226, %2245
  %2251 = fcmp uno double %2245, 0.000000e+00
  %2252 = or i1 %2251, %2250
  %2253 = select i1 %2252, double %.226, double %2245
  %2254 = load double, double* %2161, align 8, !tbaa !6
  %2255 = fdiv double %2253, %2254
  %2256 = add i64 %2186, %2165
  %2257 = add i64 %2256, %2192
  %2258 = add i64 %2257, %indvars.iv316
  %2259 = getelementptr inbounds double, double* %2166, i64 %2202
  %2260 = load double, double* %2259, align 8, !tbaa !6
  %2261 = fmul double %2260, %2255
  %2262 = fmul double %2241, %2261
  %2263 = fmul double %2204, %2262
  %2264 = add i64 %2193, %2169
  %2265 = add i64 %2264, %indvars.iv316
  %2266 = getelementptr inbounds double, double* %2167, i64 %2265
  %2267 = load double, double* %2266, align 8, !tbaa !6
  %2268 = fsub double 1.000000e+00, %2267
  %2269 = fmul double %2268, %2263
  %2270 = add i64 %2194, %2172
  %2271 = add i64 %2270, %indvars.iv316
  %2272 = getelementptr inbounds double, double* %2170, i64 %2271
  %2273 = load double, double* %2272, align 8, !tbaa !6
  %2274 = fsub double 1.000000e+00, %2273
  %2275 = fmul double %2274, %2269
  %2276 = add i64 %2195, %2175
  %2277 = add i64 %2276, %indvars.iv316
  %2278 = getelementptr inbounds double, double* %2173, i64 %2277
  %2279 = load double, double* %2278, align 8, !tbaa !6
  %2280 = fmul double %2279, %2275
  %2281 = add i64 %2196, %2178
  %2282 = add i64 %2281, %indvars.iv316
  %2283 = getelementptr inbounds double, double* %2176, i64 %2282
  %2284 = load double, double* %2283, align 8, !tbaa !6
  %2285 = fdiv double %2280, %2284
  %2286 = getelementptr inbounds double, double* %2162, i64 %2258
  store double %2285, double* %2286, align 8, !tbaa !6
  br label %"635"

"635":                                            ; preds = %"626", %"625", %"624", %"623"
  %2287 = trunc i64 %indvars.iv316 to i32
  %2288 = icmp eq i32 %591, %2287
  %indvars.iv.next317 = add nsw i64 %indvars.iv316, 1
  br i1 %2288, label %"636.loopexit", label %"623"

"636.loopexit":                                   ; preds = %"635"
  br label %"636"

"636":                                            ; preds = %"636.loopexit", %"622"
  %2289 = trunc i64 %indvars.iv318 to i32
  %2290 = icmp eq i32 %593, %2289
  %indvars.iv.next319 = add nsw i64 %indvars.iv318, 1
  br i1 %2290, label %"637.loopexit", label %"622"

"637.loopexit":                                   ; preds = %"636"
  br label %"637"

"637":                                            ; preds = %"637.loopexit", %"621"
  %indvars.iv.next321 = add nuw nsw i64 %indvars.iv320, 1
  %lftr.wideiv19 = trunc i64 %indvars.iv.next321 to i32
  %exitcond20 = icmp eq i32 %lftr.wideiv19, %2158
  br i1 %exitcond20, label %"638", label %"621"

"638":                                            ; preds = %"637"
  %2291 = icmp eq i32 %2137, 2
  br i1 %2291, label %"639", label %"706"

"639":                                            ; preds = %"638", %"619"
  br i1 %648, label %"640.preheader", label %"647"

"640.preheader":                                  ; preds = %"639"
  %2292 = icmp sgt i32 %590, %591
  %2293 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %2294 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2295 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %2296 = bitcast i8* %13 to i32*
  %2297 = bitcast i8* %22 to double*
  %2298 = bitcast i8* %48 to double*
  %2299 = sext i32 %590 to i64
  %2300 = sext i32 %592 to i64
  br label %"640"

"640":                                            ; preds = %"646", %"640.preheader"
  %indvars.iv314 = phi i64 [ %2300, %"640.preheader" ], [ %indvars.iv.next315, %"646" ]
  br i1 %2292, label %"646", label %"641.preheader"

"641.preheader":                                  ; preds = %"640"
  %2301 = mul nsw i64 %indvars.iv314, %2294
  %2302 = mul nsw i64 %indvars.iv314, %5
  %2303 = add i64 %2302, %not
  br label %"641"

"641":                                            ; preds = %"645", %"641.preheader"
  %indvars.iv312 = phi i64 [ %2299, %"641.preheader" ], [ %indvars.iv.next313, %"645" ]
  %2304 = add i64 %2301, %2295
  %2305 = add i64 %2304, %indvars.iv312
  %2306 = getelementptr inbounds i32, i32* %2293, i64 %2305
  %2307 = load i32, i32* %2306, align 4, !tbaa !3, !range !5
  %2308 = icmp eq i32 %2307, 0
  br i1 %2308, label %"645", label %"642"

"642":                                            ; preds = %"641"
  %2309 = add i64 %2303, %indvars.iv312
  %2310 = getelementptr inbounds i32, i32* %2296, i64 %2309
  %2311 = load i32, i32* %2310, align 4, !tbaa !0
  %2312 = icmp sgt i32 %2311, 2
  br i1 %2312, label %"643", label %"645"

"643":                                            ; preds = %"642"
  %2313 = getelementptr inbounds double, double* %2297, i64 %2309
  %2314 = load double, double* %2313, align 8, !tbaa !6
  %2315 = fcmp olt double %2314, 0.000000e+00
  br i1 %2315, label %"644", label %"645"

"644":                                            ; preds = %"643"
  %2316 = getelementptr inbounds double, double* %2298, i64 %2309
  store double 0.000000e+00, double* %2316, align 8, !tbaa !6
  br label %"645"

"645":                                            ; preds = %"644", %"643", %"642", %"641"
  %2317 = trunc i64 %indvars.iv312 to i32
  %2318 = icmp eq i32 %591, %2317
  %indvars.iv.next313 = add nsw i64 %indvars.iv312, 1
  br i1 %2318, label %"646.loopexit", label %"641"

"646.loopexit":                                   ; preds = %"645"
  br label %"646"

"646":                                            ; preds = %"646.loopexit", %"640"
  %2319 = trunc i64 %indvars.iv314 to i32
  %2320 = icmp eq i32 %593, %2319
  %indvars.iv.next315 = add nsw i64 %indvars.iv314, 1
  br i1 %2320, label %"647.loopexit", label %"640"

"647.loopexit":                                   ; preds = %"646"
  br label %"647"

"647":                                            ; preds = %"647.loopexit", %"639"
  %2321 = load i32, i32* @__data_runcontrol_MOD_nlgw, align 4, !tbaa !0
  %2322 = icmp sgt i32 %2321, 0
  br i1 %2322, label %"648.preheader", label %"657"

"648.preheader":                                  ; preds = %"647"
  %2323 = icmp sgt i32 %590, %591
  %2324 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %2325 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2326 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %2327 = bitcast i8* %13 to i32*
  %2328 = bitcast i8* %22 to double*
  %2329 = bitcast i8* %19 to double*
  %2330 = bitcast i8* %48 to double*
  %2331 = bitcast i8* %46 to double*
  %2332 = add i32 %2321, 1
  %2333 = sext i32 %2332 to i64
  %2334 = add nsw i64 %2333, -1
  %2335 = getelementptr inbounds [4 x double], [4 x double]* %zdzwsu257, i64 0, i64 %2334
  %2336 = bitcast i8* %33 to double*
  %2337 = sext i32 %590 to i64
  %2338 = sext i32 %592 to i64
  br label %"648"

"648":                                            ; preds = %"656", %"648.preheader"
  %indvars.iv308 = phi i64 [ 1, %"648.preheader" ], [ %indvars.iv.next309, %"656" ]
  %2339 = add nsw i64 %indvars.iv308, -1
  %2340 = getelementptr inbounds [4 x double], [4 x double]* %zdzwsu257, i64 0, i64 %2339
  %2341 = load double, double* %2340, align 8, !tbaa !6
  %2342 = getelementptr inbounds [4 x double], [4 x double]* %zdzwg, i64 0, i64 %2339
  %2343 = load double, double* %2342, align 8, !tbaa !6
  %2344 = fmul double %2343, 5.000000e-01
  %2345 = fadd double %2341, %2344
  %2346 = fsub double %2341, %2344
  br i1 %648, label %"649.preheader", label %"656"

"649.preheader":                                  ; preds = %"648"
  %2347 = mul nsw i64 %indvars.iv308, %29
  %2348 = add i64 %2347, %34
  br label %"649"

"649":                                            ; preds = %"655", %"649.preheader"
  %indvars.iv306 = phi i64 [ %2338, %"649.preheader" ], [ %indvars.iv.next307, %"655" ]
  br i1 %2323, label %"655", label %"650.preheader"

"650.preheader":                                  ; preds = %"649"
  %2349 = mul nsw i64 %indvars.iv306, %2325
  %2350 = mul nsw i64 %indvars.iv306, %5
  %2351 = add i64 %2350, %not
  %2352 = add i64 %2348, %2350
  br label %"650"

"650":                                            ; preds = %"654", %"650.preheader"
  %indvars.iv304 = phi i64 [ %2337, %"650.preheader" ], [ %indvars.iv.next305, %"654" ]
  %2353 = add i64 %2349, %2326
  %2354 = add i64 %2353, %indvars.iv304
  %2355 = getelementptr inbounds i32, i32* %2324, i64 %2354
  %2356 = load i32, i32* %2355, align 4, !tbaa !3, !range !5
  %2357 = icmp eq i32 %2356, 0
  br i1 %2357, label %"654", label %"651"

"651":                                            ; preds = %"650"
  %2358 = add i64 %2351, %indvars.iv304
  %2359 = getelementptr inbounds i32, i32* %2327, i64 %2358
  %2360 = load i32, i32* %2359, align 4, !tbaa !0
  %2361 = icmp sgt i32 %2360, 2
  br i1 %2361, label %"652", label %"654"

"652":                                            ; preds = %"651"
  %2362 = getelementptr inbounds double, double* %2328, i64 %2358
  %2363 = load double, double* %2362, align 8, !tbaa !6
  %2364 = fcmp olt double %2363, 0.000000e+00
  br i1 %2364, label %"653", label %"654"

"653":                                            ; preds = %"652"
  %2365 = getelementptr inbounds double, double* %2329, i64 %2358
  %2366 = load double, double* %2365, align 8, !tbaa !6
  %2367 = fsub double %2366, %2345
  %2368 = call double @copysign(double 5.000000e-01, double %2367) #2
  %2369 = fadd double %2368, 5.000000e-01
  %2370 = fsub double %2366, %2346
  %2371 = fsub double 1.000000e+00, %2369
  %2372 = call double @copysign(double 5.000000e-01, double %2370) #2
  %2373 = fadd double %2372, 5.000000e-01
  %2374 = fmul double %2371, %2373
  %2375 = fmul double %2343, %2369
  %2376 = fmul double %2370, %2374
  %2377 = fadd double %2375, %2376
  %2378 = getelementptr inbounds double, double* %2330, i64 %2358
  %2379 = load double, double* %2378, align 8, !tbaa !6
  %2380 = add i64 %2352, %indvars.iv304
  %2381 = getelementptr inbounds double, double* %2331, i64 %2380
  %2382 = load double, double* %2381, align 8, !tbaa !6
  %2383 = fmul double %2382, %2377
  %2384 = fdiv double %2383, %2366
  %2385 = fadd double %2379, %2384
  store double %2385, double* %2378, align 8, !tbaa !6
  %2386 = load double, double* %2335, align 8, !tbaa !6
  %2387 = fdiv double %2383, %2386
  %2388 = getelementptr inbounds double, double* %2336, i64 %2380
  store double %2387, double* %2388, align 8, !tbaa !6
  br label %"654"

"654":                                            ; preds = %"653", %"652", %"651", %"650"
  %2389 = trunc i64 %indvars.iv304 to i32
  %2390 = icmp eq i32 %591, %2389
  %indvars.iv.next305 = add nsw i64 %indvars.iv304, 1
  br i1 %2390, label %"655.loopexit", label %"650"

"655.loopexit":                                   ; preds = %"654"
  br label %"655"

"655":                                            ; preds = %"655.loopexit", %"649"
  %2391 = trunc i64 %indvars.iv306 to i32
  %2392 = icmp eq i32 %593, %2391
  %indvars.iv.next307 = add nsw i64 %indvars.iv306, 1
  br i1 %2392, label %"656.loopexit", label %"649"

"656.loopexit":                                   ; preds = %"655"
  br label %"656"

"656":                                            ; preds = %"656.loopexit", %"648"
  %indvars.iv.next309 = add nuw nsw i64 %indvars.iv308, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next309 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %2332
  br i1 %exitcond, label %"657.loopexit", label %"648"

"657.loopexit":                                   ; preds = %"656"
  br label %"657"

"657":                                            ; preds = %"657.loopexit", %"647"
  br i1 %648, label %"658.preheader", label %"694"

"658.preheader":                                  ; preds = %"657"
  %2393 = icmp sgt i32 %590, %591
  %2394 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %2395 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2396 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %2397 = bitcast i8* %13 to i32*
  %2398 = bitcast i8* %22 to double*
  %2399 = load double*, double** bitcast (%"struct.array4_real(kind=8).49"* @__data_fields_MOD_u to double**), align 8, !tbaa !8
  %2400 = load i32, i32* @__data_modelconfig_MOD_ke, align 4, !tbaa !0
  %2401 = sext i32 %2400 to i64
  %2402 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).49", %"struct.array4_real(kind=8).49"* @__data_fields_MOD_u, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %2403 = mul nsw i64 %2402, %2401
  %2404 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).49", %"struct.array4_real(kind=8).49"* @__data_fields_MOD_u, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2405 = load i32, i32* %nx, align 4, !tbaa !0
  %2406 = sext i32 %2405 to i64
  %2407 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).49", %"struct.array4_real(kind=8).49"* @__data_fields_MOD_u, i64 0, i32 3, i64 3, i32 0), align 8, !tbaa !10
  %2408 = mul nsw i64 %2407, %2406
  %2409 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).49", %"struct.array4_real(kind=8).49"* @__data_fields_MOD_u, i64 0, i32 1), align 8, !tbaa !10
  %2410 = load double*, double** bitcast (%"struct.array4_real(kind=8).50"* @__data_fields_MOD_v to double**), align 8, !tbaa !8
  %2411 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).50", %"struct.array4_real(kind=8).50"* @__data_fields_MOD_v, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %2412 = mul nsw i64 %2411, %2401
  %2413 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).50", %"struct.array4_real(kind=8).50"* @__data_fields_MOD_v, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2414 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).50", %"struct.array4_real(kind=8).50"* @__data_fields_MOD_v, i64 0, i32 3, i64 3, i32 0), align 8, !tbaa !10
  %2415 = mul nsw i64 %2414, %2406
  %2416 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).50", %"struct.array4_real(kind=8).50"* @__data_fields_MOD_v, i64 0, i32 1), align 8, !tbaa !10
  %2417 = load double*, double** bitcast (%"struct.array2_real(kind=8).52"* @__data_fields_MOD_tch to double**), align 8, !tbaa !8
  %2418 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).52", %"struct.array2_real(kind=8).52"* @__data_fields_MOD_tch, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2419 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).52", %"struct.array2_real(kind=8).52"* @__data_fields_MOD_tch, i64 0, i32 1), align 8, !tbaa !10
  %2420 = bitcast i8* %20 to double*
  %2421 = load double*, double** bitcast (%"struct.array2_real(kind=8).62"* @__data_fields_MOD_ustar_fv to double**), align 8, !tbaa !8
  %2422 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).62", %"struct.array2_real(kind=8).62"* @__data_fields_MOD_ustar_fv, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2423 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).62", %"struct.array2_real(kind=8).62"* @__data_fields_MOD_ustar_fv, i64 0, i32 1), align 8, !tbaa !10
  %2424 = load double*, double** bitcast (%"struct.array2_real(kind=8).63"* @__data_fields_MOD_tcm to double**), align 8, !tbaa !8
  %2425 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).63", %"struct.array2_real(kind=8).63"* @__data_fields_MOD_tcm, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2426 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).63", %"struct.array2_real(kind=8).63"* @__data_fields_MOD_tcm, i64 0, i32 1), align 8, !tbaa !10
  %2427 = load i32, i32* @__data_runcontrol_MOD_itype_tran, align 4, !tbaa !0
  %2428 = icmp eq i32 %2427, 1
  %2429 = load double*, double** bitcast (%"struct.array2_real(kind=8).64"* @__data_fields_MOD_pabs to double**), align 8, !tbaa !8
  %2430 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).64", %"struct.array2_real(kind=8).64"* @__data_fields_MOD_pabs, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2431 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).64", %"struct.array2_real(kind=8).64"* @__data_fields_MOD_pabs, i64 0, i32 1), align 8, !tbaa !10
  %2432 = bitcast i8* %24 to double*
  %2433 = bitcast i8* %27 to double*
  %2434 = bitcast i8* %48 to double*
  %2435 = load double*, double** bitcast (%"struct.array4_real(kind=8).56"* @__data_fields_MOD_t to double**), align 8, !tbaa !8
  %2436 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).56", %"struct.array4_real(kind=8).56"* @__data_fields_MOD_t, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %2437 = mul nsw i64 %2436, %2401
  %2438 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).56", %"struct.array4_real(kind=8).56"* @__data_fields_MOD_t, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2439 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).56", %"struct.array4_real(kind=8).56"* @__data_fields_MOD_t, i64 0, i32 3, i64 3, i32 0), align 8, !tbaa !10
  %2440 = mul nsw i64 %2439, %2406
  %2441 = load i64, i64* getelementptr inbounds (%"struct.array4_real(kind=8).56", %"struct.array4_real(kind=8).56"* @__data_fields_MOD_t, i64 0, i32 1), align 8, !tbaa !10
  %2442 = load double*, double** bitcast (%"struct.array2_real(kind=8).65"* @__data_fields_MOD_rstom to double**), align 8, !tbaa !8
  %2443 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).65", %"struct.array2_real(kind=8).65"* @__data_fields_MOD_rstom, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2444 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).65", %"struct.array2_real(kind=8).65"* @__data_fields_MOD_rstom, i64 0, i32 1), align 8, !tbaa !10
  %2445 = bitcast i8* %35 to double*
  %2446 = sext i32 %590 to i64
  %2447 = sext i32 %592 to i64
  br label %"658"

"658":                                            ; preds = %"685", %"658.preheader"
  %indvars.iv302 = phi i64 [ %2447, %"658.preheader" ], [ %indvars.iv.next303, %"685" ]
  br i1 %2393, label %"685", label %"659.preheader"

"659.preheader":                                  ; preds = %"658"
  %2448 = mul nsw i64 %indvars.iv302, %2395
  %2449 = mul nsw i64 %indvars.iv302, %5
  %2450 = add i64 %2449, %not
  %2451 = mul nsw i64 %indvars.iv302, %2404
  %2452 = mul nsw i64 %indvars.iv302, %2413
  %2453 = mul nsw i64 %indvars.iv302, %2418
  %2454 = mul nsw i64 %indvars.iv302, %2422
  %2455 = mul nsw i64 %indvars.iv302, %2425
  %2456 = mul nsw i64 %indvars.iv302, %2430
  %2457 = mul nsw i64 %indvars.iv302, %2438
  %2458 = mul nsw i64 %indvars.iv302, %2443
  br label %"659"

"659":                                            ; preds = %"684", %"659.preheader"
  %indvars.iv300 = phi i64 [ %2446, %"659.preheader" ], [ %indvars.iv.next301, %"684" ]
  %2459 = add i64 %2448, %2396
  %2460 = add i64 %2459, %indvars.iv300
  %2461 = getelementptr inbounds i32, i32* %2394, i64 %2460
  %2462 = load i32, i32* %2461, align 4, !tbaa !3, !range !5
  %2463 = icmp eq i32 %2462, 0
  br i1 %2463, label %"684", label %"660"

"660":                                            ; preds = %"659"
  %2464 = add i64 %2450, %indvars.iv300
  %2465 = getelementptr inbounds i32, i32* %2397, i64 %2464
  %2466 = load i32, i32* %2465, align 4, !tbaa !0
  %2467 = icmp sgt i32 %2466, 2
  br i1 %2467, label %"661", label %"684"

"661":                                            ; preds = %"660"
  %2468 = getelementptr inbounds double, double* %2398, i64 %2464
  %2469 = load double, double* %2468, align 8, !tbaa !6
  %2470 = fcmp olt double %2469, 0.000000e+00
  br i1 %2470, label %"662", label %"684"

"662":                                            ; preds = %"661"
  %2471 = add i64 %2408, %2403
  %2472 = add i64 %2471, %2409
  %2473 = add i64 %2472, %2451
  %2474 = add i64 %2473, %indvars.iv300
  %2475 = getelementptr inbounds double, double* %2399, i64 %2474
  %2476 = load double, double* %2475, align 8, !tbaa !6
  %2477 = fmul double %2476, %2476
  %2478 = add i64 %2415, %2412
  %2479 = add i64 %2478, %2416
  %2480 = add i64 %2479, %2452
  %2481 = add i64 %2480, %indvars.iv300
  %2482 = getelementptr inbounds double, double* %2410, i64 %2481
  %2483 = load double, double* %2482, align 8, !tbaa !6
  %2484 = fmul double %2483, %2483
  %2485 = fadd double %2477, %2484
  %2486 = call double @sqrt(double %2485) #2
  %2487 = add i64 %2453, %2419
  %2488 = add i64 %2487, %indvars.iv300
  %2489 = getelementptr inbounds double, double* %2417, i64 %2488
  %2490 = load double, double* %2489, align 8, !tbaa !6
  %2491 = fmul double %2486, %2490
  %2492 = getelementptr inbounds double, double* %2420, i64 %2464
  store double %2491, double* %2492, align 8, !tbaa !6
  %2493 = add i64 %2454, %2423
  %2494 = add i64 %2493, %indvars.iv300
  %2495 = add i64 %2455, %2426
  %2496 = add i64 %2495, %indvars.iv300
  %2497 = getelementptr inbounds double, double* %2424, i64 %2496
  %2498 = load double, double* %2497, align 8, !tbaa !6
  %2499 = call double @sqrt(double %2498) #2
  %2500 = fmul double %2486, %2499
  %2501 = getelementptr inbounds double, double* %2421, i64 %2494
  store double %2500, double* %2501, align 8, !tbaa !6
  br i1 %2428, label %"663", label %"667"

"663":                                            ; preds = %"662"
  %2502 = call double @sqrt(double %2500) #2
  %2503 = load double, double* @__data_soil_MOD_cdash, align 8, !tbaa !6
  %2504 = fmul double %2502, %2503
  %2505 = fcmp olt double %2504, 1.000000e-06
  %2506 = fcmp uno double %2504, 0.000000e+00
  %2507 = or i1 %2505, %2506
  %.op1 = fdiv double 1.000000e+00, %2504
  %2508 = select i1 %2507, double 1.000000e+06, double %.op1
  br label %"667"

"667":                                            ; preds = %"663", %"662"
  %2509 = phi double [ %2508, %"663" ], [ 0.000000e+00, %"662" ]
  %2510 = add i64 %2456, %2431
  %2511 = add i64 %2510, %indvars.iv300
  %2512 = getelementptr inbounds double, double* %2429, i64 %2511
  %2513 = load double, double* %2512, align 8, !tbaa !6
  %2514 = load double, double* @__data_soil_MOD_cparcrit, align 8, !tbaa !6
  %2515 = fdiv double %2513, %2514
  %2516 = fcmp olt double %2515, 1.000000e+00
  %.228 = select i1 %2516, double %2515, double 1.000000e+00
  %2517 = fcmp ogt double %.228, 0.000000e+00
  %2518 = select i1 %2517, double %.228, double 0.000000e+00
  %2519 = getelementptr inbounds double, double* %2432, i64 %2464
  %2520 = load double, double* %2519, align 8, !tbaa !6
  %2521 = getelementptr inbounds double, double* %2433, i64 %2464
  %2522 = load double, double* %2521, align 8, !tbaa !6
  %2523 = fsub double %2520, %2522
  %2524 = fmul double %2469, 8.640000e+04
  %2525 = fsub double -4.750000e+00, %2524
  %2526 = call double @atan(double %2525) #2
  %2527 = fmul double %2526, 1.210000e-01
  %2528 = fadd double %2527, 8.100000e-01
  %2529 = fmul double %2523, %2528
  %2530 = getelementptr inbounds double, double* %2434, i64 %2464
  %2531 = load double, double* %2530, align 8, !tbaa !6
  %2532 = fsub double %2531, %2522
  %2533 = fdiv double %2532, %2529
  %2534 = fcmp olt double %2533, 1.000000e+00
  %.229 = select i1 %2534, double %2533, double 1.000000e+00
  %2535 = fcmp ogt double %.229, 0.000000e+00
  %2536 = select i1 %2535, double %.229, double 0.000000e+00
  %2537 = load double, double* @__data_soil_MOD_ctend, align 8, !tbaa !6
  %2538 = load double, double* @__data_constants_MOD_t0_melt, align 8, !tbaa !6
  %2539 = fsub double %2537, %2538
  %2540 = fmul double %2539, %2539
  %2541 = add i64 %2440, %2437
  %2542 = add i64 %2541, %2441
  %2543 = add i64 %2542, %2457
  %2544 = add i64 %2543, %indvars.iv300
  %2545 = getelementptr inbounds double, double* %2435, i64 %2544
  %2546 = load double, double* %2545, align 8, !tbaa !6
  %2547 = fsub double %2546, %2538
  %2548 = fmul double %2547, 4.000000e+00
  %2549 = fsub double %2537, %2546
  %2550 = fmul double %2549, %2548
  %2551 = fdiv double %2550, %2540
  %2552 = fcmp olt double %2551, 1.000000e+00
  %.230 = select i1 %2552, double %2551, double 1.000000e+00
  %2553 = fcmp ogt double %.230, 0.000000e+00
  %2554 = select i1 %2553, double %.230, double 0.000000e+00
  %2555 = load double, double* @__data_soil_MOD_crsmax, align 8, !tbaa !6
  %2556 = load double, double* @__data_soil_MOD_crsmin, align 8, !tbaa !6
  %2557 = fdiv double 1.000000e+00, %2556
  %2558 = fdiv double 1.000000e+00, %2555
  %2559 = fsub double %2557, %2558
  %2560 = fmul double %2518, %2559
  %2561 = fmul double %2536, %2560
  %2562 = fmul double %2561, %2554
  %2563 = fadd double %2558, %2562
  %2564 = fdiv double 1.000000e+00, %2563
  %2565 = add i64 %2458, %2444
  %2566 = add i64 %2565, %indvars.iv300
  %2567 = getelementptr inbounds double, double* %2442, i64 %2566
  store double %2564, double* %2567, align 8, !tbaa !6
  %2568 = fadd double %2509, %2564
  %2569 = getelementptr inbounds double, double* %2445, i64 %2464
  store double %2568, double* %2569, align 8, !tbaa !6
  br label %"684"

"684":                                            ; preds = %"667", %"661", %"660", %"659"
  %2570 = trunc i64 %indvars.iv300 to i32
  %2571 = icmp eq i32 %591, %2570
  %indvars.iv.next301 = add nsw i64 %indvars.iv300, 1
  br i1 %2571, label %"685.loopexit", label %"659"

"685.loopexit":                                   ; preds = %"684"
  br label %"685"

"685":                                            ; preds = %"685.loopexit", %"658"
  %2572 = trunc i64 %indvars.iv302 to i32
  %2573 = icmp eq i32 %593, %2572
  %indvars.iv.next303 = add nsw i64 %indvars.iv302, 1
  br i1 %2573, label %"687.preheader", label %"658"

"687.preheader":                                  ; preds = %"685"
  %2574 = load double*, double** bitcast (%"struct.array2_real(kind=8).61"* @__data_fields_MOD_tai to double**), align 8, !tbaa !8
  %2575 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).61", %"struct.array2_real(kind=8).61"* @__data_fields_MOD_tai, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2576 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).61", %"struct.array2_real(kind=8).61"* @__data_fields_MOD_tai, i64 0, i32 1), align 8, !tbaa !10
  %2577 = load double*, double** bitcast (%"struct.array2_real(kind=8).60"* @__data_fields_MOD_sai to double**), align 8, !tbaa !8
  %2578 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).60", %"struct.array2_real(kind=8).60"* @__data_fields_MOD_sai, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2579 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).60", %"struct.array2_real(kind=8).60"* @__data_fields_MOD_sai, i64 0, i32 1), align 8, !tbaa !10
  %2580 = bitcast i8* %38 to double*
  br label %"687"

"687":                                            ; preds = %"693", %"687.preheader"
  %indvars.iv298 = phi i64 [ %2447, %"687.preheader" ], [ %indvars.iv.next299, %"693" ]
  br i1 %2393, label %"693", label %"688.preheader"

"688.preheader":                                  ; preds = %"687"
  %2581 = mul nsw i64 %indvars.iv298, %2395
  %2582 = mul nsw i64 %indvars.iv298, %5
  %2583 = add i64 %2582, %not
  %2584 = mul nsw i64 %indvars.iv298, %2575
  %2585 = mul nsw i64 %indvars.iv298, %2578
  br label %"688"

"688":                                            ; preds = %"692", %"688.preheader"
  %indvars.iv296 = phi i64 [ %2446, %"688.preheader" ], [ %indvars.iv.next297, %"692" ]
  %2586 = add i64 %2581, %2396
  %2587 = add i64 %2586, %indvars.iv296
  %2588 = getelementptr inbounds i32, i32* %2394, i64 %2587
  %2589 = load i32, i32* %2588, align 4, !tbaa !3, !range !5
  %2590 = icmp eq i32 %2589, 0
  br i1 %2590, label %"692", label %"689"

"689":                                            ; preds = %"688"
  %2591 = add i64 %2583, %indvars.iv296
  %2592 = getelementptr inbounds i32, i32* %2397, i64 %2591
  %2593 = load i32, i32* %2592, align 4, !tbaa !0
  %2594 = icmp sgt i32 %2593, 2
  br i1 %2594, label %"690", label %"692"

"690":                                            ; preds = %"689"
  %2595 = getelementptr inbounds double, double* %2398, i64 %2591
  %2596 = load double, double* %2595, align 8, !tbaa !6
  %2597 = fcmp olt double %2596, 0.000000e+00
  br i1 %2597, label %"691", label %"692"

"691":                                            ; preds = %"690"
  %2598 = add i64 %2584, %2576
  %2599 = add i64 %2598, %indvars.iv296
  %2600 = getelementptr inbounds double, double* %2574, i64 %2599
  %2601 = load double, double* %2600, align 8, !tbaa !6
  %2602 = fmul double %2596, %2601
  %2603 = add i64 %2585, %2579
  %2604 = add i64 %2603, %indvars.iv296
  %2605 = getelementptr inbounds double, double* %2577, i64 %2604
  %2606 = load double, double* %2605, align 8, !tbaa !6
  %2607 = getelementptr inbounds double, double* %2445, i64 %2591
  %2608 = load double, double* %2607, align 8, !tbaa !6
  %2609 = getelementptr inbounds double, double* %2420, i64 %2591
  %2610 = load double, double* %2609, align 8, !tbaa !6
  %2611 = fmul double %2608, %2610
  %2612 = fadd double %2606, %2611
  %2613 = fdiv double %2602, %2612
  %2614 = getelementptr inbounds double, double* %2580, i64 %2591
  store double %2613, double* %2614, align 8, !tbaa !6
  br label %"692"

"692":                                            ; preds = %"691", %"690", %"689", %"688"
  %2615 = trunc i64 %indvars.iv296 to i32
  %2616 = icmp eq i32 %591, %2615
  %indvars.iv.next297 = add nsw i64 %indvars.iv296, 1
  br i1 %2616, label %"693.loopexit", label %"688"

"693.loopexit":                                   ; preds = %"692"
  br label %"693"

"693":                                            ; preds = %"693.loopexit", %"687"
  %2617 = trunc i64 %indvars.iv298 to i32
  %2618 = icmp eq i32 %593, %2617
  %indvars.iv.next299 = add nsw i64 %indvars.iv298, 1
  br i1 %2618, label %"694.loopexit", label %"687"

"694.loopexit":                                   ; preds = %"693"
  br label %"694"

"694":                                            ; preds = %"694.loopexit", %"657"
  br i1 %2322, label %"695.preheader", label %"706"

"695.preheader":                                  ; preds = %"694"
  %2619 = icmp sgt i32 %590, %591
  %2620 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %2621 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2622 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %2623 = bitcast i8* %13 to i32*
  %2624 = bitcast i8* %22 to double*
  %2625 = bitcast i8* %38 to double*
  %2626 = load double*, double** bitcast (%"struct.array2_real(kind=8).58"* @__data_fields_MOD_fr_wi to double**), align 8, !tbaa !8
  %2627 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).58", %"struct.array2_real(kind=8).58"* @__data_fields_MOD_fr_wi, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2628 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).58", %"struct.array2_real(kind=8).58"* @__data_fields_MOD_fr_wi, i64 0, i32 1), align 8, !tbaa !10
  %2629 = load double*, double** bitcast (%"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow to double**), align 8, !tbaa !8
  %2630 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).28", %"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2631 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).28", %"struct.array2_real(kind=8).28"* @__data_fields_MOD_fr_snow, i64 0, i32 1), align 8, !tbaa !10
  %2632 = bitcast i8* %48 to double*
  %2633 = load double*, double** bitcast (%"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang to double**), align 32, !tbaa !8
  %2634 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %2635 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2636 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 1), align 8, !tbaa !10
  %2637 = bitcast i8* %33 to double*
  %2638 = sext i32 %590 to i64
  %2639 = sext i32 %592 to i64
  %2640 = add i32 %2321, 1
  br label %"695"

"695":                                            ; preds = %"705", %"695.preheader"
  %indvars.iv294 = phi i64 [ 1, %"695.preheader" ], [ %indvars.iv.next295, %"705" ]
  br i1 %648, label %"696.preheader", label %"705"

"696.preheader":                                  ; preds = %"695"
  %2641 = mul nsw i64 %indvars.iv294, %2634
  %2642 = mul nsw i64 %indvars.iv294, %29
  %2643 = add i64 %2642, %34
  br label %"696"

"696":                                            ; preds = %"704", %"696.preheader"
  %indvars.iv292 = phi i64 [ %2639, %"696.preheader" ], [ %indvars.iv.next293, %"704" ]
  br i1 %2619, label %"704", label %"697.preheader"

"697.preheader":                                  ; preds = %"696"
  %2644 = mul nsw i64 %indvars.iv292, %2621
  %2645 = mul nsw i64 %indvars.iv292, %5
  %2646 = add i64 %2645, %not
  %2647 = mul nsw i64 %indvars.iv292, %2627
  %2648 = mul nsw i64 %indvars.iv292, %2630
  %2649 = mul nsw i64 %indvars.iv292, %2635
  %2650 = add i64 %2643, %2645
  br label %"697"

"697":                                            ; preds = %"703", %"697.preheader"
  %indvars.iv290 = phi i64 [ %2638, %"697.preheader" ], [ %indvars.iv.next291, %"703" ]
  %2651 = add i64 %2644, %2622
  %2652 = add i64 %2651, %indvars.iv290
  %2653 = getelementptr inbounds i32, i32* %2620, i64 %2652
  %2654 = load i32, i32* %2653, align 4, !tbaa !3, !range !5
  %2655 = icmp eq i32 %2654, 0
  br i1 %2655, label %"703", label %"698"

"698":                                            ; preds = %"697"
  %2656 = add i64 %2646, %indvars.iv290
  %2657 = getelementptr inbounds i32, i32* %2623, i64 %2656
  %2658 = load i32, i32* %2657, align 4, !tbaa !0
  %2659 = icmp sgt i32 %2658, 2
  br i1 %2659, label %"699", label %"703"

"699":                                            ; preds = %"698"
  %2660 = getelementptr inbounds double, double* %2624, i64 %2656
  %2661 = load double, double* %2660, align 8, !tbaa !6
  %2662 = fcmp olt double %2661, 0.000000e+00
  br i1 %2662, label %"700", label %"703"

"700":                                            ; preds = %"699"
  %2663 = getelementptr inbounds double, double* %2625, i64 %2656
  %2664 = load double, double* %2663, align 8, !tbaa !6
  %2665 = add i64 %2647, %2628
  %2666 = add i64 %2665, %indvars.iv290
  %2667 = getelementptr inbounds double, double* %2626, i64 %2666
  %2668 = load double, double* %2667, align 8, !tbaa !6
  %2669 = fsub double 1.000000e+00, %2668
  %2670 = fmul double %2664, %2669
  %2671 = add i64 %2648, %2631
  %2672 = add i64 %2671, %indvars.iv290
  %2673 = getelementptr inbounds double, double* %2629, i64 %2672
  %2674 = load double, double* %2673, align 8, !tbaa !6
  %2675 = fsub double 1.000000e+00, %2674
  %2676 = fmul double %2670, %2675
  %2677 = getelementptr inbounds double, double* %2632, i64 %2656
  %2678 = load double, double* %2677, align 8, !tbaa !6
  %2679 = fcmp ogt double %2678, 1.000000e-06
  %.232 = select i1 %2679, double %2678, double 1.000000e-06
  %2680 = add i64 %2641, %2636
  %2681 = add i64 %2680, %2649
  %2682 = add i64 %2681, %indvars.iv290
  %2683 = add i64 %2650, %indvars.iv290
  %2684 = getelementptr inbounds double, double* %2637, i64 %2683
  %2685 = load double, double* %2684, align 8, !tbaa !6
  %2686 = fmul double %2676, %2685
  %2687 = fdiv double %2686, %.232
  %2688 = getelementptr inbounds double, double* %2633, i64 %2682
  store double %2687, double* %2688, align 8, !tbaa !6
  br label %"703"

"703":                                            ; preds = %"700", %"699", %"698", %"697"
  %2689 = trunc i64 %indvars.iv290 to i32
  %2690 = icmp eq i32 %591, %2689
  %indvars.iv.next291 = add nsw i64 %indvars.iv290, 1
  br i1 %2690, label %"704.loopexit", label %"697"

"704.loopexit":                                   ; preds = %"703"
  br label %"704"

"704":                                            ; preds = %"704.loopexit", %"696"
  %2691 = trunc i64 %indvars.iv292 to i32
  %2692 = icmp eq i32 %593, %2691
  %indvars.iv.next293 = add nsw i64 %indvars.iv292, 1
  br i1 %2692, label %"705.loopexit", label %"696"

"705.loopexit":                                   ; preds = %"704"
  br label %"705"

"705":                                            ; preds = %"705.loopexit", %"695"
  %indvars.iv.next295 = add nuw nsw i64 %indvars.iv294, 1
  %lftr.wideiv17 = trunc i64 %indvars.iv.next295 to i32
  %exitcond18 = icmp eq i32 %lftr.wideiv17, %2640
  br i1 %exitcond18, label %"706.loopexit", label %"695"

"706.loopexit":                                   ; preds = %"705"
  br label %"706"

"706":                                            ; preds = %"706.loopexit", %"694", %"638", %"620", %"619"
  br i1 %648, label %"707.preheader", label %"712"

"707.preheader":                                  ; preds = %"706"
  %2693 = icmp sgt i32 %590, %591
  %2694 = load i32*, i32** bitcast (%"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask to i32**), align 8, !tbaa !8
  %2695 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2696 = load i64, i64* getelementptr inbounds (%"struct.array2_logical(kind=4)", %"struct.array2_logical(kind=4)"* @__data_fields_MOD_llandmask, i64 0, i32 1), align 8, !tbaa !10
  %2697 = load double*, double** bitcast (%"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt to double**), align 32, !tbaa !8
  %2698 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2699 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).8", %"struct.array2_real(kind=8).8"* @__src_soil_MOD_xdwsndt, i64 0, i32 1), align 8, !tbaa !10
  %2700 = load double*, double** bitcast (%"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt to double**), align 32, !tbaa !8
  %2701 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2702 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).9", %"struct.array2_real(kind=8).9"* @__src_soil_MOD_xdwidt, i64 0, i32 1), align 8, !tbaa !10
  %2703 = load double*, double** bitcast (%"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil to double**), align 32, !tbaa !8
  %2704 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2705 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).6", %"struct.array2_real(kind=8).6"* @__src_soil_MOD_xesoil, i64 0, i32 1), align 8, !tbaa !10
  %2706 = load double*, double** bitcast (%"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang to double**), align 32, !tbaa !8
  %2707 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2708 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %2709 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8)", %"struct.array3_real(kind=8)"* @__src_soil_MOD_xtrang, i64 0, i32 1), align 8, !tbaa !10
  %2710 = shl i64 %2708, 1
  %2711 = mul nsw i64 %2708, 3
  %2712 = load double*, double** bitcast (%"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr to double**), align 32, !tbaa !8
  %2713 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2714 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).1", %"struct.array2_real(kind=8).1"* @__src_soil_MOD_xrr, i64 0, i32 1), align 8, !tbaa !10
  %2715 = load double*, double** bitcast (%"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs to double**), align 32, !tbaa !8
  %2716 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2717 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).0", %"struct.array2_real(kind=8).0"* @__src_soil_MOD_xrs, i64 0, i32 1), align 8, !tbaa !10
  %2718 = load double*, double** bitcast (%"struct.array3_real(kind=8).51"* @__data_fields_MOD_qv_s to double**), align 8, !tbaa !8
  %2719 = load i32, i32* %nx, align 4, !tbaa !0
  %2720 = sext i32 %2719 to i64
  %2721 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).51", %"struct.array3_real(kind=8).51"* @__data_fields_MOD_qv_s, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %2722 = mul nsw i64 %2721, %2720
  %2723 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).51", %"struct.array3_real(kind=8).51"* @__data_fields_MOD_qv_s, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2724 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).51", %"struct.array3_real(kind=8).51"* @__data_fields_MOD_qv_s, i64 0, i32 1), align 8, !tbaa !10
  %2725 = load double*, double** bitcast (%"struct.array3_real(kind=8).44"* @qv.2641 to double**), align 32, !tbaa !8
  %2726 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).44", %"struct.array3_real(kind=8).44"* @qv.2641, i64 0, i32 3, i64 0, i32 0), align 8, !tbaa !10
  %2727 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).44", %"struct.array3_real(kind=8).44"* @qv.2641, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2728 = load i32, i32* @__data_modelconfig_MOD_ke, align 4, !tbaa !0
  %2729 = sext i32 %2728 to i64
  %2730 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).44", %"struct.array3_real(kind=8).44"* @qv.2641, i64 0, i32 3, i64 2, i32 0), align 8, !tbaa !10
  %2731 = mul nsw i64 %2730, %2729
  %2732 = load i64, i64* getelementptr inbounds (%"struct.array3_real(kind=8).44", %"struct.array3_real(kind=8).44"* @qv.2641, i64 0, i32 1), align 8, !tbaa !10
  %2733 = load double*, double** bitcast (%"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch to double**), align 32, !tbaa !8
  %2734 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 3, i64 1, i32 0), align 8, !tbaa !10
  %2735 = load i64, i64* getelementptr inbounds (%"struct.array2_real(kind=8).5", %"struct.array2_real(kind=8).5"* @__src_soil_MOD_xrhoch, i64 0, i32 1), align 8, !tbaa !10
  %2736 = load i32, i32* @__data_runcontrol_MOD_nnew, align 4, !tbaa !0
  %2737 = sext i32 %2736 to i64
  %2738 = mul nsw i64 %2721, %2737
  %2739 = sext i32 %590 to i64
  %2740 = sext i32 %592 to i64
  br label %"707"

"707":                                            ; preds = %"711", %"707.preheader"
  %indvars.iv288 = phi i64 [ %2740, %"707.preheader" ], [ %indvars.iv.next289, %"711" ]
  br i1 %2693, label %"711", label %"708.preheader"

"708.preheader":                                  ; preds = %"707"
  %2741 = mul nsw i64 %indvars.iv288, %2695
  %2742 = mul nsw i64 %indvars.iv288, %2698
  %2743 = mul nsw i64 %indvars.iv288, %2701
  %2744 = mul nsw i64 %indvars.iv288, %2704
  %2745 = mul nsw i64 %indvars.iv288, %2707
  %2746 = mul nsw i64 %indvars.iv288, %2713
  %2747 = mul nsw i64 %indvars.iv288, %2716
  %2748 = mul nsw i64 %indvars.iv288, %2723
  %2749 = mul nsw i64 %indvars.iv288, %2727
  %2750 = mul nsw i64 %indvars.iv288, %2734
  br label %"708"

"708":                                            ; preds = %"710", %"708.preheader"
  %indvars.iv = phi i64 [ %2739, %"708.preheader" ], [ %indvars.iv.next, %"710" ]
  %2751 = add i64 %2741, %2696
  %2752 = add i64 %2751, %indvars.iv
  %2753 = getelementptr inbounds i32, i32* %2694, i64 %2752
  %2754 = load i32, i32* %2753, align 4, !tbaa !3, !range !5
  %2755 = icmp eq i32 %2754, 0
  br i1 %2755, label %"710", label %"709"

"709":                                            ; preds = %"708"
  %2756 = add i64 %2742, %2699
  %2757 = add i64 %2756, %indvars.iv
  %2758 = getelementptr inbounds double, double* %2697, i64 %2757
  %2759 = load double, double* %2758, align 8, !tbaa !6
  %2760 = add i64 %2743, %2702
  %2761 = add i64 %2760, %indvars.iv
  %2762 = getelementptr inbounds double, double* %2700, i64 %2761
  %2763 = load double, double* %2762, align 8, !tbaa !6
  %2764 = fadd double %2759, %2763
  %2765 = add i64 %2744, %2705
  %2766 = add i64 %2765, %indvars.iv
  %2767 = getelementptr inbounds double, double* %2703, i64 %2766
  %2768 = load double, double* %2767, align 8, !tbaa !6
  %2769 = fadd double %2764, %2768
  %2770 = add i64 %indvars.iv, %2745
  %2771 = add i64 %2709, %2708
  %2772 = add i64 %2771, %2770
  %2773 = getelementptr inbounds double, double* %2706, i64 %2772
  %2774 = load double, double* %2773, align 8, !tbaa !6
  %2775 = fadd double %2769, %2774
  %2776 = add i64 %2709, %2710
  %2777 = add i64 %2776, %2770
  %2778 = getelementptr inbounds double, double* %2706, i64 %2777
  %2779 = load double, double* %2778, align 8, !tbaa !6
  %2780 = fadd double %2775, %2779
  %2781 = add i64 %2709, %2711
  %2782 = add i64 %2781, %2770
  %2783 = getelementptr inbounds double, double* %2706, i64 %2782
  %2784 = load double, double* %2783, align 8, !tbaa !6
  %2785 = fadd double %2780, %2784
  %2786 = add i64 %2746, %2714
  %2787 = add i64 %2786, %indvars.iv
  %2788 = getelementptr inbounds double, double* %2712, i64 %2787
  %2789 = load double, double* %2788, align 8, !tbaa !6
  %2790 = fadd double %2785, %2789
  %2791 = add i64 %2747, %2717
  %2792 = add i64 %2791, %indvars.iv
  %2793 = getelementptr inbounds double, double* %2715, i64 %2792
  %2794 = load double, double* %2793, align 8, !tbaa !6
  %2795 = fadd double %2790, %2794
  %2796 = add i64 %2724, %2722
  %2797 = add i64 %2796, %2748
  %2798 = add i64 %2797, %indvars.iv
  %2799 = mul nsw i64 %indvars.iv, %2726
  %2800 = add i64 %2732, %2731
  %2801 = add i64 %2800, %2749
  %2802 = add i64 %2801, %2799
  %2803 = getelementptr inbounds double, double* %2725, i64 %2802
  %2804 = load double, double* %2803, align 8, !tbaa !6
  %2805 = add i64 %2750, %2735
  %2806 = add i64 %2805, %indvars.iv
  %2807 = getelementptr inbounds double, double* %2733, i64 %2806
  %2808 = load double, double* %2807, align 8, !tbaa !6
  %2809 = fadd double %2808, 1.000000e-06
  %2810 = fdiv double %2795, %2809
  %2811 = fsub double %2804, %2810
  %2812 = getelementptr inbounds double, double* %2718, i64 %2798
  store double %2811, double* %2812, align 8, !tbaa !6
  %2813 = add i64 %2738, %2724
  %2814 = add i64 %2813, %2748
  %2815 = add i64 %2814, %indvars.iv
  %2816 = add i64 %2724, %2722
  %2817 = add i64 %2816, %2748
  %2818 = add i64 %2817, %indvars.iv
  %2819 = getelementptr inbounds double, double* %2718, i64 %2818
  %2820 = bitcast double* %2819 to i64*
  %2821 = load i64, i64* %2820, align 8, !tbaa !6
  %2822 = getelementptr inbounds double, double* %2718, i64 %2815
  %2823 = bitcast double* %2822 to i64*
  store i64 %2821, i64* %2823, align 8, !tbaa !6
  br label %"710"

"710":                                            ; preds = %"709", %"708"
  %2824 = trunc i64 %indvars.iv to i32
  %2825 = icmp eq i32 %591, %2824
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  br i1 %2825, label %"711.loopexit", label %"708"

"711.loopexit":                                   ; preds = %"710"
  br label %"711"

"711":                                            ; preds = %"711.loopexit", %"707"
  %2826 = trunc i64 %indvars.iv288 to i32
  %2827 = icmp eq i32 %593, %2826
  %indvars.iv.next289 = add nsw i64 %indvars.iv288, 1
  br i1 %2827, label %"712.loopexit", label %"707"

"712.loopexit":                                   ; preds = %"711"
  br label %"712"

"712":                                            ; preds = %"712.loopexit", %"706"
  %2828 = icmp eq i8* %49, null
  br i1 %2828, label %"714", label %"713"

"713":                                            ; preds = %"712"
  call void @free(i8* %49) #1
  br label %"714"

"714":                                            ; preds = %"713", %"712"
  %2829 = icmp eq i8* %48, null
  br i1 %2829, label %"716", label %"715"

"715":                                            ; preds = %"714"
  call void @free(i8* %48) #1
  br label %"716"

"716":                                            ; preds = %"715", %"714"
  %2830 = icmp eq i8* %47, null
  br i1 %2830, label %"718", label %"717"

"717":                                            ; preds = %"716"
  call void @free(i8* %47) #1
  br label %"718"

"718":                                            ; preds = %"717", %"716"
  %2831 = icmp eq i8* %46, null
  br i1 %2831, label %"720", label %"719"

"719":                                            ; preds = %"718"
  call void @free(i8* %46) #1
  br label %"720"

"720":                                            ; preds = %"719", %"718"
  %2832 = icmp eq i8* %41, null
  br i1 %2832, label %"722", label %"721"

"721":                                            ; preds = %"720"
  call void @free(i8* %41) #1
  br label %"722"

"722":                                            ; preds = %"721", %"720"
  %2833 = icmp eq i8* %40, null
  br i1 %2833, label %"724", label %"723"

"723":                                            ; preds = %"722"
  call void @free(i8* %40) #1
  br label %"724"

"724":                                            ; preds = %"723", %"722"
  %2834 = icmp eq i8* %39, null
  br i1 %2834, label %"728", label %"725"

"725":                                            ; preds = %"724"
  call void @free(i8* %39) #1
  br label %"728"

"728":                                            ; preds = %"725", %"724"
  %2835 = icmp eq i8* %38, null
  br i1 %2835, label %"730", label %"729"

"729":                                            ; preds = %"728"
  call void @free(i8* %38) #1
  br label %"730"

"730":                                            ; preds = %"729", %"728"
  %2836 = icmp eq i8* %37, null
  br i1 %2836, label %"732", label %"731"

"731":                                            ; preds = %"730"
  call void @free(i8* %37) #1
  br label %"732"

"732":                                            ; preds = %"731", %"730"
  %2837 = icmp eq i8* %36, null
  br i1 %2837, label %"736", label %"733"

"733":                                            ; preds = %"732"
  call void @free(i8* %36) #1
  br label %"736"

"736":                                            ; preds = %"733", %"732"
  %2838 = icmp eq i8* %35, null
  br i1 %2838, label %"738", label %"737"

"737":                                            ; preds = %"736"
  call void @free(i8* %35) #1
  br label %"738"

"738":                                            ; preds = %"737", %"736"
  %2839 = icmp eq i8* %33, null
  br i1 %2839, label %"740", label %"739"

"739":                                            ; preds = %"738"
  call void @free(i8* %33) #1
  br label %"740"

"740":                                            ; preds = %"739", %"738"
  %2840 = icmp eq i8* %28, null
  br i1 %2840, label %"742", label %"741"

"741":                                            ; preds = %"740"
  call void @free(i8* %28) #1
  br label %"742"

"742":                                            ; preds = %"741", %"740"
  %2841 = icmp eq i8* %27, null
  br i1 %2841, label %"744", label %"743"

"743":                                            ; preds = %"742"
  call void @free(i8* %27) #1
  br label %"744"

"744":                                            ; preds = %"743", %"742"
  %2842 = icmp eq i8* %26, null
  br i1 %2842, label %"746", label %"745"

"745":                                            ; preds = %"744"
  call void @free(i8* %26) #1
  br label %"746"

"746":                                            ; preds = %"745", %"744"
  %2843 = icmp eq i8* %25, null
  br i1 %2843, label %"748", label %"747"

"747":                                            ; preds = %"746"
  call void @free(i8* %25) #1
  br label %"748"

"748":                                            ; preds = %"747", %"746"
  %2844 = icmp eq i8* %24, null
  br i1 %2844, label %"750", label %"749"

"749":                                            ; preds = %"748"
  call void @free(i8* %24) #1
  br label %"750"

"750":                                            ; preds = %"749", %"748"
  %2845 = icmp eq i8* %23, null
  br i1 %2845, label %"752", label %"751"

"751":                                            ; preds = %"750"
  call void @free(i8* %23) #1
  br label %"752"

"752":                                            ; preds = %"751", %"750"
  %2846 = icmp eq i8* %22, null
  br i1 %2846, label %"754", label %"753"

"753":                                            ; preds = %"752"
  call void @free(i8* %22) #1
  br label %"754"

"754":                                            ; preds = %"753", %"752"
  %2847 = icmp eq i8* %21, null
  br i1 %2847, label %"756", label %"755"

"755":                                            ; preds = %"754"
  call void @free(i8* %21) #1
  br label %"756"

"756":                                            ; preds = %"755", %"754"
  %2848 = icmp eq i8* %20, null
  br i1 %2848, label %"758", label %"757"

"757":                                            ; preds = %"756"
  call void @free(i8* %20) #1
  br label %"758"

"758":                                            ; preds = %"757", %"756"
  %2849 = icmp eq i8* %19, null
  br i1 %2849, label %"760", label %"759"

"759":                                            ; preds = %"758"
  call void @free(i8* %19) #1
  br label %"760"

"760":                                            ; preds = %"759", %"758"
  %2850 = icmp eq i8* %18, null
  br i1 %2850, label %"762", label %"761"

"761":                                            ; preds = %"760"
  call void @free(i8* %18) #1
  br label %"762"

"762":                                            ; preds = %"761", %"760"
  %2851 = icmp eq i8* %17, null
  br i1 %2851, label %"764", label %"763"

"763":                                            ; preds = %"762"
  call void @free(i8* %17) #1
  br label %"764"

"764":                                            ; preds = %"763", %"762"
  %2852 = icmp eq i8* %13, null
  br i1 %2852, label %return, label %"765"

"765":                                            ; preds = %"764"
  call void @free(i8* %13) #1
  br label %return

return:                                           ; preds = %"765", %"764"
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

declare void @__src_tracer_MOD_trcr_get_byindex(i32* noalias, i32* noalias, %"struct.array3_real(kind=8).45"*, %"struct.array4_real(kind=8)"*, %"struct.array3_real(kind=8).46"*, %"struct.array3_real(kind=8).47"*, i32*)

declare void @__src_tracer_MOD_trcr_errorstr([255 x i8]*, i32, i32* noalias)

declare void @__environment_MOD_model_abort(i32* noalias, i32* noalias, [0 x i8]* noalias, [0 x i8]* noalias, i32*, i32, i32)

; Function Attrs: nounwind readnone
declare double @log10(double) #2

; Function Attrs: nounwind readnone
declare double @pow(double, double) #2

declare double @fabs(double)

; Function Attrs: nounwind readnone
declare double @atan(double) #2

; Function Attrs: nounwind readnone
declare double @llvm.fabs.f64(double) #2

attributes #0 = { nounwind uwtable }
attributes #1 = { nounwind }
attributes #2 = { nounwind readnone }
attributes #3 = { argmemonly nounwind }

!0 = !{!1, !1, i64 0}
!1 = !{!"alias set 11: integer(kind=4)", !2}
!2 = distinct !{!2}
!3 = !{!4, !4, i64 0}
!4 = !{!"alias set 18: logical(kind=4)", !2}
!5 = !{i32 0, i32 2}
!6 = !{!7, !7, i64 0}
!7 = !{!"alias set 19: real(kind=8)", !2}
!8 = !{!9, !9, i64 0}
!9 = !{!"alias set 3: void*", !2}
!10 = !{!11, !11, i64 0}
!11 = !{!"alias set 4: integer(kind=8)", !2}
