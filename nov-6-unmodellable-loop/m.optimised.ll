; ModuleID = 'm.canonical.ll'
source_filename = "m.bc"
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

module asm "\09.ident\09\22GCC: (GNU) 4.6.4 LLVM: 3.3.1\22"

%"struct.array1_real(kind=4)" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i64, i64, i64 }
%"struct.array1_real(kind=4).0" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).1" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4)" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).2" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).3" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).4" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).5" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).6" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=4)" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).7" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).8" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).9" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array3_real(kind=4).10" = type { i8*, i64, i64, [3 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).11" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).12" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).13" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).14" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).15" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).16" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).17" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).18" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).19" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).20" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).21" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).22" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).23" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).24" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).25" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).26" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).27" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).28" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).29" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).30" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).31" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).32" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).33" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).34" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).35" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).36" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).37" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).38" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).39" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).40" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).41" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).42" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).43" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).44" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).45" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).46" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).47" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).48" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).49" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).50" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).51" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).52" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).53" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).54" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).55" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).56" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).57" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).58" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).59" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).60" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).61" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).62" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).63" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).64" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).65" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).66" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }
%"struct.array2_real(kind=4).67" = type { i8*, i64, i64, [2 x %struct.descriptor_dimension] }
%"struct.array1_real(kind=4).68" = type { i8*, i64, i64, [1 x %struct.descriptor_dimension] }

@__m_MOD_zzflsu_par = unnamed_addr global %"struct.array1_real(kind=4)" zeroinitializer, align 32
@__m_MOD_zzflsp_par = unnamed_addr global %"struct.array1_real(kind=4).0" zeroinitializer, align 32
@__m_MOD_zzflsd_par = unnamed_addr global %"struct.array1_real(kind=4).1" zeroinitializer, align 32
@__m_MOD_zwv = unnamed_addr global %"struct.array2_real(kind=4)" zeroinitializer, align 32
@__m_MOD_zvdaeu = unnamed_addr global %"struct.array1_real(kind=4).2" zeroinitializer, align 32
@__m_MOD_zvdaes = unnamed_addr global %"struct.array1_real(kind=4).3" zeroinitializer, align 32
@__m_MOD_zvdael = unnamed_addr global %"struct.array1_real(kind=4).4" zeroinitializer, align 32
@__m_MOD_zvdaed = unnamed_addr global %"struct.array1_real(kind=4).5" zeroinitializer, align 32
@__m_MOD_zti = unnamed_addr global %"struct.array2_real(kind=4).6" zeroinitializer, align 32
@__m_MOD_zthhr = unnamed_addr global %"struct.array3_real(kind=4)" zeroinitializer, align 32
@__m_MOD_zthbt = unnamed_addr global %"struct.array2_real(kind=4).7" zeroinitializer, align 32
@__m_MOD_zthbs = unnamed_addr global %"struct.array2_real(kind=4).8" zeroinitializer, align 32
@__m_MOD_zsw = unnamed_addr global %"struct.array2_real(kind=4).9" zeroinitializer, align 32
@__m_MOD_zsohr = unnamed_addr global %"struct.array3_real(kind=4).10" zeroinitializer, align 32
@__m_MOD_zsodwddm = unnamed_addr global %"struct.array2_real(kind=4).11" zeroinitializer, align 32
@__m_MOD_zsobt = unnamed_addr global %"struct.array2_real(kind=4).12" zeroinitializer, align 32
@__m_MOD_zsobs = unnamed_addr global %"struct.array2_real(kind=4).13" zeroinitializer, align 32
@__m_MOD_zsign = unnamed_addr global %"struct.array1_real(kind=4).14" zeroinitializer, align 32
@__m_MOD_zse = unnamed_addr global %"struct.array2_real(kind=4).15" zeroinitializer, align 32
@__m_MOD_zqofo = unnamed_addr global %"struct.array1_real(kind=4).16" zeroinitializer, align 32
@__m_MOD_zqcfo = unnamed_addr global %"struct.array1_real(kind=4).17" zeroinitializer, align 32
@__m_MOD_zpabs = unnamed_addr global %"struct.array2_real(kind=4).18" zeroinitializer, align 32
@__m_MOD_zo3h = unnamed_addr global %"struct.array1_real(kind=4).19" zeroinitializer, align 32
@__m_MOD_zfltu = unnamed_addr global %"struct.array1_real(kind=4).20" zeroinitializer, align 32
@__m_MOD_zfltd = unnamed_addr global %"struct.array1_real(kind=4).21" zeroinitializer, align 32
@__m_MOD_zflt_s = unnamed_addr global %"struct.array1_real(kind=4).22" zeroinitializer, align 32
@__m_MOD_zflt = unnamed_addr global %"struct.array2_real(kind=4).23" zeroinitializer, align 32
@__m_MOD_zflsu_par = unnamed_addr global %"struct.array1_real(kind=4).24" zeroinitializer, align 32
@__m_MOD_zflsu = unnamed_addr global %"struct.array1_real(kind=4).25" zeroinitializer, align 32
@__m_MOD_zflsp_par = unnamed_addr global %"struct.array1_real(kind=4).26" zeroinitializer, align 32
@__m_MOD_zflsp = unnamed_addr global %"struct.array1_real(kind=4).27" zeroinitializer, align 32
@__m_MOD_zflsdir = unnamed_addr global %"struct.array2_real(kind=4).28" zeroinitializer, align 32
@__m_MOD_zflsd_par = unnamed_addr global %"struct.array1_real(kind=4).29" zeroinitializer, align 32
@__m_MOD_zflsd = unnamed_addr global %"struct.array1_real(kind=4).30" zeroinitializer, align 32
@__m_MOD_zfls_s = unnamed_addr global %"struct.array1_real(kind=4).31" zeroinitializer, align 32
@__m_MOD_zfls = unnamed_addr global %"struct.array2_real(kind=4).32" zeroinitializer, align 32
@__m_MOD_zflpar = unnamed_addr global %"struct.array1_real(kind=4).33" zeroinitializer, align 32
@__m_MOD_zduo3f = unnamed_addr global %"struct.array2_real(kind=4).34" zeroinitializer, align 32
@__m_MOD_zduco2f = unnamed_addr global %"struct.array2_real(kind=4).35" zeroinitializer, align 32
@__m_MOD_zclwc = unnamed_addr global %"struct.array2_real(kind=4).36" zeroinitializer, align 32
@__m_MOD_zclcmin = unnamed_addr global %"struct.array2_real(kind=4).37" zeroinitializer, align 32
@__m_MOD_zclcmax = unnamed_addr global %"struct.array2_real(kind=4).38" zeroinitializer, align 32
@__m_MOD_zclcm1 = unnamed_addr global %"struct.array1_real(kind=4).39" zeroinitializer, align 32
@__m_MOD_zclc = unnamed_addr global %"struct.array2_real(kind=4).40" zeroinitializer, align 32
@__m_MOD_zciwc = unnamed_addr global %"struct.array2_real(kind=4).41" zeroinitializer, align 32
@__m_MOD_zapre = unnamed_addr global %"struct.array1_real(kind=4).42" zeroinitializer, align 32
@__m_MOD_zalth = unnamed_addr global %"struct.array1_real(kind=4).43" zeroinitializer, align 32
@__m_MOD_zalso = unnamed_addr global %"struct.array1_real(kind=4).44" zeroinitializer, align 32
@__m_MOD_zaetr_top = unnamed_addr global %"struct.array1_real(kind=4).45" zeroinitializer, align 32
@__m_MOD_zaequo = unnamed_addr global %"struct.array1_real(kind=4).46" zeroinitializer, align 32
@__m_MOD_zaeqso = unnamed_addr global %"struct.array1_real(kind=4).47" zeroinitializer, align 32
@__m_MOD_zaeqlo = unnamed_addr global %"struct.array1_real(kind=4).48" zeroinitializer, align 32
@__m_MOD_zaeqdo = unnamed_addr global %"struct.array1_real(kind=4).49" zeroinitializer, align 32
@__m_MOD_zaeq5 = unnamed_addr global %"struct.array2_real(kind=4).50" zeroinitializer, align 32
@__m_MOD_zaeq4 = unnamed_addr global %"struct.array2_real(kind=4).51" zeroinitializer, align 32
@__m_MOD_zaeq3 = unnamed_addr global %"struct.array2_real(kind=4).52" zeroinitializer, align 32
@__m_MOD_zaeq2 = unnamed_addr global %"struct.array2_real(kind=4).53" zeroinitializer, align 32
@__m_MOD_zaeq1 = unnamed_addr global %"struct.array2_real(kind=4).54" zeroinitializer, align 32
@__m_MOD_zaeadk = unnamed_addr global %"struct.array1_real(kind=4).55" zeroinitializer, align 32
@__m_MOD_z_zzfltu = unnamed_addr global %"struct.array2_real(kind=4).56" zeroinitializer, align 32
@__m_MOD_z_zzfltd = unnamed_addr global %"struct.array2_real(kind=4).57" zeroinitializer, align 32
@__m_MOD_z_zzflsu_par = unnamed_addr global %"struct.array2_real(kind=4).58" zeroinitializer, align 32
@__m_MOD_z_zzflsu = unnamed_addr global %"struct.array2_real(kind=4).59" zeroinitializer, align 32
@__m_MOD_z_zzflsp_par = unnamed_addr global %"struct.array2_real(kind=4).60" zeroinitializer, align 32
@__m_MOD_z_zzflsp = unnamed_addr global %"struct.array2_real(kind=4).61" zeroinitializer, align 32
@__m_MOD_z_zzflsd_par = unnamed_addr global %"struct.array2_real(kind=4).62" zeroinitializer, align 32
@__m_MOD_z_zzflsd = unnamed_addr global %"struct.array2_real(kind=4).63" zeroinitializer, align 32
@__m_MOD_ucl = unnamed_addr global float 0.000000e+00
@__m_MOD_uc2 = unnamed_addr global float 0.000000e+00
@__m_MOD_uc1 = unnamed_addr global float 0.000000e+00
@__m_MOD_tg_ra = unnamed_addr global %"struct.array2_real(kind=4).64" zeroinitializer, align 32
@__m_MOD_t0_melt = unnamed_addr global float 0.000000e+00
@__m_MOD_solc = unnamed_addr global float 0.000000e+00
@__m_MOD_sigma = unnamed_addr global float 0.000000e+00
@__m_MOD_rvd_m_o = unnamed_addr global float 0.000000e+00
@__m_MOD_rho_w = unnamed_addr global float 0.000000e+00
@__m_MOD_rho_ice = unnamed_addr global float 0.000000e+00
@__m_MOD_rdv = unnamed_addr global float 0.000000e+00
@__m_MOD_rdocp = unnamed_addr global float 0.000000e+00
@__m_MOD_rcpv = unnamed_addr global float 0.000000e+00
@__m_MOD_rcpl = unnamed_addr global float 0.000000e+00
@__m_MOD_rad_csalbw = global [10 x float] zeroinitializer, align 32
@__m_MOD_r_v = unnamed_addr global float 0.000000e+00
@__m_MOD_r_earth = unnamed_addr global float 0.000000e+00
@__m_MOD_r_d = unnamed_addr global float 0.000000e+00
@__m_MOD_qi0 = unnamed_addr global float 0.000000e+00
@__m_MOD_qc0 = unnamed_addr global float 0.000000e+00
@__m_MOD_pi = unnamed_addr global float 0.000000e+00
@__m_MOD_p0ref = unnamed_addr global float 0.000000e+00
@__m_MOD_o_m_rdv = unnamed_addr global float 0.000000e+00
@__m_MOD_nradcoarse = unnamed_addr global i32 0
@__m_MOD_nproma = unnamed_addr global i32 0
@__m_MOD_nlgw_ini = unnamed_addr global i32 0
@__m_MOD_nlgw_bd = unnamed_addr global i32 0
@__m_MOD_nlgw = unnamed_addr global i32 0
@__m_MOD_nlastproma = unnamed_addr global i32 0
@__m_MOD_ninctura = unnamed_addr global i32 0
@__m_MOD_nincsso = unnamed_addr global i32 0
@__m_MOD_nincrad = unnamed_addr global i32 0
@__m_MOD_nincconv = unnamed_addr global i32 0
@__m_MOD_nhori = unnamed_addr global i32 0
@__m_MOD_nextrad = unnamed_addr global i32 0
@__m_MOD_nblock = unnamed_addr global i32 0
@__m_MOD_ltur = unnamed_addr global i32 0
@__m_MOD_ltmpcor = unnamed_addr global i32 0
@__m_MOD_ltkesso = unnamed_addr global i32 0
@__m_MOD_ltkecon = unnamed_addr global i32 0
@__m_MOD_lstomata = unnamed_addr global i32 0
@__m_MOD_lsso = unnamed_addr global i32 0
@__m_MOD_lsoil = unnamed_addr global i32 0
@__m_MOD_lseaice = unnamed_addr global i32 0
@__m_MOD_lradtopo = unnamed_addr global i32 0
@__m_MOD_lradf_avg = unnamed_addr global i32 0
@__m_MOD_lrad = unnamed_addr global i32 0
@__m_MOD_lprog_tke = unnamed_addr global i32 0
@__m_MOD_lprfcor = unnamed_addr global i32 0
@__m_MOD_lphys = unnamed_addr global i32 0
@__m_MOD_lnonloc = unnamed_addr global i32 0
@__m_MOD_lmulti_snow = unnamed_addr global i32 0
@__m_MOD_lmulti_layer = unnamed_addr global i32 0
@__m_MOD_lmelt_var = unnamed_addr global i32 0
@__m_MOD_lmelt = unnamed_addr global i32 0
@__m_MOD_llake = unnamed_addr global i32 0
@__m_MOD_limpltkediff = unnamed_addr global i32 0
@__m_MOD_lhocp = unnamed_addr global float 0.000000e+00
@__m_MOD_lh_v = unnamed_addr global float 0.000000e+00
@__m_MOD_lh_s = unnamed_addr global float 0.000000e+00
@__m_MOD_lh_f = unnamed_addr global float 0.000000e+00
@__m_MOD_lgsp = unnamed_addr global i32 0
@__m_MOD_lforest = unnamed_addr global i32 0
@__m_MOD_lexpcor = unnamed_addr global i32 0
@__m_MOD_lemiss = unnamed_addr global i32 0
@__m_MOD_ldiniprec = unnamed_addr global i32 0
@__m_MOD_lctke = unnamed_addr global i32 0
@__m_MOD_lcpfluc = unnamed_addr global i32 0
@__m_MOD_lconv_inst = unnamed_addr global i32 0
@__m_MOD_lconv_clo = unnamed_addr global i32 0
@__m_MOD_lconv = unnamed_addr global i32 0
@__m_MOD_lconf_avg = unnamed_addr global i32 0
@__m_MOD_lco2_stab = unnamed_addr global i32 0
@__m_MOD_lcape = unnamed_addr global i32 0
@__m_MOD_l_dzeta_d_needed = unnamed_addr global i32 0
@__m_MOD_l3dturb_metr = unnamed_addr global i32 0
@__m_MOD_l3dturb = unnamed_addr global i32 0
@__m_MOD_k_w = unnamed_addr global float 0.000000e+00
@__m_MOD_k_ice = unnamed_addr global float 0.000000e+00
@__m_MOD_iy_co2_stab = unnamed_addr global i32 0
@__m_MOD_itype_wcld = unnamed_addr global i32 0
@__m_MOD_itype_turb = unnamed_addr global i32 0
@__m_MOD_itype_trvg = unnamed_addr global i32 0
@__m_MOD_itype_tran = unnamed_addr global i32 0
@__m_MOD_itype_synd = unnamed_addr global i32 0
@__m_MOD_itype_sher = unnamed_addr global i32 0
@__m_MOD_itype_root = unnamed_addr global i32 0
@__m_MOD_itype_hydcond = unnamed_addr global i32 0
@__m_MOD_itype_hydbound = unnamed_addr global i32 0
@__m_MOD_itype_heatcond = unnamed_addr global i32 0
@__m_MOD_itype_gscp = unnamed_addr global i32 0
@__m_MOD_itype_evsl = unnamed_addr global i32 0
@__m_MOD_itype_conv = unnamed_addr global i32 0
@__m_MOD_itype_albedo = unnamed_addr global i32 0
@__m_MOD_itype_aerosol = unnamed_addr global i32 0
@__m_MOD_itim_fesft = unnamed_addr global i32 20
@__m_MOD_imode_turb = unnamed_addr global i32 0
@__m_MOD_imode_tran = unnamed_addr global i32 0
@__m_MOD_ico2_rad = unnamed_addr global i32 0
@__m_MOD_icldm_turb = unnamed_addr global i32 0
@__m_MOD_icldm_tran = unnamed_addr global i32 0
@__m_MOD_icldm_rad = unnamed_addr global i32 0
@__m_MOD_ibot_w_so = unnamed_addr global i32 0
@__m_MOD_gr = unnamed_addr global float 0.000000e+00
@__m_MOD_gq = unnamed_addr global float 0.000000e+00
@__m_MOD_gh = unnamed_addr global float 0.000000e+00
@__m_MOD_gamma = unnamed_addr global float 0.000000e+00
@__m_MOD_g = unnamed_addr global float 0.000000e+00
@__m_MOD_day_len = unnamed_addr global float 0.000000e+00
@__m_MOD_czmls = unnamed_addr global %"struct.array1_real(kind=4).65" zeroinitializer, align 32
@__m_MOD_czhls = unnamed_addr global %"struct.array1_real(kind=4).66" zeroinitializer, align 32
@__m_MOD_cwimax_ml = unnamed_addr global float 0x3EB0C6F7A0000000
@__m_MOD_cwimax = unnamed_addr global float 0x3F40624DE0000000
@__m_MOD_cwhc = unnamed_addr global float 0x3FA47AE140000000
@__m_MOD_ctend = unnamed_addr global float 0x4073926660000000
@__m_MOD_ctau_i = unnamed_addr global float 1.000000e+03
@__m_MOD_ctau2 = unnamed_addr global float 5.000000e+00
@__m_MOD_ctau1 = unnamed_addr global float 1.000000e+00
@__m_MOD_ctalb = unnamed_addr global float 0x3F70624DE0000000
@__m_MOD_csvoro = unnamed_addr global float 1.000000e+00
@__m_MOD_csnow_tmin = unnamed_addr global float 0x4070226660000000
@__m_MOD_csigma = unnamed_addr global float 7.500000e+01
@__m_MOD_csatdef = unnamed_addr global float 4.000000e+03
@__m_MOD_csandf = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_csalbw = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_csalb_snow_min = unnamed_addr global float 0x3FD99999A0000000
@__m_MOD_csalb_snow_max = unnamed_addr global float 0x3FE6666660000000
@__m_MOD_csalb_snow_fe = unnamed_addr global float 0x3FC99999A0000000
@__m_MOD_csalb_snow_fd = unnamed_addr global float 0x3FC99999A0000000
@__m_MOD_csalb_snow = unnamed_addr global float 0x3FE6666660000000
@__m_MOD_csalb_p = unnamed_addr global float 0x3FC3333340000000
@__m_MOD_csalb = global [10 x float] zeroinitializer, align 32
@__m_MOD_crsmin = unnamed_addr global float 1.500000e+02
@__m_MOD_crsmax = unnamed_addr global float 4.000000e+03
@__m_MOD_crock = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_crhowm = unnamed_addr global float 0x3FE99999A0000000
@__m_MOD_crhosmint = unnamed_addr global float 0x3FC99999A0000000
@__m_MOD_crhosminf = unnamed_addr global float 5.000000e+01
@__m_MOD_crhosmin_ml = unnamed_addr global float 5.000000e+01
@__m_MOD_crhosmin = unnamed_addr global float 5.000000e+02
@__m_MOD_crhosmaxt = unnamed_addr global float 0x3FD99999A0000000
@__m_MOD_crhosmaxf = unnamed_addr global float 1.500000e+02
@__m_MOD_crhosmax_ml = unnamed_addr global float 4.000000e+02
@__m_MOD_crhosmax = unnamed_addr global float 8.000000e+02
@__m_MOD_crhos_dw = unnamed_addr global float 3.000000e+02
@__m_MOD_crhoc = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_cpwp = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_cporv = global [10 x float] zeroinitializer, align 32
@__m_MOD_cpdr = unnamed_addr global float 0.000000e+00
@__m_MOD_cparcrit = unnamed_addr global float 1.000000e+02
@__m_MOD_cp_d = unnamed_addr global float 0.000000e+00
@__m_MOD_con_m = unnamed_addr global float 0.000000e+00
@__m_MOD_con_h = unnamed_addr global float 0.000000e+00
@__m_MOD_clgk0 = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_clai = unnamed_addr global float 3.000000e+00
@__m_MOD_ckw1 = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_ckw0 = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_ckrdi = unnamed_addr global float 0x3EE4F8B580000000
@__m_MOD_ck0di = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_cik2 = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_cik1 = unnamed_addr global float 0x3F60624DE0000000
@__m_MOD_chcond = unnamed_addr global float 0x3F847AE140000000
@__m_MOD_chc_w = unnamed_addr global float 4.180000e+03
@__m_MOD_chc_i = unnamed_addr global float 2.100000e+03
@__m_MOD_cfinull = unnamed_addr global float 0x3FC99999A0000000
@__m_MOD_cfcap = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_cf_w = unnamed_addr global float 0x3F50624DE0000000
@__m_MOD_cf_snow = unnamed_addr global float 0x3F8EB851E0000000
@__m_MOD_cdzw33 = unnamed_addr global float 0x3FECCCCCC0000000
@__m_MOD_cdzw23 = unnamed_addr global float 0x3FB47AE140000000
@__m_MOD_cdzw22 = unnamed_addr global float 0x3FECCCCCC0000000
@__m_MOD_cdzw13 = unnamed_addr global float 0x3F947AE140000000
@__m_MOD_cdzw12 = unnamed_addr global float 0x3FB99999A0000000
@__m_MOD_cdz1 = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_cdw1 = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_cdw0 = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_cdsmin = unnamed_addr global float 0x3F847AE140000000
@__m_MOD_cdmin = unnamed_addr global float 0x3DF12E0BE0000000
@__m_MOD_cdash = unnamed_addr global float 0x3FA99999A0000000
@__m_MOD_cclayf = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_cbedi = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_calasmin = unnamed_addr global float 0x3FC99999A0000000
@__m_MOD_calasmax = unnamed_addr global float 1.500000e+00
@__m_MOD_calas_dw = unnamed_addr global float 0x3FF4CCCCC0000000
@__m_MOD_cala1 = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_cala0 = unnamed_addr global [10 x float] zeroinitializer, align 32
@__m_MOD_cakw = unnamed_addr global float 0x3FE99999A0000000
@__m_MOD_cadp = global [10 x float] zeroinitializer, align 32
@__m_MOD_ca2 = unnamed_addr global float 0x3EA6255B60000000
@__m_MOD_b4w = unnamed_addr global float 0.000000e+00
@__m_MOD_b4i = unnamed_addr global float 0.000000e+00
@__m_MOD_b3 = unnamed_addr global float 0.000000e+00
@__m_MOD_b2w = unnamed_addr global float 0.000000e+00
@__m_MOD_b2i = unnamed_addr global float 0.000000e+00
@__m_MOD_b234w = unnamed_addr global float 0.000000e+00
@__m_MOD_b1 = unnamed_addr global float 0.000000e+00
@__m_MOD_arr2 = unnamed_addr global %"struct.array2_real(kind=4).67" zeroinitializer, align 32
@__m_MOD_arr1 = unnamed_addr global %"struct.array1_real(kind=4).68" zeroinitializer, align 32
@__m_MOD_aks4 = unnamed_addr global float 0.000000e+00
@__m_MOD_aks2 = unnamed_addr global float 0.000000e+00
@options.75.2363 = internal constant [8 x i32] [i32 68, i32 511, i32 0, i32 0, i32 0, i32 1, i32 0, i32 1], align 32

; Function Attrs: nounwind uwtable
define void @__m_MOD_break_scop() #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @__m_MOD_radiation_rg_organize(i32* noalias %ierror, [0 x i8]* noalias %yerrmsg, [14 x i8]* noalias %ydate_ini, i32* noalias %lzradstep, i32* noalias %nproma, i32* noalias %ke, i32* noalias %ke_soil, i32* noalias %ke_snow, i32* noalias %ipend, [0 x float]* noalias %aer_bc, [0 x float]* noalias %aerlan, [0 x float]* noalias %aer_or, [0 x float]* noalias %aersea, [0 x float]* noalias %aer_ss, [0 x float]* noalias %aer_su, [0 x float]* noalias %aerurb, [0 x float]* noalias %alb_dif, [0 x float]* noalias %alb_dry, [0 x float]* noalias %alb_sat, [0 x float]* noalias %clc_con, [0 x float]* noalias %depth_lk, [0 x float]* noalias %dp0, [0 x float]* noalias %emis_rad, [0 x float]* noalias %for_d, [0 x float]* noalias %for_e, [0 x float]* noalias %freshsnow, [0 x float]* noalias %h_ice, [0 x float]* noalias %hmo3, [0 x i32]* noalias %llandmask, [0 x float]* noalias %p0, [0 x float]* noalias %p0hl, [0 x float]* noalias %plcov, [0 x float]* noalias %pp, [0 x float]* noalias %ps, [0 x float]* noalias %qc, [0 x float]* noalias %qi, [0 x float]* noalias %qv, [0 x float]* noalias %rcld, [0 x float]* noalias %soiltyp, [0 x float]* noalias %swdir_cor, [0 x float]* noalias %t, [0 x float]* noalias %t_g, [0 x float]* noalias %t_ice, [0 x float]* noalias %t_s, [0 x float]* noalias %t_snow, [0 x float]* noalias %t_snow_mult, [0 x float]* noalias %vio3, [0 x float]* noalias %w_g1, [0 x float]* noalias %w_snow, [0 x float]* noalias %w_so, [0 x float]* noalias %zskyview, [0 x float]* noalias %zsmu0_fesft, [0 x float]* noalias %zsmu0_flux, [0 x float]* noalias %alb_rad, [0 x float]* noalias %clch, [0 x float]* noalias %clcl, [0 x float]* noalias %clcm, [0 x float]* noalias %clct, [0 x float]* noalias %lwd_s, [0 x float]* noalias %lwu_s, [0 x float]* noalias %qc_rad, [0 x float]* noalias %qi_rad, [0 x float]* noalias %sodwddm, [0 x float]* noalias %thbs, [0 x float]* noalias %thbt, [0 x float]* noalias %thhr, [0 x float]* noalias %aerdes, [0 x float]* noalias %aer_du, [0 x float]* noalias %clc_sgs, [0 x float]* noalias %sod_t, [0 x float]* noalias %sotr, [0 x float]* noalias %sotr_par, [0 x float]* noalias %swtrdifd_s, [0 x float]* noalias %swtrdifu_s, [0 x float]* noalias %swtrdir_s, [0 x float]* noalias %pabs, [0 x float]* noalias %sobs, [0 x float]* noalias %sobt, [0 x float]* noalias %swdifd_s, [0 x float]* noalias %swdifu_s, [0 x float]* noalias %swdir_s, [0 x float]* noalias %sohr, i32 %_yerrmsg, i32 %_ydate_ini) unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %tmp = load i32, i32* %nproma, align 4
  %tmp11 = sext i32 %tmp to i64
  %tmp12 = icmp sgt i64 %tmp11, 0
  %tmp13 = select i1 %tmp12, i64 %tmp11, i64 0
  %not = xor i64 %tmp13, -1
  tail call void @__m_MOD_break_scop() #0
  %tmp14 = load i32, i32* %ipend, align 4
  %tmp15 = icmp sgt i32 %tmp14, 0
  br i1 %tmp15, label %"3.preheader", label %"41"

"3.preheader":                                    ; preds = %entry.split
  br label %"3"

"3":                                              ; preds = %"39", %"3.preheader"
  %tmp16 = phi i32 [ %tmp192, %"39" ], [ 1, %"3.preheader" ]
  tail call void @__m_MOD_break_scop() #0
  %tmp17 = load i32, i32* @__m_MOD_lemiss, align 4, !range !0
  %tmp18 = icmp eq i32 %tmp17, 0
  %tmp19 = load float*, float** bitcast (%"struct.array1_real(kind=4).43"* @__m_MOD_zalth to float**), align 32
  %tmp20 = sext i32 %tmp16 to i64
  %tmp21 = load i64, i64* getelementptr inbounds (%"struct.array1_real(kind=4).43", %"struct.array1_real(kind=4).43"* @__m_MOD_zalth, i64 0, i32 1), align 8
  %tmp22 = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp21, i64 1, i64 %tmp20) #2
  br i1 %tmp18, label %"5", label %"4"

"4":                                              ; preds = %"3"
  %tmp23 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp20) #2
  %tmp24 = getelementptr [0 x float], [0 x float]* %emis_rad, i64 0, i64 %tmp23
  %tmp25 = load float, float* %tmp24, align 4
  %tmp26 = fsub float 1.000000e+00, %tmp25
  %tmp27 = getelementptr float, float* %tmp19, i64 %tmp22
  store float %tmp26, float* %tmp27, align 4
  br label %"6"

"5":                                              ; preds = %"3"
  %tmp28 = load i32, i32* bitcast (float* @__m_MOD_ctalb to i32*), align 4
  %tmp29 = getelementptr float, float* %tmp19, i64 %tmp22
  %tmp30 = bitcast float* %tmp29 to i32*
  store i32 %tmp28, i32* %tmp30, align 4
  br label %"6"

"6":                                              ; preds = %"5", %"4"
  %tmp31 = load i32, i32* @__m_MOD_lmulti_snow, align 4, !range !0
  %tmp32 = icmp eq i32 %tmp31, 0
  %tmp33 = sext i32 %tmp16 to i64
  br i1 %tmp32, label %"10", label %"7"

"7":                                              ; preds = %"6"
  %tmp34 = tail call i64 @_gfortran_polly_array_index_2(i64 %not, i64 %tmp13, i64 1, i64 1, i64 %tmp33) #2
  %tmp35 = getelementptr [0 x float], [0 x float]* %t_snow_mult, i64 0, i64 %tmp34
  %tmp36 = load float, float* %tmp35, align 4
  %tmp37 = fcmp olt float %tmp36, 0.000000e+00
  br i1 %tmp37, label %"8", label %"9"

"8":                                              ; preds = %"7"
  %tmp38 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp33) #2
  %tmp39 = getelementptr [0 x float], [0 x float]* %t_g, i64 0, i64 %tmp38
  br label %"13"

"9":                                              ; preds = %"7"
  %tmp40 = tail call i64 @_gfortran_polly_array_index_2(i64 %not, i64 %tmp13, i64 1, i64 1, i64 %tmp33) #2
  %tmp41 = getelementptr [0 x float], [0 x float]* %t_snow_mult, i64 0, i64 %tmp40
  br label %"13"

"10":                                             ; preds = %"6"
  %tmp42 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp33) #2
  %tmp43 = getelementptr [0 x float], [0 x float]* %t_snow, i64 0, i64 %tmp42
  %tmp44 = load float, float* %tmp43, align 4
  %tmp45 = fcmp olt float %tmp44, 0.000000e+00
  %tmp46 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp33) #2
  br i1 %tmp45, label %"11", label %"12"

"11":                                             ; preds = %"10"
  %tmp47 = getelementptr [0 x float], [0 x float]* %t_g, i64 0, i64 %tmp46
  br label %"13"

"12":                                             ; preds = %"10"
  %tmp48 = getelementptr [0 x float], [0 x float]* %t_snow, i64 0, i64 %tmp46
  br label %"13"

"13":                                             ; preds = %"12", %"11", %"9", %"8"
  %.in = phi float* [ %tmp48, %"12" ], [ %tmp47, %"11" ], [ %tmp41, %"9" ], [ %tmp39, %"8" ]
  %tmp49 = load float, float* %.in, align 4
  %tmp50 = sext i32 %tmp16 to i64
  %tmp51 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp50) #2
  %tmp52 = getelementptr [0 x i32], [0 x i32]* %llandmask, i64 0, i64 %tmp51
  %tmp53 = load i32, i32* %tmp52, align 4, !range !0
  %tmp54 = icmp eq i32 %tmp53, 0
  br i1 %tmp54, label %"14", label %"15"

"14":                                             ; preds = %"13"
  %tmp55 = load float, float* @__m_MOD_t0_melt, align 4
  %tmp56 = fadd float %tmp55, 0xBFFB333340000000
  %tmp57 = fcmp ugt float %tmp56, %tmp49
  br i1 %tmp57, label %"16", label %"15"

"15":                                             ; preds = %"14", %"13"
  %tmp58 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp50) #2
  %tmp59 = getelementptr [0 x float], [0 x float]* %soiltyp, i64 0, i64 %tmp58
  %tmp60 = load float, float* %tmp59, align 4
  %tmp61 = tail call i64 @lroundf(float %tmp60) #1
  br label %"16"

"16":                                             ; preds = %"15", %"14"
  %tmp62 = phi i64 [ %tmp61, %"15" ], [ 10, %"14" ]
  %tmp63 = load float*, float** bitcast (%"struct.array1_real(kind=4).44"* @__m_MOD_zalso to float**), align 32
  %tmp64 = load i64, i64* getelementptr inbounds (%"struct.array1_real(kind=4).44", %"struct.array1_real(kind=4).44"* @__m_MOD_zalso, i64 0, i32 1), align 8
  %tmp65 = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp64, i64 1, i64 %tmp50) #2
  %sext = shl i64 %tmp62, 32
  %tmp66 = ashr exact i64 %sext, 32
  %tmp67 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp66) #2
  %tmp68 = getelementptr [10 x float], [10 x float]* @__m_MOD_csalb, i64 0, i64 %tmp67
  %tmp69 = bitcast float* %tmp68 to i32*
  %tmp70 = load i32, i32* %tmp69, align 4
  %tmp71 = getelementptr float, float* %tmp63, i64 %tmp65
  %tmp72 = bitcast float* %tmp71 to i32*
  store i32 %tmp70, i32* %tmp72, align 4
  %tmp73 = load i32, i32* @__m_MOD_lsoil, align 4, !range !0
  %tmp74 = icmp eq i32 %tmp73, 0
  br i1 %tmp74, label %"39", label %"17"

"17":                                             ; preds = %"16"
  %tmp75 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp50) #2
  %tmp76 = getelementptr [0 x i32], [0 x i32]* %llandmask, i64 0, i64 %tmp75
  %tmp77 = load i32, i32* %tmp76, align 4, !range !0
  %tmp78 = icmp eq i32 %tmp77, 0
  br i1 %tmp78, label %"39", label %"18"

"18":                                             ; preds = %"17"
  %tmp79 = load i32, i32* @__m_MOD_itype_albedo, align 4
  switch i32 %tmp79, label %"39" [
    i32 1, label %"19"
    i32 2, label %"23"
    i32 3, label %"38"
  ]

"19":                                             ; preds = %"18"
  %tmp80 = load i32, i32* @__m_MOD_lmulti_layer, align 4, !range !0
  %tmp81 = icmp eq i32 %tmp80, 0
  %tmp82 = load float*, float** bitcast (%"struct.array1_real(kind=4).44"* @__m_MOD_zalso to float**), align 32
  %tmp83 = load i64, i64* getelementptr inbounds (%"struct.array1_real(kind=4).44", %"struct.array1_real(kind=4).44"* @__m_MOD_zalso, i64 0, i32 1), align 8
  %tmp84 = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp83, i64 1, i64 %tmp50) #2
  %tmp85 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp66) #2
  %tmp86 = getelementptr [10 x float], [10 x float]* @__m_MOD_csalb, i64 0, i64 %tmp85
  %tmp87 = load float, float* %tmp86, align 4
  %tmp88 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp66) #2
  %tmp89 = getelementptr [10 x float], [10 x float]* @__m_MOD_rad_csalbw, i64 0, i64 %tmp88
  %tmp90 = load float, float* %tmp89, align 4
  br i1 %tmp81, label %"21", label %"20"

"20":                                             ; preds = %"19"
  %tmp91 = tail call i64 @_gfortran_polly_array_index_2(i64 %not, i64 %tmp13, i64 1, i64 1, i64 %tmp50) #2
  %tmp92 = getelementptr [0 x float], [0 x float]* %w_so, i64 0, i64 %tmp91
  %tmp93 = load float, float* %tmp92, align 4
  %tmp94 = fmul float %tmp90, %tmp93
  %tmp95 = fsub float %tmp87, %tmp94
  %tmp96 = getelementptr float, float* %tmp82, i64 %tmp84
  store float %tmp95, float* %tmp96, align 4
  br label %"39"

"21":                                             ; preds = %"19"
  %tmp97 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp50) #2
  %tmp98 = getelementptr [0 x float], [0 x float]* %w_g1, i64 0, i64 %tmp97
  %tmp99 = load float, float* %tmp98, align 4
  %tmp100 = fmul float %tmp90, %tmp99
  %tmp101 = fsub float %tmp87, %tmp100
  %tmp102 = getelementptr float, float* %tmp82, i64 %tmp84
  store float %tmp101, float* %tmp102, align 4
  br label %"39"

"23":                                             ; preds = %"18"
  %tmp103 = load i32, i32* @__m_MOD_lmulti_layer, align 4, !range !0
  %tmp104 = icmp eq i32 %tmp103, 0
  br i1 %tmp104, label %"29", label %"24"

"24":                                             ; preds = %"23"
  %tmp105 = tail call i64 @_gfortran_polly_array_index_2(i64 %not, i64 %tmp13, i64 1, i64 1, i64 %tmp50) #2
  %tmp106 = getelementptr [0 x float], [0 x float]* %w_so, i64 0, i64 %tmp105
  %tmp107 = load float, float* %tmp106, align 4
  %tmp108 = fmul float %tmp107, 5.000000e-01
  %tmp109 = load float*, float** bitcast (%"struct.array1_real(kind=4).65"* @__m_MOD_czmls to float**), align 32
  %tmp110 = load i64, i64* getelementptr inbounds (%"struct.array1_real(kind=4).65", %"struct.array1_real(kind=4).65"* @__m_MOD_czmls, i64 0, i32 1), align 8
  %tmp111 = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp110, i64 1, i64 1) #2
  %tmp112 = getelementptr float, float* %tmp109, i64 %tmp111
  %tmp113 = load float, float* %tmp112, align 4
  %tmp114 = fdiv float %tmp108, %tmp113
  %tmp115 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp66) #2
  %tmp116 = getelementptr [10 x float], [10 x float]* @__m_MOD_cadp, i64 0, i64 %tmp115
  %tmp117 = load float, float* %tmp116, align 4
  %tmp118 = fsub float %tmp114, %tmp117
  %tmp119 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp66) #2
  %tmp120 = getelementptr [10 x float], [10 x float]* @__m_MOD_cporv, i64 0, i64 %tmp119
  %tmp121 = load float, float* %tmp120, align 4
  %tmp122 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp66) #2
  %tmp123 = getelementptr [10 x float], [10 x float]* @__m_MOD_cadp, i64 0, i64 %tmp122
  %tmp124 = load float, float* %tmp123, align 4
  %tmp125 = fsub float %tmp121, %tmp124
  %tmp126 = fdiv float %tmp118, %tmp125
  %tmp127 = fcmp ogt float %tmp126, 0.000000e+00
  %tmp128 = select i1 %tmp127, float %tmp126, float 0.000000e+00
  %tmp129 = fcmp olt float %tmp128, 1.000000e+00
  %tmp130 = select i1 %tmp129, float %tmp128, float 1.000000e+00
  %tmp131 = load float*, float** bitcast (%"struct.array1_real(kind=4).44"* @__m_MOD_zalso to float**), align 32
  %tmp132 = load i64, i64* getelementptr inbounds (%"struct.array1_real(kind=4).44", %"struct.array1_real(kind=4).44"* @__m_MOD_zalso, i64 0, i32 1), align 8
  %tmp133 = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp132, i64 1, i64 %tmp50) #2
  %tmp134 = fsub float 1.000000e+00, %tmp130
  %tmp135 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp50) #2
  %tmp136 = getelementptr [0 x float], [0 x float]* %alb_dry, i64 0, i64 %tmp135
  %tmp137 = load float, float* %tmp136, align 4
  %tmp138 = fmul float %tmp137, %tmp134
  %tmp139 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp50) #2
  %tmp140 = getelementptr [0 x float], [0 x float]* %alb_sat, i64 0, i64 %tmp139
  %tmp141 = load float, float* %tmp140, align 4
  %tmp142 = fmul float %tmp130, %tmp141
  %tmp143 = fadd float %tmp138, %tmp142
  %tmp144 = getelementptr float, float* %tmp131, i64 %tmp133
  store float %tmp143, float* %tmp144, align 4
  br label %"39"

"29":                                             ; preds = %"23"
  %tmp145 = load i32, i32* @__m_MOD_nlgw, align 4
  %tmp146 = icmp eq i32 %tmp145, 2
  %tmp147 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp50) #2
  %tmp148 = getelementptr [0 x float], [0 x float]* %w_g1, i64 0, i64 %tmp147
  %tmp149 = load float, float* %tmp148, align 4
  %__m_MOD_cdzw12.val = load float, float* @__m_MOD_cdzw12, align 4
  %__m_MOD_cdzw13.val = load float, float* @__m_MOD_cdzw13, align 4
  %tmp150 = select i1 %tmp146, float %__m_MOD_cdzw12.val, float %__m_MOD_cdzw13.val
  %tmp151 = fdiv float %tmp149, %tmp150
  %tmp152 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp66) #2
  %tmp153 = getelementptr [10 x float], [10 x float]* @__m_MOD_cadp, i64 0, i64 %tmp152
  %tmp154 = load float, float* %tmp153, align 4
  %tmp155 = fsub float %tmp151, %tmp154
  %tmp156 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp66) #2
  %tmp157 = getelementptr [10 x float], [10 x float]* @__m_MOD_cporv, i64 0, i64 %tmp156
  %tmp158 = load float, float* %tmp157, align 4
  %tmp159 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp66) #2
  %tmp160 = getelementptr [10 x float], [10 x float]* @__m_MOD_cadp, i64 0, i64 %tmp159
  %tmp161 = load float, float* %tmp160, align 4
  %tmp162 = fsub float %tmp158, %tmp161
  %tmp163 = fdiv float %tmp155, %tmp162
  %tmp164 = fcmp ogt float %tmp163, 0.000000e+00
  %tmp165 = select i1 %tmp164, float %tmp163, float 0.000000e+00
  %tmp166 = fcmp olt float %tmp165, 1.000000e+00
  %tmp167 = select i1 %tmp166, float %tmp165, float 1.000000e+00
  %tmp168 = load float*, float** bitcast (%"struct.array1_real(kind=4).44"* @__m_MOD_zalso to float**), align 32
  %tmp169 = load i64, i64* getelementptr inbounds (%"struct.array1_real(kind=4).44", %"struct.array1_real(kind=4).44"* @__m_MOD_zalso, i64 0, i32 1), align 8
  %tmp170 = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp169, i64 1, i64 %tmp50) #2
  %tmp171 = fsub float 1.000000e+00, %tmp167
  %tmp172 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp50) #2
  %tmp173 = getelementptr [0 x float], [0 x float]* %alb_dry, i64 0, i64 %tmp172
  %tmp174 = load float, float* %tmp173, align 4
  %tmp175 = fmul float %tmp174, %tmp171
  %tmp176 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp50) #2
  %tmp177 = getelementptr [0 x float], [0 x float]* %alb_sat, i64 0, i64 %tmp176
  %tmp178 = load float, float* %tmp177, align 4
  %tmp179 = fmul float %tmp167, %tmp178
  %tmp180 = fadd float %tmp175, %tmp179
  %tmp181 = getelementptr float, float* %tmp168, i64 %tmp170
  store float %tmp180, float* %tmp181, align 4
  br label %"39"

"38":                                             ; preds = %"18"
  %tmp182 = load float*, float** bitcast (%"struct.array1_real(kind=4).44"* @__m_MOD_zalso to float**), align 32
  %tmp183 = load i64, i64* getelementptr inbounds (%"struct.array1_real(kind=4).44", %"struct.array1_real(kind=4).44"* @__m_MOD_zalso, i64 0, i32 1), align 8
  %tmp184 = tail call i64 @_gfortran_polly_array_index_1(i64 %tmp183, i64 1, i64 %tmp50) #2
  %tmp185 = tail call i64 @_gfortran_polly_array_index_1(i64 -1, i64 1, i64 %tmp50) #2
  %tmp186 = getelementptr [0 x float], [0 x float]* %alb_dif, i64 0, i64 %tmp185
  %tmp187 = bitcast float* %tmp186 to i32*
  %tmp188 = load i32, i32* %tmp187, align 4
  %tmp189 = getelementptr float, float* %tmp182, i64 %tmp184
  %tmp190 = bitcast float* %tmp189 to i32*
  store i32 %tmp188, i32* %tmp190, align 4
  br label %"39"

"39":                                             ; preds = %"38", %"29", %"24", %"21", %"20", %"18", %"17", %"16"
  %tmp191 = icmp eq i32 %tmp16, %tmp14
  %tmp192 = add i32 %tmp16, 1
  br i1 %tmp191, label %"41.loopexit", label %"3"

"41.loopexit":                                    ; preds = %"39"
  br label %"41"

"41":                                             ; preds = %"41.loopexit", %entry.split
  tail call void @__m_MOD_break_scop() #0
  ret void
}

; Function Attrs: readnone
declare i64 @_gfortran_polly_array_index_1(i64, i64, i64) #1

; Function Attrs: readnone
declare i64 @_gfortran_polly_array_index_2(i64, i64, i64, i64, i64) #1

declare i64 @lroundf(float)

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
  tail call void @_gfortran_set_options(i32 8, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @options.75.2363, i64 0, i64 0)) #2
  tail call void @MAIN__() #0
  ret i32 0
}

declare void @_gfortran_set_args(i32, i8**)

declare void @_gfortran_set_options(i32, i32*)

attributes #0 = { nounwind uwtable }
attributes #1 = { readnone }
attributes #2 = { nounwind }

!0 = !{i32 0, i32 2}
