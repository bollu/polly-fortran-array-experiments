!+ Source module  "radiation_rg"
!------------------------------------------------------------------------------

MODULE radiation_rg

!------------------------------------------------------------------------------
!
! Description:
!   The module "radiation" performs calculations related to the 
!   parameterization of radiative transfer.
!   Driving routine is the model procedure "organize_radiation", which
!   calls the main routine "fesft" of the radiation package.
!   Additionally, some diagnostics and gridpoint output is done.
!
!   All global variables of the model that are used by the interface routine
!   "organize_radiation" are imported by USE statements below.
!
!   The program package for the parameterization of radiative transfer consists
!   of following routines:
!         fesft, coe_so, coe_th, inv_so, ivs_th, opt_so and opt_th.
!
!   All parametric data that are required by these routines are defined in the
!   data module data_radiation.
!
!   Additionally, the routine init_radiation has to be called once before the 
!   first call of the driving routine fesft for the radiation package in the 
!   driving routine organize_radiation. Aerdis is a small help routine to 
!   receive some parameters for the vertical distribution of background 
!   aerosol in the driving routine.
!
!   The parameterization package has been provided by B. Ritter in a
!   Plug-compatible Fortran77-Version. Some technical modifications have been
!   done for the F90-Version:
!   Internal communication by common-blocks is replaced by module parameters,
!   scalars and arrays defined in module data_radiation. 
!
! Current Code Owner: DWD, Bodo Ritter
!  phone:  +49  69  8062 2703
!  fax:    +49  69  8062 3721
!  email:  Bodo.Ritter@dwd.de
!
! History:
! Version    Date       Name
! ---------- ---------- ----
! 1.1        1998/03/11 Guenter Doms     
!  Initial release
! 1.4        1998/05/22 Guenter Doms
!  Inclusion of control parameter l2tls to select time levels
!  according to the time integration scheme used.
! 1.8        1998/08/03 Ulrich Schaettler
!  Elmination of dependency from module data_io
! 1.20       1999/01/07 Guenther Doms
!  Renaming of some global variables
! 1.24       1999/03/01 Guenther Doms
!  Inclusion of the new prognostic 3-D array 'qi'.
! 1.29       1999/05/11 Ulrich Schaettler
!  Adapted interfaces to utility-modules
! 1.30       1999/06/24 Matthias Raschendofer
!  Use from module data_constants: rvd_m_o, lhop, b234w.
!  Use form module data_fields: rcld.
!  Use form module data-runcontrol: itype_wcld, icldm_rad.
!  Use form module meteo_utilities: cloud_diag
! 1.32       1999/08/24 Guenther Doms
!  top_con and bas_con removed from the use-list
! 1.34       1999/12/10 Ulrich Schaettler
!  Use new timing routines
! 1.39       2000/05/03 Ulrich Schaettler
!  Use variables klv800 and klv400 from data_modelconfig.
! 2.18       2002/07/16 Reinhold Schrodin
!  Eliminated variable rhde, use cf_snow instead
!  Use new variable for soil moisture in case of multi-layer soil model
! 3.5        2003/09/02 Ulrich Schaettler
!  Avoid global communication by providing the fields phi_tot, rla_tot
! 3.6        2003/12/11 Reinhold Schrodin
!  Adaptations for multi-layer soil model
! 3.7        2004/02/18 Ulrich Schaettler
!  Replace local logical variable lcl_ice by global variable lprog_qi
!  Renamed alb (alb_rad), phi (rlat), rla (rlon)
! 3.16       2005/07/22 Reinhold Schrodin
!  Use variables for_e and for_d from data_fields, csalb_snow_fd and
!  csalb_snow_fe from data_soil
! 3.18       2006/03/03 Ulrich Schaettler
!  Really included all the *.incf files in src_radiation.f90
!  Add variables and fields used by the lake model FLake
!  Some additionals for the Climate LM Version
! 3.21       2006/12/04 Burkhardt Rockel, Ulrich Schaettler
!  Added A2 scenarios for CO2; renamed variable sodwdir to sodwddm
!  Use alternatively t_g for determining soil type of grid cell
!  Use new NL variables from data_constants: clc_diag, q_crit
! 3.22       2007/01/24 Axel Seifert
!  Adapted a constant for computation of cloud cover of ice clouds
! V3_23        2007/03/30 Matthias Raschendorfer, Matteo Buzzi
!  Moving 'clc_diag' and 'q_crit' to MODULE data_turbulence.
!  Calculation of topographical correction if lradtopo=.TRUE.
! V4_1         2007/12/04 Ulrich Schaettler
!  Bug correction (found out by Catherine Meissner, IMK Karlsruhe):
!  The downward and upward component have to be changed in call to SR fesft
! V4_3         2008/02/25 Ulrich Schaettler
!  There were also other downward and upward component in the wrong order
! V4_4         2008/07/16 Ulrich Schaettler
!  Eliminated timing variables which are unused
!  Changed NL parameter lyear_360 to itype_calendar, to have several options
! V4_8         2009/02/16 Ulrich Schaettler; Guenther Zaengl
!  Included additional (output) fields (for CLM: Uli)
!  Use p0hl (reference pressure at half levels) for full consistency with
!  new reference atmosphere implementation
! V4_9         2009/07/16 Ulrich Schaettler
!  Removed boundary exchange for radiation averaging (now in organize_physics)
!  Introduced full 3D fields of local variables in organize_radiation for a
!   better vectorization of the interpolation for radiation averaging
!  Implemented COSMO-ART features (with ifdef)
! V4_10        2009/09/11 Matthias Raschendorfer, Jan-Peter Schulz
!  Bug correction for the case "icldm_rad==2" when coud ice is present.
!  Modifications for the new seaice scheme (Jan-Peter Schulz)
!  Additional vector optimizations by NEC
! V4_11        2009/11/30 Ekaterina Machulskaya, Juergen Helmert
!  Adaptations for running with multi-layer snow model
!  Implemented options for aerosol distribution and use of an external 
!      emissivity map (JH)
! V4_12        2010/05/11 Ulrich Schaettler
!  Renamed t0 to t0_melt because of conflicting names
!  Bug fix in call to exchg_boundaries (wrong vertical dimension) (Lucio Torrisi)
!  Init and use unified variables for all aerosol-types (JH)
!  Compute additional fields for sunshine duration (Oli Fuhrer)
!  Adaptations in the COSMO-ART part
! V4_13        2010/05/11 Michael Gertz
!  Adaptions to SVN
! V4_17        2011/02/24 Ulrich Blahak
!  Adapted interface of exchg_boundaries; corrected kzdims(1:20) -> kzdims(1:24);
!  eliminated my_peri_neigh
! V4_18        2011/05/26 Ulrich Schaettler
!  Use local 2D array zskyview and use 1D slice of it (because global array is
!   allocated only for lradtopo, but was used in SR interfaces)
!  Smoothing field swdifu_s (for output) after coarse grid computation
!  Use of lgas and call to SR calcjval of COSMO-ART only for lgas (Christoph Knote)
!  Bug fix for computing qc_rad, qi_rad in case of a coarser grid (Victor Venema)
! V4_20        2011/08/31 Juergen Helmert / Victor Venema
!  Bug correction in the sub grid scale cloudiness
!  Replaced arguments p0 and pp in SR cloud_diag by p_tot (Uli Schaettler)
!  Bug fix in setting full variables after coarse radiation step (TR)
! V4_22        2012/01/31 Thorsten Reinhardt
!  Adaptations for solar zenith angle updating in every timestep.
! V4_23        2012/05/10 Axel Seifert, CLM, Juergen Helmert
!  Modification of the cloud cover of ice clouds, to get a more realistic cloud
!    cover, compared to Lindenberg cloud radar (Axel Seifert)
!  CLM:
!  - Include the new RCPs RCP2.6 (=RCP3PD), RCP4.5, RCP6, and RCP8.5
!    Limiter for GHG forcing
!  - CO2 stabilisation: new Namelist parameters iy_co2_stab and lco2_stab
!  - Introduction of prescribed surface albedo depending on itype_albedo
!  Additional options for itype_albedo (Juergen Helmert)
! V4_24        2012/06/22 Hendrik Reich
!  Adapted length of strings for date variables
! V4_25        2012/09/28 Anne Roches, Oliver Fuhrer, Hans-Juergen Panitz
!  Replaced qx-variables by using them from the tracer module
!  Introduced nexch_tag for MPI boundary exchange tag to replace ntstep (HJP)
! Ulrich Blahak: Some bugfixes for periodic boundary conditions:
!  For nradcoarse > 1, changed IF clause (my_cart_neigh == -1) in initialization of
!    istartrad, etc. to avoid crash in case of periodic BCs.
!  Calculation of aerosol distribution, local sun time and sun position changed for
!    periodic BCs to make aerosols and the sun "pseudo-periodic":
!    aerosols, sun time and sun position are constant along
!      - rotated latitudes  for lperi_x=.TRUE.:
!      - rotated longitudes for lperi_y=.TRUE.:
!      Values are taken from the model reference point (as implied by pollon, pollat);
!  In computation of sun_azi and sun_el, the loop over js and i has been splitted
!    in two parts, but the scalar zeitrad was not correct in second part. This has been
!    fixed by making it a vector over i as above and deleting the splitting of the js-loop.
!    (this can change results for lradtopo=.TRUE.
! Other bugfixes (not related to periodic BC) 
!  Time level nnow was specified for qi, changed to the flexible nzx as for qv,qc.
!     No influence on results, because nzx equals nnow.
!  Wrong index js used for averaging values to fesft input for nradcoarse > 1
! V4_26        2012/12/06 Anne Roches
!  Renamed local variable lprog_qi to lzprog_qi not to confuse it with the
!   global variable. Initialize this variable explicitely to .FALSE., which had
!   been forgotten before.
! V4_27        2013/03/19 Astrid Kerkweg
!  Introduction of MESSy interface
! V4_28        2013/07/12 Ulrich Schaettler
!  Use variables for vertical grid from module vgrid_refatm_utils (US)
! V4_29        2013/10/04 Astrid Kerkweg, Ulrich Schaettler
!  Unification of MESSy interfaces and COSMO Tracer structure
!  For the COSMO-Model only use vcoord from vgrid_refatm_utils
! @VERSION@    @DATE@     Matthias Raschendorfer, Oliver Fuhrer, Ulrich Schaettler
!  Introduction of LOGICAL lscm in order to employ always true geographical
!  longitude and latitude in case of a SC-run.
!  Introduction of working precision; but fesft and below subroutines have to be run in dp
!  Technical clean up of SR fesft (and below): removed second dimension, 
!    which is not present (US)
!
! Code Description:
! Language: Fortran 90.
! Software Standards: "European Standards for Writing and
! Documenting Exchangeable Fortran 90 Code".
!==============================================================================
!
! Declarations:
!
! Modules used:

USE data_parameters, ONLY :   &
    wp,sp,dp,  & ! KIND-type parameters for real variables
    iintegers, & ! KIND-type parameter for standard integer variables
    repsilon
!#    rprecision

!------------------------------------------------------------------------------

!#USE data_modelconfig, ONLY :   &

! 2. horizontal and vertical sizes of the fields and related variables
! --------------------------------------------------------------------
!#    ie,           & ! number of grid points in zonal direction
!#    ie_tot,       & ! the same for the total field
!#    je,           & ! number of grid points in meridional direction
!#    ke,           & ! number of grid points in vertical direction
!#    ke1,          & ! ke+1
!#    czmls,        & ! depth of the soil layers in meters

! 3. start- and end-indices for the computations in the horizontal layers
! -----------------------------------------------------------------------
!    These variables give the start- and the end-indices of the
!    forecast for the prognostic variables in a horizontal layer.
!    Note, that the indices for the wind-speeds u and v differ from
!    the other ones because of the use of the staggered Arakawa-C-grid.

!   zonal direction
!#    istart,       & ! start index for the forecast of w, t, qd, qw and pp
!#    iend,         & ! end index for the forecast of w, t, qd, qw and pp
!#    istartpar,    & ! start index for computations in the parallel program
!#    iendpar,      & ! end index for computations in the parallel program

!   meridional direction
!#    jstart,       & ! start index for the forecast of w, t, qd, qw and pp
!#    jend,         & ! end index for the forecast of w, t, qd, qw and pp
!#    jstartpar,    & ! start index for computations in the parallel program
!#    jendpar,      & ! end index for computations in the parallel program

! 4. variables for the time discretization and related variables
! --------------------------------------------------------------
!#    dt,           & ! long time-step
!#    degrad,       & ! factor for transforming degree to rad

! 5. constants for the horizontal rotated grid and related variables
! ------------------------------------------------------------------

!#    pollon,       & ! longitude of the rotated north pole (in degrees, E>0)
!#    pollat,       & ! latitude of the rotated north pole (in degrees, N>0)

! 7. Layer index corresponding to a specified pressure
! ----------------------------------------------------

!#    klv800,       & ! k index of the LM-mainlevel, on 800 HPa
!#    klv500,       & ! k index of the LM-mainlevel, on 500 HPa
!#    klv400,       & ! k index of the LM-mainlevel, on 400 HPa

! 8. Organizational variables to handle the COSMO humidity tracers
! ----------------------------------------------------------------
!#    idt_qv,  idt_qc,  idt_qi

! end of data_modelconfig
!------------------------------------------------------------------------------

!#USE data_constants  , ONLY :   &

! 1. mathematical constants
! -------------------------
!#    pi,           & ! circle constant

! 2. physical constants and related variables
! -------------------------------------------

!#    t0_melt,      & ! melting temperature of ice
!#    r_v,          & ! gas constant for water vapor
!#    rdv,          & ! r_d / r_v
!#    o_m_rdv,      & ! 1 - r_d/r_v
!#    rvd_m_o,      & ! r_v/r_d - 1
!#    cp_d,         & ! specific heat of dry air at constant pressure
!#    cpdr,         & ! 1 / cp_d
!#    rdocp,        & ! r_d / cp_d
!#    lh_v,         & ! latent heat of vapourization
!#    lhocp,        & ! lh_v/cp_d
!#    g,            & ! acceleration due to gravity
!#    sigma,        & ! Boltzmann-constant
!#    solc,         & ! solar constant

! 3. constants for parametrizations
! ---------------------------------
!#    b1,           & ! variables for computing the saturation vapour pressure
!#    b2w,          & ! over water (w) and ice (i)
!#    b2i,          & !               -- " --
!#    b3,           & !               -- " --
!#    b4w,          & !               -- " --
!#    b4i,          & !               -- " --
!#    b234w,        & ! b2w * (b3 - b4w)
!#    uc1,          & ! variable for computing the rate of cloud cover in 
!#    uc2,          & ! the unsaturated case
!#    ucl             !               -- " --

! end of data_constants
!------------------------------------------------------------------------------

!#USE data_turbulence     , ONLY :   &

! 1. tuning constants for statistical cloud scheme:
! ------------------------------------------------------------

!#  clc_diag,     & ! cloud cover at saturation in statistical cloud diagnostic
!#  q_crit          ! critical value for normalized over-saturation

!------------------------------------------------------------------------------

!#USE data_fields     , ONLY :   &

! 1. constant fields for the reference atmosphere                     (unit)
! -----------------------------------------------
!#    p0         ,    & ! reference pressure at full levels             ( pa  )
!#    p0hl       ,    & ! reference pressure at half levels             ( Pa  )
!#    dp0        ,    & ! pressure thickness
!#    depth_lk   ,    & ! lake depth                                    (  m  )

! 2. external parameter fields                                        (unit)
! ----------------------------
!#    soiltyp    ,    & ! type of the soil (keys 0-9)                     --
!#    vio3       ,    & ! vertical integrated ozone contents            (pa O3)
!#    hmo3       ,    & ! ozone maximum                                 ( pa  )
!#    rlat       ,    & ! geographical latitude                         ( rad )
!#    rlon       ,    & ! geographical longitude                        ( rad )
!#    rlattot    ,    & ! geographical latitude                         ( rad )
!#    rlontot    ,    & ! geographical longitude                        ( rad )
!#    aer_su     ,    & ! monthly aerosol climatology sulfate drops     (0 - 1)
!#    aer_du     ,    & ! mon. aerosol climatology total dust           (0 - 1)
!#    aer_or     ,    & ! mon. aerosol climatology organic (water sol.) (0 - 1)
!#    aer_bc     ,    & ! mon. aerosol climatology black carbon         (0 - 1)
!#    aer_ss     ,    & ! mon. aerosol climatology sea salt             (0 - 1)
!#    emis_rad   ,    & ! thermal surface emissivity                    (0 - 1)
!#    aerlan     ,    & ! aerosol-distribution for rural areas            --
!#    aerurb     ,    & ! aerosol-distribution for urban areas            --
!#    aerdes     ,    & ! aerosol-distribution for desert areas           --
!#    aersea     ,    & ! aerosol-distribution for sea                    --
!#    plcov      ,    & ! fraction of plant cover                         --
!#    llandmask         ! landpoint mask
!#    for_e      ,    & ! ground fraction covered by evergreen forest     --
!#    for_d      ,    & ! ground fraction covered by deciduous forest     --
!#    alb_dry    ,    & ! surface albedo for dry soil                   (     )
!#    alb_sat    ,    & ! surface albedo for saturated soil             (     )
!#    alb_dif           ! solar surface albedo                          (     )

!#USE data_fields     , ONLY :   &

! 3. prognostic variables                                             (unit)
! -----------------------
!#    t          ,    & ! temperature                                   (  k  )
!#    pp         ,    & ! deviation from the reference pressure         ( pa  )

! 5. fields for surface values and soil model variables               (unit )
! -----------------------------------------------------
!#    ps        ,     & ! surface pressure                              ( pa  )
!#    t_s       ,     & ! surface temperature                           (  K  )
!#    t_snow    ,     & ! temperature of the snow-surface               (  k  )
!#    t_snow_mult,    & ! temperature of the snow-surface               (  k  )
!#    t_g       ,     & ! weighted surface temperature                  (  k  )
!#    w_snow            ! water content of snow                         (m H2O)
!#    w_g1      ,     & ! water content of the upper soil layer         (m H2O)
!#    w_so              ! multi-layer soil moisture                     (m H2O)

!#USE data_fields     , ONLY :   &

!   fields for prognostic variables of the lake model FLake or ocean
!   variables
!#    t_ice      ,    & ! temperature of ice/water surface              (  K  )
!#    h_ice      ,    & ! lake/sea ice thickness                        (  m  )

! 6. fields that are computed in the parametrization and dynamics     (unit )
! ---------------------------------------------------------------
!   turbulence statistics in the atmosphere
!   (defined on full levels)
!#    rcld        ,   & ! standard deviation of the saturation deficit    --

!   fields of the radiation
!#    sohr        ,   & ! rate of solar heating                         ( k/s )
!#    sotr,sotr_par,  & ! solar transmissivity
!#    thhr        ,   & ! rate of thermal heating                       ( k/s )
!#    clc_sgs     ,   & ! subgrid-scale stratiform cloud cover            --
!#    alb_rad     ,   & ! albedo of the ground                            --
!#    alb_rad_coarse ,   & ! albedo of the ground                            --
!#    sobs        ,   & ! solar radiation at the ground                 ( w/m2)
!#    thbs        ,   & ! thermal radiation at the ground               ( w/m2)
!#    pabs        ,   & ! photosynthetic active radiation at the ground ( w/m2)
!#    sobt        ,   & ! solar radiation at the upper boundary         ( w/m2)
                      ! of the atmosphere
!#    thbt        ,   & ! thermal radiation at the upper boundary       ( w/m2)
                      ! of the atmosphere
!#    clch        ,   & ! cloud cover with high clouds                    --   
!#    clcm        ,   & ! cloud cover with medium clouds                  --   
!#    clcl        ,   & ! cloud cover with low clouds                     --   
!#    clct        ,   & ! total cloud cover                               --   
!#    freshsnow   ,   & ! weighting function indicating 'freshness' of snow in
                      ! upper few centimeters of snow cover            ( -- )
!#    sun_el      ,   & ! sun elevation angle                           (deg  )
!#    sun_azi     ,   & ! sun azimuth  angle                            (deg  )

    ! and for the Climate-LM Version
!#    sodwddm     ,   & ! downward direct solar radiative flux / smu0   ( W/m2)
!#    qc_rad      ,   & ! subgrid-scale specific cloud water content    (kg/kg)
!#    qi_rad      ,   & ! subgrid-scale specific ice water content      (kg/kg)

!   fields of the convection
!#    clc_con     ,   & ! cloud cover due to convection                   --     

!   fields for the radiation correction scheme
    ! these are actual values
!#    swdir_s     ,   & ! direct comp. of solar radiative flux at surface ( W/m2)
!#    swdifd_s    ,   & ! diffuse downward comp. of short wave rad. flux  ( W/m2)
!#    swdifu_s    ,   & ! diffuse upward   comp. of short wave rad. flux  ( W/m2)
!#    swtrdir_s   ,   & ! direct comp. of solar radiative transmiss. at surface
!#    swtrdifd_s  ,   & ! diffuse downward comp. of short wave rad. transmiss.
!#    swtrdifu_s  ,   & ! diffuse upward   comp. of short wave rad. transmiss.
!#    lwd_s,lwu_s ,   & ! downward/upward comp. of long  wave rad. flux  ( W/m2)

    ! this is the essential correction factor
!#    swdir_cor   ,   & ! direct short wave radiation correction factor actual value

    ! these are topographic parameters
!#    skyview     ,   & ! sky view
!#    slo_asp     ,   & ! slope aspect
!#    slo_ang     ,   & ! slope angle
!#    horizon     ,   & ! horizon

! 7. fields for model output and diagnostics                          (unit )
! ------------------------------------------
!#     sod_t      ,   & ! solar downward radiation at top of atmosphere (     )
!#    asod_t            ! averaged solar downward radiation at top      (     )

! end of data_fields

!------------------------------------------------------------------------------

USE data_runcontrol , ONLY :   &

! 1. start and end of the forecast
! --------------------------------
!#    ntstep,       & ! actual time step
                    ! indices for permutation of three time levels
!#    nold  ,       & ! corresponds to ntstep - 1
!#    nnow  ,       & ! corresponds to ntstep 
!#    nnew  ,       & ! corresponds to ntstep + 1

! 3. controlling the physics
! --------------------------
!#    lconv,        & ! forecast with convection
!#    itype_aerosol,& ! type of aerosol map internal/external
!#    lemiss,       & ! external emissivity map
!#    lgsp,         & ! switch for grid-scale cloud and precipitation scheme
!#    lforest,      & ! if .true., run with forest (evergreen and deciduous)
!#    lsoil,        & ! forecast with soil model
!#    lseaice,      & ! forecast with sea ice model
!#    llake,        & ! forecst with lake model FLake
    l_cosmo_art,  & ! if .TRUE., run the COSMO_ART
!#    nincrad,      & ! time step increment for running the radiation
!#    hincrad,      & ! increment for running the radiation in hours
!#    nextrad,      & ! next step for running the radiation 
!#    hnextrad,     & ! next step for running the radiation in hours
!#    nradcoarse,   & ! radiation coarse-grid number of gpts per hor. direction !T.R.
!#    lradf_avg,    & ! switch for filtering of radiative increments !T.R.
!#    nlgw,         & ! number of prognostic soil water levels
!#    itype_wcld,   & ! type of water cloud diagnosis
!#    icldm_rad,    & ! mode of cloud representation in radiation  parametr.
!#    lmulti_layer, & ! run multi-layer soil model
!#    lmulti_snow , & ! run multi-layer snow model
    lradtopo        ! if .TRUE., calculate topographic correction of radiation
!#    nhori,        & ! number of sectors for the horizont array by the topographic
                    ! correction of the radiation

    ! and for the Climate-LM Version
!#    ico2_rad,     & ! type of CO2 concentration in radiation parameterization
!#    lco2_stab,    & ! use CO2 stabilisation
!#    iy_co2_stab,  & ! default year of CO2 stabilisation
!#    itype_albedo    ! type of solar surface albedo

!#USE data_runcontrol , ONLY :   &

! 5. additional control variables
! -------------------------------
!#    ltime,        & ! 
!#    lreproduce,   & ! the results are reproducible in parallel mode
!#    l2tls     ,   & ! forecast with 1-TL integration scheme        
!#    lperi_x,      & ! if lartif_data=.TRUE.: periodic boundary conditions in x-dir.
                    !               .FALSE.:   or with Davies conditions
!#    lperi_y,      & ! if lartif_data=.TRUE.: periodic boundary conditions in y-dir.
                    !               .FALSE.:   or with Davies conditions
!#    l2dim,        & ! 2 dimensional runs
!#    lscm,         & ! SCM-run

! 9. Variables for Ascii file handling, time measuring, ...
! ---------------------------------------------------------
!#    itype_calendar,&! for specifying the calendar used

! 12. controlling verbosity of debug output
! -----------------------------------------
!#    idbg_level,   & ! to control the verbosity of debug output
!#    ldebug_rad,   & ! if .TRUE., debug output for radiation
!#    lprintdeb_all   ! .TRUE.:  all tasks print debug output
                    ! .FALSE.: only task 0 prints debug output

! end of data_runcontrol 

!------------------------------------------------------------------------------

!#USE data_soil , ONLY :   &
!#    csalb     , & !
!#    csalbw    , & !
!#    csalb_p   , & !
!#    csalb_snow, & !
!#    csalb_snow_min, & ! min. solar albedo of snow for forest free surfaces
!#    csalb_snow_max, & ! max. solar albedo of snow for forest free surfaces
!#    csalb_snow_fd , & ! solar albedo of snow for surfaces with deciduous forest
!#    csalb_snow_fe , & ! solar albedo of snow for surfaces with evergreen forest
!#    ctalb     , & !
!#    cdzw12    , & !
!#    cdzw13        !
!#    cf_snow   , & !
!#    cporv     , & !
!#    cadp

! end of data_soil       

!------------------------------------------------------------------------------

!#USE data_flake, ONLY : &
  ! flake_parameters
!#  h_Ice_min_flk                 ! Minimum ice thickness [m]
!#  tpl_T_f                   , & ! Fresh water freezing point [K]

  ! flake_albedo_ref
!#  albedo_whiteice_ref       , & ! White ice
!#  albedo_blueice_ref        , & ! Blue ice
!#  c_albice_MR                   ! Constant in the interpolation formula for
                                ! the ice albedo (Mironov and Ritter 2004)

!------------------------------------------------------------------------------

USE data_parallel,      ONLY :  &
!#  nprocx,isubpos, &
!#  num_compute,   & ! number of compute PEs
!#  nboundlines,   & ! number of boundary lines of the domain for which
                   ! no forecast is computed = overlapping boundary
                   ! lines of the subdomains
!#  ldatatypes,    & ! if .TRUE.: use MPI-Datatypes for some communications
!#  ltime_barrier, & ! if .TRUE.: use additional barriers for determining the
                   ! load-imbalance
!#  ncomm_type,    & ! type of communication
  my_cart_id       ! rank of this subdomain in the cartesian communicator
!#  my_cart_neigh, & ! neighbors of this subdomain in the cartesian grid
!#  icomm_cart,    & ! communicator for the virtual cartesian topology
                   ! that can be used by MPI_WAIT to identify the send
!#  imp_reals,     & ! determines the correct REAL type used in the model
                   ! for MPI
!#  imp_integers,  & ! determines the correct INTEGER type used in the model
                   ! for MPI
!#  nexch_tag,     & ! tag to be used for MPI boundary exchange
                   !  (in calls to exchg_boundaries)
!#  sendbuf,       & ! sending buffer for boundary exchange:
                   ! 1-4 are used for sending, 5-8 are used for receiving
!#  isendbuflen      ! length of one column of sendbuf

!------------------------------------------------------------------------------

USE environment,              ONLY :  &
!# exchg_boundaries,        & ! performs the boundary exchange between
!#                            ! neighboring processors
  model_abort
!------------------------------------------------------------------------------

USE data_radiation, ONLY : &
!#  idim_rad,        & ! ie-dimension of the coarser grid
!#  istartrad,       & ! start- and end-indices for computing the radiation
!#  iendrad,         & !   (when running on a coarser grid, the input values for
!#  jstartrad,       & !    fesft are computed on all grid points, to compute an
!#  jendrad,         & !    average input over several grid points)
!#  iendparrad,      & ! end-index just for preparations
!#  jendparrad,      & ! end-index just for preparations

! Imported array data variables with intent (in) for init_radiation:
!#  jpgas,    & ! Number of gases
  coali,    & !
  cobti,    & !
!#  pgas,     & !
!#  tgas,     & !
  jpsol   , & ! Number of solar spectral intervals
  jpther  , & ! Number of thermal spectral intervals
  jpspec  , & ! =jpsol+jpther (Total number of spectral intervals)

  solant  , & ! Fraction of solar energy at TOA contained in individual
              ! solar spectral intervals

  planck  , & ! coefficients for the description of the fraction of the total
              ! black body radiation contained in an thermal spectral interval
              ! as a function (2.order polynomial) of temperature
!#  zketypr , & ! e-type continuum-coefficient for all spectral intervals 
              ! (PA (H2O)**-2) at 296 K
  zketypa , & ! (r) following ROBERTS ET AL. 1976,(a) implicitly derived 
              ! from the AFGL spectral data
!#  ztetypr , & ! constant for the temperature dependancy of e-type absorption 
              ! for all intervals
  ztetypa , & ! (r) following ROBERTS ET AL. 1976,(a) implicitly derived 
              ! from the AFGL spectral data
  zteref  , & ! reference temperature

!#  grenze  , & ! Limits of spectral intervals (for information only)

  ! absorption properties of atmospheric gases
  ncgas   , & ! number of coefficients for each interval and gas (maximum=7)
  nfast   , & ! control variable for choice between ESFT/FESFT method in 
              ! each interval
  coai    , & ! weigthing coefficients
  cobi    , & ! absorption coefficients

! array data variables for opt_th and opt_so with intent (in):
  zaea, zaes, zaeg, zaef,         & !
  zlwe, zlwemn, zlwemx,           & !
  zlww, zlwg,                     & !
  ziwe, ziwemn, ziwemx,           & !
  ziww, ziwg,                     & !
  zrsc                              !

! for albedo
!#  rad_csalbw

!------------------------------------------------------------------------------

!#USE src_tracer,         ONLY :  trcr_get, trcr_errorstr
!#USE data_tracer,        ONLY :  T_ERR_NOTFOUND

!------------------------------------------------------------------------------

!#USE meteo_utilities,    ONLY :  cloud_diag
!#USE utilities,          ONLY :  get_utc_date
!#USE parallel_utilities, ONLY :  global_values
!#USE vgrid_refatm_utils, ONLY :  vcoord

!------------------------------------------------------------------------------

#ifdef COSMOART
USE data_cosmo_art,     ONLY :     &
    Eup          , & ! upward flux (3. band of GRAALS)            (W m-2)
    Edown        , & ! downward flux (3. band of GRAALS)          (W m-2)
    Edir         , & ! direkt intensity (3. band of GRAALS)       (W m-2)
!#    mmy          , & ! cosinus of sun-zenith-angle in radiation   (1)
    ! CK 20101204 lgas necessary to check if jvals need to be calculated
!#    lgas         , & ! with gas phase chemistry
    lrad_dust    , & ! mineral dust aerosols
    lrad_seas    , & ! sea salt aerosols
    lrad_aero    , & ! anthropogenic aerosols
    asym_ges     , & !
    asym_seas    , & !
    asym_aero     , & !
    tau_abs_dust  , & !
    tau_streu_dust, & !
    tau_abs_seas  , & !
    tau_streu_seas, & !
    tau_abs_aero  , & !
    tau_streu_aero    !

!#USE art_papa,           ONLY :  calcjval
#endif

USE timing_tools, ONLY: start_loc_timing,end_loc_timing !XL_TIMING

!==============================================================================

IMPLICIT NONE

!==============================================================================
! Working arrays - fesft_dp
!==============================================================================

  REAL    (KIND=dp), ALLOCATABLE        ::  &
    zketyp (:) ,      & !
    ztetyp (:)          !

! Local (automatic) arrays:
! ------------------------
! Arrays local to *fesft* or required for communication with
! subroutines called from *fesft*

  REAL    (KIND=dp), ALLOCATABLE        ::  &
  ! 'Grey' and gaseous fluxes for individual spectral intervals
  ! "_c" means: corrected if lradtopo
  zflux    (:,:)  , & ! (W/m**2)
  zflux_c  (:,:)  , & ! (W/m**2)
  zfluxi   (:,:)  , & ! 1./(W/m**2)
  zfluxu   (:,:)  , & ! (W/m**2)
  zfluxu_c (:,:)  , & ! (W/m**2)
  zfluxui  (:,:)  , & ! 1./(W/m**2)
  zfluxd   (:,:)  , & ! (W/m**2)
  zfluxd_c (:,:)  , & ! (W/m**2)
  zfluxdi  (:,:)  , & ! 1./(W/m**2)
  zfgas    (:,:)  , & ! (W/m**2)
  zfgasu   (:,:)  , & ! (W/m**2)
  zfgasd   (:,:)      ! (W/m**2)

  REAL    (KIND=dp), ALLOCATABLE        ::  &
  pbbr     (:,:)  , & ! (W/m**2) Black body radiation at layer boundaries
  pflpt    (:)    , & ! Solar flux at TOA
  palp     (:)    , & ! Solar surface albedo for parallel radiation
  pqsmu0   (:)    , & ! Inverse of cosine of zenith angle
  palogt   (:,:)  , & ! ln T
  palogp   (:,:)  , & ! ln p
  papra    (:)    , & ! (Pa) pressure at one level
  pduh2oc  (:,:)  , & ! layer water vapour content (Pa), cloudy
  pduh2of  (:,:)  , & ! layer water vapour content (Pa), cloud-free)
  pdulwc   (:,:)  , & ! (Pa H2O-liquid) layer
                                                      ! incloud liquid water content
  pduiwc   (:,:)  , & ! (Pa H2O-ice) layer incloud ice content
  prholwc  (:,:)  , & ! (kg/m**3)
  prhoiwc  (:,:)  , & ! (kg/m**3)
  zduetpc  (:,:)  , & ! water vapour e-type contribution (cloudy)
  zduetpf  (:,:)  , & ! water vapour e-type contribution (cloud-free)

  ! layer mean temperature, water vapour mixing ratio, utility arrays
  ztm      (:)    , & !
  zzwv     (:)    , & !
  zcpo     (:)    , & !
  zcpn     (:)    , & !
  zcmo     (:)    , & !
  zcmn     (:)        !

  REAL    (KIND=dp), ALLOCATABLE        ::  &
  ! Output data from opt_th/opt_so
  podac   (:,:)   , & ! absorption optical depth
  podaf   (:,:)   , & ! in cloudy and free part
  podsc   (:,:)   , & ! scattering optical depth
  podsf   (:,:)   , & ! in cloudy and free part
  pbsfc   (:,:)   , & ! backscattering fraction 
  pbsff   (:,:)   , & ! in cloudy and free part
  pusfc   (:,:)   , & ! upscattering   fraction 
  pusff   (:,:)   , & ! in cloudy and free part

  ! cloud geometry factors
  pca1    (:,:)   , & !
  pcb1    (:,:)   , & !
  pcc1    (:,:)   , & !
  pcd1    (:,:)   , & !
  pca2    (:,:)   , & !
  pcb2    (:,:)   , & !
  pcc2    (:,:)   , & !
  pcd2    (:,:)   , & !

  !fluxes calculated in inv_th/inv_so
  pflfd   (:,:) , & ! (W/m**2)
  pflfu   (:,:) , & ! (W/m**2)
  pflfp   (:,:) , & ! (W/m**2)
  pflcd   (:,:) , & ! (W/m**2)
  pflcu   (:,:) , & ! (W/m**2)
  pflcp   (:,:)     ! (W/m**2)

!==============================================================================
! Working arrays - fesft_sp
!==============================================================================

  REAL    (KIND=dp), ALLOCATABLE ::  &
    ! Temperature at layer boundaries, pressure thickness of layers,
    ! cloud cover in each layer, water vapour and saturation water
    ! vapour mixing ratio, liquid water and ice mixing ratio
    ! layer CO2 content and O3 content
    pti_dp    (:,:)  , & ! (K)
    pdp_dp    (:,:)  , & ! (Pa)
    pclc_dp   (:,:)  , & ! (1)
    pwv_dp    (:,:)  , & ! (kg/kg)
    psw_dp    (:,:)  , & ! (kg/kg)
    pqlwc_dp  (:,:)  , & ! (kg/kg)
    pqiwc_dp  (:,:)  , & ! (kg/kg)
    pduco2_dp (:,:)  , & ! (Pa CO2)
    pduo3_dp  (:,:)  , & ! (Pa O3)

    ! Aerorsole optical depth at 0.55 micrometer for five types
    paeq1_dp  (:,:)  , & ! (1)
    paeq2_dp  (:,:)  , & ! (1)
    paeq3_dp  (:,:)  , & ! (1)
    paeq4_dp  (:,:)  , & ! (1)
    paeq5_dp  (:,:)  , & ! (1)

    ! Cosine of zenith angle, thermal and solar surface albedo
    psmu0_dp  (:)    , & ! (1)
    palth_dp  (:)    , & ! (1)
    palso_dp  (:)    , & ! (1)
  
    ! External data and radiation corrections
    pskyview_dp(:)   , & !
    pfcor_dp   (:)

  REAL    (KIND=dp), ALLOCATABLE ::  &
    ! Surface pressure
    papre_dp  (:)

! Output data
! -----------
  REAL    (KIND=dp), ALLOCATABLE ::  &
    ! Thermal and solar radiative fluxes at each layer boundary
    ! dito for cloud-free conditions (TOA and surface only)
    pflt_dp      (:,:) , & ! (W/m**2)
    pfls_dp      (:,:) , & ! (W/m**2)

    ! corrected thermal and solar surface flux
    ! (if not lradtopo, just pflt(ke1) and pfls(ke1)
    pflt_s_dp    (:)   , & ! (W/m**2)
    pfls_s_dp    (:)   , & ! (W/m**2)

    ! and for the Climate LM Version: solar direct downward radiative flux 
    pflsdir_dp   (:,:) , & ! (W/m**2)

    ! components of solar and thermal fluxes at surface
    ! (influenced by lradtopo for topographic corrections)
    pfltd_dp     (:)   , & ! (W/m**2)
    pfltu_dp     (:)   , & ! (W/m**2)
    pflsd_dp     (:)   , & ! (W/m**2)
    pflsu_dp     (:)   , & ! (W/m**2)
    pflsp_dp     (:)   , & ! (W/m**2)

    ! surface flux of photosynthetic active radiation and components
    pflpar_dp    (:)   , & ! (W/m**2)
    pflsu_par_dp (:)   , & ! (W/m**2)
    pflsd_par_dp (:)   , & ! (W/m**2)
    pflsp_par_dp (:)       ! (W/m**2)

!==============================================================================
! Working arrays - inv_th/so
!==============================================================================

  REAL    (KIND=dp), ALLOCATABLE ::  &

    ! layer properties calculated in *coe_th*
    pa1c (:)  , & !
    pa1f (:)  , & ! 
    pa2c (:)  , & ! 
    pa2f (:)  , & ! 
    pa3c (:)  , & ! 
    pa3f (:)  , & ! 
    pa4c (:)  , & ! 
    pa4f (:)  , & ! 
    pa5c (:)  , & ! 
    pa5f (:)  , & ! 

    ! Utility arrays
    ztu1 (:,:), & !
    ztu2 (:,:), & !
    ztu3 (:,:), & !
    ztu4 (:,:), & !
    ztu5 (:,:), & !
    ztu6 (:,:), & !
    ztu7 (:,:), & !
    ztu8 (:,:), & !
    ztu9 (:,:)    !

!==============================================================================
! Working arrays - opt_th/so
!==============================================================================

!    optical properties (absorption, scattering, back- and upscatter fraction)
!    for liquid water, ice and total aerosole
!    for Rayleigh scattering, only the optical depth is stored as array, since
!    back- and upscatter fractions are constant (=0.5)

  REAL    (KIND=dp), ALLOCATABLE ::  &
     zlwoda (:), & !
     zlwods (:), & ! 
     zlwb0  (:), & ! 
     zlwb   (:), & ! 
     ziwoda (:), & ! 
     ziwods (:), & ! 
     ziwb0  (:), & ! 
     ziwb   (:), & ! 
     zaeoda (:), & ! 
     zaeods (:), & ! 
     zaeb0  (:), & ! 
     zaeb   (:), & ! 
     zraods (:)    ! 

!==============================================================================

! indices for a debug point (define it here instead of doing it in all routines)
  INTEGER (KIND=iintegers), PARAMETER ::  &
     j1b    = 50,          & ! debug point index first dimension
     j2b    = 4              ! debug point index second dimension

!==============================================================================

!XL_TIMING/XL_TODO: eventually remove these timers
LOGICAL, PARAMETER :: lloc_timing = .FALSE.
INTEGER, PARAMETER :: &
  itim_fesft  = 20  , &
  itim_opt_th = 21  , &
  itim_opt_so = 22  , &
  itim_inv_th = 23  , &
  itim_inv_so = 24

!==============================================================================

! Interface Blocks
INTERFACE fesft
  MODULE PROCEDURE        &
    fesft_sp,             &
    fesft_dp
END INTERFACE

!==============================================================================

CONTAINS

!==============================================================================
!==============================================================================
!+ Module procedure in "Radiation" 
!------------------------------------------------------------------------------

SUBROUTINE fesft_sp(                                  &
       pti   , pdp  , pclc  , pwv  , psw  , pqlwc,    &
       pqiwc , pduco2,pduo3,                          &
       paeq1 , paeq2, paeq3 , paeq4, paeq5,           &
       papre , psmu0, palso , palth, pskyview, pfcor, &
       psig  , psct ,                                 &
       ki1sd , ki1ed, ki3sd, ki3ed,                   &
       ki1sc , ki1ec, ki3sc, ki3ec,                   &
       lsolar, lcrf , lradtopo, idebug, jindex,       &
       pflt  , pfls , pflt_s, pfls_s, pflsdir,        &
       pfltd , pfltu, pflsd , pflsu, pflsp,           &
       pflpar, pflsu_par, pflsd_par, pflsp_par)


!------------------------------------------------------------------------------
!
! Description:
!
!   This is the specific subroutine call for fesft with single precision 
!   variables. It transforms all input variables to double precision and then 
!   calls fesft_dp
!
!------------------------------------------------------------------------------

! Subroutine arguments:
! --------------------

! Input data
! ----------
  INTEGER (KIND=iintegers), INTENT (IN) ::  &
    ! indices for array dimensioning
    ki1sd,       & ! start index for first  array dimension
    ki1ed,       & ! end   index for first  array dimension
    ki3sd,       & ! start index for third  array dimension
    ki3ed,       & ! end   index for third  array dimension

    ! and the same for the computations
    ki1sc,       & ! start index for first  array computation
    ki1ec,       & ! end   index for first  array computation
    ki3sc,       & ! start index for third  array computation
    ki3ec,       & ! end   index for third  array computation

    ! for activating debug output
    jindex,      & ! actual j-index computed
    idebug         ! debug control switch       

  LOGICAL                 , INTENT (IN) ::  &
    lcrf,        & ! control switch for cloud-free calcul.
    lsolar,      & ! control switch for solar calculations
    lradtopo       ! control switch for topographic corrections

  REAL    (KIND=sp)       , INTENT (IN) ::  &
    psig,        & ! Stefan-Boltzman constant 
    psct           ! solar constant (at time of year)

  REAL    (KIND=sp)       , INTENT (IN) ::  &
    ! Temperature at layer boundaries, pressure thickness of layers,
    ! cloud cover in each layer, water vapour and saturation water
    ! vapour mixing ratio, liquid water and ice mixing ratio
    ! layer CO2 content and O3 content
    pti    (ki1sd:ki1ed,ki3sd:ki3ed+1)    , & ! (K)
    pdp    (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (Pa)
    pclc   (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (1)
    pwv    (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (kg/kg)
    psw    (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (kg/kg)
    pqlwc  (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (kg/kg)
    pqiwc  (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (kg/kg)
    pduco2 (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (Pa CO2)
    pduo3  (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (Pa O3)

    ! Aerorsole optical depth at 0.55 micrometer for five types
    paeq1  (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (1)
    paeq2  (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (1)
    paeq3  (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (1)
    paeq4  (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (1)
    paeq5  (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (1)

    ! Cosine of zenith angle, thermal and solar surface albedo
    psmu0  (ki1sd:ki1ed)                  , & ! (1)
    palth  (ki1sd:ki1ed)                  , & ! (1)
    palso  (ki1sd:ki1ed)                  , & ! (1)
  
    ! External data and radiation corrections
    pskyview(ki1sd:ki1ed)                 , & !
    pfcor   (ki1sd:ki1ed)            

  REAL    (KIND=sp)       , INTENT (INOUT) ::  &
    ! Surface pressure
    papre  (ki1sd:ki1ed)                                  ! (Pa)

! Output data
! -----------
  REAL    (KIND=sp)       , INTENT (OUT) ::  &
    ! Thermal and solar radiative fluxes at each layer boundary
    ! dito for cloud-free conditions (TOA and surface only)
    pflt      (ki1sd:ki1ed,            ki3sd:ki3ed+1) , & ! (W/m**2)
    pfls      (ki1sd:ki1ed,            ki3sd:ki3ed+1) , & ! (W/m**2)

    ! corrected thermal and solar surface flux
    ! (if not lradtopo, just pflt(ke1) and pfls(ke1)
    pflt_s    (ki1sd:ki1ed)               , & ! (W/m**2)
    pfls_s    (ki1sd:ki1ed)               , & ! (W/m**2)

    ! and for the Climate LM Version: solar direct downward radiative flux 
    pflsdir   (ki1sd:ki1ed,ki3sd:ki3ed+1) , & ! (W/m**2)

    ! components of solar and thermal fluxes at surface
    ! (influenced by lradtopo for topographic corrections)
    pfltd     (ki1sd:ki1ed)               , & ! (W/m**2)
    pfltu     (ki1sd:ki1ed)               , & ! (W/m**2)
    pflsd     (ki1sd:ki1ed)               , & ! (W/m**2)
    pflsu     (ki1sd:ki1ed)               , & ! (W/m**2)
    pflsp     (ki1sd:ki1ed)               , & ! (W/m**2)

    ! surface flux of photosynthetic active radiation and components
    pflpar    (ki1sd:ki1ed)               , & ! (W/m**2)
    pflsu_par (ki1sd:ki1ed)               , & ! (W/m**2)
    pflsd_par (ki1sd:ki1ed)               , & ! (W/m**2)
    pflsp_par (ki1sd:ki1ed)                   ! (W/m**2)

!------------------------------------------------------------------------------

! Local variables in double precision
  REAL    (KIND=dp)                     ::  &
    psig_dp,     & ! Stefan-Boltzman constant 
    psct_dp        ! solar constant (at time of year)

!RUS_CHANGE/REMOVE/WKARR
!#  REAL    (KIND=dp)                     ::  &
!#    ! Temperature at layer boundaries, pressure thickness of layers,
!#    ! cloud cover in each layer, water vapour and saturation water
!#    ! vapour mixing ratio, liquid water and ice mixing ratio
!#    ! layer CO2 content and O3 content
!#    pti_dp    (ki1sd:ki1ed,ki3sd:ki3ed+1)    , & ! (K)
!#    pdp_dp    (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (Pa)
!#    pclc_dp   (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (1)
!#    pwv_dp    (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (kg/kg)
!#    psw_dp    (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (kg/kg)
!#    pqlwc_dp  (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (kg/kg)
!#    pqiwc_dp  (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (kg/kg)
!#    pduco2_dp (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (Pa CO2)
!#    pduo3_dp  (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (Pa O3)
!#
!#    ! Aerorsole optical depth at 0.55 micrometer for five types
!#    paeq1_dp  (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (1)
!#    paeq2_dp  (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (1)
!#    paeq3_dp  (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (1)
!#    paeq4_dp  (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (1)
!#    paeq5_dp  (ki1sd:ki1ed,ki3sd:ki3ed)      , & ! (1)
!#
!#    ! Cosine of zenith angle, thermal and solar surface albedo
!#    psmu0_dp  (ki1sd:ki1ed)                  , & ! (1)
!#    palth_dp  (ki1sd:ki1ed)                  , & ! (1)
!#    palso_dp  (ki1sd:ki1ed)                  , & ! (1)
!#  
!#    ! External data and radiation corrections
!#    pskyview_dp(ki1sd:ki1ed)                 , & !
!#    pfcor_dp   (ki1sd:ki1ed)
!#
!#  REAL    (KIND=dp)                        ::  &
!#    ! Surface pressure
!#    papre_dp  (ki1sd:ki1ed)
!#
!#! Output data
!#! -----------
!#  REAL    (KIND=dp)                      ::  &
!#    ! Thermal and solar radiative fluxes at each layer boundary
!#    ! dito for cloud-free conditions (TOA and surface only)
!#    pflt_dp      (ki1sd:ki1ed,ki3sd:ki3ed+1) , & ! (W/m**2)
!#    pfls_dp      (ki1sd:ki1ed,ki3sd:ki3ed+1) , & ! (W/m**2)
!#
!#    ! corrected thermal and solar surface flux
!#    ! (if not lradtopo, just pflt(ke1) and pfls(ke1)
!#    pflt_s_dp    (ki1sd:ki1ed)               , & ! (W/m**2)
!#    pfls_s_dp    (ki1sd:ki1ed)               , & ! (W/m**2)
!#
!#    ! and for the Climate LM Version: solar direct downward radiative flux 
!#    pflsdir_dp   (ki1sd:ki1ed,            ki3sd:ki3ed+1) , & ! (W/m**2)
!#
!#    ! components of solar and thermal fluxes at surface
!#    ! (influenced by lradtopo for topographic corrections)
!#    pfltd_dp     (ki1sd:ki1ed)              , & ! (W/m**2)
!#    pfltu_dp     (ki1sd:ki1ed)              , & ! (W/m**2)
!#    pflsd_dp     (ki1sd:ki1ed)              , & ! (W/m**2)
!#    pflsu_dp     (ki1sd:ki1ed)              , & ! (W/m**2)
!#    pflsp_dp     (ki1sd:ki1ed)              , & ! (W/m**2)
!#
!#    ! surface flux of photosynthetic active radiation and components
!#    pflpar_dp    (ki1sd:ki1ed)              , & ! (W/m**2)
!#    pflsu_par_dp (ki1sd:ki1ed)              , & ! (W/m**2)
!#    pflsd_par_dp (ki1sd:ki1ed)              , & ! (W/m**2)
!#    pflsp_par_dp (ki1sd:ki1ed)                  ! (W/m**2)

INTEGER(KIND=iintegers) :: ip,k

!------------------------------------------------------------------------------
! Start GPU data region
!------------------------------------------------------------------------------

  !$acc data &
  !---- Argument arrays - intent(in)
  !$acc present ( pti,pdp,pclc,pwv,psw,pqlwc,pqiwc,pduco2,pduo3  ) &
  !$acc present ( paeq1,paeq2,paeq3,paeq4,paeq5,psmu0,palso      ) &
  !$acc present ( palth,pskyview,pfcor                           ) &
  !---- Argument arrays - intent(inout)                          
  !$acc present ( papre                                          ) &
  !---- Argument arrays - intent(out)                            
  !$acc present ( pflt,pfls,pflt_s,pfls_s,pflsdir,pfltd,pfltu    ) &
  !$acc present ( pflsd,pflsu,pflsp,pflpar,pflsu_par,pflsd_par   ) &
  !$acc present ( pflsp_par                                      ) &
  !---- Local automatic arrays
  !$acc present ( pti_dp,pdp_dp,pclc_dp,pwv_dp,psw_dp,pqlwc_dp   ) &
  !$acc present ( pqiwc_dp,pduco2_dp,pduo3_dp,paeq1_dp,paeq2_dp  ) &
  !$acc present ( paeq3_dp,paeq4_dp,paeq5_dp,psmu0_dp,palth_dp   ) &
  !$acc present ( palso_dp,pskyview_dp,pfcor_dp,papre_dp,pflt_dp ) &
  !$acc present ( pfls_dp,pflt_s_dp,pfls_s_dp,pflsdir_dp         ) &
  !$acc present ( pfltd_dp,pfltu_dp,pflsd_dp,pflsu_dp,pflsp_dp   ) &
  !$acc present ( pflpar_dp,pflsu_par_dp,pflsd_par_dp            ) &
  !$acc present ( pflsp_par_dp                                   )
    
!------------------------------------------------------------------------------
! Begin of the subroutine
!------------------------------------------------------------------------------
    
! Variables with intent in
  psig_dp  = REAL(psig, dp)
  psct_dp  = REAL(psct, dp)

  !$acc parallel
  !$acc loop gang vector collapse(2)
  DO k=ki3sd,ki3ed+1
    DO ip=ki1sd,ki1ed
      pti_dp (ip,k) = 0.0_dp
      pflt   (ip,k) = 0.0_sp
      pfls   (ip,k) = 0.0_sp
      pflsdir(ip,k) = 0.0_sp
    ENDDO
  ENDDO
  !$acc end parallel

  !$acc parallel
  !$acc loop gang vector collapse(2)
  DO k=ki3sd,ki3ed
    DO ip=ki1sd,ki1ed
      pdp_dp    (ip,k) = 0.0_dp
      pclc_dp   (ip,k) = 0.0_dp
      pwv_dp    (ip,k) = 0.0_dp
      psw_dp    (ip,k) = 0.0_dp
      pqlwc_dp  (ip,k) = 0.0_dp
      pqiwc_dp  (ip,k) = 0.0_dp
      pduco2_dp (ip,k) = 0.0_dp
      pduo3_dp  (ip,k) = 0.0_dp
      paeq1_dp  (ip,k) = 0.0_dp
      paeq2_dp  (ip,k) = 0.0_dp
      paeq3_dp  (ip,k) = 0.0_dp
      paeq4_dp  (ip,k) = 0.0_dp
      paeq5_dp  (ip,k) = 0.0_dp
    ENDDO
  ENDDO
  !$acc end parallel

  !$acc parallel
  !$acc loop gang vector
  DO ip=ki1sd,ki1ed
    psmu0_dp   (ip) = 0.0_dp
    palth_dp   (ip) = 0.0_dp
    palso_dp   (ip) = 0.0_dp
    pskyview_dp(ip) = 0.0_dp
    pfcor_dp   (ip) = 0.0_dp
    pflt_s     (ip) = 0.0_sp
    pfls_s     (ip) = 0.0_sp
    pfltd      (ip) = 0.0_sp
    pfltu      (ip) = 0.0_sp
    pflsd      (ip) = 0.0_sp
    pflsu      (ip) = 0.0_sp
    pflsp      (ip) = 0.0_sp
    pflpar     (ip) = 0.0_sp
    pflsu_par  (ip) = 0.0_sp
    pflsd_par  (ip) = 0.0_sp
    pflsp_par  (ip) = 0.0_sp
  ENDDO
  !$acc end parallel

  !$acc parallel
  !$acc loop gang vector collapse(2)
  DO k=ki3sc,ki3ec+1
    DO ip=ki1sc,ki1ec
      pti_dp (ip,k) = REAL(pti (ip,k),dp)
    ENDDO
  ENDDO
  !$acc end parallel

  !$acc parallel
  !$acc loop gang vector collapse(2)
  DO k=ki3sc,ki3ec
    DO ip=ki1sc,ki1ec
      pdp_dp    (ip,k) = REAL(pdp    (ip,k),dp)
      pclc_dp   (ip,k) = REAL(pclc   (ip,k),dp)
      pwv_dp    (ip,k) = REAL(pwv    (ip,k),dp)
      psw_dp    (ip,k) = REAL(psw    (ip,k),dp)
      pqlwc_dp  (ip,k) = REAL(pqlwc  (ip,k),dp)
      pqiwc_dp  (ip,k) = REAL(pqiwc  (ip,k),dp)
      pduco2_dp (ip,k) = REAL(pduco2 (ip,k),dp)
      pduo3_dp  (ip,k) = REAL(pduo3  (ip,k),dp)
   
      paeq1_dp  (ip,k) = REAL(paeq1  (ip,k),dp)
      paeq2_dp  (ip,k) = REAL(paeq2  (ip,k),dp)
      paeq3_dp  (ip,k) = REAL(paeq3  (ip,k),dp)
      paeq4_dp  (ip,k) = REAL(paeq4  (ip,k),dp)
      paeq5_dp  (ip,k) = REAL(paeq5  (ip,k),dp)
    ENDDO
  ENDDO
  !$acc end parallel

  !$acc parallel
  !$acc loop gang vector
  DO ip=ki1sc,ki1ec
    psmu0_dp   (ip) = REAL(psmu0   (ip),dp)
    palth_dp   (ip) = REAL(palth   (ip),dp)
    palso_dp   (ip) = REAL(palso   (ip),dp)
 
    pskyview_dp(ip) = REAL(pskyview(ip),dp)
    pfcor_dp   (ip) = REAL(pfcor   (ip),dp)
 
  ! Variable with intent inout (has to be transformed back at the end)
    papre_dp   (ip)  = REAL(papre  (ip),dp)
  ENDDO
  !$acc end parallel

! Now call double precision fesft
  CALL fesft_dp(                                                        &
       pti_dp,      pdp_dp,      pclc_dp,     pwv_dp,      psw_dp,      &
       pqlwc_dp,    pqiwc_dp,    pduco2_dp,   pduo3_dp,                 &
       paeq1_dp,    paeq2_dp,    paeq3_dp,    paeq4_dp,    paeq5_dp,    &
       papre_dp,    psmu0_dp,    palso_dp,    palth_dp,    pskyview_dp, &
       pfcor_dp,    psig_dp,     psct_dp,                               &
       ki1sd,       ki1ed,       ki3sd,       ki3ed,                    &
       ki1sc,       ki1ec,       ki3sc,       ki3ec,                    &
       lsolar,      lcrf,        lradtopo,    idebug,      jindex,      &
       pflt_dp,     pfls_dp,     pflt_s_dp,   pfls_s_dp,   pflsdir_dp,  &
       pfltd_dp,    pfltu_dp,    pflsd_dp,    pflsu_dp,    pflsp_dp,    &
       pflpar_dp,   pflsu_par_dp,pflsd_par_dp,pflsp_par_dp              )

! Transform output variables back to single precision
  !$acc parallel
  !$acc loop gang vector collapse(2)
  DO k=ki3sc,ki3ec+1
    DO ip=ki1sc,ki1ec
      pflt   (ip,k) = REAL(pflt_dp   (ip,k),sp)
      pfls   (ip,k) = REAL(pfls_dp   (ip,k),sp)
      pflsdir(ip,k) = REAL(pflsdir_dp(ip,k),sp)
    ENDDO
  ENDDO
  !$acc end parallel

  !$acc parallel
  !$acc loop gang vector
  DO ip=ki1sc,ki1ec
    pflt_s   (ip) = REAL(pflt_s_dp   (ip),sp)
    pfls_s   (ip) = REAL(pfls_s_dp   (ip),sp)
    pfltd    (ip) = REAL(pfltd_dp    (ip),sp)
    pfltu    (ip) = REAL(pfltu_dp    (ip),sp)
    pflsd    (ip) = REAL(pflsd_dp    (ip),sp)
    pflsu    (ip) = REAL(pflsu_dp    (ip),sp)
    pflsp    (ip) = REAL(pflsp_dp    (ip),sp)
    pflpar   (ip) = REAL(pflpar_dp   (ip),sp)
    pflsu_par(ip) = REAL(pflsu_par_dp(ip),sp)
    pflsd_par(ip) = REAL(pflsd_par_dp(ip),sp)
    pflsp_par(ip) = REAL(pflsp_par_dp(ip),sp)
  ! Variable with intent inout
    papre    (ip) = REAL(papre_dp    (ip),sp)
  ENDDO
  !$acc end parallel

!------------------------------------------------------------------------------
! End of the subroutine
!------------------------------------------------------------------------------

  !$acc end data

END SUBROUTINE fesft_sp

!==============================================================================
!==============================================================================
!+ Module procedure in "Radiation" 
!------------------------------------------------------------------------------

SUBROUTINE fesft_dp(                                                     &
       pti   , pdp  , pclc  , pwv  , psw  , pqlwc, pqiwc, pduco2, pduo3, &
       paeq1 , paeq2, paeq3 , paeq4, paeq5,                              &
       papre , psmu0, palso , palth, pskyview, pfcor,                    &
       psig  , psct ,                                                    &
       ki1sd , ki1ed,                ki3sd, ki3ed,                       &
       ki1sc , ki1ec,                ki3sc, ki3ec,                       &
       lsolar, lcrf , lradtopo, idebug, jindex,                          &
       pflt  , pfls , pflt_s, pfls_s, pflsdir,                           &
       pfltd , pfltu, pflsd , pflsu, pflsp,                              &
       pflpar, pflsu_par, pflsd_par, pflsp_par)


!------------------------------------------------------------------------------
!
! Description:
!
!   The module procedure fesft organizes the radiative transfer calculations.
!
! Method:
!
! This routine organizes the radiative transfer calculations by
! calling a set of dedicated routines for the calculation of
! basic optical properties (opt_th/opt_so), the derivation of
! layer coefficients (coe_th/coe_so) for an implicit delta-two-
! stream scheme (cf.Ritter and Geleyn, 1992) and the inversion
! (inv_th/inv_so) of the corresponding system matrix. These 
! operations are performed seperately for thermal and solar parts
! of the spectrum and are embedded in loops over the various
! spectral intervals. Within each interval, a data-controlled
! decision is taken, whether the so-called ESFT or FESFT approach
! is used for the handling of gaseous absorption (cf. Ritter and
! Geleyn, 1992).
! Controlled by the logical input variable LCRF, the calculation
! of radiative fluxes in cloud-free conditions can be done in
! addition to the results for the given atmospheric cloud structure.
! (not implemented yet)
! Before the actual flux calculation starts, some preliminary steps
! provide utility arrays which are applicable to all spectral inter-
! vals (e.g. cloud geometry factors, integrated layer water content, etc.)
!
!------------------------------------------------------------------------------

! Subroutine arguments:
! --------------------

! Input data
! ----------
  INTEGER (KIND=iintegers), INTENT (IN) ::  &
    ! indices for array dimensioning
    ki1sd,       & ! start index for first  array dimension
    ki1ed,       & ! end   index for first  array dimension
    ki3sd,       & ! start index for third  array dimension
    ki3ed,       & ! end   index for third  array dimension

    ! and the same for the computations
    ki1sc,       & ! start index for first  array computation
    ki1ec,       & ! end   index for first  array computation
    ki3sc,       & ! start index for third  array computation
    ki3ec,       & ! end   index for third  array computation

    ! for activating debug output
    jindex,      & ! actual j-index computed
    idebug         ! debug control switch       

  LOGICAL                 , INTENT (IN) ::  &
    lcrf,        & ! control switch for cloud-free calcul.
    lsolar,      & ! control switch for solar calculations
    lradtopo       ! control switch for topographic corrections

  REAL    (KIND=dp)       , INTENT (IN) ::  &
    psig,        & ! Stefan-Boltzman constant 
    psct           ! solar constant (at time of year)

 REAL    (KIND=dp)       , INTENT (IN) ::  &
 ! Temperature at layer boundaries, pressure thickness of layers,
 ! cloud cover in each layer, water vapour and saturation water
 ! vapour mixing ratio, liquid water and ice mixing ratio
 ! layer CO2 content and O3 content
    pti    (ki1sd:ki1ed,            ki3sd:ki3ed+1)    , & ! (K)
    pdp    (ki1sd:ki1ed,            ki3sd:ki3ed)      , & ! (Pa)
    pclc   (ki1sd:ki1ed,            ki3sd:ki3ed)      , & ! (1)
    pwv    (ki1sd:ki1ed,            ki3sd:ki3ed)      , & ! (kg/kg)
    psw    (ki1sd:ki1ed,            ki3sd:ki3ed)      , & ! (kg/kg)
    pqlwc  (ki1sd:ki1ed,            ki3sd:ki3ed)      , & ! (kg/kg)
    pqiwc  (ki1sd:ki1ed,            ki3sd:ki3ed)      , & ! (kg/kg)
    pduco2 (ki1sd:ki1ed,            ki3sd:ki3ed)      , & ! (Pa CO2)
    pduo3  (ki1sd:ki1ed,            ki3sd:ki3ed)      , & ! (Pa O3)

 ! Aerorsole optical depth at 0.55 micrometer for five types
    paeq1  (ki1sd:ki1ed,            ki3sd:ki3ed)      , & ! (1)
    paeq2  (ki1sd:ki1ed,            ki3sd:ki3ed)      , & ! (1)
    paeq3  (ki1sd:ki1ed,            ki3sd:ki3ed)      , & ! (1)
    paeq4  (ki1sd:ki1ed,            ki3sd:ki3ed)      , & ! (1)
    paeq5  (ki1sd:ki1ed,            ki3sd:ki3ed)      , & ! (1)

 ! Cosine of zenith angle, thermal and solar surface albedo
    psmu0  (ki1sd:ki1ed)                              , & ! (1)
    palth  (ki1sd:ki1ed)                              , & ! (1)
    palso  (ki1sd:ki1ed)                              , & ! (1)

 ! External data and radiation corrections
    pskyview(ki1sd:ki1ed)                             , & !
    pfcor   (ki1sd:ki1ed)                

  !RUS_CHANGE/ADD/COMMENT
  ! The argument papre needs to be INOUT because it's changed inside
  ! fesft and the changed value is re-used in the subsequent iteration
  ! for the averaging (case lradave=T).
  ! Note that INOUT is only necessary for lradave=T; for lradave=F
  ! the nicer solution would be to declare it as IN and add a local
  ! counterpart array inside fesft which could be changes (this
  ! would clean up the interface of fesft).
  REAL    (KIND=dp)       , INTENT (INOUT) ::  &
    ! Surface pressure
    papre  (ki1sd:ki1ed)                                  ! (Pa)

! Output data
! -----------
  REAL    (KIND=dp)       , INTENT (OUT) ::  &
    ! Thermal and solar radiative fluxes at each layer boundary
    ! dito for cloud-free conditions (TOA and surface only)
    pflt      (ki1sd:ki1ed,            ki3sd:ki3ed+1) , & ! (W/m**2)
    pfls      (ki1sd:ki1ed,            ki3sd:ki3ed+1) , & ! (W/m**2)

    ! corrected thermal and solar surface flux
    ! (if not lradtopo, just pflt(ke1) and pfls(ke1)
    pflt_s    (ki1sd:ki1ed)                           , & ! (W/m**2)
    pfls_s    (ki1sd:ki1ed)                           , & ! (W/m**2)

    ! and for the Climate LM Version: solar direct downward radiative flux 
    pflsdir   (ki1sd:ki1ed,            ki3sd:ki3ed+1) , & ! (W/m**2)

    ! components of solar and thermal fluxes at surface
    ! (influenced by lradtopo for topographic corrections)
    pfltd     (ki1sd:ki1ed)                           , & ! (W/m**2)
    pfltu     (ki1sd:ki1ed)                           , & ! (W/m**2)
    pflsd     (ki1sd:ki1ed)                           , & ! (W/m**2)
    pflsu     (ki1sd:ki1ed)                           , & ! (W/m**2)
    pflsp     (ki1sd:ki1ed)                           , & ! (W/m**2)

    ! surface flux of photosynthetic active radiation and components
    pflpar    (ki1sd:ki1ed)                           , & ! (W/m**2)
    pflsu_par (ki1sd:ki1ed)                           , & ! (W/m**2)
    pflsd_par (ki1sd:ki1ed)                           , & ! (W/m**2)
    pflsp_par (ki1sd:ki1ed)                               ! (W/m**2)

! Local parameters: 
! ----------------
  REAL    (KIND=dp)       , PARAMETER ::  &
    zepflx = 1.0E-8_dp,     & ! Minimum 'grey' flux to avoid 1./0.
    zrd    = 287.05_dp,     & ! Ra (gas constant of dry air)

    zrvdm1 = 461.51_dp/287.05_dp-1.0_dp,  & ! Rv/Ra - 1
    zrvd   = 461.51_dp/287.05_dp,             & ! Rv/Ra
    zepai  = 0.0_dp           ! Could be used to save computing time for 
                                  ! 'unimportant' gaseous absorption coefficients

! Local scalars:
! -------------
  INTEGER (KIND=iintegers) ::  &
    icrf, igase, izerror,  & !
    igasm1, igasz,         & !
    j1,j3,                 & ! loop indices over spatial dimensions
    jc,jh2o,jco2,jo3,      & ! loop indices over gaseous coefficients
    jspec,jspect,          & ! loop indices over spectrum
    jg,jjg ,               & ! loop indices over gases      
    icc,ih2o,ico2,io3        ! loop limit for gaseous absorption

  LOGICAL                  ::  &
    ldebug_th      ,       & ! debug control switch for thermal     
    ldebug_so      ,       & ! debug control switch for solar       
    ldebug_opt_th  ,       & ! debug control switch for opt_th      
    ldebug_opt_so  ,       & ! debug control switch for opt_so      
    ldebug_inv_th  ,       & ! debug control switch for inv_th      
    ldebug_inv_so            ! debug control switch for inv_so      

  REAL    (KIND=dp)        ::  &
    zet ,zaiprod,          & !
    zcoai,zcobi,           & !
    zemissivity, zalbedo     !

! Local arrays:
! -------------
  INTEGER (KIND=iintegers) ::  &
    icgas (3)                !

!RUS_CHANGE/REMOVE/WKARR
!#  REAL    (KIND=dp)        ::  &
!#    zketyp (jpther) ,      & !
!#    ztetyp (jpther)          !
!#
!#! Local (automatic) arrays:
!#! ------------------------
!#! Arrays local to *fesft* or required for communication with
!#! subroutines called from *fesft*
!#
!#  REAL    (KIND=dp)        ::  &
!#  ! 'Grey' and gaseous fluxes for individual spectral intervals
!#  ! "_c" means: corrected if lradtopo
!#  zflux    (ki1sd:ki1ed,            ki3sd:ki3ed+1), & ! (W/m**2)
!#  zflux_c  (ki1sd:ki1ed,            ki3sd:ki3ed+1), & ! (W/m**2)
!#  zfluxi   (ki1sd:ki1ed,            ki3sd:ki3ed+1), & ! 1./(W/m**2)
!#  zfluxu   (ki1sd:ki1ed,            ki3sd:ki3ed+1), & ! (W/m**2)
!#  zfluxu_c (ki1sd:ki1ed,            ki3sd:ki3ed+1), & ! (W/m**2)
!#  zfluxui  (ki1sd:ki1ed,            ki3sd:ki3ed+1), & ! 1./(W/m**2)
!#  zfluxd   (ki1sd:ki1ed,            ki3sd:ki3ed+1), & ! (W/m**2)
!#  zfluxd_c (ki1sd:ki1ed,            ki3sd:ki3ed+1), & ! (W/m**2)
!#  zfluxdi  (ki1sd:ki1ed,            ki3sd:ki3ed+1), & ! 1./(W/m**2)
!#  zfgas    (ki1sd:ki1ed,            ki3sd:ki3ed+1), & ! (W/m**2)
!#  zfgasu   (ki1sd:ki1ed,            ki3sd:ki3ed+1), & ! (W/m**2)
!#  zfgasd   (ki1sd:ki1ed,            ki3sd:ki3ed+1)    ! (W/m**2)
!#
!#  REAL    (KIND=dp)        ::  &
!#  pbbr     (ki1sd:ki1ed,            ki3sd:ki3ed+1), & ! (W/m**2) Black body radiation at layer boundaries
!#  pflpt    (ki1sd:ki1ed)                          , & ! Solar flux at TOA
!#  palp     (ki1sd:ki1ed)                          , & ! Solar surface albedo for parallel radiation
!#  pqsmu0   (ki1sd:ki1ed)                          , & ! Inverse of cosine of zenith angle
!#  palogt   (ki1sd:ki1ed,            ki3sd:ki3ed)  , & ! ln T
!#  palogp   (ki1sd:ki1ed,            ki3sd:ki3ed)  , & ! ln p
!#  papra    (ki1sd:ki1ed)                          , & ! (Pa) pressure at one level
!#  pduh2oc  (ki1sd:ki1ed,            ki3sd:ki3ed)  , & ! layer water vapour content (Pa), cloudy
!#  pduh2of  (ki1sd:ki1ed,            ki3sd:ki3ed)  , & ! layer water vapour content (Pa), cloud-free)
!#  pdulwc   (ki1sd:ki1ed,            ki3sd:ki3ed)  , & ! (Pa H2O-liquid) layer
!#                                                      ! incloud liquid water content
!#  pduiwc   (ki1sd:ki1ed,            ki3sd:ki3ed)  , & ! (Pa H2O-ice) layer incloud ice content
!#  prholwc  (ki1sd:ki1ed,            ki3sd:ki3ed)  , & ! (kg/m**3)
!#  prhoiwc  (ki1sd:ki1ed,            ki3sd:ki3ed)  , & ! (kg/m**3)
!#  zduetpc  (ki1sd:ki1ed,            ki3sd:ki3ed)  , & ! water vapour e-type contribution (cloudy)
!#  zduetpf  (ki1sd:ki1ed,            ki3sd:ki3ed)  , & ! water vapour e-type contribution (cloud-free)
!#
!#  ! layer mean temperature, water vapour mixing ratio, utility arrays
!#  ztm      (ki1sd:ki1ed)                          , & !
!#  zzwv     (ki1sd:ki1ed)                          , & !
!#  zcpo     (ki1sd:ki1ed)                          , & !
!#  zcpn     (ki1sd:ki1ed)                          , & !
!#  zcmo     (ki1sd:ki1ed)                          , & !
!#  zcmn     (ki1sd:ki1ed)                              !
!#
!#  REAL    (KIND=dp)        ::  &
!#  ! Output data from opt_th/opt_so
!#  podac   (ki1sd:ki1ed,            ki3sd:ki3ed)   , & ! absorption optical depth
!#  podaf   (ki1sd:ki1ed,            ki3sd:ki3ed)   , & ! in cloudy and free part
!#  podsc   (ki1sd:ki1ed,            ki3sd:ki3ed)   , & ! scattering optical depth
!#  podsf   (ki1sd:ki1ed,            ki3sd:ki3ed)   , & ! in cloudy and free part
!#  pbsfc   (ki1sd:ki1ed,            ki3sd:ki3ed)   , & ! backscattering fraction 
!#  pbsff   (ki1sd:ki1ed,            ki3sd:ki3ed)   , & ! in cloudy and free part
!#  pusfc   (ki1sd:ki1ed,            ki3sd:ki3ed)   , & ! upscattering   fraction 
!#  pusff   (ki1sd:ki1ed,            ki3sd:ki3ed)   , & ! in cloudy and free part
!#
!#  ! cloud geometry factors
!#  pca1    (ki1sd:ki1ed,            ki3sd:ki3ed)   , & !
!#  pcb1    (ki1sd:ki1ed,            ki3sd:ki3ed)   , & !
!#  pcc1    (ki1sd:ki1ed,            ki3sd:ki3ed)   , & !
!#  pcd1    (ki1sd:ki1ed,            ki3sd:ki3ed)   , & !
!#  pca2    (ki1sd:ki1ed,            ki3sd:ki3ed)   , & !
!#  pcb2    (ki1sd:ki1ed,            ki3sd:ki3ed)   , & !
!#  pcc2    (ki1sd:ki1ed,            ki3sd:ki3ed)   , & !
!#  pcd2    (ki1sd:ki1ed,            ki3sd:ki3ed)   , & !
!#
!#  !fluxes calculated in inv_th/inv_so
!#  pflfd   (ki1sd:ki1ed,            ki3sd:ki3ed+1) , & ! (W/m**2)
!#  pflfu   (ki1sd:ki1ed,            ki3sd:ki3ed+1) , & ! (W/m**2)
!#  pflfp   (ki1sd:ki1ed,            ki3sd:ki3ed+1) , & ! (W/m**2)
!#  pflcd   (ki1sd:ki1ed,            ki3sd:ki3ed+1) , & ! (W/m**2)
!#  pflcu   (ki1sd:ki1ed,            ki3sd:ki3ed+1) , & ! (W/m**2)
!#  pflcp   (ki1sd:ki1ed,            ki3sd:ki3ed+1)     ! (W/m**2)

  CHARACTER (LEN=255)  yzerrmsg      ! for error message
  CHARACTER (LEN=  5)  yzroutine

!- End of header
!==============================================================================

!------------------------------------------------------------------------------
! Start GPU data region
!------------------------------------------------------------------------------

  !$acc data                                                      &
  !---- Argument arrays - intent(in)
  !$acc present ( pti,pdp,pclc,pwv,psw,pqlwc,pqiwc,pduco2,pduo3 ) &
  !$acc present ( paeq1,paeq2,paeq3,paeq4,paeq5,psmu0,palth     ) &
  !$acc present ( palso,pskyview,pfcor                          ) &
  !---- Argument arrays - intent(inout)
  !$acc present ( papre                                         ) &
  !---- Argument arrays - intent(out)
  !$acc present ( pflt,pfls,pflt_s,pfls_s,pflsdir,pfltd,pfltu   ) &
  !$acc present ( pflsd,pflsu,pflsp,pflpar,pflsu_par,pflsd_par  ) &
  !$acc present ( pflsp_par                                     ) &
  !---- Local automatic arrays
  !$acc present ( zketyp,ztetyp,zflux,zflux_c,zfluxi,zfluxu     ) &
  !$acc present ( zfluxu_c,zfluxui,zfluxd,zfluxd_c,zfluxdi      ) &
  !$acc present ( zfgas,zfgasu,zfgasd,pbbr,pflpt,palp,pqsmu0    ) &
  !$acc present ( palogt,palogp,papra,pduh2oc,pduh2of,pdulwc    ) &
  !$acc present ( pduiwc,prholwc,prhoiwc,zduetpc,zduetpf,ztm    ) &
  !$acc present ( zzwv,zcpo,zcpn,zcmo,zcmn,podac,podaf,podsc    ) &
  !$acc present ( podsf,pbsfc,pbsff,pusfc,pusff,pca1,pcb1,pcc1  ) &
  !$acc present ( pcd1,pca2,pcb2,pcc2,pcd2,pflfd,pflfu,pflfp    ) &
  !$acc present ( pflcd,pflcu,pflcp                             )

!------------------------------------------------------------------------------
! Begin Subroutine fesft               
!------------------------------------------------------------------------------


! data_runcontrol

!  PRINT*,'INPUT DEBUG RG DATA_RUNCONTROL l_cosmo_art',l_cosmo_art
!  PRINT*,'INPUT DEBUG RG DATA_RUNCONTROL lradtopo',lradtopo
!
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION coali SUM',sum(coali)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION cobti SUM',sum(cobti)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION jpsol',jpsol
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION jpther',jpther
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION jpspec',jpspec
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION solant SUM',sum(solant)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION planck SUM',sum(planck)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION zketypa SUM',sum(zketypa)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION ztetypa SUM',sum(ztetypa)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION zteref SUM',zteref
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION ncgas SUM',sum(ncgas)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION nfast SUM',sum(nfast)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION coai SUM',sum(coai)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION cobi SUM',sum(cobi)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION zaea SUM',sum(zaea)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION zaes SUM',sum(zaes)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION zaeg SUM',sum(zaeg)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION zaef SUM',sum(zaef)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION zaef SUM AFTER',sum(zaef)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION zlwe SUM',sum(zlwe)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION zlwemn SUM',sum(zlwemn)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION zlwemx SUM',sum(zlwemx)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION zlww SUM',sum(zlww)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION zlwg SUM',sum(zlwg)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION ziwe SUM',sum(ziwe)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION ziwemn SUM',sum(ziwemn)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION ziwemx SUM',sum(ziwemx)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION ziww SUM',sum(ziww)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION ziwg SUM',sum(ziwg)
!  PRINT*,'INPUT DEBUG RG DATA_RADIATION zrsc SUM',sum(zrsc)

  yzerrmsg(:) = ' '
  yzroutine   = 'fesft'
  izerror     = 0

!------------------------------------------------------------------------------
! Section 1: Initializations
!------------------------------------------------------------------------------

  icrf  = 0
 
  ! Debug switches for lower level subroutines
  ldebug_th     = .FALSE.
  ldebug_so     = .FALSE.
  ldebug_opt_th = .FALSE.
  ldebug_opt_so = .FALSE.
  ldebug_inv_th = .FALSE.
  ldebug_inv_so = .FALSE.

  IF (idebug > 15) THEN
    PRINT *,' **** FESFT  *********************** debug point : ',j1b,j2b
  ENDIF 

  ! Preset output arrays
  !$acc parallel
  !$acc loop gang vector collapse(2)
  DO j3 = ki3sc, ki3ec+1
    DO j1 = ki1sc, ki1ec
      pflt   (j1,j3) = 0.0_dp
      pfls   (j1,j3) = 0.0_dp
      ! and for Climate-LM Version
      pflsdir(j1,j3) = 0.0_dp
    ENDDO
  ENDDO
  !$acc end parallel

#ifdef COSMOART
  IF(l_cosmo_art) THEN
    !$acc parallel
    !$acc loop gang vector collapse(2)
    DO j3 = ki3sc, ki3ec+1
      DO j1 = ki1sc, ki1ec  
        Edir (j1,jindex,j3) =  0.0_dp
        Edown(j1,jindex,j3) =  0.0_dp
        Eup  (j1,jindex,j3) =  0.0_dp
      ENDDO
    ENDDO
    !$acc end parallel
  ENDIF
#endif

  !$acc parallel
  !$acc loop gang vector
  DO j1 = ki1sc, ki1ec
    pflpar   (j1   ) = 0.0_dp
    pflsu_par(j1   ) = 0.0_dp
    pflsd_par(j1   ) = 0.0_dp
    pflsp_par(j1   ) = 0.0_dp
    pfls_s   (j1   ) = 0.0_dp
    pflt_s   (j1   ) = 0.0_dp
    pfltu    (j1   ) = 0.0_dp
    pfltd    (j1   ) = 0.0_dp
    pflsu    (j1   ) = 0.0_dp
    pflsd    (j1   ) = 0.0_dp
    pflsp    (j1   ) = 0.0_dp
  ENDDO
  !$acc end parallel

  ! Choice of e-type-absorption and temperature correction coefficients
  DO jspec = 1, jpther     
    zketyp(jspec) = zketypa(jspec)
    ztetyp(jspec) = ztetypa(jspec)
  ENDDO
  ! Initialized on CPU to avoid copying zketypa,ztetypa to GPU,
  ! but zketyp,ztetyp subsequently used on both CPU and GPU.
  !$acc update device (zketyp,ztetyp)
  

  ! cloud geometry factors
 
  ! first part for top layer
  !$acc parallel
  !$acc loop gang vector
  DO j1 = ki1sc, ki1ec
    pca2(j1,ki3sc)   = 1.0_dp - pclc(j1,ki3sc)
    pcd2(j1,ki3sc)   = 1.0_dp
    zcpn(j1)         = MAX(pclc(j1,ki3sc),pclc(j1,ki3sc+1))
    zcmn(j1)         = MIN(pclc(j1,ki3sc),pclc(j1,ki3sc+1))
    pca2(j1,ki3sc+1) = (1.0_dp-zcpn(j1))/pca2(j1,ki3sc)
    pcd2(j1,ki3sc+1) =         zcmn(j1) /pclc(j1,ki3sc)
  ENDDO
  !$acc end parallel
 
  ! first part for inner layers
 
  !$acc parallel
  !$acc loop seq
  DO j3 = ki3sc+1, ki3ec-1
    !$acc loop gang vector
    DO j1 = ki1sc, ki1ec
      zcpo(j1)      = zcpn(j1)
      zcmo(j1)      = zcmn(j1)
      zcpn(j1)      = MAX (pclc(j1,j3),pclc(j1,j3+1))
      zcmn(j1)      = MIN (pclc(j1,j3),pclc(j1,j3+1))
      pca2(j1,j3+1) = (1.0_dp-zcpn(j1))/(1.0_dp-pclc(j1,j3))
      pca1(j1,j3-1) = (1.0_dp-zcpo(j1))/(1.0_dp-pclc(j1,j3))
      pcd2(j1,j3+1) = zcmn(j1)/pclc(j1,j3)
      pcd1(j1,j3-1) = zcmo(j1)/pclc(j1,j3)
    ENDDO
  ENDDO
  !$acc end parallel
 
  ! first part for lowest layer
  !$acc parallel
  !$acc loop gang vector
  DO j1 = ki1sc, ki1ec
    pca1(j1,ki3ec-1) = (1.0_dp-zcpn(j1))/(1.0_dp-pclc(j1,ki3ec))
    pcd1(j1,ki3ec-1) = zcmn(j1)/pclc(j1,ki3ec)
    pca1(j1,ki3ec  ) = 1.0_dp
    pcd1(j1,ki3ec  ) = 1.0_dp
  ENDDO
  !$acc end parallel
 
  ! second part of geometry factors
  !$acc parallel
  !$acc loop gang vector collapse(2)
  DO j3 = ki3sc, ki3ec
    DO j1 = ki1sc, ki1ec
      pcb1(j1,j3) = 1.0_dp-pca1(j1,j3)
      pcc1(j1,j3) = 1.0_dp-pcd1(j1,j3)
      pcb2(j1,j3) = 1.0_dp-pca2(j1,j3)
      pcc2(j1,j3) = 1.0_dp-pcd2(j1,j3)
    ENDDO
  ENDDO
  !$acc end parallel
 
  ! Optically relevant layer constituents
  ! (Note: CO2 and O3 amounts are provided by calling routine)
  !$acc parallel
  !$acc loop gang vector
  DO j1 = ki1sc, ki1ec
    papra(j1) = papre(j1)   ! surface pressure
  ENDDO
  !$acc end parallel
 
  ! water vapour, liquid water and ice content, logarithm of layer
  ! mean temperature and pressure, absorber amount for e-type absorption
 
  !$acc parallel
  !$acc loop seq
  DO j3 = ki3ec, ki3sc,-1    ! Bottom to top
    !$acc loop gang vector
    DO j1 = ki1sc, ki1ec
      ztm   (j1)    = 0.5_dp*(pti(j1,j3)+pti(j1,j3+1))
      papra (j1)    = papra(j1) - 0.5_dp*pdp(j1,j3)
      palogt(j1,j3) = LOG  (ztm  (j1))
      palogp(j1,j3) = LOG  (papra(j1))
    
      ! cloud-free:  water vapour and e-type absorber amount
      zzwv   (j1) = MAX( (pwv(j1,j3)-pclc(j1,j3)*psw(j1,j3)) &
                            /(1.0_dp-pclc(j1,j3)) , 0.0_dp)
      pduh2of(j1,j3) = pdp(j1,j3)*zzwv(j1)
      zduetpf(j1,j3) = pduh2of(j1,j3)*pduh2of(j1,j3) &
                         *papra(j1)*zrvd/pdp(j1,j3)
    
      ! cloudy:  water vapour, e-type absorber amount, liquid water and ice
      pdulwc (j1,j3) = pdp(j1,j3) * (pqlwc(j1,j3)/pclc(j1,j3))
      pdulwc (j1,j3) = MAX( pdulwc(j1,j3), 0.0_dp )
      pduiwc (j1,j3) = pdp(j1,j3) * (pqiwc(j1,j3)/pclc(j1,j3))
      pduiwc (j1,j3) = MAX( pduiwc(j1,j3), 0.0_dp )
      pduh2oc(j1,j3) = pdp(j1,j3) * psw(j1,j3)
      zduetpc(j1,j3) = pduh2oc(j1,j3) * pduh2oc(j1,j3) *           &
                                papra(j1) * zrvd / pdp(j1,j3)
      prholwc(j1,j3) = (pqlwc(j1,j3) / pclc(j1,j3)) * papra(j1) &
                            / (zrd*ztm(j1) * (1.0_dp+zrvdm1*psw(j1,j3)))
      prhoiwc(j1,j3) = (pqiwc(j1,j3) / pclc(j1,j3)) * papra(j1) &
                            / (zrd*ztm(j1) * (1.0_dp+zrvdm1*psw(j1,j3)))
      ! Secure minium for ice density for use in empirical function with ALOG
      prhoiwc(j1,j3) = MAX (prhoiwc(j1,j3),1.0E-06_dp) 
       
      papra  (j1)    = papra(j1) - 0.5_dp * pdp(j1,j3)
    ENDDO
  ENDDO     ! End of vertical loop
  !$acc end parallel

  ! Identify *papre* with top of model pressure (for Rayleigh scattering)
  !$acc parallel
  !$acc loop gang vector
  DO j1 = ki1sc, ki1ec
    papre(j1) = papra(j1)
  ENDDO
  !$acc end parallel
 
#ifdef COSMOART
! aerosol optical properties for online radiation feedback
  IF(l_cosmo_art) THEN
    IF (lrad_dust) CALL rad_dust(jindex)
    IF (lrad_seas) CALL rad_seas(jindex)
    IF (lrad_aero) CALL rad_aero(jindex)
  ENDIF
#endif

1 CONTINUE  ! Address for backward jump to perform cloud-free calculations

!------------------------------------------------------------------------------
! Section 2: Thermal radiative flux calculations 
!------------------------------------------------------------------------------

  ! Loop over thermal spectral intervals
  !================================================================
  thermal_spectral_loop:  DO jspec=jpsol+1,jpspec
  !================================================================
      
  !----------------------------------------------------------------------------
  ! Section 2.1: Initializations
  !----------------------------------------------------------------------------

    jspect = jspec - jpsol
 
    ! Black body radiation at layer boundaries in spectral interval
    !$acc parallel
    !$acc loop gang
    DO j3 = ki3sc, ki3ec+1
      !$acc loop vector
      DO j1 = ki1sc, ki1ec
        pbbr(j1,j3)= ( planck(1,jspect) + pti(j1,j3)                      &
                   * ( planck(2,jspect) + pti(j1,j3)*planck(3,jspect) ) ) &
                   * psig * (pti(j1,j3)**2)**2
      ENDDO
    ENDDO
    !$acc end parallel
 
    ! Optical properties of non-gaseous constituents        
    IF (idebug > 10 ) THEN
       print *,' FESFT    Call to opt_th for jspec: ',jspec
    ENDIF 

    IF (lloc_timing) CALL start_loc_timing("rad_opt_th",itim_opt_th) !XL_TIMING
    CALL opt_th( prholwc, pdulwc, prhoiwc, pduiwc,              &
                 paeq1  , paeq2 , paeq3  , paeq4 , paeq5 ,      &
                 ki1sd  , ki1ed , ki3sd  , ki3ed , jspec ,      &
                 ki1sc  , ki1ec , ki3sc  , ki3ec ,              &
                 ldebug_opt_th  , jindex ,                      &
                 podac  , podaf , podsc  , podsf , pbsfc , pbsff)
    IF (lloc_timing) CALL end_loc_timing(itim_opt_th) !XL_TIMING

    ! Addition of e-type contribution
    IF (zketyp(jspect) /= 0.0_dp) THEN
      zet   = 1.0_dp/EXP(ztetyp(jspect)/zteref)
      !$acc parallel
      !$acc loop seq
      DO j3 = ki3sc,ki3ec
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          ztm(j1)      = 0.5_dp*(pti(j1,j3)+pti(j1,j3+1))
          podaf(j1,j3) = podaf(j1,j3) + zduetpf(j1,j3) &
                       * zet * EXP(ztetyp(jspect)/ztm(j1)) * zketyp(jspect)
          podac(j1,j3) = podac(j1,j3) + zduetpc(j1,j3) &
                       * zet * EXP(ztetyp(jspect)/ztm(j1)) * zketyp(jspect)
        ENDDO  
      ENDDO
      !$acc end parallel
    ENDIF

  !----------------------------------------------------------------------------
  ! Section 2.2: Selection of ESFT or FESFT method for interval considered
  !----------------------------------------------------------------------------

    !--------------------------------------------------------------
    IF (nfast(jspec) == 0) THEN           ! ESFT method
    !--------------------------------------------------------------

      !$acc parallel
      !$acc loop gang vector collapse(2)
      DO j3 = ki3sc, ki3ec+1
        DO j1 = ki1sc, ki1ec
          zflux(j1,j3) = 0.0_dp  ! Preset flux in spectral interval
        ENDDO
      ENDDO
      !$acc end parallel
 
      ! Loop over various absorption coefficients of each of the three gases
 
      ih2o = ncgas(jspec,1)
      ico2 = ncgas(jspec,2)
      io3  = ncgas(jspec,3)
 
      DO jh2o=    1,ih2o    ! Loop over H2O coefficients
        DO jco2=  1,ico2    ! Loop over CO2 coefficients
          DO jo3= 1,io3     ! Loop over O3  coefficients
 
            zaiprod = coai(jh2o,jspec,1)*coai(jco2,jspec,2)*coai(jo3,jspec,3)
 
            IF (icrf.eq.0) THEN      ! partially cloudy atmosphere
              IF (lloc_timing) CALL start_loc_timing("rad_inv_th",itim_inv_th) !XL_TIMING
              CALL       inv_th (                                              &
                pclc   ,pca1   ,pca2  ,pcb1  ,pcb2  ,pcc1  ,pcc2 ,pcd1 ,pcd2 , &
                pduh2oc,pduh2of,pduco2,pduo3 ,palogp,palogt,                   &
                podsc  ,podsf  ,podac ,podaf ,pbsfc ,pbsff ,                   &
                pbbr   ,palth,                                                 &
                jspec  ,jh2o   ,jco2  ,jo3   ,                                 &
                ki1sd  ,ki1ed  ,ki3sd ,ki3ed ,ki1sc ,ki1ec ,ki3sc ,ki3ec ,     &
                ldebug_inv_th  ,jindex,                                        &
                pflcu  ,pflfu  ,pflcd ,pflfd)
              IF (lloc_timing) CALL end_loc_timing(itim_inv_th) !XL_TIMING
            ELSE                     ! 'cloud-free' atmosphere    
              print *,' CRF not yet implemented'
            END IF
 
            ! Incrementation of flux in spectral interval

            !$acc parallel
            !$acc loop gang
            DO j3 = ki3sc, ki3ec+1
              !$acc loop vector
              DO j1 = ki1sc, ki1ec
                zflux(j1,j3) = zflux(j1,j3)                            &
                   + zaiprod * ( pflfu(j1,j3) + pflcu(j1,j3)           &
                               - pflfd(j1,j3) - pflcd(j1,j3) )
              ENDDO
            ENDDO
            !$acc end parallel

          ENDDO       ! Loop over O3 absorption coefficients
        ENDDO         ! Loop over CO2 absorption coefficients
      ENDDO           ! Loop over H2O absorption coefficients

    !--------------------------------------------------------------
    ELSE                                  ! FESFT method
    !--------------------------------------------------------------

      igase = 0
      DO jg=1,3
        icgas (jg) = 0
        IF (ncgas(jspec,jg).GT.1) THEN
          igase = igase + 1
        ENDIF
      ENDDO
      igasm1 = igase - 1
 
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      IF (igase.le.1) THEN  !(no 'grey' fluxes required)
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        !$acc parallel
        !$acc loop gang
        DO j3 = ki3sc, ki3ec+1
          !$acc loop vector
          DO j1 = ki1sc, ki1ec
            zfluxi(j1,j3) = 1.0_dp
          ENDDO
        ENDDO
        !$acc end parallel

      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      ELSE   ! more than 1 gas --> 'grey' fluxes required
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        IF (icrf.EQ.0) THEN    ! partially cloudy atmosphere
          IF (lloc_timing) CALL start_loc_timing("rad_inv_th",itim_inv_th) !XL_TIMING
          CALL       inv_th (                                               &
             pclc   ,pca1   ,pca2  ,pcb1  ,pcb2  ,pcc1  ,pcc2 ,pcd1 ,pcd2 , &
             pduh2oc,pduh2of,pduco2,pduo3 ,palogp,palogt,                   &
             podsc  ,podsf  ,podac ,podaf ,pbsfc ,pbsff ,                   &
             pbbr   ,palth,                                                 &
             jspec  ,0      ,0     ,0     ,                                 &
             ki1sd  ,ki1ed  ,ki3sd ,ki3ed ,ki1sc ,ki1ec ,ki3sc ,ki3ec ,     &
             ldebug_inv_th  ,jindex,                                        &
             pflcu  ,pflfu  ,pflcd ,pflfd)
          IF (lloc_timing) CALL end_loc_timing(itim_inv_th) !XL_TIMING
        ELSE                     ! 'cloud-free' atmosphere    
          print *,' CRF not yet implemented'
        ENDIF

        ! Storage of 'grey' fluxes and their inverse (**igasm1)
        !$acc parallel
        !$acc loop gang
        DO j3 = ki3sc, ki3ec+1
          !$acc loop vector
          DO j1 = ki1sc, ki1ec
            zflux (j1,j3) = pflfu(j1,j3) + pflcu(j1,j3)          &
                          - pflfd(j1,j3) - pflcd(j1,j3)
            zfluxi(j1,j3) = 1.0_dp / MIN( -zepflx, zflux(j1,j3) )**igasm1
          ENDDO
        ENDDO
        !$acc end parallel

      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      ENDIF    ! No.of relevant gases
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

      igasz = 0
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      DO jg = 3, 1, -1   !     Loop over gases
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
        IF (ncgas(jspec,jg).GT.1) THEN   ! include gas only, if necessary
          igasz = igasz + 1
 
          DO jjg = 1,3
            icgas(jjg) = 0      !   Set absorption coefficient index for all
          ENDDO                 !   gases to zero
 
          !$acc parallel
          !$acc loop gang
          DO j3 = ki3sc, ki3ec+1
            !$acc loop vector
            DO j1 = ki1sc, ki1ec
              zfgas(j1,j3) = 0.0_dp    ! Preset 'gaseous' flux
            ENDDO
          ENDDO
          !$acc end parallel
 
          icc = ncgas(jspec,jg) ! No.of relevant coefficients    
 
          ! -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
          DO jc = icc,1,-1        ! Loop over absorption coefficients
          ! -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
            zcoai = coai(jc,jspec,jg)
            zcobi = cobi(jc,jspec,jg)
 
            ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            IF ( ((zcoai.GE.zepai).AND.(zcobi.GT.0.0_dp)) .OR. (igase.EQ.1) ) THEN   
            ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
              ! Solve linear system, if necessary
              icgas(jg) = jc
              IF (icrf.EQ.0) THEN  ! partially cloudy atmosphere
                IF (lloc_timing) CALL start_loc_timing("rad_inv_th",itim_inv_th) !XL_TIMING
                CALL       inv_th (                                              & 
                  pclc   ,pca1   ,pca2  ,pcb1  ,pcb2  ,pcc1  ,pcc2 ,pcd1 ,pcd2 , &
                  pduh2oc,pduh2of,pduco2,pduo3 ,palogp,palogt,                   &
                  podsc  ,podsf  ,podac ,podaf ,pbsfc ,pbsff ,                   &
                  pbbr   ,palth,                                                 &
                  jspec  ,icgas(1),icgas(2),icgas(3),                            &
                  ki1sd  ,ki1ed  ,ki3sd ,ki3ed ,ki1sc ,ki1ec ,ki3sc ,ki3ec ,     &
                  ldebug_inv_th  ,jindex,                                        &
                  pflcu  ,pflfu  ,pflcd ,pflfd)
                IF (lloc_timing) CALL end_loc_timing(itim_inv_th) !XL_TIMING
              ELSE                     ! 'cloud-free' atmosphere    
                print *,' CRF not yet implemented'
              ENDIF
            ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            ELSE               ! use 'grey' fluxes directly
            ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
              !$acc parallel
              !$acc loop gang vector collapse(2)
              DO j3 = ki3sc, ki3ec+1
                DO j1 = ki1sc, ki1ec
                  pflfu(j1,j3) = zflux(j1   ,j3)
                  pflfd(j1,j3) = 0.0_dp
                  pflcu(j1,j3) = 0.0_dp
                  pflcd(j1,j3) = 0.0_dp
                ENDDO
              ENDDO
              !$acc end parallel
            ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            ENDIF            ! Necessity to calculate fluxes
            ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
            !$acc parallel
            !$acc loop gang
            DO j3 = ki3sc, ki3ec+1
              !$acc loop vector
              DO j1 = ki1sc, ki1ec
                zfgas(j1,j3) = zfgas(j1,j3) + zcoai * ( pflfu(j1,j3) &
                             + pflcu(j1,j3) - pflfd(j1,j3) - pflcd(j1,j3) )
              ENDDO
            ENDDO
            !$acc end parallel

!XL_TODO/GPU_WRITE
#ifndef _OPENACC
            !?????????????????????????????????????????????????????????????????
            IF (ldebug_th .AND. j2b==jindex) THEN
              print *,' FESFT in debug mode for thermal fluxes'
              print *,' only one interval/coefficient considered '
              print *,'zfgas(j1b,j2b,ki3sc): ',zfgas(j1b    ,ki3sc)
              EXIT thermal_spectral_loop
            ENDIF 
            !?????????????????????????????????????????????????????????????????
#endif
          ! -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
          ENDDO      ! Loop over absorption coefficients
          ! -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
 
          ! Combination of inverse of 'grey' fluxes and actual gaseous flux
          !$acc parallel
          !$acc loop gang
          DO j3 = ki3sc, ki3ec+1
            !$acc loop vector
            DO j1 = ki1sc, ki1ec
              zfluxi(j1,j3) = zfluxi(j1,j3)*zfgas(j1,j3)
            ENDDO
          ENDDO
          !$acc end parallel
 
          IF (igasz.eq.igasm1) THEN    ! Avoid unphysical pseudo-transmission
            !$acc parallel
            !$acc loop gang
            DO j3 = ki3sc, ki3ec+1
              !$acc loop vector
              DO j1 = ki1sc, ki1ec
                zfluxi(j1,j3) = MIN( 1.0_dp, MAX( 0.0_dp, zfluxi(j1,j3) ) )
              ENDDO
            ENDDO
            !$acc end parallel
          ENDIF
    
        ENDIF                   ! Test, whether gas needs to be included
    
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      END DO          ! End of loop over gases
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
      ! Store FESFT result in zflux
      !$acc parallel
      !$acc loop gang
      DO j3 = ki3sc, ki3ec+1
        !$acc loop vector
        DO j1 = ki1sc, ki1ec
          zflux(j1,j3) = zfluxi(j1,j3)
        ENDDO
      ENDDO
      !$acc end parallel

    !--------------------------------------------------------------
    END IF                             ! ESFT/FESFT-Selection 
    !--------------------------------------------------------------

  !----------------------------------------------------------------------------
  ! Section 2.3: Addition of flux for spectral interval to total thermal flux
  !----------------------------------------------------------------------------
 
    IF (icrf.EQ.0) THEN     ! Add flux at all levels
      !$acc parallel
      !$acc loop gang
      DO j3 = ki3sc, ki3ec+1
        DO j1 = ki1sc, ki1ec
          pflt(j1,j3) = pflt(j1,j3) + zflux(j1,j3)
        ENDDO
      ENDDO
      !$acc end parallel
    END IF
 
  ! End of spectral loop
  ! ===============================================================
  ENDDO  thermal_spectral_loop
  ! ===============================================================

  !----------------------------------------------------------------------------
  ! Section 2.4: Storage of components for thermal radiative surface flux
  !----------------------------------------------------------------------------

  !$acc parallel
  !$acc loop gang vector
  DO j1 = ki1sc, ki1ec
    ! Recompute surface thermal flux components based on lower boundary 
    ! condition (cf. Ritter and Geleyn (1992))
    zemissivity =  1.0_dp-palth(j1) ! surface emissivity
    pfltd (j1) = (pflt(j1,ki3ec+1) + zemissivity * psig * pti(j1,ki3ec+1)**4) &
               / zemissivity
    pfltu (j1) = pfltd(j1) - pflt(j1,ki3ec+1)
    pflt_s(j1) = pflt(j1,ki3ec+1)
  ENDDO
  !$acc end parallel

!XL_TODO/GPU_WRITE
#ifndef _OPENACC
!NEC_CB Moved Debug-Prints of out the loop
  IF (idebug > 15) THEN
    IF ((j2b==jindex).AND.(j1b>=ki1sc).AND.(j1b<=ki1ec)) THEN
      WRITE (*,'(A32,2F16.6)') 'FESFT: zemissivity, palth',              &
           zemissivity, palth(j1b)  
      WRITE (*,'(A60, F16.6)')                                           &
          'FESFT: thermal fluxes before and after correction, skyview',  &
           pskyview(j1b)
      WRITE (*,'(A32,2I4,3F16.6)') 'FESFT th before: net, down, up:',    &
           j1b, j2b, pflt(j1b,ki3ec+1), pfltd(j1b), pfltu(j1b)
    ENDIF
  ENDIF
#endif

  IF (lradtopo) THEN
    !$acc parallel
    !$acc loop gang vector
    DO j1 = ki1sc, ki1ec
      ! corrected thermal balance
      ! correction as in Mueller and Scherrer (2005)
      pfltd (j1   ) = pfltd(j1   ) *               pskyview(j1   )  +   &
                      pfltu(j1   ) * (1.0_dp - pskyview(j1   ))
      pflt_s(j1   ) = pfltd(j1   )-pfltu(j1   )
    ENDDO
    !$acc end parallel

!XL_TODO/GPU_WRITE
#ifndef _OPENACC
!NEC_CB Moved Debug-Prints of out the loop
    IF (idebug > 15) THEN
      IF ((j2b==jindex).AND.(j1b>=ki1sc).AND.(j1b<=ki1ec)) THEN
        WRITE (*,'(A32,2I4,3F16.6)') 'FESFT th after: net,down,up:',     &
                j1b, j2b, pflt_s(j1b  ), pfltd(j1b  ), pfltu(j1b  )
      END IF
    END IF
#endif
  END IF

!------------------------------------------------------------------------------
! Section 3: Solar flux calculations, if required
!------------------------------------------------------------------------------

  IF (lsolar) THEN

  !----------------------------------------------------------------------------
  ! Section 3.1: Initializations
  !----------------------------------------------------------------------------

  ! Inverse of cosine of zenith angle and surface albedo for
  ! parallel radiation

  !$acc parallel
  !$acc loop gang vector
  DO j1 = ki1sc, ki1ec
    pqsmu0(j1) = 1.0_dp / psmu0(j1)
    palp  (j1) = (1.0_dp +                                        &
             0.5_dp * (psmu0(j1) * (1.0_dp/palso(j1) - 1.0_dp)))  &
          / (1.0_dp + (psmu0(j1) * (1.0_dp/palso(j1) - 1.0_dp)))**2
  ENDDO
  !$acc end parallel

  ! Loop over solar spectral intervals
  ! ===============================================================
  solar_spectral_loop:  DO jspec = 1, jpsol
  ! ===============================================================

    ! Preset flux in spectral interval
    !$acc parallel
    !$acc loop gang vector collapse(2)
    DO j3 = ki3sc, ki3ec+1
      DO j1 = ki1sc, ki1ec
        zflux (j1,j3) = 0.0_dp
        zfluxd(j1,j3) = 0.0_dp
        zfluxu(j1,j3) = 0.0_dp
      ENDDO
    ENDDO
    !$acc end parallel
 
    ! Upper boundary condition and reference pressure for Rayleigh sc.
    !$acc parallel
    !$acc loop gang vector
    DO j1 = ki1sc, ki1ec
      pflpt(j1) = psct * solant(jspec) * psmu0(j1)
      papra(j1) = papre(j1) * pqsmu0(j1)
    ENDDO
    !$acc end parallel
 
    ! Optical properties of non-gaseous constituents        
 
    IF (idebug > 10) THEN
      print *,' FESFT    Call to opt_so for jspec: ',jspec
    ENDIF   

    IF (lloc_timing) CALL start_loc_timing("rad_opt_so",itim_opt_so) !XL_TIMING
    CALL opt_so ( prholwc,pdulwc,prhoiwc,pduiwc,               &
                  paeq1  ,paeq2 ,paeq3  ,paeq4 , paeq5 ,       &
                  pdp    ,papra ,psmu0  ,pqsmu0,               &
                  ki1sd  ,ki1ed ,ki3sd  ,ki3ed , jspec ,       &
                  ki1sc  ,ki1ec ,ki3sc  ,ki3ec ,               &
                  ldebug_opt_so ,jindex ,                      &
                  podac  ,podaf ,podsc  ,podsf , pbsfc ,pbsff ,&
                  pusfc   ,pusff                               )
    IF (lloc_timing) CALL end_loc_timing(itim_opt_so) !XL_TIMING

  !----------------------------------------------------------------------------
  ! Section 3.2: Selection of ESFT or FESFT method for interval considered
  !----------------------------------------------------------------------------

    !--------------------------------------------------------------
    IF (nfast(jspec).eq.0) THEN           ! ESFT method
    !--------------------------------------------------------------

      ih2o = ncgas(jspec,1)
      ico2 = ncgas(jspec,2)
      io3  = ncgas(jspec,3)
 
      DO jh2o    = 1, ih2o    ! Loop over H2O coefficients
        DO jco2  = 1, ico2    ! Loop over CO2 coefficients
          DO jo3 = 1, io3     ! Loop over O3  coefficients
 
            zaiprod=coai(jh2o,jspec,1)*coai(jco2,jspec,2)*coai(jo3,jspec,3)
 
            IF (icrf.eq.0) THEN      ! partially cloudy atmosphere
              IF (lloc_timing) CALL start_loc_timing("rad_inv_so",itim_inv_so) !XL_TIMING
              CALL inv_so (                                                     &
                 pclc   ,pca1   ,pca2  ,pcb1  ,pcb2  ,pcc1  ,pcc2 ,pcd1 ,pcd2 , &
                 pflpt  ,psmu0  ,pqsmu0,palp  ,palso ,                          &
                 pduh2oc,pduh2of,pduco2,pduo3 ,palogp,palogt,                   &
                 podsc  ,podsf  ,podac ,podaf ,pbsfc ,pbsff ,pusfc,pusff,       &
                 jspec  ,jh2o   ,jco2  ,jo3   ,                                 &
                 ki1sd  ,ki1ed  ,ki3sd ,ki3ed ,ki1sc ,ki1ec ,ki3sc,ki3ec,       &
                 ldebug_inv_so  ,jindex,                                        &
                 pflcu  ,pflfu  ,pflcd ,pflfd ,pflcp ,pflfp)
              IF (lloc_timing) CALL end_loc_timing(itim_inv_so) !XL_TIMING
 
            ELSE                     ! cloud-free calculation
              print *,' CRF-Code not implemented yet'
            ENDIF
 
            ! Incrementation of flux in spectral interval
            !$acc parallel
            !$acc loop gang
            DO j3 = ki3sc, ki3ec+1
              !$acc loop vector
              DO j1 = ki1sc, ki1ec
                zflux (j1,j3) = zflux (j1,j3)                           &
                              + zaiprod * (pflfp(j1,j3) + pflcp(j1,j3))
                zfluxd(j1,j3) = zfluxd(j1,j3)                           &
                              + zaiprod * (pflfd(j1,j3) + pflcd(j1,j3))
                zfluxu(j1,j3) = zfluxu(j1,j3)                           &
                              + zaiprod * (pflfu(j1,j3) + pflcu(j1,j3))
              ENDDO
            ENDDO
            !$acc end parallel
 
          ENDDO       ! Loop over O3 absorption coefficients
        ENDDO         ! Loop over CO2 absorption coefficients
      ENDDO           ! Loop over H2O absorption coefficients

    !--------------------------------------------------------------
    ELSE                                  ! FESFT method
    !--------------------------------------------------------------

      igase = 0
      DO jg = 1, 3
        icgas(jg) = 0
        IF (ncgas(jspec,jg).GT.1) THEN
          igase = igase + 1
        ENDIF
      ENDDO

      igasm1    = igase -1
 
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      IF (igase.le.1) THEN  !(no 'grey' fluxes required)
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        !$acc parallel
        !$acc loop gang vector collapse(2)
        DO j3 = ki3sc, ki3ec+1
          DO j1 = ki1sc, ki1ec
            zflux  (j1,j3) = 1.0_dp
            zfluxd (j1,j3) = 1.0_dp
            zfluxu (j1,j3) = 1.0_dp
            zfluxi (j1,j3) = 1.0_dp
            zfluxdi(j1,j3) = 1.0_dp
            zfluxui(j1,j3) = 1.0_dp
          ENDDO
        ENDDO
        !$acc end parallel

      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      ELSE   ! more than 1 gas --> 'grey' fluxes required
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        IF (icrf.eq.0) THEN      ! partially cloudy atmosphere
          IF (lloc_timing) CALL start_loc_timing("rad_inv_so",itim_inv_so) !XL_TIMING
          CALL inv_so (                                                    &
             pclc   ,pca1   ,pca2  ,pcb1  ,pcb2  ,pcc1  ,pcc2 ,pcd1 ,pcd2 ,&
             pflpt  ,psmu0  ,pqsmu0,palp  ,palso ,                         &
             pduh2oc,pduh2of,pduco2,pduo3 ,palogp,palogt,                  & 
             podsc  ,podsf  ,podac ,podaf ,pbsfc ,pbsff ,pusfc,pusff,      &
             jspec  ,0      ,0     ,0     ,                                &
             ki1sd  ,ki1ed  ,ki3sd ,ki3ed ,ki1sc ,ki1ec ,ki3sc,ki3ec,      &
             ldebug_inv_so  ,jindex,                                       &
             pflcu  ,pflfu  ,pflcd ,pflfd ,pflcp ,pflfp)
          IF (lloc_timing) CALL end_loc_timing(itim_inv_so) !XL_TIMING
        ELSE                     ! cloud-free calculation
          yzerrmsg = ' CRF-Code not implemented yet !!!'
          izerror  = 2616
          CALL model_abort(my_cart_id, izerror, yzerrmsg, yzroutine)
        ENDIF

        ! Storage of 'grey' fluxes and their inverse (**igasm1)
        !$acc parallel
        !$acc loop gang
        DO j3 = ki3sc, ki3ec+1
          !$acc loop vector
          DO j1 = ki1sc, ki1ec
            zfluxi (j1,j3) = 1.0_dp                                  &
                           / MAX (pflfp(j1,j3)+pflcp(j1,j3), zepflx) ** igasm1
            zfluxdi(j1,j3) = 1.0_dp                                  &
                           / MAX (pflfd(j1,j3)+pflcd(j1,j3), zepflx) ** igasm1
            zfluxui(j1,j3) = 1.0_dp                                  &
                           / MAX (pflfu(j1,j3)+pflcu(j1,j3), zepflx) ** igasm1
            zflux  (j1,j3) = pflfp(j1,j3) + pflcp(j1,j3)
            zfluxd (j1,j3) = pflfd(j1,j3) + pflcd(j1,j3)
            zfluxu (j1,j3) = pflfu(j1,j3) + pflcu(j1,j3)
          ENDDO
        ENDDO
        !$acc end parallel

!XL_TODO/GPU_WRITE
#ifndef _OPENACC
        IF (ldebug_so .AND. j2b==jindex) THEN
          print *,' FESFT in debug mode for solar fluxes for js = ', jindex
          print *,' Grey fluxes   '
          DO j3=ki3sc,ki3ec+1
            print *,'par/down/up    : ',zflux (j1b    ,j3) &
                                       ,zfluxd(j1b    ,j3) &
                                       ,zfluxu(j1b    ,j3),j3
          ENDDO
        ENDIF 
#endif
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      ENDIF    ! No.of relevant gases
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

      igasz = 0
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      DO jg = 3, 1, -1   !     Loop over gases
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
      IF (ncgas(jspec,jg).GT.1) THEN   ! include gas only, if necessary
   
        igasz = igasz + 1
 
        DO jjg = 1,3
          icgas(jjg) = 0
        ENDDO 
 
        ! Initialize 'gaseous' fluxes
        !$acc parallel
        !$acc loop gang vector collapse(2)
        DO j3 = ki3sc, ki3ec+1
          DO j1 = ki1sc, ki1ec
            zfgas (j1,j3) = 0.0_dp
            zfgasd(j1,j3) = 0.0_dp
            zfgasu(j1,j3) = 0.0_dp
          ENDDO
        ENDDO
        !$acc end parallel
 
        ! -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
        icc = ncgas(jspec,jg)
        DO jc = icc,1,-1        ! Loop over absorption coefficients
        ! -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
          zcoai = coai(jc,jspec,jg)
          zcobi = cobi(jc,jspec,jg)
          ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
          IF ( ((zcoai.GE.zepai).AND.(zcobi.GT.0.0_dp)) .OR. (igase.EQ.1) ) THEN 
          ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            ! Solve linear system, if necessary
            icgas(jg) = jc
            IF (icrf.eq.0) THEN      ! partially cloudy atmosphere
              IF (lloc_timing) CALL start_loc_timing("rad_inv_so",itim_inv_so) !XL_TIMING
              CALL inv_so (                                                     &
                 pclc   ,pca1   ,pca2  ,pcb1  ,pcb2  ,pcc1  ,pcc2 ,pcd1 ,pcd2 , &
                 pflpt  ,psmu0  ,pqsmu0,palp  ,palso ,                          &
                 pduh2oc,pduh2of,pduco2,pduo3 ,palogp,palogt,                   &
                 podsc  ,podsf  ,podac ,podaf ,pbsfc ,pbsff ,pusfc,pusff,       &
                 jspec  ,icgas(1),icgas(2),icgas(3),                            &
                 ki1sd  ,ki1ed  ,ki3sd ,ki3ed ,ki1sc ,ki1ec ,ki3sc,ki3ec,       &
                 ldebug_inv_so  ,jindex,                                        &
                 pflcu  ,pflfu  ,pflcd ,pflfd ,pflcp ,pflfp)
              IF (lloc_timing) CALL end_loc_timing(itim_inv_so) !XL_TIMING
            ELSE                     ! cloud-free clculations
              yzerrmsg = ' CRF-Code not implemented yet !!!'
              izerror  = 2616
              CALL model_abort(my_cart_id, izerror, yzerrmsg, yzroutine)
            ENDIF

          ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
          ELSE               ! use 'grey' fluxes directly
          ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

            !$acc parallel
            !$acc loop gang
            DO j3 = ki3sc, ki3ec+1
              !$acc loop vector
              DO j1 = ki1sc, ki1ec
                pflfp(j1,j3) = zflux (j1,j3)
                pflcp(j1,j3) = 0.0_dp
                pflfd(j1,j3) = zfluxd(j1,j3)
                pflcd(j1,j3) = 0.0_dp
                pflfu(j1,j3) = zfluxu(j1,j3)
                pflcu(j1,j3) = 0.0_dp
              ENDDO
            ENDDO
            !$acc end parallel

          ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
          ENDIF            ! Necessity to calculate fluxes
          ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
          !$acc parallel
          !$acc loop gang
          DO j3 = ki3sc, ki3ec+1
            !$acc loop vector
            DO j1 = ki1sc, ki1ec
              zfgas (j1,j3) = zfgas (j1,j3)                          &
                            + zcoai * (pflfp(j1,j3) + pflcp(j1,j3))
              zfgasd(j1,j3) = zfgasd(j1,j3)                          &
                            + zcoai * (pflfd(j1,j3) + pflcd(j1,j3))
              zfgasu(j1,j3) = zfgasu(j1,j3)                          &
                            + zcoai * (pflfu(j1,j3) + pflcu(j1,j3))
            ENDDO
          ENDDO
          !$acc end parallel
 
!XL_TODO/GPU_WRITE
#ifndef _OPENACC
          !?????????????????????????????????????????????????????????????????
          IF (ldebug_so .AND. j2b==jindex) THEN
             print *,' FESFT in debug mode for solar fluxes for js = ', jindex
             print *,' only one interval/coefficient considered '
             print *,' zcoai = ',zcoai
             DO j3=ki3sc,ki3ec+1
                print *,'zfgas(j1b,j2b,j3): ',zfgas(j1b    ,j3)
             ENDDO 
             EXIT solar_spectral_loop
          ENDIF 
          !?????????????????????????????????????????????????????????????????
#endif
        ! -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
        ENDDO      ! Loop over absorption coefficients
        ! -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
 
        ! Combination of inverse of 'grey' fluxes and actual gaseous flux
        !$acc parallel
        !$acc loop gang vector collapse(2)
        DO j3 = ki3sc, ki3ec+1
            DO j1 = ki1sc, ki1ec
              zfluxi (j1,j3) = zfluxi (j1,j3) * zfgas (j1,j3)
              zfluxdi(j1,j3) = zfluxdi(j1,j3) * zfgasd(j1,j3)
              zfluxui(j1,j3) = zfluxui(j1,j3) * zfgasu(j1,j3)
          ENDDO
        ENDDO
        !$acc end parallel
 
        IF (igasz.eq.igasm1) THEN ! Avoid unphysical pseudo-transmission
          !$acc parallel
          !$acc loop gang vector collapse(2)
          DO j3 = ki3sc, ki3ec+1
            DO j1 = ki1sc, ki1ec
              zfluxi (j1,j3) = MIN( 1.0_dp, MAX( 0.0_dp, zfluxi (j1,j3)) )
              zfluxdi(j1,j3) = MIN( 1.0_dp, MAX( 0.0_dp, zfluxdi(j1,j3)) )
              zfluxui(j1,j3) = MIN( 1.0_dp, MAX( 0.0_dp, zfluxui(j1,j3)) )
            ENDDO
          ENDDO
          !$acc end parallel
        END IF

      END IF                   ! Test, whether gas needs to be included
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      END DO          ! End of loop over gases
      ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
      ! Store FESFT result in zflux
      !$acc parallel
      !$acc loop gang vector collapse(2)
      DO j3 = ki3sc, ki3ec+1
        DO j1 = ki1sc, ki1ec
          zflux (j1,j3) = zfluxi (j1,j3) 
          zfluxd(j1,j3) = zfluxdi(j1,j3)
          zfluxu(j1,j3) = zfluxui(j1,j3)
        ENDDO
      ENDDO
      !$acc end parallel
 
    !--------------------------------------------------------------
    END IF                             ! ESFT/FESFT-Selection 
    !--------------------------------------------------------------

  !----------------------------------------------------------------------------
  ! Section 3.3: Compute corrected fluxes, if lradtopo
  !----------------------------------------------------------------------------

    IF (lradtopo) THEN
!XL_TODO/GPU_WRITE
#ifndef _OPENACC
      IF (idebug > 15 .AND. j2b==jindex) THEN
        WRITE (*,'(A60,2F16.6)')                                          &
               'FESFT: solar fluxes before and after, skyview, fcor',     &
                          pskyview(j1b), pfcor(j1b)
        WRITE (*,'(A32,2I4,3F16.6)')  'FESFT: zfluxd, zflux, zfluxu',     &
                j1b, j2b, zfluxd(j1b,ki3ec+1), zflux(j1b,ki3ec+1),        &
                          zfluxu(j1b,ki3ec+1)
        zalbedo = zfluxu(j1b,ki3ec+1) /                                   &
                          (zflux(j1b,ki3ec+1)+zfluxd(j1b,ki3ec+1))
        WRITE (*,'(A32,2F16.6)') 'albedo, palso', zalbedo, palso(j1b)
      ENDIF
#endif

      !$acc parallel
      !$acc loop gang vector
      DO j1 = ki1sc, ki1ec

        zalbedo = zfluxu(j1,ki3ec+1) /                                    &
                      (zflux(j1,ki3ec+1)+zfluxd(j1,ki3ec+1))

        ! direct down corrected
        zflux_c (j1,ki3ec+1) = pfcor(j1) * zfluxi(j1,ki3ec+1)

        ! diffuse down corrected
        zfluxd_c(j1,ki3ec+1) =                                            &
                  zfluxdi(j1,ki3ec+1) *         pskyview(j1)              &
                + zfluxui(j1,ki3ec+1) * (1.0_dp-pskyview(j1))

        ! diffuse up adapted to new other components
        zfluxu_c(j1,ki3ec+1) =                                            &
                 (zflux_c(j1,ki3ec+1) + zfluxd_c(j1,ki3ec+1)) * zalbedo

      ENDDO
      !$acc end parallel

!XL_TODO/GPU_WRITE
#ifndef _OPENACC
      IF (idebug > 15 .AND. j2b==jindex) THEN
        WRITE (*,'(A42,2I4,3F16.6)')                                      &
                      'FESFT corrected: zfluxd, zflux, zfluxu', j1b, j2b, &
                      zfluxd_c(j1b,ki3ec+1), zflux_c(j1b,ki3ec+1),        &
                      zfluxu_c(j1b,ki3ec+1)
      ENDIF
#endif
    ENDIF

  !----------------------------------------------------------------------------
  ! Section 3.4: Addition of flux for spectral interval to total solar flux
  !----------------------------------------------------------------------------
 
    IF (icrf == 0) THEN     ! Add flux at all levels

      !$acc parallel
      !$acc loop gang
      DO j3 = ki3sc, ki3ec+1
        !$acc loop vector
        DO j1 = ki1sc, ki1ec
          pfls(j1,j3) = pfls (j1,j3)                                 &
                      + zflux(j1,j3) + zfluxd(j1,j3) - zfluxu(j1,j3)
          ! for the Climate-LM Version
          IF ( (.NOT.lradtopo) .OR. (pfcor(j1) /= 0.0_dp) ) THEN
            pflsdir(j1,j3) = pflsdir (j1,j3) + zflux(j1,j3)
          ! the else part just lets pflsdir untouched
          ENDIF
        ENDDO
      ENDDO
      !$acc end parallel

      ! Store individual components of solar flux at surface
      IF (lradtopo) THEN
        !$acc parallel
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          pflsu (j1) = pflsu (j1) + zfluxu_c(j1,ki3ec+1)
          pflsd (j1) = pflsd (j1) + zfluxd_c(j1,ki3ec+1)
          pflsp (j1) = pflsp (j1) + zflux_c (j1,ki3ec+1)
          pfls_s(j1) = pfls_s(j1) + zflux_c (j1,ki3ec+1)            &
                     + zfluxd_c(j1,ki3ec+1) - zfluxu_c(j1,ki3ec+1)
        ENDDO
        !$acc end parallel
      ELSE
        !$acc parallel
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          pflsu (j1) = pflsu (j1) + zfluxu (j1,ki3ec+1)
          pflsd (j1) = pflsd (j1) + zfluxd (j1,ki3ec+1)
          pflsp (j1) = pflsp (j1) + zflux  (j1,ki3ec+1)
          pfls_s(j1) = pfls_s(j1) + zflux  (j1,ki3ec+1)             &
                     + zfluxd (j1,ki3ec+1) - zfluxu (j1,ki3ec+1)
        ENDDO
        !$acc end parallel
      ENDIF
      IF (idebug > 15 .AND. j2b==jindex) THEN
        WRITE (*,'(A40,3F16.6)') 'FESFT: diff_up, diff_down, dir_down',  &
            pflsu(j1b), pflsd(j1b), pflsp(j1b)
      ENDIF

      IF (jspec == 3) THEN   ! Photosynthetic active radiation
        IF (lradtopo) THEN   ! T.R.
          !$acc parallel
          !$acc loop gang vector
          DO j1 = ki1sc, ki1ec
            pflsu_par(j1) = pflsu_par (j1) + zfluxu_c(j1,ki3ec+1)
            pflsd_par(j1) = pflsd_par (j1) + zfluxd_c(j1,ki3ec+1)
            pflsp_par(j1) = pflsp_par (j1) + zflux_c (j1,ki3ec+1)
            pflpar   (j1) = pflpar    (j1) + zflux_c (j1,ki3ec+1)       &
                          + zfluxd_c(j1,ki3ec+1) - zfluxu_c(j1,ki3ec+1)
          ENDDO
          !$acc end parallel
        ELSE
          !$acc parallel
          !$acc loop gang vector
          DO j1 = ki1sc, ki1ec
            pflsu_par(j1) = pflsu_par (j1) + zfluxu(j1,ki3ec+1)
            pflsd_par(j1) = pflsd_par (j1) + zfluxd(j1,ki3ec+1)
            pflsp_par(j1) = pflsp_par (j1) + zflux (j1,ki3ec+1)
            pflpar   (j1) = pflpar    (j1) + zflux (j1,ki3ec+1)       &
                          + zfluxd (j1,ki3ec+1) - zfluxu (j1,ki3ec+1)
          ENDDO
          !$acc end parallel
        ENDIF
      ENDIF !(jspec == 3)

    ENDIF
 
#ifdef COSMOART
  IF(l_cosmo_art) THEN
    IF (jspec == 3) THEN
      IF (lradtopo) THEN
        !$acc parallel
        !$acc loop gang
        DO j3 = ki3sc, ki3ec+1
          !$acc loop vector
          DO j1 = ki1sc, ki1ec
            Edir (j1,jindex,j3) =  zflux_c (j1,j3)
            Edown(j1,jindex,j3) =  zfluxd_c(j1,j3)
            Eup  (j1,jindex,j3) =  zfluxu_c(j1,j3)
          ENDDO
        ENDDO
        !$acc end parallel
      ELSE
        !$acc parallel
        !$acc loop gang
        DO j3 = ki3sc, ki3ec+1
          !$acc loop vector
          DO j1 = ki1sc, ki1ec
            Edir (j1,jindex,j3) =  zflux (j1,j3)
            Edown(j1,jindex,j3) =  zfluxd(j1,j3)
            Eup  (j1,jindex,j3) =  zfluxu(j1,j3)
          ENDDO
        ENDDO
        !$acc end parallel
      ENDIF
    ENDIF
  ENDIF
#endif

  ! End of solar spectral loop
  ! ===============================================================
  ENDDO solar_spectral_loop 
  ! ===============================================================
 
  ENDIF     ! Test, whether solar calculation or not
 
!------------------------------------------------------------------------------
! Section 4: Repeat calculations for cloud-free fluxes
!------------------------------------------------------------------------------

  ! Repeat calculations for cloud-free fluxes if switch for CRF
  ! is set to .true. and cloud-free fluxes have not yet been
  ! computed

  IF (.NOT. lcrf) THEN
!T.R.: pfltf & pflsf removed
!    DO j2 = ki2sc, ki2ec
!      DO j1 = ki1sc, ki1ec
!        pflsf(j1   ,1)  = pfls(j1   ,ki3sc  )
!        pflsf(j1   ,2)  = pfls(j1   ,ki3ec+1)
!        pfltf(j1   ,1)  = pflt(j1   ,ki3sc  )
!        pfltf(j1   ,2)  = pflt(j1   ,ki3ec+1)
!      ENDDO
!    ENDDO
  ELSE IF (icrf.eq.0) THEN  ! Branch to cloud-free calculations only once
    icrf = 1     
    GO TO 1
  ENDIF
 
!------------------------------------------------------------------------------
! End of the subroutine
!------------------------------------------------------------------------------

  !$acc end data


END SUBROUTINE fesft_dp

!==============================================================================
!==============================================================================
!+ Module procedure in "Radiation"
!------------------------------------------------------------------------------

SUBROUTINE coe_th (                                                    &
       pduh2oc,pduh2of,pduco2 ,pduo3  ,palogp ,palogt ,                &
       podsc  ,podsf  ,podac  ,podaf  ,pbsfc  ,pbsff  ,                &
       ki3    ,kspec  ,kh2o   ,kco2   ,ko3    ,                        &
       ki1sd  ,ki1ed  ,ki3sd  ,ki3ed  ,ki1sc  ,ki1ec  ,                &
       ldebug ,jindex ,                                                &
       pa1c   ,pa1f   ,pa2c   ,pa2f   ,pa3c   ,pa3f)

!------------------------------------------------------------------------------
!
! Description:
!
!   The module procedure coe_th calculates the optical effects of atmospheric 
!   layers on thermal radiation based on basic optical properties of non-gaseous 
!   constituents and gaseous absorption coefficients selected through the 
!   corresponding control variables in the argument list.
!   This routine computes layer effects (transmissivity, reflectivity
!   and emmisivity) in the thermal part of the radiative spectrum
!   both for the cloud-free and the cloudy part of a model layer.
!   The calculation is based on the implicit delt-two-stream equations
!   (cf. Ritter and Geleyn, 1992) and uses basic optical properties
!   (i.e. absorption and scattering optical depth and backscattered
!   fraction for non-gaseous atmospheric constituents as well as 
!   gaseous absorption properties) as input. 
!
! Method:
!
! - addition of individual gaseous absorption effects to the optical
!   properties of the non-gaseous constituents
! - determination of layer effects (cf. Zdunkowski et al., 1982, 1986
!   and Ritter and Geleyn, 1992)
!     
!------------------------------------------------------------------------------

! Subroutine arguments:
! --------------------

! Input data
! ----------
  INTEGER (KIND=iintegers), INTENT (IN) ::  &
     ki1sd,       & ! start index for first  array dimension
     ki1ed,       & ! end   index for first  array dimension
     ki3sd,       & ! start index for third  array dimension
     ki3ed,       & ! end   index for third  array dimension

   ! and the same for the computations
     ki1sc,       & ! start index for first  array computation
     ki1ec,       & ! end   index for first  array computation
     ki3  ,       & ! vertical layer considered    
     kspec,       & ! spectral interval considered
     kh2o ,       & ! table index for h2o absorption properties
     kco2 ,       & ! table index for co2 absorption properties
     ko3  ,       & ! table index for o3  absorption properties
     jindex         ! index for j-loop

  LOGICAL                 , INTENT (IN) ::  &
     ldebug         ! debug control switch       

  REAL    (KIND=dp)       , INTENT (IN) ::  &

     ! opticall relevant gas quantities (Pa)
     pduh2oc(ki1sd:ki1ed,ki3sd:ki3ed), & ! h2o inside cloud
     pduh2of(ki1sd:ki1ed,ki3sd:ki3ed), & ! h2o out of cloud
     pduco2 (ki1sd:ki1ed,ki3sd:ki3ed), & ! co2 content 
     pduo3  (ki1sd:ki1ed,ki3sd:ki3ed), & ! o3  content 

     ! Logarithm of layer mean temperature and pressure
     palogt (ki1sd:ki1ed,ki3sd:ki3ed), & ! ln T
     palogp (ki1sd:ki1ed,ki3sd:ki3ed), & ! ln p

     ! Optical properties of non-gaseous constituents (..c=cloudy; ..f=free)  
     podsc  (ki1sd:ki1ed,ki3sd:ki3ed), & ! 
     podsf  (ki1sd:ki1ed,ki3sd:ki3ed), & ! 
     podac  (ki1sd:ki1ed,ki3sd:ki3ed), & ! 
     podaf  (ki1sd:ki1ed,ki3sd:ki3ed), & ! 
     pbsfc  (ki1sd:ki1ed,ki3sd:ki3ed), & ! 
     pbsff  (ki1sd:ki1ed,ki3sd:ki3ed)    ! 

! Output data
! -----------
  REAL    (KIND=dp)       , INTENT (OUT) ::  &
     pa1c  (ki1sd:ki1ed) , & ! transmissivity in cloud   
     pa1f  (ki1sd:ki1ed) , & ! transmissivity cloud-free  
     pa2c  (ki1sd:ki1ed) , & ! reflectivity in cloud    
     pa2f  (ki1sd:ki1ed) , & ! reflectivity cloud-free      
     pa3c  (ki1sd:ki1ed) , & ! emissivity in cloud    
     pa3f  (ki1sd:ki1ed)     ! emissivity cloud-free       

! Local parameters: 
! ----------------
  REAL    (KIND=dp)       , PARAMETER ::  &
     zargli  = 80.0_dp     , &  ! argument limit for EXP 
     ztsec   = 1.0E-35_dp  , &  ! (=exp(-zargli) avoids ALOG(0.0)
     zodmax  = 1.0E+6_dp   , &  ! maximum allowed optical depth
     zudiff  = 2.0_dp      , &  ! Diffusivity factors for gases and other constituents
     zangfa  = 1.648721271_dp   ! exp(0.5)

! Local scalars:
! -------------
  INTEGER (KIND=iintegers) ::  &
    j1,j3                    ! loop indices over spatial dimensions

  REAL    (KIND=dp)        ::  &
    zeps, ztau, zrho, zodgf, zodgc, zod1, zod2
 
! End of header
!==============================================================================

!------------------------------------------------------------------------------
! Begin Subroutine coe_th              
!------------------------------------------------------------------------------

  j3     = ki3

  IF (ldebug .AND. j2b==jindex) THEN
     print *,'**** coe_th ******************************'
     print *,'**** debug point : ',j1b,j2b, ' in level j3 = ', j3
     print *,'**** coe_th kspec=',kspec
     print *,'**** coe_th j3   =',j3   
     print *,'**** coe_th kh2o =',kh2o 
     print *,'**** coe_th kco2 =',kco2 
     print *,'**** coe_th ko3  =',ko3  
     print *,'**** pduh2of(j1b,j2b,j3)=',pduh2of(ki1sc    ,j3)
     print *,'**** pduh2oc(j1b,j2b,j3)=',pduh2oc(ki1sc    ,j3)
     print *,'**** pduco2 (j1b,j2b,j3)=',pduco2 (ki1sc    ,j3)
     print *,'**** pduo3  (j1b,j2b,j3)=',pduo3  (ki1sc    ,j3)
     print *,'**** palogp (j1b,j2b,j3)=',palogp (ki1sc    ,j3)
     print *,'**** palogt (j1b,j2b,j3)=',palogt (ki1sc    ,j3)
     if (kh2o > 0) print *,'**** cobi (kh2o,kspec,1)    =',cobi (kh2o,kspec,1)
     if (kco2 > 0) print *,'**** cobi (kco2,kspec,2)    =',cobi (kco2,kspec,2)
     if (ko3  > 0) print *,'**** cobi (ko3 ,kspec,3)    =',cobi (ko3 ,kspec,3)
     if (kh2o > 0) print *,'**** coali(kh2o,kspec,1)    =',coali (kh2o,kspec,1)
     if (kco2 > 0) print *,'**** coali(kco2,kspec,2)    =',coali (kco2,kspec,2)
     if (ko3  > 0) print *,'**** coali(ko3 ,kspec,3)    =',coali (ko3 ,kspec,3)
     if (kh2o > 0) print *,'**** cobti(kh2o,kspec,1)    =',cobti(kh2o,kspec,1)
     if (kco2 > 0) print *,'**** cobti(kco2,kspec,2)    =',cobti(kco2,kspec,2)
     if (ko3  > 0) print *,'**** cobti(ko3 ,kspec,3)    =',cobti(ko3 ,kspec,3)
  ENDIF 

  ! Optical depth of gases

! DO j2 = ki2sc, ki2ec
    DO j1 = ki1sc, ki1ec
      zodgf = 0.0_dp     ! Initialisation
 
      IF (kco2.ne.0) then     ! Include CO2 contribution
        zodgf = zodgf + pduco2(j1   ,j3) * (cobi(kco2,kspec,2) &
                    * EXP ( coali(kco2,kspec,2) * palogp(j1   ,j3)    &
                           -cobti(kco2,kspec,2) * palogt(j1   ,j3)))
      ENDIF                  ! CO2
      !US IF (ldebug .AND. j1==j1b .AND. jindex==j2b) print *,'**** zodgf(CO2)        =',zodgf
 
      IF (ko3 /= 0) THEN  ! Include O3 contribution
        zodgf = zodgf + pduo3 (j1   ,j3) * (cobi(ko3 ,kspec,3)* &
                    EXP ( coali(ko3 ,kspec,3) * palogp(j1   ,j3)      &
                         -cobti(ko3 ,kspec,3) * palogt(j1   ,j3)))
      ENDIF
      !US IF (ldebug .AND. j1==j1b .AND. jindex==j2b) print *,'**** zodgf(CO2+O3)     =',zodgf
 
      ! Cloudy = cloud free for CO2 and O3 :
      zodgc = zodgf
 
      IF (kh2o /= 0) THEN  ! Include H2O contribution
        zodgf = zodgf + pduh2of(j1   ,j3)* (cobi(kh2o,kspec,1)* &
                    EXP ( coali(kh2o,kspec,1) * palogp(j1   ,j3)      &
                         -cobti(kh2o,kspec,1) * palogt(j1   ,j3)))
        zodgc = zodgc + pduh2oc(j1   ,j3)* (cobi(kh2o,kspec,1)* &
                    EXP ( coali(kh2o,kspec,1) * palogp(j1   ,j3)      &
                         -cobti(kh2o,kspec,1) * palogt(j1   ,j3)))
      ENDIF
      !US IF (ldebug .AND. j1==j1b .AND. jindex==j2b) print *,'**** zodgf(CO2+O3+H2O) =',zodgf
      !US IF (ldebug .AND. j1==j1b .AND. jindex==j2b) print *,'**** zodgc(CO2+O3+H2O) =',zodgc
 
      zodgf = MIN (zodgf, zodmax)
      zodgc = MIN (zodgc, zodmax)

      !US IF (ldebug .AND. j1==j1b .AND. jindex==j2b) print *,'**** nach securit auf optical depth '
      !US IF (ldebug .AND. j1==j1b .AND. jindex==j2b) print *,'**** zodgf(CO2+O3+H2O) =',zodgf
      !US IF (ldebug .AND. j1==j1b .AND. jindex==j2b) print *,'**** zodgc(CO2+O3+H2O) =',zodgc
 
      ! Pseudo-optical depth in cloud-free part of layer

      zod2 = zudiff * pbsff(j1   ,j3) * podsf(j1   ,j3)
      zod1 = zod2 + zudiff * podaf(j1   ,j3)
      zod1 = zod1 + zangfa * zodgf

      !US IF (ldebug .AND. j1==j1b .AND. jindex==j2b) THEN
      !US   print *,'**** cloud-free zod1 (j1b,j2b)=',zod1
      !US   print *,'**** cloud-free zod2 (j1b,j2b)=',zod2
      !US ENDIF 
 
      ! Layer coefficients in cloud-free part of layer
 
      zeps=SQRT(zod1*zod1-zod2*zod2)
      IF (zeps.LT.zargli) THEN
        ztau = EXP  (-zeps)
      ELSE
        ztau = ztsec
      END IF
      zrho = zod2/(zod1+zeps)
      pa1f(j1   )=ztau*(1.0_dp-(zrho**2))*(1.0_dp/(1.0_dp-(zrho**2)*(ztau**2)))
      pa2f(j1   )=zrho*(1.0_dp-(ztau**2))*(1.0_dp/(1.0_dp-(zrho**2)*(ztau**2)))
      pa3f(j1   )=(1.0_dp-pa1f(j1   )+pa2f(j1   ))/(zod1+zod2)

      !US IF (ldebug .AND. j1==j1b .AND. jindex==j2b) THEN
      !US   print *,'**** cloud-free pa1f (j1b,j2b)=',pa1f (j1b)
      !US   print *,'**** cloud-free pa2f (j1b,j2b)=',pa2f (j1b)
      !US   print *,'**** cloud-free pa3f (j1b,j2b)=',pa3f (j1b)
      !US ENDIF
 
      ! Pseudo-optical depth in cloudy part of layer
      zod2 = zudiff * pbsfc(j1   ,j3) * podsc(j1   ,j3)
      zod1 = zod2 + zudiff * podac(j1   ,j3)
      zod1 = zod1 + zangfa * zodgc
 
      ! Layer coefficients in cloudy part of layer
 
      zeps=SQRT(zod1*zod1-zod2*zod2)
      IF (zeps.LT.zargli) THEN
        ztau = EXP  (-zeps)
      ELSE
        ztau = ztsec
      END IF
      zrho = zod2/(zod1+zeps)
      pa1c(j1   )=ztau*(1.0_dp-(zrho**2))*(1.0_dp/(1.0_dp-(zrho**2)*(ztau**2)))
      pa2c(j1   )=zrho*(1.0_dp-(ztau**2))*(1.0_dp/(1.0_dp-(zrho**2)*(ztau**2)))
      pa3c(j1   )=(1.0_dp-pa1c(j1   )+pa2c(j1   ))/(zod1+zod2)

      !US IF (ldebug .AND. j1==j1b .AND. jindex==j2b) THEN
      !US   print *,'**** cloud-xxxx pa1c (j1b,j2b)=',pa1c (j1b)
      !US   print *,'**** cloud-xxxx pa2c (j1b,j2b)=',pa2c (j1b)
      !US   print *,'**** cloud-xxxx pa3c (j1b,j2b)=',pa3c (j1b)
      !US ENDIF

  ENDDO
! ENDDO
 
!------------------------------------------------------------------------------
! End of the subroutine
!------------------------------------------------------------------------------

END SUBROUTINE coe_th

!==============================================================================
!==============================================================================
!+ Module procedure in "Radiation"
!------------------------------------------------------------------------------

SUBROUTINE coe_so (                                                     &
       pduh2oc,pduh2of,pduco2 ,pduo3  ,palogp ,palogt ,                 &
       podsc  ,podsf  ,podac  ,podaf  ,pbsfc  ,pbsff  ,pusfc ,pusff ,   &
       psmu0  ,pqsmu0 ,                                                 &
       ki3    ,kspec  ,kh2o   ,kco2   ,ko3    ,                         &
       ki1sd  ,ki1ed  ,ki3sd  ,ki3ed  ,ki1sc  ,ki1ec  ,                 &
       ldebug ,jindex ,                                                 &
       pa1c   ,pa1f   ,pa2c   ,pa2f   ,pa3c   ,pa3f ,                   &
       pa4c   ,pa4f   ,pa5c   ,pa5f )

!------------------------------------------------------------------------------
!
! Description:
!
!   The module procedure coe_so calculates the optical effects of atmospheric
!   layers on solar radiation based on basic optical properties of non-gaseous
!   constituents and gaseous absorption coefficients selected through the
!   corresponding control variables.
!   This routine computes layer effects (transmissivity, reflectivity)
!   for diffuse and direct solar radiation both for the cloudy and the
!   cloud-free part of a model layer.
!   The calculation is based on the implicit delt-two-stream equations
!   (cf. Ritter and Geleyn, 1992) and uses basic optical properties
!   (i.e. absorption and scattering optical depth, backscattered and
!   upscattered fraction for non-gaseous atmospheric constituents and
!   gaseous absorption properties) as input.
!
! Method:
!
! - addition of individual gaseous absorption effects to the optical
!   properties of the non-gaseous constituents
!   (optical depth multiplied by alpha1 to alpha4)
!
! - determination of layer effects (cf. Zdunkowski et al., 1982, 1986
!   and Ritter and Geleyn, 1992)
! - the resonance case for those effects related to the direct solar
!   radiation is avoided by a small displacement of the local inverse
!   of the cosine of the zenith angle (if necessary)
!
!------------------------------------------------------------------------------

! Subroutine arguments:
! --------------------

! Input data
! ----------
  INTEGER (KIND=iintegers), INTENT (IN) ::  &
     ki1sd,       & ! start index for first  array dimension
     ki1ed,       & ! end   index for first  array dimension
     ki3sd,       & ! start index for third  array dimension
     ki3ed,       & ! end   index for third  array dimension

   ! and the same for the computations
     ki1sc,       & ! start index for first  array computation
     ki1ec,       & ! end   index for first  array computation
     ki3  ,       & ! vertical layer considered
     kspec,       & ! spectral interval considered
     kh2o ,       & ! table index for h2o absorption properties
     kco2 ,       & ! table index for co2 absorption properties
     ko3  ,       & ! table index for o3  absorption properties
     jindex         ! index for j-loop

  LOGICAL                 , INTENT (IN) ::  &
     ldebug         ! debug control switch

  REAL    (KIND=dp)       , INTENT (IN) ::  &

     ! opticall relevant gas quantities (Pa)
     pduh2oc(ki1sd:ki1ed,ki3sd:ki3ed), & ! h2o inside cloud
     pduh2of(ki1sd:ki1ed,ki3sd:ki3ed), & ! h2o out of cloud
     pduco2 (ki1sd:ki1ed,ki3sd:ki3ed), & ! co2 content
     pduo3  (ki1sd:ki1ed,ki3sd:ki3ed), & ! o3  content

     ! Logarithm of layer mean temperature and pressure
     palogt (ki1sd:ki1ed,ki3sd:ki3ed), & ! ln T
     palogp (ki1sd:ki1ed,ki3sd:ki3ed), & ! ln p

     ! Optical properties of non-gaseous constituents (..c=cloudy; ..f=free)
     podsc  (ki1sd:ki1ed,ki3sd:ki3ed), & !
     podsf  (ki1sd:ki1ed,ki3sd:ki3ed), & !
     podac  (ki1sd:ki1ed,ki3sd:ki3ed), & !
     podaf  (ki1sd:ki1ed,ki3sd:ki3ed), & !
     pbsfc  (ki1sd:ki1ed,ki3sd:ki3ed), & !
     pbsff  (ki1sd:ki1ed,ki3sd:ki3ed), & !
     pusfc  (ki1sd:ki1ed,ki3sd:ki3ed), & !
     pusff  (ki1sd:ki1ed,ki3sd:ki3ed), & !

     psmu0  (ki1sd:ki1ed)            , & ! cosine of zenith angle
     pqsmu0 (ki1sd:ki1ed)                ! inverse of cosine ...

! Output data
! -----------
  REAL    (KIND=dp)       , INTENT (OUT) ::  &
     pa1c  (ki1sd:ki1ed) , & ! direct radiation transmis-
     pa1f  (ki1sd:ki1ed) , & ! sivity cloudy/cloud-free
     pa2c  (ki1sd:ki1ed) , & ! direct radition downward
     pa2f  (ki1sd:ki1ed) , & ! scattering cloudy/cloud-free
     pa3c  (ki1sd:ki1ed) , & ! direct radiation upward
     pa3f  (ki1sd:ki1ed) , & ! scattering cloudy/cloud-free
     pa4c  (ki1sd:ki1ed) , & ! diffuse flux transmissivity
     pa4f  (ki1sd:ki1ed) , & ! cloudy/cloud-free
     pa5c  (ki1sd:ki1ed) , & ! diffuse flux reflectivity
     pa5f  (ki1sd:ki1ed)     ! cloudy/cloud-free

! Local parameters:
! ----------------
  REAL    (KIND=dp)       , PARAMETER ::  &
     zargli  = 80.0_dp     , &  ! argument limit for EXP
     ztsec   = 1.0E-35_dp  , &  ! (=exp(-zargli) avoids ALOG(0.0)
     zodmax  = 1.0E+6_dp   , &  ! maximum allowed optical depth
     zepres  = 1.0E-7_dp   , &  ! for resonance case avoidance
                             ! 32bit-accuracy (1.E-14 for 64bit machine)
     zudiff  = 2.0_dp      , &  ! Diffusivity factors for gases and other constituents
     zangfa  = 1.648721271_dp   ! exp(0.5)

! Local scalars:
! -------------
  INTEGER (KIND=iintegers) ::  &
    j1, j3                    ! loop indices over spatial dimensions

  REAL    (KIND=dp)        ::  &
    zeps,                      & !
    ze,zm,zg1,zg2,ze1mwf,zmu0if  !

  REAL    (KIND=dp)        ::  &
     zodgf, zodgc, zod1, zod2, zod3, zod4, zod5
 
!- End of header
!==============================================================================

!------------------------------------------------------------------------------
! Begin Subroutine coe_so
!------------------------------------------------------------------------------

  j3     = ki3

  !~IF (ldebug .AND. j2b==jindex) THEN
  !~   print *,'**** coe_so ******************************'
  !~   print *,'**** debug point index : ',j1b,j2b, ' in level ', j3
  !~   print *,'**** coe_so kspec=',kspec
  !~   print *,'**** coe_so j3   =',j3
  !~   print *,'**** coe_so kh2o =',kh2o
  !~   print *,'**** coe_so kco2 =',kco2
  !~   print *,'**** coe_so ko3  =',ko3
  !~   print *,'**** pduh2of(j1b,j2b,j3)=',pduh2of(j1b,j3)
  !~   print *,'**** pduh2oc(j1b,j2b,j3)=',pduh2oc(j1b,j3)
  !~   print *,'**** pduco2 (j1b,j2b,j3)=',pduco2 (j1b,j3)
  !~   print *,'**** pduo3  (j1b,j2b,j3)=',pduo3  (j1b,j3)
  !~   print *,'**** psmu0  (j1b,j2b)   =',psmu0  (j1b)
  !~ENDIF

  ! Optical depth of gases

! DO j2 = ki2sc , ki2ec
    DO j1 = ki1sc, ki1ec
      zodgf = 0.0_dp        ! Initialisation

      !~~~~~~~~~~~~~~~~~~~~ 1/4
      !~IF (kco2 /= 0) THEN     ! Include CO2 contribution
      !~  zodgf = zodgf + pduco2(j1   ,j3)* (cobi(kco2,kspec,2)*       &
      !~              EXP ( coali(kco2,kspec,2) * palogp(j1   ,j3)     &
      !~                   -cobti(kco2,kspec,2) * palogt(j1   ,j3)))
      !~ENDIF                  ! CO2
      !~!US IF (ldebug) print *,'**** zodgf(CO2)        =',zodgf

      !~IF (ko3 /= 0) THEN     ! Include O3 contribution
      !~  zodgf = zodgf + pduo3 (j1   ,j3)* (cobi(ko3 ,kspec,3)*       &
      !~              EXP ( coali(ko3 ,kspec,3) * palogp(j1   ,j3)     &
      !~                   -cobti(ko3 ,kspec,3) * palogt(j1   ,j3)))
      !~ENDIF
      !~!US IF (ldebug) print *,'**** zodgf(CO2+O3)     =',zodgf

      !~! Cloudy = cloud free for CO2 and O3 :
      !~zodgc = zodgf

      !~IF (kh2o /= 0) THEN    ! Include H2O contribution
      !~  zodgf = zodgf + pduh2of(j1   ,j3)* (cobi(kh2o,kspec,1)*       &
      !~              EXP ( coali(kh2o,kspec,1) * palogp(j1   ,j3)      &
      !~                   -cobti(kh2o,kspec,1) * palogt(j1   ,j3)))
      !~  zodgc = zodgc + pduh2oc(j1   ,j3)* (cobi(kh2o,kspec,1)*       &
      !~              EXP ( coali(kh2o,kspec,1) * palogp(j1   ,j3)      &
      !~                   -cobti(kh2o,kspec,1) * palogt(j1   ,j3)))
      !~ENDIF
      !~!US IF (ldebug) print *,'**** zodgf(CO2+O3+H2O) =',zodgf
      !~!US IF (ldebug) print *,'**** zodgc(CO2+O3+H2O) =',zodgc

      !~zodgf = MIN (zodgf, zodmax)
      !~zodgc = MIN (zodgc, zodmax)
      !~!US IF (ldebug) print *,'**** nach securit auf optical depth '
      !~!US IF (ldebug) print *,'**** zodgf(CO2+O3+H2O) =',zodgf
      !~!US IF (ldebug) print *,'**** zodgc(CO2+O3+H2O) =',zodgc

      !~! Pseudo-optical depth in cloud-free part of layer

      !~zod2 = zudiff * pbsff(j1   ,j3) * podsf(j1   ,j3)
      !~zod1 = zod2 + zudiff * podaf(j1   ,j3)
      !~zod3 = pusff(j1   ,j3) * podsf(j1   ,j3)
      !~zod4 = podsf(j1   ,j3) - zod3
      !~zod5 = podsf(j1   ,j3) + podaf(j1   ,j3)
      !~zod1 = zod1 + zangfa * zodgf
      !~zod5 = zod5 + zodgf
      !~!US IF (ldebug) THEN
      !~!US   print *,'**** cloud-free zod1 (j1b,j2b)    =',zod1
      !~!US   print *,'**** cloud-free zod2 (j1b,j2b)    =',zod2
      !~!US   print *,'**** cloud-free zod3 (j1b,j2b)    =',zod3
      !~!US   print *,'**** cloud-free zod4 (j1b,j2b)    =',zod4
      !~!US   print *,'**** cloud-free zod5 (j1b,j2b)    =',zod5
      !~!US ENDIF

      !~! Layer coefficients in cloud-free part of layer

      !~zeps=SQRT(zod1*zod1-zod2*zod2)
      !~IF (zeps.LT.zargli) THEN
      !~  ze = EXP  (-zeps)
      !~ELSE
      !~  ze = ztsec
      !~END IF
      !~zm = zod2/(zod1+zeps)
      !~~~~~~~~~~~~~~~~~~~~~1/4
      !~ Original pa4f:  pa4f(j1   )=ze*(1.0_dp-(zm**2))*(1.0_dp/(1.0_dp-(zm**2)*(ze**2)))
      pa4f(j1   )=10 ! ze*(1.0_dp-(zm**2))*(1.0_dp/(1.0_dp-(zm**2)*(ze**2)))
      !~pa5f(j1   )=zm*(1.0_dp-(ze**2))*(1.0_dp/(1.0_dp-(zm**2)*(ze**2)))

      !~~~~~~~~~~~~~~~~~~~(1/4)
      !~ze1mwf = zeps / zod5
      !~zmu0if = ze1mwf + SIGN ( MAX(ABS(pqsmu0(j1   )-ze1mwf),zepres) &
      !~                        ,(pqsmu0(j1   )-ze1mwf) )
      !~zod3 = zod3 * zmu0if
      !~zod4 = zod4 * zmu0if
      !~zod5 = zod5 * zmu0if
      !~IF (zod5.LT.zargli) THEN
      !~  pa1f(j1   ) = EXP  (-zod5)
      !~ELSE
      !~  pa1f(j1   ) = ztsec
      !~END IF
      !~~~~~~~~~~~~~~~~~~~~~~~~(1/2)
      !~zg1 = ( zod3*(zod5-zod1) -zod2*zod4) /(zod5*zod5 - zeps*zeps)
      !~zg2 =-( zod4*(zod5+zod1) +zod2*zod3) /(zod5*zod5 - zeps*zeps)
      !~pa2f(j1   ) = zg2*(pa1f(j1   )-pa4f(j1   )) -zg1*pa5f(j1   )*pa1f(j1   )
      !~pa3f(j1   ) = zg1*(1.0_dp-pa4f(j1   )*pa1f(j1   )) -zg2*pa5f(j1   )

      !~!US IF (ldebug) THEN
      !~!US   print *,'**** cloud-free pa1f (j1b,j2b)    =',pa1f (j1b,j2b)
      !~!US   print *,'**** cloud-free pa2f (j1b,j2b)    =',pa2f (j1b,j2b)
      !~!US   print *,'**** cloud-free pa3f (j1b,j2b)    =',pa3f (j1b,j2b)
      !~!US   print *,'**** cloud-free pa4f (j1b,j2b)    =',pa4f (j1b,j2b)
      !~!US   print *,'**** cloud-free pa5f (j1b,j2b)    =',pa5f (j1b,j2b)
      !~!US ENDIF

      !~! Pseudo-optical depth in cloudy part of layer

      !~zod2 = zudiff * pbsfc(j1   ,j3) * podsc(j1   ,j3)
      !~zod1 = zod2 + zudiff * podac(j1   ,j3)
      !~zod3 = pusfc(j1   ,j3) * podsc(j1   ,j3)
      !~zod4 = podsc(j1   ,j3) - zod3
      !~zod5 = podsc(j1   ,j3) + podac(j1   ,j3)
      !~zod1 = zod1 + zangfa * zodgc
      !~zod5 = zod5 + zodgc

      !~!US IF (ldebug) THEN
      !~!US   print *,'**** cloudy     zod1 (j1b,j2b)    =',zod1
      !~!US   print *,'**** cloudy     zod2 (j1b,j2b)    =',zod2
      !~!US   print *,'**** cloudy     zod3 (j1b,j2b)    =',zod3
      !~!US   print *,'**** cloudy     zod4 (j1b,j2b)    =',zod4
      !~!US   print *,'**** cloudy     zod5 (j1b,j2b)    =',zod5
      !~!US ENDIF

      !~! Layer coefficients in cloudy part of layer

      !~zeps=SQRT(zod1*zod1-zod2*zod2)
      !~IF (zeps.LT.zargli) THEN
      !~  ze = EXP  (-zeps)
      !~ELSE
      !~  ze = ztsec
      !~END IF
      !~zm = zod2/(zod1+zeps)
      !~pa4c(j1   )=ze*(1.0_dp-(zm**2))*(1.0_dp/(1.0_dp-(zm**2)*(ze**2)))
      !~pa5c(j1   )=zm*(1.0_dp-(ze**2))*(1.0_dp/(1.0_dp-(zm**2)*(ze**2)))

      !~ze1mwf = zeps / zod5
      !~zmu0if = ze1mwf + SIGN ( MAX(ABS(pqsmu0(j1   )-ze1mwf),zepres) &
      !~                        ,(pqsmu0(j1   )-ze1mwf) )
      !~zod3 = zod3 * zmu0if
      !~zod4 = zod4 * zmu0if
      !~zod5 = zod5 * zmu0if
      !~IF (zod5.LT.ZARGLI) THEN
      !~   pa1c(j1   ) = EXP  (-zod5)
      !~ELSE
      !~   pa1c(j1   ) = ztsec
      !~END IF
      !~zg1 = ( zod3*(zod5-zod1) -zod2*zod4) /(zod5*zod5 - zeps*zeps)
      !~zg2 =-( zod4*(zod5+zod1) +zod2*zod3) /(zod5*zod5 - zeps*zeps)
      !~pa2c(j1   ) = zg2*(pa1c(j1   )-pa4c(j1   )) -zg1*pa5c(j1   )*pa1c(j1   )
      !~pa3c(j1   ) = zg1*(1.0_dp-pa4c(j1   )*pa1c(j1   )) -zg2*pa5c(j1   )
  ENDDO

  !~IF (ldebug .AND. j2b==jindex) THEN
  !~    print *,'**** cloudy     pa1c (j1b,j2b)    =',pa1c (j1b)
  !~    print *,'**** cloudy     pa2c (j1b,j2b)    =',pa2c (j1b)
  !~    print *,'**** cloudy     pa3c (j1b,j2b)    =',pa3c (j1b)
  !~    print *,'**** cloudy     pa4c (j1b,j2b)    =',pa4c (j1b)
  !~    print *,'**** cloudy     pa5c (j1b,j2b)    =',pa5c (j1b)
  !~ENDIF

!-------------------------------------------------------------------------------
! End of the subroutine
!-------------------------------------------------------------------------------

END SUBROUTINE coe_so

!==============================================================================
!==============================================================================
!+ Module procedure in "radiation_rg"
!------------------------------------------------------------------------------

SUBROUTINE coe_th_gpu (                                 &
       pduh2oc,pduh2of,pduco2 ,pduo3  ,palogp ,palogt , &
       podsc  ,podsf  ,podac  ,podaf  ,pbsfc  ,pbsff  , &
       kspec  ,kh2o   ,kco2   ,ko3    ,                 &
       pa1c   ,pa1f   ,pa2c   ,pa2f   ,pa3c   ,pa3f)

!------------------------------------------------------------------------------
!
! Description:
!
!   The module procedure coe_th_gpu calculates the optical effects of atmospheric 
!   layers on thermal radiation based on basic optical properties of non-gaseous 
!   constituents and gaseous absorption coefficients selected through the 
!   corresponding control variables in the argument list.
!   This routine computes layer effects (transmissivity, reflectivity
!   and emmisivity) in the thermal part of the radiative spectrum
!   both for the cloud-free and the cloudy part of a model layer.
!   The calculation is based on the implicit delt-two-stream equations
!   (cf. Ritter and Geleyn, 1992) and uses basic optical properties
!   (i.e. absorption and scattering optical depth and backscattered
!   fraction for non-gaseous atmospheric constituents as well as 
!   gaseous absorption properties) as input. 
!
! Method:
!
! - addition of individual gaseous absorption effects to the optical
!   properties of the non-gaseous constituents
! - determination of layer effects (cf. Zdunkowski et al., 1982, 1986
!   and Ritter and Geleyn, 1992)
!     
!------------------------------------------------------------------------------

! Subroutine arguments:
! --------------------

! Input data
! ----------
  INTEGER, INTENT(IN) :: &
     kspec,       & ! spectral interval considered
     kh2o ,       & ! table index for h2o absorption properties
     kco2 ,       & ! table index for co2 absorption properties
     ko3            ! table index for o3  absorption properties
     
  REAL    (KIND=dp   ), INTENT (IN) ::  &

     ! opticall relevant gas quantities (Pa)
     pduh2oc, & ! h2o inside cloud
     pduh2of, & ! h2o out of cloud
     pduco2 , & ! co2 content 
     pduo3  , & ! o3  content 

     ! Logarithm of layer mean temperature and pressure
     palogt , & ! ln T
     palogp , & ! ln p

     ! Optical properties of non-gaseous constituents (..c=cloudy; ..f=free)  
     podsc  , & ! 
     podsf  , & ! 
     podac  , & ! 
     podaf  , & ! 
     pbsfc  , & ! 
     pbsff      ! 

! Output data
! -----------
  REAL    (KIND=dp   ), INTENT (OUT) ::  &
     pa1c  , & ! transmissivity in cloud   
     pa1f  , & ! transmissivity cloud-free  
     pa2c  , & ! reflectivity in cloud    
     pa2f  , & ! reflectivity cloud-free      
     pa3c  , & ! emissivity in cloud    
     pa3f      ! emissivity cloud-free       

! Local parameters: 
! ----------------
  REAL    (KIND=dp   ), PARAMETER ::  &
     zargli  = 80.0_dp     , &  ! argument limit for EXP 
     ztsec   = 1.0E-35_dp  , &  ! (=exp(-zargli) avoids ALOG(0.0)
     zodmax  = 1.0E+6_dp   , &  ! maximum allowed optical depth
     zudiff  = 2.0_dp      , &  ! Diffusivity factors for gases and other constituents
     zangfa  = 1.648721271_dp   ! exp(0.5)

  INTEGER (KIND=iintegers), PARAMETER ::  &
     j1b    = 1,           & ! debug point index first dimension
     j2b    = 1              ! debug point index second dimension

  REAL    (KIND=dp   ) ::  &
    zeps, ztau, zrho, zodgf, zodgc, zod1, zod2

! End of header
!==============================================================================

!------------------------------------------------------------------------------
! Begin Subroutine coe_th_gpu              
!------------------------------------------------------------------------------

  ! Optical depth of gases
      zodgf = 0.0_dp     ! Initialisation
 
      IF (kco2.ne.0) then     ! Include CO2 contribution
        zodgf = zodgf + pduco2 * (REAL(cobi(kco2,kspec,2),dp) &
                    * EXP ( REAL(coali(kco2,kspec,2),dp) * palogp    &
                           -REAL(cobti(kco2,kspec,2),dp) * palogt))
      ENDIF                  ! CO2
      !US IF (ldebug) print *,'**** zodgf(CO2)        =',zodgf
 
      IF (ko3 /= 0) THEN  ! Include O3 contribution
        zodgf = zodgf + pduo3  * (REAL(cobi(ko3 ,kspec,3),dp)* &
                    EXP ( REAL(coali(ko3 ,kspec,3),dp) * palogp      &
                         -REAL(cobti(ko3 ,kspec,3),dp) * palogt))
      ENDIF
      !US IF (ldebug) print *,'**** zodgf(CO2+O3)     =',zodgf
 
      ! Cloudy = cloud free for CO2 and O3 :
      zodgc = zodgf
 
      IF (kh2o /= 0) THEN  ! Include H2O contribution
        zodgf = zodgf + pduh2of* (REAL(cobi(kh2o,kspec,1),dp)* &
                    EXP ( REAL(coali(kh2o,kspec,1),dp) * palogp      &
                         -REAL(cobti(kh2o,kspec,1),dp) * palogt))
        zodgc = zodgc + pduh2oc* (REAL(cobi(kh2o,kspec,1),dp)* &
                    EXP ( REAL(coali(kh2o,kspec,1),dp) * palogp      &
                         -REAL(cobti(kh2o,kspec,1),dp) * palogt))
      ENDIF
!------------------------------------------------------------------------------
      !US IF (ldebug) print *,'**** zodgf(CO2+O3+H2O) =',zodgf
      !US IF (ldebug) print *,'**** zodgc(CO2+O3+H2O) =',zodgc
 
      zodgf = MIN (zodgf, zodmax)
      zodgc = MIN (zodgc, zodmax)

      !US IF (ldebug) print *,'**** nach securit auf optical depth '
      !US IF (ldebug) print *,'**** zodgf(CO2+O3+H2O) =',zodgf
      !US IF (ldebug) print *,'**** zodgc(CO2+O3+H2O) =',zodgc
 
      ! Pseudo-optical depth in cloud-free part of layer

      zod2 = zudiff * pbsff * podsf
      zod1 = zod2 + zudiff * podaf
      zod1 = zod1 + zangfa * zodgf

      !US IF (ldebug) THEN
      !US   print *,'**** cloud-free zod1 (j1b,j2b)=',zod1
      !US   print *,'**** cloud-free zod2 (j1b,j2b)=',zod2
      !US ENDIF 
 
      ! Layer coefficients in cloud-free part of layer
 
      zeps=SQRT(zod1*zod1-zod2*zod2)
      IF (zeps.LT.zargli) THEN
        ztau = EXP  (-zeps)
      ELSE
        ztau = ztsec
      END IF
      zrho = zod2/(zod1+zeps)
      pa1f=ztau*(1._dp-(zrho**2))*(1._dp/(1._dp-(zrho**2)*(ztau**2)))
      pa2f=zrho*(1._dp-(ztau**2))*(1._dp/(1._dp-(zrho**2)*(ztau**2)))
      pa3f=(1._dp-pa1f+pa2f)/(zod1+zod2)

      !US IF (ldebug) THEN
      !US   print *,'**** cloud-free pa1f (j1b,j2b)=',pa1f (j1b,j2b)
      !US   print *,'**** cloud-free pa2f (j1b,j2b)=',pa2f (j1b,j2b)
      !US   print *,'**** cloud-free pa3f (j1b,j2b)=',pa3f (j1b,j2b)
      !US ENDIF
 
      ! Pseudo-optical depth in cloudy part of layer
      zod2 = zudiff * pbsfc * podsc
      zod1 = zod2 + zudiff * podac
      zod1 = zod1 + zangfa * zodgc
 
      ! Layer coefficients in cloudy part of layer
 
      zeps=SQRT(zod1*zod1-zod2*zod2)
      IF (zeps.LT.zargli) THEN
        ztau = EXP  (-zeps)
      ELSE
        ztau = ztsec
      END IF
      zrho = zod2/(zod1+zeps)
      pa1c=ztau*(1._dp-(zrho**2))*(1._dp/(1._dp-(zrho**2)*(ztau**2)))
      pa2c=zrho*(1._dp-(ztau**2))*(1._dp/(1._dp-(zrho**2)*(ztau**2)))
      pa3c=(1._dp-pa1c+pa2c)/(zod1+zod2)

!------------------------------------------------------------------------------
! End of the subroutine
!------------------------------------------------------------------------------

END SUBROUTINE coe_th_gpu

!==============================================================================


!==============================================================================
!+ Module procedure in "radiation_rg"
!------------------------------------------------------------------------------

SUBROUTINE coe_so_gpu (                                                 &
       pduh2oc,pduh2of,pduco2 ,pduo3  ,palogp ,palogt ,                 &
       podsc  ,podsf  ,podac  ,podaf  ,pbsfc  ,pbsff  ,pusfc ,pusff ,   &
       psmu0  ,pqsmu0 ,                                                 &
       kspec  ,kh2o   ,kco2   ,ko3    ,                                 &
       pa1c   ,pa1f   ,pa2c   ,pa2f   ,pa3c   ,pa3f ,                   &
       pa4c   ,pa4f   ,pa5c   ,pa5f )

!------------------------------------------------------------------------------
!
! Description:
!
!   The module procedure coe_so calculates the optical effects of atmospheric
!   layers on solar radiation based on basic optical properties of non-gaseous
!   constituents and gaseous absorption coefficients selected through the
!   corresponding control variables.
!   This routine computes layer effects (transmissivity, reflectivity)
!   for diffuse and direct solar radiation both for the cloudy and the
!   cloud-free part of a model layer.
!   The calculation is based on the implicit delt-two-stream equations
!   (cf. Ritter and Geleyn, 1992) and uses basic optical properties
!   (i.e. absorption and scattering optical depth, backscattered and
!   upscattered fraction for non-gaseous atmospheric constituents and
!   gaseous absorption properties) as input.
!
! Method:
!
! - addition of individual gaseous absorption effects to the optical
!   properties of the non-gaseous constituents
!   (optical depth multiplied by alpha1 to alpha4)
!
! - determination of layer effects (cf. Zdunkowski et al., 1982, 1986
!   and Ritter and Geleyn, 1992)
! - the resonance case for those effects related to the direct solar
!   radiation is avoided by a small displacement of the local inverse
!   of the cosine of the zenith angle (if necessary)
!
!------------------------------------------------------------------------------

! Subroutine arguments:
! --------------------

! Input data
! ----------
  INTEGER (KIND=iintegers), INTENT (IN) ::  &
     kspec,       & ! spectral interval considered
     kh2o ,       & ! table index for h2o absorption properties
     kco2 ,       & ! table index for co2 absorption properties
     ko3            ! table index for o3  absorption properties

  REAL    (KIND=dp   ), INTENT (IN) ::  &

     ! opticall relevant gas quantities (Pa)
     pduh2oc, & ! h2o inside cloud
     pduh2of, & ! h2o out of cloud
     pduco2 , & ! co2 content
     pduo3  , & ! o3  content

     ! Logarithm of layer mean temperature and pressure
     palogt , & ! ln T
     palogp , & ! ln p

     ! Optical properties of non-gaseous constituents (..c=cloudy; ..f=free)
     podsc  , & !
     podsf  , & !
     podac  , & !
     podaf  , & !
     pbsfc  , & !
     pbsff  , & !
     pusfc  , & !
     pusff  , & !

     psmu0              , & ! cosine of zenith angle
     pqsmu0                 ! inverse of cosine ...

! Output data
! -----------
  REAL    (KIND=dp   ), INTENT (OUT) ::  &
     pa1c  , & ! direct radiation transmis-
     pa1f  , & ! sivity cloudy/cloud-free
     pa2c  , & ! direct radition downward
     pa2f  , & ! scattering cloudy/cloud-free
     pa3c  , & ! direct radiation upward
     pa3f  , & ! scattering cloudy/cloud-free
     pa4c  , & ! diffuse flux transmissivity
     pa4f  , & ! cloudy/cloud-free
     pa5c  , & ! diffuse flux reflectivity
     pa5f      ! cloudy/cloud-free

! Local parameters:
! ----------------
  REAL    (KIND=dp   ), PARAMETER ::  &
     zargli  = 80.0_dp     , &  ! argument limit for EXP
     ztsec   = 1.0E-35_dp  , &  ! (=exp(-zargli) avoids ALOG(0.0)
     zodmax  = 1.0E+6_dp   , &  ! maximum allowed optical depth
     zepres  = 1.0E-7_dp   , &  ! for resonance case avoidance
                             ! 32bit-accuracy (1.E-14 for 64bit machine)
     zudiff  = 2.0_dp      , &  ! Diffusivity factors for gases and other constituents
     zangfa  = 1.648721271_dp   ! exp(0.5)

  INTEGER (KIND=iintegers), PARAMETER ::  &
     j1b    = 1,           & ! debug point index first dimension
     j2b    = 1              ! debug point index second dimension

! Local scalars:
! -------------
  INTEGER (KIND=iintegers) ::  &
    j1,j2,j3                 ! loop indices over spatial dimensions

  REAL    (KIND=dp   ) ::  &
    zeps,                      & !
    ze,zm,zg1,zg2,ze1mwf,zmu0if  !

  REAL    (KIND=dp   ) ::  &
     zodgf, zodgc, zod1, zod2, zod3, zod4, zod5

!- End of header
!==============================================================================

!------------------------------------------------------------------------------
! Begin Subroutine coe_so_gpu
!------------------------------------------------------------------------------

  ! Optical depth of gases

      zodgf = 0.0_dp        ! Initialisation

      IF (kco2 /= 0) THEN     ! Include CO2 contribution
        zodgf = zodgf + pduco2* (REAL(cobi(kco2,kspec,2),dp)*       &
                    EXP ( REAL(coali(kco2,kspec,2),dp) * palogp     &
                         -REAL(cobti(kco2,kspec,2),dp) * palogt))
      ENDIF                  ! CO2
      !US IF (ldebug) print *,'**** zodgf(CO2)        =',zodgf

      IF (ko3 /= 0) THEN     ! Include O3 contribution
        zodgf = zodgf + pduo3 * (REAL(cobi(ko3 ,kspec,3),dp)*       &
                    EXP ( REAL(coali(ko3 ,kspec,3),dp) * palogp     &
                         -REAL(cobti(ko3 ,kspec,3),dp) * palogt))
      ENDIF
      !US IF (ldebug) print *,'**** zodgf(CO2+O3)     =',zodgf

      ! Cloudy = cloud free for CO2 and O3 :
      zodgc = zodgf

      IF (kh2o /= 0) THEN    ! Include H2O contribution
        zodgf = zodgf + pduh2of* (REAL(cobi(kh2o,kspec,1),dp)*       &
                    EXP ( REAL(coali(kh2o,kspec,1),dp) * palogp      &
                         -REAL(cobti(kh2o,kspec,1),dp) * palogt))
        zodgc = zodgc + pduh2oc* (REAL(cobi(kh2o,kspec,1),dp)*       &
                    EXP ( REAL(coali(kh2o,kspec,1),dp) * palogp      &
                         -REAL(cobti(kh2o,kspec,1),dp) * palogt))
      ENDIF
      !US IF (ldebug) print *,'**** zodgf(CO2+O3+H2O) =',zodgf
      !US IF (ldebug) print *,'**** zodgc(CO2+O3+H2O) =',zodgc

      zodgf = MIN (zodgf, zodmax)
      zodgc = MIN (zodgc, zodmax)
      !US IF (ldebug) print *,'**** nach securit auf optical depth '
      !US IF (ldebug) print *,'**** zodgf(CO2+O3+H2O) =',zodgf
      !US IF (ldebug) print *,'**** zodgc(CO2+O3+H2O) =',zodgc

      ! Pseudo-optical depth in cloud-free part of layer

      zod2 = zudiff * pbsff * podsf
      zod1 = zod2 + zudiff * podaf
      zod3 = pusff * podsf
      zod4 = podsf - zod3
      zod5 = podsf + podaf
      zod1 = zod1 + zangfa * zodgf
      zod5 = zod5 + zodgf
      !US IF (ldebug) THEN
      !US   print *,'**** cloud-free zod1 (j1b,j2b)    =',zod1
      !US   print *,'**** cloud-free zod2 (j1b,j2b)    =',zod2
      !US   print *,'**** cloud-free zod3 (j1b,j2b)    =',zod3
      !US   print *,'**** cloud-free zod4 (j1b,j2b)    =',zod4
      !US   print *,'**** cloud-free zod5 (j1b,j2b)    =',zod5
      !US ENDIF

      ! Layer coefficients in cloud-free part of layer

      zeps=SQRT(zod1*zod1-zod2*zod2)
      IF (zeps.LT.zargli) THEN
        ze = EXP  (-zeps)
      ELSE
        ze = ztsec
      END IF
      zm = zod2/(zod1+zeps)
      pa4f=ze*(1._dp-(zm**2))*(1._dp/(1._dp-(zm**2)*(ze**2)))
      pa5f=zm*(1._dp-(ze**2))*(1._dp/(1._dp-(zm**2)*(ze**2)))

      ze1mwf = zeps / zod5
      zmu0if = ze1mwf + SIGN ( MAX(ABS(pqsmu0-ze1mwf),zepres) &
                              ,(pqsmu0-ze1mwf) )
      zod3 = zod3 * zmu0if
      zod4 = zod4 * zmu0if
      zod5 = zod5 * zmu0if
      IF (zod5.LT.zargli) THEN
        pa1f = EXP  (-zod5)
      ELSE
        pa1f = ztsec
      END IF
      zg1 = ( zod3*(zod5-zod1) -zod2*zod4) /(zod5*zod5 - zeps*zeps)
      zg2 =-( zod4*(zod5+zod1) +zod2*zod3) /(zod5*zod5 - zeps*zeps)
      pa2f = zg2*(pa1f-pa4f) -zg1*pa5f*pa1f
      pa3f = zg1*(1._dp-pa4f*pa1f) -zg2*pa5f

      !US IF (ldebug) THEN
      !US   print *,'**** cloud-free pa1f (j1b,j2b)    =',pa1f (j1b,j2b)
      !US   print *,'**** cloud-free pa2f (j1b,j2b)    =',pa2f (j1b,j2b)
      !US   print *,'**** cloud-free pa3f (j1b,j2b)    =',pa3f (j1b,j2b)
      !US   print *,'**** cloud-free pa4f (j1b,j2b)    =',pa4f (j1b,j2b)
      !US   print *,'**** cloud-free pa5f (j1b,j2b)    =',pa5f (j1b,j2b)
      !US ENDIF

      ! Pseudo-optical depth in cloudy part of layer

      zod2 = zudiff * pbsfc * podsc
      zod1 = zod2 + zudiff * podac
      zod3 = pusfc * podsc
      zod4 = podsc - zod3
      zod5 = podsc + podac
      zod1 = zod1 + zangfa * zodgc
      zod5 = zod5 + zodgc

      !US IF (ldebug) THEN
      !US   print *,'**** cloudy     zod1 (j1b,j2b)    =',zod1
      !US   print *,'**** cloudy     zod2 (j1b,j2b)    =',zod2
      !US   print *,'**** cloudy     zod3 (j1b,j2b)    =',zod3
      !US   print *,'**** cloudy     zod4 (j1b,j2b)    =',zod4
      !US   print *,'**** cloudy     zod5 (j1b,j2b)    =',zod5
      !US ENDIF

      ! Layer coefficients in cloudy part of layer

      zeps=SQRT(zod1*zod1-zod2*zod2)
      IF (zeps.LT.zargli) THEN
        ze = EXP  (-zeps)
      ELSE
        ze = ztsec
      END IF
      zm = zod2/(zod1+zeps)
      pa4c=ze*(1._dp-(zm**2))*(1._dp/(1._dp-(zm**2)*(ze**2)))
      pa5c=zm*(1._dp-(ze**2))*(1._dp/(1._dp-(zm**2)*(ze**2)))

      ze1mwf = zeps / zod5
      zmu0if = ze1mwf + SIGN ( MAX(ABS(pqsmu0-ze1mwf),zepres) &
                              ,(pqsmu0-ze1mwf) )
      zod3 = zod3 * zmu0if
      zod4 = zod4 * zmu0if
      zod5 = zod5 * zmu0if
      IF (zod5.LT.ZARGLI) THEN
         pa1c = EXP  (-zod5)
      ELSE
         pa1c = ztsec
      END IF
      zg1 = ( zod3*(zod5-zod1) -zod2*zod4) /(zod5*zod5 - zeps*zeps)
      zg2 =-( zod4*(zod5+zod1) +zod2*zod3) /(zod5*zod5 - zeps*zeps)
      pa2c = zg2*(pa1c-pa4c) -zg1*pa5c*pa1c
      pa3c = zg1*(1._dp-pa4c*pa1c) -zg2*pa5c

!-------------------------------------------------------------------------------
! End of the subroutine
!-------------------------------------------------------------------------------

END SUBROUTINE coe_so_gpu

!==============================================================================
!==============================================================================
!==============================================================================
!+ Module procedure in "Radiation" 
!------------------------------------------------------------------------------

 SUBROUTINE inv_th (                                                  &
       pclc   ,pca1   ,pca2  ,pcb1  ,pcb2  ,pcc1  ,pcc2 ,pcd1 ,pcd2 , &
       pduh2oc,pduh2of,pduco2,pduo3 ,palogp,palogt,                   &
       podsc  ,podsf  ,podac ,podaf ,pbsfc ,pbsff ,                   &
       pbbr   ,palth,                                                 &
       kspec  ,kh2o   ,kco2  ,ko3   ,                                 &
       ki1sd  ,ki1ed  ,ki3sd ,ki3ed ,ki1sc ,ki1ec ,ki3sc ,ki3ec ,     &
       ldebug ,jindex ,                                               &
       pflcu  ,pflfu  ,pflcd ,pflfd)

!------------------------------------------------------------------------------
!
! Description:
!
!   The module procedure inv_th solves a linear equation system for thermal 
!   fluxes using a Gaussian elimination-backsubstitution algorithm dedicated 
!   to the specific structure of the system matrix.
!
! Method:
!
! - setting of the RHS of the system using the layer boundary black
!   body radiation and allowing for partial cloud cover in each layer
! - solution of the equation system including the lower boundary
!   condition
! - matrix coefficients are calculated in the course of the elimination
!   step for one layer at a time through a call to routine *coe_th*
! - the final result, i.e. the so-called black body flux differences
!   (cf.Ritter and Geleyn, 1992) are stored seperately for cloudy and
!   cloud-free part of each layer boundary
!
!------------------------------------------------------------------------------

! Subroutine arguments:
! --------------------

! Input data
! ----------
  INTEGER (KIND=iintegers), INTENT (IN) ::  &
     ki1sd,       & ! start index for first  array dimension
     ki1ed,       & ! end   index for first  array dimension
     ki3sd,       & ! start index for third  array dimension
     ki3ed,       & ! end   index for third  array dimension

   ! and the same for the computations
     ki1sc,       & ! start index for first  array computation
     ki1ec,       & ! end   index for first  array computation
     ki3sc,       & ! start index for third  array computation
     ki3ec,       & ! end   index for third  array computation
     kspec,       & ! spectral interval considered
     kh2o ,       & ! table index for h2o absorption properties
     kco2 ,       & ! table index for co2 absorption properties
     ko3  ,       & ! table index for o3  absorption properties
     jindex         ! index for j-loop

  LOGICAL                 , INTENT (IN) ::  &
     ldebug         ! debug control switch       

  REAL    (KIND=dp)       , INTENT (IN) ::  &
     pclc  (ki1sd:ki1ed,ki3sd:ki3ed),   & ! cloud cover
     pca1  (ki1sd:ki1ed,ki3sd:ki3ed),   & ! cloud geometry factor  
     pca2  (ki1sd:ki1ed,ki3sd:ki3ed),   & ! cloud geometry factor  
     pcb1  (ki1sd:ki1ed,ki3sd:ki3ed),   & ! cloud geometry factor  
     pcb2  (ki1sd:ki1ed,ki3sd:ki3ed),   & ! cloud geometry factor  
     pcc1  (ki1sd:ki1ed,ki3sd:ki3ed),   & ! cloud geometry factor  
     pcc2  (ki1sd:ki1ed,ki3sd:ki3ed),   & ! cloud geometry factor  
     pcd1  (ki1sd:ki1ed,ki3sd:ki3ed),   & ! cloud geometry factor  
     pcd2  (ki1sd:ki1ed,ki3sd:ki3ed),   & ! cloud geometry factor  
     pbbr  (ki1sd:ki1ed,ki3sd:ki3ed+1), & ! black body radiation   
     palth (ki1sd:ki1ed)                              ! surface albedo

  ! Input data to be passed to *coe_th*
  REAL    (KIND=dp)       , INTENT (IN) ::  &

     ! layer gas contents (cloudy and cloud-free, if distinction necessary)
     pduh2oc(ki1sd:ki1ed,ki3sd:ki3ed), & ! h2o-vapour cloudy      
     pduh2of(ki1sd:ki1ed,ki3sd:ki3ed), & ! h2o-vapour cloud-free  
     pduco2 (ki1sd:ki1ed,ki3sd:ki3ed), & ! co2
     pduo3  (ki1sd:ki1ed,ki3sd:ki3ed), & ! o3 
     ! optical properties of 'grey' constituents (cloudy and cloud-free)
     podsc  (ki1sd:ki1ed,ki3sd:ki3ed), & ! scattering optical depth
     podsf  (ki1sd:ki1ed,ki3sd:ki3ed), & ! scattering optical depth
     podac  (ki1sd:ki1ed,ki3sd:ki3ed), & ! absorption optical depth
     podaf  (ki1sd:ki1ed,ki3sd:ki3ed), & ! absorption optical depth
     pbsfc  (ki1sd:ki1ed,ki3sd:ki3ed), & ! backscatter fraction
     pbsff  (ki1sd:ki1ed,ki3sd:ki3ed), & ! backscatter fraction

     palogp (ki1sd:ki1ed,ki3sd:ki3ed), & ! ln(p)
     palogt (ki1sd:ki1ed,ki3sd:ki3ed)    ! ln(T)
 
! Output data
! -----------
  REAL    (KIND=dp)       , INTENT (OUT) ::  &
     pflcu (ki1sd:ki1ed,ki3sd:ki3ed+1), & ! flux up   cloudy
     pflfu (ki1sd:ki1ed,ki3sd:ki3ed+1), & ! flux up   cloud-free 
     pflcd (ki1sd:ki1ed,ki3sd:ki3ed+1), & ! flux down cloudy     
     pflfd (ki1sd:ki1ed,ki3sd:ki3ed+1)    ! flux down cloud-free 

! Local scalars:
! -------------
  INTEGER (KIND=iintegers) ::  &
    j1,j3                    ! loop indices over spatial dimensions

  LOGICAL                  ::  &
    ldebug_coe_th            ! debug switch for *coe_th*

  REAL    (KIND=dp)        ::  &
    ztd1 ,ztd2 ,ztd3 ,ztd4 ,ztd5 ,ztd6 , ztd7,  & !
    ztds1,ztds2,ztds3,ztus1                       !
 
! Local (automatic) arrays:
! ------------------------
!RUS_CHANGE/REMOVE/WKARR
!#  REAL    (KIND=dp)        ::  &
!#
!#    ! layer properties calculated in *coe_th*
!#    pa1c   (ki1sd:ki1ed)     , & !
!#    pa1f   (ki1sd:ki1ed)     , & ! 
!#    pa2c   (ki1sd:ki1ed)     , & ! 
!#    pa2f   (ki1sd:ki1ed)     , & ! 
!#    pa3c   (ki1sd:ki1ed)     , & ! 
!#    pa3f   (ki1sd:ki1ed)     , & ! 
!#
!#    ! Utility arrays
!#    ztu1 (ki1sd:ki1ed,ki3sd:ki3ed), & !
!#    ztu2 (ki1sd:ki1ed,ki3sd:ki3ed), & !
!#    ztu3 (ki1sd:ki1ed,ki3sd:ki3ed), & !
!#    ztu4 (ki1sd:ki1ed,ki3sd:ki3ed), & !
!#    ztu5 (ki1sd:ki1ed,ki3sd:ki3ed), & !
!#    ztu6 (ki1sd:ki1ed,ki3sd:ki3ed), & !
!#    ztu7 (ki1sd:ki1ed,ki3sd:ki3ed), & !
!#    ztu8 (ki1sd:ki1ed,ki3sd:ki3ed), & !
!#    ztu9 (ki1sd:ki1ed,ki3sd:ki3ed)    !
 
!- End of header
!==============================================================================

!------------------------------------------------------------------------------
! Start GPU data region
!------------------------------------------------------------------------------

  !$acc data                                                            &
  !---- Argument arrays - intent(in)
  !$acc present ( pclc,pca1,pca2,pcb1,pcb2,pcc1,pcc2,pcd1,pcd2,pbbr   ) &
  !$acc present ( palth,pduh2oc,pduh2of,pduco2,pduo3,podsc,podsf      ) &
  !$acc present ( podac,podaf,pbsfc,pbsff                             ) &
  !---- Argument arrays - intent(out)
  !$acc present ( pflcu,pflfu,pflcd,pflfd                             ) &
  !---- Local automatic arrays
  !$acc present ( pa1c,pa1f,pa2c,pa2f,pa3c,pa3f                       ) &
  !$acc present ( ztu1,ztu2,ztu3,ztu4,ztu5,ztu6,ztu7,ztu8,ztu9        ) &
  !---- Module arrays
  !$acc present ( cobi,coali,cobti                                    )

!------------------------------------------------------------------------------
! Begin Subroutine inv_th              
!------------------------------------------------------------------------------

  ldebug_coe_th = .FALSE. 

! Upper boundary condition
 
  !$acc parallel
  !$acc loop gang vector collapse(2)
  DO j3 = ki3sc, ki3ec+1
    DO j1 = ki1sc, ki1ec
      pflfd(j1,j3) = pbbr(j1,j3)
      pflcd(j1,j3) = 0.0_dp
    ENDDO
  ENDDO
  !$acc end parallel

!XL_TODO/GPU_WRITE
#ifndef _OPENACC
  IF (ldebug .AND. j2b==jindex) THEN
     print *,' *** INV_TH **************************'
     print *,' *** debug point : ',j1b,j2b
     print *,'pflfd(j1b,j2b,ki3sc) : ',pflfd(j1b,ki3sc)
     print *,'pflcd(j1b,j2b,ki3sc) : ',pflcd(j1b,ki3sc)
  ENDIF
#endif
 
! Determine effects of first layer in *coe_th*
#ifdef _OPENACC
  !$acc parallel
  !$acc loop gang vector
  DO j1 = ki1sc, ki1ec
    CALL coe_th_gpu(pduh2oc (j1,ki3sc), pduh2of (j1,ki3sc), &
                    pduco2  (j1,ki3sc), pduo3   (j1,ki3sc), &
                    palogp  (j1,ki3sc), palogt  (j1,ki3sc), &
                    podsc   (j1,ki3sc), podsf   (j1,ki3sc), &
                    podac   (j1,ki3sc), podaf   (j1,ki3sc), &
                    pbsfc   (j1,ki3sc), pbsff   (j1,ki3sc), &
                    kspec   , kh2o    , kco2    , ko3     , &
                    pa1c(j1), pa1f(j1), pa2c(j1),           &
                    pa2f(j1), pa3c(j1), pa3f(j1)            )
  ENDDO
  !$acc end parallel
#else
  CALL coe_th ( pduh2oc,pduh2of,pduco2 ,pduo3  ,palogp ,palogt , &
                podsc  ,podsf  ,podac  ,podaf  ,pbsfc  ,pbsff  , &
                ki3sc  ,kspec  ,kh2o   ,kco2   ,ko3    ,         &
                ki1sd  ,ki1ed  ,ki3sd  ,ki3ed  ,ki1sc  ,ki1ec  , &
                ldebug_coe_th  ,jindex ,                         &
                pa1c   ,pa1f   ,pa2c   ,pa2f   ,pa3c   ,pa3f)
#endif
 
! Set RHS
  !$acc parallel
  !$acc loop gang vector
  DO j1 = ki1sc, ki1ec
    pflfu(j1,ki3sc)   = (1.0_dp-pclc(j1,ki3sc))*pa3f(j1) * &
                         (pbbr(j1,ki3sc)-pbbr(j1,ki3sc+1))
    pflcu(j1,ki3sc)   =   pclc(j1,ki3sc)*pa3c(j1) * &
                         (pbbr(j1,ki3sc)-pbbr(j1,ki3sc+1))
    pflfd(j1,ki3sc+1) = -pflfu(j1,ki3sc)
    pflcd(j1,ki3sc+1) = -pflcu(j1,ki3sc)
  ENDDO
  !$acc end parallel
 
! Elimination for first layer
  !$acc parallel
  !$acc loop gang vector
  DO j1 = ki1sc, ki1ec
    pflfu(j1,ki3sc)   = pflfu(j1,ki3sc  ) + pa2f(j1) *            &
                       (pca2 (j1,ki3sc)   * pflfd(j1,ki3sc))
    pflfd(j1,ki3sc+1) = pflfd(j1,ki3sc+1) + pa1f(j1) *            &
                       (pca2 (j1,ki3sc)   * pflfd(j1,ki3sc))
    pflcu(j1,ki3sc)   = pflcu(j1,ki3sc  ) + pa2c(j1) *            &
                       (pcb2 (j1,ki3sc)   * pflfd(j1,ki3sc))
    pflcd(j1,ki3sc+1) = pflcd(j1,ki3sc+1) + pa1c(j1) *            &
                       (pcb2 (j1,ki3sc)   * pflfd(j1,ki3sc))
  ENDDO
  !$acc end parallel

!XL_TODO/GPU_WRITE
#ifndef _OPENACC
  IF (ldebug .AND. j2b==jindex) THEN
     print *,' after elimination'
     print *,'pflfd(j1b,j2b,ki3sc+1) : ',pflfd(j1b,ki3sc+1)
  ENDIF
#endif
 
! Store some utitlity variables for first layer

  !$acc parallel
  !$acc loop gang vector
  DO j1 = ki1sc, ki1ec
    ztu1(j1,ki3sc) = 0.0_dp
    ztu2(j1,ki3sc) = pca1(j1,ki3sc)*pa1f(j1)
    ztu3(j1,ki3sc) = pcc1(j1,ki3sc)*pa1f(j1)
    ztu4(j1,ki3sc) = pcb1(j1,ki3sc)*pa1c(j1)
    ztu5(j1,ki3sc) = pcd1(j1,ki3sc)*pa1c(j1)
    ztu6(j1,ki3sc) = pca1(j1,ki3sc)*pa2f(j1)
    ztu7(j1,ki3sc) = pcc1(j1,ki3sc)*pa2f(j1)
    ztu8(j1,ki3sc) = pcb1(j1,ki3sc)*pa2c(j1)
    ztu9(j1,ki3sc) = pcd1(j1,ki3sc)*pa2c(j1)
  ENDDO
  !$acc end parallel
 
! Vertical loop
 
!RUS_CHANGE/REORDER/GPU:
!> Turn loop structure with multiple ip loops inside a
!> single k loop into perfectly nested k-ip loop on GPU.
#ifdef _OPENACC
  !$acc parallel
  !$acc loop gang vector
  DO j1 = ki1sc, ki1ec
    !$acc loop seq
    DO j3 = ki3sc+1, ki3ec
 
    ! Determine effect of the layer in *coe_th*
      CALL coe_th_gpu(pduh2oc    (j1,j3), pduh2of    (j1,j3), &
                      pduco2     (j1,j3), pduo3      (j1,j3), &
                      palogp     (j1,j3), palogt     (j1,j3), &
                      podsc      (j1,j3), podsf      (j1,j3), &
                      podac      (j1,j3), podaf      (j1,j3), &
                      pbsfc      (j1,j3), pbsff      (j1,j3), &
                      kspec   , kh2o    , kco2    , ko3     , &
                      pa1c(j1), pa1f(j1), pa2c(j1),           &
                      pa2f(j1), pa3c(j1), pa3f(j1)            )
 
      pflfu(j1,j3  ) = (1.0_dp - pclc(j1,j3)) * pa3f(j1)      &
                     * (pbbr(j1,j3) - pbbr(j1,j3+1))
      pflcu(j1,j3  ) =  pclc(j1,j3) * pa3c(j1)                &
                     * (pbbr(j1,j3) - pbbr(j1,j3+1))
      pflfd(j1,j3+1) = -pflfu(j1,j3)
      pflcd(j1,j3+1) = -pflcu(j1,j3)
 
  ! IF (ldebug .AND. j2b==jindex) THEN
  !    print *,' in vertical loop j3=',j3
  !    print *,'pflfd(j1b,j2b,j3+1) : ',pflfd(j1b    ,j3+1)
  ! ENDIF 

    ! Elimination and storage of utility variables
      ztd1 = 1.0_dp/(1.0_dp-pa2f(j1)*( pca2(j1,j3)*ztu6(j1,j3-1)    &
                                 +pcc2(j1,j3)*ztu8(j1,j3-1)))
      pflfu(j1,j3) = ztd1*( pflfu(j1,j3) +                          &
                     pa2f(j1)*( pca2(j1,j3)*pflfd(j1,j3)            &
                               +pcc2(j1,j3)*pflcd(j1,j3)))
      ztu1 (j1,j3) = ztd1*pa2f(j1)*( pca2(j1,j3)*ztu7(j1,j3-1)      &
                                    +pcc2(j1,j3)*ztu9(j1,j3-1))
      ztu2 (j1,j3) = ztd1*pa1f(j1)*pca1(j1,j3)
      ztu3 (j1,j3) = ztd1*pa1f(j1)*pcc1(j1,j3)
      ztd2 = pa2c(j1   )*(  pcb2(j1,j3)*ztu6(j1,j3-1)               &
                          + pcd2(j1,j3)*ztu8(j1,j3-1))
      ztd3 = 1.0_dp/(1.0_dp-pa2c(j1)*( pcb2(j1,j3)*ztu7(j1,j3-1)    &
                                      +pcd2(j1,j3)*ztu9(j1,j3-1))   &
                                      -ztd2*ztu1(j1,j3))
      pflcu(j1,j3) = ztd3*( pflcu(j1,j3) +                          &
                     pa2c(j1)*( pcb2(j1,j3)*pflfd(j1,j3)            &
                               +pcd2(j1,j3)*pflcd(j1,j3))           &
                       + ztd2*pflfu(j1,j3))
      ztu4 (j1,j3) = ztd3*( pa1c(j1)*pcb1(j1,j3)+ztd2*ztu2(j1,j3))
      ztu5 (j1,j3) = ztd3*( pa1c(j1)*pcd1(j1,j3)+ztd2*ztu3(j1,j3))
      ztd4 = pa1f(j1)*( pca2(j1,j3)*ztu6(j1,j3-1)                   &
                       +pcc2(j1,j3)*ztu8(j1,j3-1))
      ztd5 = pa1f(j1)*( pca2(j1,j3)*ztu7(j1,j3-1)                   &
                       +pcc2(j1,j3)*ztu9(j1,j3-1))
      pflfd(j1,j3+1) = pflfd(j1,j3+1)                               &
                       +pa1f(j1)*( pca2(j1,j3)*pflfd(j1,j3)         &
                                  +pcc2(j1,j3)*pflcd(j1,j3))        &
                       +ztd4*pflfu(j1,j3) + ztd5*pflcu(j1,j3)
      ztu6 (j1,j3) = pa2f(j1)*pca1(j1,j3)                           &
                    +ztd4*ztu2(j1,j3)+ztd5*ztu4(j1,j3)
      ztu7 (j1,j3) = pa2f(j1)*pcc1(j1,j3)                           &
                    +ztd4*ztu3(j1,j3)+ztd5*ztu5(j1,j3)
      ztd6 = pa1c(j1)*( pcb2(j1,j3)*ztu6(j1,j3-1)                   &
                       +pcd2(j1,j3)*ztu8(j1,j3-1))
      ztd7 = pa1c(j1)*( pcb2(j1,j3)*ztu7(j1,j3-1)                   &
                       +pcd2(j1,j3)*ztu9(j1,j3-1))
      pflcd(j1,j3+1) = pflcd(j1,j3+1)                               &
                      +pa1c(j1)*( pcb2(j1,j3)*pflfd(j1,j3)          &
                                 +pcd2(j1,j3)*pflcd(j1,j3))         &
                      +ztd6*pflfu(j1,j3) + ztd7*pflcu(j1,j3)
      ztu8(j1,j3) = pa2c(j1)*pcb1(j1,j3)                            &
                   +ztd6*ztu2(j1,j3)+ztd7*ztu4(j1,j3)
      ztu9(j1,j3) = pa2c(j1)*pcd1(j1,j3)                            &
                   +ztd6*ztu3(j1,j3)+ztd7*ztu5(j1,j3)
    ENDDO
  ! IF (ldebug .AND. j2b==jindex) THEN
  !    print *,' after elimination in vertical loop j3=',j3
  !    print *,'pflfd(j1b,j2b,j3+1) : ',pflfd(j1b    ,j3+1)
  ! ENDIF
  ENDDO     ! End of vertical loop over layers
  !$acc end parallel
#else
  DO j3 = ki3sc+1, ki3ec
 
    ! Determine effect of the layer in *coe_th*
    CALL coe_th ( pduh2oc,pduh2of,pduco2 ,pduo3  ,palogp ,palogt , &
                  podsc  ,podsf  ,podac  ,podaf  ,pbsfc  ,pbsff  , &
                  j3     ,kspec  ,kh2o   ,kco2   ,ko3    ,         &
                  ki1sd  ,ki1ed  ,ki3sd  ,ki3ed  ,ki1sc  ,ki1ec  , &
                  ldebug_coe_th  ,jindex ,                         &
                  pa1c   ,pa1f   ,pa2c   ,pa2f   ,pa3c   ,pa3f)
 
    ! Set RHS
    DO j1 = ki1sc, ki1ec
      pflfu(j1,j3  ) = (1.0_dp - pclc(j1,j3)) * pa3f(j1)      &
                     * (pbbr(j1,j3) - pbbr(j1,j3+1))
      pflcu(j1,j3  ) =  pclc(j1,j3) * pa3c(j1)                &
                     * (pbbr(j1,j3) - pbbr(j1,j3+1))
      pflfd(j1,j3+1) = -pflfu(j1,j3)
      pflcd(j1,j3+1) = -pflcu(j1,j3)
    ENDDO
 
    IF (ldebug .AND. j2b==jindex) THEN
       print *,' in vertical loop j3=',j3
       print *,'pflfd(j1b,j2b,j3+1) : ',pflfd(j1b    ,j3+1)
    ENDIF 

    ! Elimination and storage of utility variables
 
    DO j1 = ki1sc, ki1ec
      ztd1 = 1.0_dp/(1.0_dp-pa2f(j1)*( pca2(j1,j3)*ztu6(j1,j3-1)    &
                                 +pcc2(j1,j3)*ztu8(j1,j3-1)))
      pflfu(j1,j3) = ztd1*( pflfu(j1,j3) +                          &
                     pa2f(j1)*( pca2(j1,j3)*pflfd(j1,j3)            &
                               +pcc2(j1,j3)*pflcd(j1,j3)))
      ztu1 (j1,j3) = ztd1*pa2f(j1)*( pca2(j1,j3)*ztu7(j1,j3-1)      &
                                    +pcc2(j1,j3)*ztu9(j1,j3-1))
      ztu2 (j1,j3) = ztd1*pa1f(j1)*pca1(j1,j3)
      ztu3 (j1,j3) = ztd1*pa1f(j1)*pcc1(j1,j3)
      ztd2 = pa2c(j1   )*(  pcb2(j1,j3)*ztu6(j1,j3-1)               &
                          + pcd2(j1,j3)*ztu8(j1,j3-1))
      ztd3 = 1.0_dp/(1.0_dp-pa2c(j1)*( pcb2(j1,j3)*ztu7(j1,j3-1)    &
                                      +pcd2(j1,j3)*ztu9(j1,j3-1))   &
                                      -ztd2*ztu1(j1,j3))
      pflcu(j1,j3) = ztd3*( pflcu(j1,j3) +                          &
                     pa2c(j1)*( pcb2(j1,j3)*pflfd(j1,j3)            &
                               +pcd2(j1,j3)*pflcd(j1,j3))           &
                       + ztd2*pflfu(j1,j3))
      ztu4 (j1,j3) = ztd3*( pa1c(j1)*pcb1(j1,j3)+ztd2*ztu2(j1,j3))
      ztu5 (j1,j3) = ztd3*( pa1c(j1)*pcd1(j1,j3)+ztd2*ztu3(j1,j3))
      ztd4 = pa1f(j1)*( pca2(j1,j3)*ztu6(j1,j3-1)                   &
                       +pcc2(j1,j3)*ztu8(j1,j3-1))
      ztd5 = pa1f(j1)*( pca2(j1,j3)*ztu7(j1,j3-1)                   &
                       +pcc2(j1,j3)*ztu9(j1,j3-1))
      pflfd(j1,j3+1) = pflfd(j1,j3+1)                               &
                       +pa1f(j1)*( pca2(j1,j3)*pflfd(j1,j3)         &
                                  +pcc2(j1,j3)*pflcd(j1,j3))        &
                       +ztd4*pflfu(j1,j3) + ztd5*pflcu(j1,j3)
      ztu6 (j1,j3) = pa2f(j1)*pca1(j1,j3)                           &
                    +ztd4*ztu2(j1,j3)+ztd5*ztu4(j1,j3)
      ztu7 (j1,j3) = pa2f(j1)*pcc1(j1,j3)                           &
                    +ztd4*ztu3(j1,j3)+ztd5*ztu5(j1,j3)
      ztd6 = pa1c(j1)*( pcb2(j1,j3)*ztu6(j1,j3-1)                   &
                       +pcd2(j1,j3)*ztu8(j1,j3-1))
      ztd7 = pa1c(j1)*( pcb2(j1,j3)*ztu7(j1,j3-1)                   &
                       +pcd2(j1,j3)*ztu9(j1,j3-1))
      pflcd(j1,j3+1) = pflcd(j1,j3+1)                               &
                      +pa1c(j1)*( pcb2(j1,j3)*pflfd(j1,j3)          &
                                 +pcd2(j1,j3)*pflcd(j1,j3))         &
                      +ztd6*pflfu(j1,j3) + ztd7*pflcu(j1,j3)
      ztu8(j1,j3) = pa2c(j1)*pcb1(j1,j3)                            &
                   +ztd6*ztu2(j1,j3)+ztd7*ztu4(j1,j3)
      ztu9(j1,j3) = pa2c(j1)*pcd1(j1,j3)                            &
                   +ztd6*ztu3(j1,j3)+ztd7*ztu5(j1,j3)
    ENDDO

    IF (ldebug .AND. j2b==jindex) THEN
       print *,' after elimination in vertical loop j3=',j3
       print *,'pflfd(j1b,j2b,j3+1) : ',pflfd(j1b    ,j3+1)
    ENDIF
 
  ENDDO     ! End of vertical loop over layers
#endif
 
  ! Elimination and backsubstitution at the surface

  !$acc parallel
  !$acc loop gang vector
  DO j1 = ki1sc, ki1ec
    ztds1    = 1.0_dp/(1.0_dp-palth(j1)*ztu6(j1,ki3ec))
    pflfu(j1,ki3ec+1) = ztds1 *palth(j1)*pflfd(j1,ki3ec+1)
    ztus1    = ztds1 *palth(j1)*ztu7(j1,ki3ec)
    ztds2    = palth(j1)*ztu8(j1,ki3ec)
    ztds3    = 1.0_dp/(1.0_dp-palth(j1)*ztu9(j1,ki3ec)-ztds2*ztus1)
    pflcu(j1,ki3ec+1) = ztds3*( palth(j1)*pflcd(j1,ki3ec+1) &
                                +ztds2*pflfu(j1,ki3ec+1))
    pflfu(j1,ki3ec+1) = pflfu(j1,ki3ec+1)+ztus1*pflcu(j1,ki3ec+1)
  ENDDO
  !$acc end parallel

  ! Layer-by-layer backsubstitution
 
  !$acc parallel
  !$acc loop seq
  DO j3 = ki3ec,ki3sc,-1
    !$acc loop gang vector
    DO j1 = ki1sc, ki1ec
      pflcd(j1,j3+1) = pflcd(j1,j3+1) + ztu8 (j1,j3)              &
              * pflfu(j1,j3+1) + ztu9 (j1,j3) * pflcu(j1,j3+1)
      pflfd(j1,j3+1) = pflfd(j1,j3+1) + ztu6 (j1,j3)              &
              * pflfu(j1,j3+1) + ztu7 (j1,j3) * pflcu(j1,j3+1)
      pflcu(j1,j3  ) = pflcu(j1,j3  ) + ztu4 (j1,j3)              &
              * pflfu(j1,j3+1) + ztu5 (j1,j3) * pflcu(j1,j3+1)
      pflfu(j1,j3  ) = pflfu(j1,j3  ) + ztu2 (j1,j3)              &
              * pflfu(j1,j3+1) + ztu3 (j1,j3) * pflcu(j1,j3+1)    &
                                      + ztu1 (j1,j3) * pflcu(j1,j3)
    ENDDO
!XL_TODO/GPU_WRITE
#ifndef _OPENACC
    IF (ldebug .AND. j2b==jindex) THEN
      print *,' after backsubst.  in vertical loop j3=',j3
      print *,'pflfd(j1b,j2b,j3+1) : ',pflfd(j1b    ,j3+1)
    ENDIF
#endif
  ENDDO
  !$acc end parallel
 
!------------------------------------------------------------------------------
! End of the subroutine
!------------------------------------------------------------------------------

  !$acc end data

END SUBROUTINE inv_th

!==============================================================================
!==============================================================================
!+ Module procedure in "Radiation" 
!------------------------------------------------------------------------------

SUBROUTINE inv_so (                                                    &
       pclc   ,pca1   ,pca2  ,pcb1  ,pcb2  ,pcc1  ,pcc2 ,pcd1 ,pcd2 ,  &
       pflpt  ,psmu0  ,pqsmu0,palp  ,palso ,                           &
       pduh2oc,pduh2of,pduco2,pduo3 ,palogp,palogt,                    &
       podsc  ,podsf  ,podac ,podaf ,pbsfc ,pbsff ,pusfc,pusff,        &
       kspec  ,kh2o   ,kco2  ,ko3   ,                                  &
       ki1sd  ,ki1ed  ,ki3sd ,ki3ed ,ki1sc ,ki1ec ,ki3sc ,ki3ec ,      &
       ldebug ,jindex ,                                                &
       pflcu  ,pflfu  ,pflcd ,pflfd ,pflcp ,pflfp)

!------------------------------------------------------------------------------
!
! Description:
!
!   The module procedure inv_so solves the linear system of equations for 
!   solar fluxes.
!   The routine solves a linear equation system for solar fluxes using
!   a Gaussian elimination-backsubstitution algorithm dedicated to the
!   specific structure of the system matrix.
!
! Method:
!
! - setting of the RHS of the system using the parallel solar radiation
!   at the top of the atmosphere and allowing for partial cloud cover
! - solution of the equation system including the lower boundary
!   condition
! - matrix coefficients are calculated in the course of the elimination
!   step for one layer at a time through a call to routine *coe_so*
! - the final result, i.e. upward and downward diffuse and parallel 
!   solar fluxes are stored seperately for cloudy and cloud-free parts
!   of each layer boundary
!     
!------------------------------------------------------------------------------

! Subroutine arguments:
! --------------------

! Input data
! ----------
  INTEGER (KIND=iintegers), INTENT (IN) ::  &
     ki1sd,       & ! start index for first  array dimension
     ki1ed,       & ! end   index for first  array dimension
     ki3sd,       & ! start index for third  array dimension
     ki3ed,       & ! end   index for third  array dimension

   ! and the same for the computations
     ki1sc,       & ! start index for first  array computation
     ki1ec,       & ! end   index for first  array computation
     ki3sc,       & ! start index for third  array computation
     ki3ec,       & ! end   index for third  array computation
     kspec,       & ! spectral interval considered
     kh2o ,       & ! table index for h2o absorption properties
     kco2 ,       & ! table index for co2 absorption properties
     ko3  ,       & ! table index for o3  absorption properties
     jindex         ! index for j-loop

  LOGICAL                 , INTENT (IN) ::  &
     ldebug         ! debug control switch       

  REAL    (KIND=dp)       , INTENT (IN) ::  &
     pclc  (ki1sd:ki1ed,ki3sd:ki3ed), & ! cloud cover
     pca1  (ki1sd:ki1ed,ki3sd:ki3ed), & ! cloud geometry factor  
     pca2  (ki1sd:ki1ed,ki3sd:ki3ed), & ! cloud geometry factor  
     pcb1  (ki1sd:ki1ed,ki3sd:ki3ed), & ! cloud geometry factor  
     pcb2  (ki1sd:ki1ed,ki3sd:ki3ed), & ! cloud geometry factor  
     pcc1  (ki1sd:ki1ed,ki3sd:ki3ed), & ! cloud geometry factor  
     pcc2  (ki1sd:ki1ed,ki3sd:ki3ed), & ! cloud geometry factor  
     pcd1  (ki1sd:ki1ed,ki3sd:ki3ed), & ! cloud geometry factor  
     pcd2  (ki1sd:ki1ed,ki3sd:ki3ed), & ! cloud geometry factor  

     pflpt (ki1sd:ki1ed)            , &  ! parallel solar flux at TOA
     palp  (ki1sd:ki1ed)            , &  ! surface albedo for parallel
     palso (ki1sd:ki1ed)                 ! and for diffuse radiation  

  ! Input data to be passed to *coe_so*
  REAL    (KIND=dp)       , INTENT (IN) ::  &

     ! layer gas contents (cloudy and cloud-free, if distinction necessary)
     pduh2oc(ki1sd:ki1ed,ki3sd:ki3ed), & ! h2o-vapour cloudy      
     pduh2of(ki1sd:ki1ed,ki3sd:ki3ed), & ! h2o-vapour cloud-free  
     pduco2 (ki1sd:ki1ed,ki3sd:ki3ed), & ! co2
     pduo3  (ki1sd:ki1ed,ki3sd:ki3ed), & ! o3 
     ! optical properties of 'grey' constituents (cloudy and cloud-free)
     podsc  (ki1sd:ki1ed,ki3sd:ki3ed), & ! scattering optical depth
     podsf  (ki1sd:ki1ed,ki3sd:ki3ed), & ! scattering optical depth
     podac  (ki1sd:ki1ed,ki3sd:ki3ed), & ! absorption optical depth
     podaf  (ki1sd:ki1ed,ki3sd:ki3ed), & ! absorption optical depth
     pbsfc  (ki1sd:ki1ed,ki3sd:ki3ed), & ! backscatter fraction
     pbsff  (ki1sd:ki1ed,ki3sd:ki3ed), & ! backscatter fraction
     pusfc  (ki1sd:ki1ed,ki3sd:ki3ed), & ! upscatter   fraction
     pusff  (ki1sd:ki1ed,ki3sd:ki3ed), & ! upscatter   fraction

     palogp (ki1sd:ki1ed,ki3sd:ki3ed), & ! ln(p)
     palogt (ki1sd:ki1ed,ki3sd:ki3ed), & ! ln(T)

     psmu0 (ki1sd:ki1ed),              & ! cosine of zenith angle
     pqsmu0(ki1sd:ki1ed)                 ! 1./cosine of zenith angle

! Output data
! -----------
  REAL    (KIND=dp)       , INTENT (OUT) ::  &
     pflcu (ki1sd:ki1ed,ki3sd:ki3ed+1), & ! flux up   cloudy
     pflfu (ki1sd:ki1ed,ki3sd:ki3ed+1), & ! flux up   cloud-free 
     pflcd (ki1sd:ki1ed,ki3sd:ki3ed+1), & ! flux down cloudy     
     pflfd (ki1sd:ki1ed,ki3sd:ki3ed+1), & ! flux down cloud-free 
     pflcp (ki1sd:ki1ed,ki3sd:ki3ed+1), & ! flux par. cloudy     
     pflfp (ki1sd:ki1ed,ki3sd:ki3ed+1)    ! flux par. cloud-free 

! Local scalars:
! -------------
  INTEGER (KIND=iintegers) ::  &
    j1,j3                    ! loop indices over spatial dimensions

  LOGICAL                  ::  &
    ldebug_coe_so            ! debug switch for *coe_so*

  REAL    (KIND=dp)        ::  &
    ztd1 ,ztd2 ,ztd3 ,ztd4 ,ztd5 ,ztd6 , ztd7,  & !
    ztds1,ztds2,ztds3,ztus1                       !
 
! Local (automatic) arrays:
! ------------------------
!RUS_CHANGE/REMOVE/WKARR
!#  REAL    (KIND=dp)        ::  &
!#
!#    ! layer properties calculated in *coe_so*
!#    pa1c   (ki1sd:ki1ed)     , & !
!#    pa1f   (ki1sd:ki1ed)     , & ! 
!#    pa2c   (ki1sd:ki1ed)     , & ! 
!#    pa2f   (ki1sd:ki1ed)     , & ! 
!#    pa3c   (ki1sd:ki1ed)     , & ! 
!#    pa3f   (ki1sd:ki1ed)     , & ! 
!#    pa4c   (ki1sd:ki1ed)     , & ! 
!#    pa4f   (ki1sd:ki1ed)     , & ! 
!#    pa5c   (ki1sd:ki1ed)     , & ! 
!#    pa5f   (ki1sd:ki1ed)     , & ! 
!#
!#    ! Utility arrays
!#    ztu1 (ki1sd:ki1ed,ki3sd:ki3ed), & !
!#    ztu2 (ki1sd:ki1ed,ki3sd:ki3ed), & !
!#    ztu3 (ki1sd:ki1ed,ki3sd:ki3ed), & !
!#    ztu4 (ki1sd:ki1ed,ki3sd:ki3ed), & !
!#    ztu5 (ki1sd:ki1ed,ki3sd:ki3ed), & !
!#    ztu6 (ki1sd:ki1ed,ki3sd:ki3ed), & !
!#    ztu7 (ki1sd:ki1ed,ki3sd:ki3ed), & !
!#    ztu8 (ki1sd:ki1ed,ki3sd:ki3ed), & !
!#    ztu9 (ki1sd:ki1ed,ki3sd:ki3ed)    !
 
!- End of header
!==============================================================================

!------------------------------------------------------------------------------
! Start GPU data region
!------------------------------------------------------------------------------

  !$acc data                                                            &
  !---- Argument arrays - intent(in)
  !$acc present ( pclc,pca1,pca2,pcb1,pcb2,pcc1,pcc2,pcd1,pcd2,pflpt  ) &
  !$acc present ( palp,palso,pduh2oc,pduh2of,pduco2,pduo3,podsc,podsf ) &
  !$acc present ( podac,podaf,pbsfc,pbsff,pusfc,pusff,palogp,palogt   ) &
  !$acc present ( psmu0,pqsmu0                                        ) &
  !---- Argument arrays - intent(out)
  !$acc present ( pflcu,pflfu,pflcd,pflfd,pflcp,pflfp                 ) &
  !---- Local automatic arrays
  !$acc present ( pa1c,pa1f,pa2c,pa2f,pa3c,pa4f,pa4c,pa5f,pa5c,pa3f   ) &
  !$acc present ( ztu1,ztu2,ztu3,ztu4,ztu5,ztu6,ztu7,ztu8,ztu9        ) &
  !---- Module arrays
  !$acc present ( cobi,coali,cobti                                    )

!------------------------------------------------------------------------------
! Begin Subroutine inv_so              
!------------------------------------------------------------------------------

!~  ldebug_coe_so = .FALSE. 
!~
!~  ! Upper boundary condition
!~ 
!~  !$acc parallel
!~  !$acc loop gang vector
!~  DO j1 = ki1sc, ki1ec
!~    pflfp(j1,ki3sc) = pflpt(j1)
!~    pflcp(j1,ki3sc) = 0.0_dp
!~    pflfd(j1,ki3sc) = 0.0_dp
!~    pflcd(j1,ki3sc) = 0.0_dp
!~  ENDDO
!~  !$acc end parallel
!~
!~!XL_TODO/GPU_WRITE
!~#ifndef _OPENACC
!~  IF (ldebug .AND. j2b==jindex) THEN
!~     print *,' *** INV_SO **************************'
!~     print *,' *** Debug point: ',j1b,j2b
!~     print *,'pflfp(j1b,j2b,ki3sc) : ',pflfp(j1b    ,ki3sc)
!~     print *,'pflcp(j1b,j2b,ki3sc) : ',pflcp(j1b    ,ki3sc)
!~     print *,'pflfp(j1b,j2b,ki3sc) : ',pflfp(j1b    ,ki3sc)
!~     print *,'pflcd(j1b,j2b,ki3sc) : ',pflcd(j1b    ,ki3sc)
!~  ENDIF 
!~#endif
!~
!~  ! Determine effects of first layer in *coe_so*
!~#ifdef _OPENACC
!~  !$acc parallel
!~  !$acc loop gang vector
!~  DO j1 = ki1sc, ki1ec
!~    CALL coe_so_gpu(pduh2oc (j1,ki3sc), pduh2of (j1,ki3sc), &
!~                    pduco2  (j1,ki3sc), pduo3   (j1,ki3sc), &
!~                    palogp  (j1,ki3sc), palogt  (j1,ki3sc), &
!~                    podsc   (j1,ki3sc), podsf   (j1,ki3sc), &
!~                    podac   (j1,ki3sc), podaf   (j1,ki3sc), &
!~                    pbsfc   (j1,ki3sc), pbsff   (j1,ki3sc), &
!~                    pusfc   (j1,ki3sc), pusff   (j1,ki3sc), &
!~                    psmu0   (j1)      , pqsmu0  (j1)      , &
!~                    kspec   , kh2o    , kco2    , ko3     , &
!~                    pa1c(j1), pa1f(j1), pa2c(j1),           &
!~                    pa2f(j1), pa3c(j1), pa3f(j1),           &
!~                    pa4c(j1), pa4f(j1), pa5c(j1), pa5f(j1)  )
!~  ENDDO
!~  !$acc end parallel
!~#else
!~  CALL  coe_so (                                                     &
!~      pduh2oc,pduh2of,pduco2 ,pduo3  ,palogp ,palogt ,               &
!~      podsc  ,podsf  ,podac  ,podaf  ,pbsfc  ,pbsff  ,pusfc ,pusff , &
!~      psmu0  ,pqsmu0 ,                                               &
!~      ki3sc  ,kspec  ,kh2o   ,kco2   ,ko3    ,                       &
!~      ki1sd  ,ki1ed  ,ki3sd  ,ki3ed  ,ki1sc  ,ki1ec  ,               &
!~      ldebug_coe_so  ,jindex ,                                       &
!~      pa1c   ,pa1f   ,pa2c   ,pa2f   ,pa3c   ,pa3f ,                 &
!~      pa4c   ,pa4f   ,pa5c   ,pa5f )
!~#endif
!~ 
!~  ! Top layer elimination
!~ 
!~  !$acc parallel
!~  !$acc loop gang vector
!~  DO j1 = ki1sc, ki1ec
!~    pflfu(j1,ki3sc  ) = pa3f(j1) * pca2(j1,ki3sc) *pflfp(j1,ki3sc)
!~    pflfp(j1,ki3sc+1) = pa1f(j1) * pca2(j1,ki3sc) *pflfp(j1,ki3sc)
!~    pflfd(j1,ki3sc+1) = pa2f(j1) * pca2(j1,ki3sc) *pflfp(j1,ki3sc)
!~    pflcu(j1,ki3sc  ) = pa3c(j1) * pcb2(j1,ki3sc) *pflfp(j1,ki3sc)
!~    pflcp(j1,ki3sc+1) = pa1c(j1) * pcb2(j1,ki3sc) *pflfp(j1,ki3sc)
!~    pflcd(j1,ki3sc+1) = pa2c(j1) * pcb2(j1,ki3sc) *pflfp(j1,ki3sc)
!~  ENDDO
!~  !$acc end parallel
!~
!~!XL_TODO/GPU_WRITE
!~#ifndef _OPENACC
!~  IF (ldebug .AND. j2b==jindex) THEN
!~     print *,' *** INV_SO **************************'
!~     print *,'pflfu(j1b,j2b,ki3sc)  : ',pflfu(j1b    ,ki3sc)
!~     print *,'pflcu(j1b,j2b,ki3sc)  : ',pflcu(j1b    ,ki3sc)
!~     print *,'pflfd(j1b,j2b,ki3sc+1): ',pflfd(j1b    ,ki3sc+1)
!~     print *,'pflcd(j1b,j2b,ki3sc+1): ',pflcd(j1b    ,ki3sc+1)
!~     print *,'pa1f (j1b,j2b)        : ',pa1f (j1b    )        
!~     print *,'pa1c (j1b,j2b)        : ',pa1c (j1b    )        
!~     print *,'pa2f (j1b,j2b)        : ',pa2f (j1b    )        
!~     print *,'pa2c (j1b,j2b)        : ',pa2c (j1b    )        
!~     print *,'pa3f (j1b,j2b)        : ',pa3f (j1b    )        
!~     print *,'pa3c (j1b,j2b)        : ',pa3c (j1b    )        
!~  ENDIF 
!~#endif
!~ 
!~  ! Storage of utility arrays for the top layer
!~
!~  !$acc parallel
!~  !$acc loop gang vector


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!~ WITH THIS ENABLED, WE DONT CAPTURE SCOP - I did this 2nd
!~  DO j1 = ki1sc, ki1ec
!~    ztu1(j1,1) = 0.0_dp
!~    ztu2(j1,1) = pca1(j1,1) * pa4f(j1)
!~    ztu3(j1,1) = pcc1(j1,1) * pa4f(j1)
!~    ztu4(j1,1) = pcb1(j1,1) * pa4c(j1)
!~    ztu5(j1,1) = pcd1(j1,1) * pa4c(j1)
!~    ztu6(j1,1) = pca1(j1,1) * pa5f(j1)
!~    ztu7(j1,1) = pcc1(j1,1) * pa5f(j1)
!~    ztu8(j1,1) = pcb1(j1,1) * pa5c(j1)
!~    ztu9(j1,1) = pcd1(j1,1) * pa5c(j1)
!~  ENDDO
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!~  !$acc end parallel
!~ 
!~  ! Successive layer-by-layer elimination
!~ 
!~!RUS_CHANGE/REORDER/GPU
!~!> Turn loop structure with multiple ip loops inside a
!~!> single k loop into perfectly nested k-ip loop on GPU.
!~#ifdef _OPENACC
!~  !$acc parallel
!~  !$acc loop gang vector
!~  DO j1 = ki1sc, ki1ec
!~    !$acc loop seq
!~    DO j3 = ki3sc+1, ki3ec         ! Loop over vertical
!~
!~    ! Determine effects of layer in *coe_so*
!~      CALL coe_so_gpu(pduh2oc (j1,j3)   , pduh2of (j1,j3)   , &
!~                      pduco2  (j1,j3)   , pduo3   (j1,j3)   , &
!~                      palogp  (j1,j3)   , palogt  (j1,j3)   , &
!~                      podsc   (j1,j3)   , podsf   (j1,j3)   , &
!~                      podac   (j1,j3)   , podaf   (j1,j3)   , &
!~                      pbsfc   (j1,j3)   , pbsff   (j1,j3)   , &
!~                      pusfc   (j1,j3)   , pusff   (j1,j3)   , &
!~                      psmu0   (j1)      , pqsmu0  (j1)      , &
!~                      kspec   , kh2o    , kco2    , ko3     , &
!~                      pa1c(j1), pa1f(j1), pa2c(j1),           &
!~                      pa2f(j1), pa3c(j1), pa3f(j1),           &
!~                      pa4c(j1), pa4f(j1), pa5c(j1), pa5f(j1)  )
!~ 
!~    ! Elimination
!~ 
!~      ztd1 = 1.0_dp/(1.0_dp-pa5f(j1)*(pca2(j1,j3)*ztu6(j1,j3-1)          &
!~                                     +pcc2(j1,j3)*ztu8(j1,j3-1)))
!~      pflfu(j1,j3) = ztd1*( pa3f(j1)*( pca2(j1,j3)*pflfp(j1,j3)          &
!~                                      +pcc2(j1,j3)*pflcp(j1,j3) )        &
!~                           +pa5f(j1)*( pca2(j1,j3)*pflfd(j1,j3)          &
!~                                      +pcc2(j1,j3)*pflcd(j1,j3) )   )
!~      ztu1 (j1,j3) = ztd1*pa5f(j1)* ( pca2(j1,j3)*ztu7(j1,j3-1)          &
!~                                     +pcc2(j1,j3)*ztu9(j1,j3-1))
!~      ztu2(j1,j3)  =  ztd1*pa4f(j1)*pca1(j1,j3)
!~      ztu3(j1,j3)  =  ztd1*pa4f(j1)*pcc1(j1,j3)
!~      ztd2         = pa5c(j1)*( pcb2(j1,j3)*ztu6(j1,j3-1)                &
!~                               +pcd2(j1,j3)*ztu8(j1,j3-1) )
!~      ztd3         = 1.0_dp/( 1.0_dp-pa5c(j1)*(pcb2(j1,j3)*ztu7(j1,j3-1) &
!~                                              +pcd2(j1,j3)*ztu9(j1,j3-1))&
!~                             -ztd2*ztu1(j1,j3) )
!~      pflcu(j1,j3) = ztd3 *(                                             &
!~                              pa3c(j1)*( pcb2(j1,j3)*pflfp(j1,j3)        &
!~                                        +pcd2(j1,j3)*pflcp(j1,j3) )      &
!~                             +pa5c(j1)*( pcb2(j1,j3)*pflfd(j1,j3)        &
!~                                        +pcd2(j1,j3)*pflcd(j1,j3) )      &
!~                             +ztd2*pflfu(j1,j3)   )
!~      ztu4(j1,j3)    = ztd3 *( pa4c(j1)*pcb1(j1,j3)+ztd2*ztu2(j1,j3) )
!~      ztu5(j1,j3)    = ztd3 *( pa4c(j1)*pcd1(j1,j3)+ztd2*ztu3(j1,j3) )
!~      pflfp(j1,j3+1) = pa1f(j1)*(pca2(j1,j3)*pflfp(j1,j3)                &
!~                                +pcc2(j1,j3)*pflcp(j1,j3))
!~      pflcp(j1,j3+1) = pa1c(j1)*(pcb2(j1,j3)*pflfp(j1,j3)                &
!~                                +pcd2(j1,j3)*pflcp(j1,j3))
!~      ztd4 = pa4f(j1)*( pca2(j1,j3)*ztu6(j1,j3-1)                        &
!~                       +pcc2(j1,j3)*ztu8(j1,j3-1) )
!~      ztd5 = pa4f(j1)*( pca2(j1,j3)*ztu7(j1,j3-1)                        &
!~                       +pcc2(j1,j3)*ztu9(j1,j3-1) )
!~      pflfd(j1,j3+1) = pa2f(j1)*(pca2(j1,j3)*pflfp(j1,j3)                &
!~                                +pcc2(j1,j3)*pflcp(j1,j3))               &
!~                      +pa4f(j1)*(pca2(j1,j3)*pflfd(j1,j3)                &
!~                                +pcc2(j1,j3)*pflcd(j1,j3))               &
!~                      +ztd4*pflfu(j1,j3) + ztd5*pflcu(j1,j3)
!~      ztu6(j1,j3) = pa5f(j1)*pca1(j1,j3)                                 &
!~                      +ztd4*ztu2(j1,j3) + ztd5*ztu4(j1,j3)
!~      ztu7(j1,j3) = pa5f(j1)*pcc1(j1,j3)                                 &
!~                      +ztd4*ztu3(j1,j3) + ztd5*ztu5(j1,j3)
!~      ztd6 = pa4c(j1)*( pcb2(j1,j3)*ztu6(j1,j3-1)                        &
!~                       +pcd2(j1,j3)*ztu8(j1,j3-1) )
!~      ztd7 = pa4c(j1)*( pcb2(j1,j3)*ztu7(j1,j3-1)                        &
!~                        +pcd2(j1,j3)*ztu9(j1,j3-1) )
!~      pflcd(j1,j3+1) =  pa2c(j1)*(pcb2(j1,j3)*pflfp(j1,j3)               &
!~                                 +pcd2(j1,j3)*pflcp(j1,j3))              &
!~                         + pa4c(j1)*(pcb2(j1,j3)*pflfd(j1,j3)            &
!~                                 +pcd2(j1,j3)*pflcd(j1,j3))              &
!~                         +ztd6*pflfu(j1,j3) + ztd7*pflcu(j1,j3)
!~      ztu8(j1,j3) = pa5c(j1)*pcb1(j1,j3)                                 &
!~                   +ztd6*ztu2(j1,j3) + ztd7*ztu4(j1,j3)
!~      ztu9(j1,j3) = pa5c(j1)*pcd1(j1,j3)                                 &
!~                   +ztd6*ztu3(j1,j3) + ztd7*ztu5(j1,j3)
!~    ENDDO
!~  ! IF (ldebug .AND. j2b==jindex) THEN
!~  !   print *,' inv_so j3=',j3, '; j2b=',j2b
!~  !   print *,'pflfu(j1b,j2b,j3)  : ',pflfu(j1b,    j3)
!~  !   print *,'pflcu(j1b,j2b,j3)  : ',pflcu(j1b,    j3)
!~  !   print *,'pflfd(j1b,j2b,j3+1): ',pflfd(j1b,    j3+1)
!~  !   print *,'pflcd(j1b,j2b,j3+1): ',pflcd(j1b,    j3+1)
!~  !   print *,'pflfp(j1b,j2b,j3+1): ',pflfp(j1b,    j3+1)
!~  !   print *,'pflcp(j1b,j2b,j3+1): ',pflcp(j1b,    j3+1)
!~  !   print *,'ztu1 (j1b,j2b,j3)  : ',ztu1 (j1b,    j3)
!~  !   print *,'ztu2 (j1b,j2b,j3)  : ',ztu2 (j1b,    j3)
!~  !   print *,'ztu3 (j1b,j2b,j3)  : ',ztu3 (j1b,    j3)
!~  !   print *,'ztu4 (j1b,j2b,j3)  : ',ztu4 (j1b,    j3)
!~  !   print *,'ztu5 (j1b,j2b,j3)  : ',ztu5 (j1b,    j3)
!~  !   print *,'ztu6 (j1b,j2b,j3)  : ',ztu6 (j1b,    j3)
!~  !   print *,'ztu7 (j1b,j2b,j3)  : ',ztu7 (j1b,    j3)
!~  !   print *,'ztu8 (j1b,j2b,j3)  : ',ztu8 (j1b,    j3)
!~  !   print *,'ztu9 (j1b,j2b,j3)  : ',ztu9 (j1b,    j3)
!~  !   print *,' .....'
!~  ! ENDIF 
!~  END DO       ! Vertical loop
!~  !$acc end parallel
!~#else
 print *, "@@@@@ INV_SO"
 print *, "ki1sc: " , ki1sc, " | ki1ec: " , ki1ec
 print *, "ki3sc: ", ki3sc, " |ki3ec: ", ki3ec
 !~~ pflfu (ki1sd:ki1ed,ki3sd:ki3ed+1), & ! flux up   cloud-free 
 print *, "ki1sd: " , ki1sd, " | ki1ed: " , ki1ed
 print *, "ki3sd: " , ki3sd, " | ki3ed: " , ki3ed

  DO j3 = ki3sc+1, ki3ec         ! Loop over vertical

    ! Determine effects of layer in *coe_so*
    !~CALL  coe_so (                                                     &
    !~    pduh2oc,pduh2of,pduco2 ,pduo3  ,palogp ,palogt ,               &
    !~    podsc  ,podsf  ,podac  ,podaf  ,pbsfc  ,pbsff  ,pusfc ,pusff , &
    !~    psmu0  ,pqsmu0 ,                                               &
    !~    j3     ,kspec  ,kh2o   ,kco2   ,ko3    ,                       &
    !~    ki1sd  ,ki1ed  ,ki3sd  ,ki3ed  ,ki1sc  ,ki1ec  ,               &
    !~    ldebug_coe_so  ,jindex ,                                       &
    !~    pa1c   ,pa1f   ,pa2c   ,pa2f   ,pa3c   ,pa3f ,                 &
    !~    pa4c   ,pa4f   ,pa5c   ,pa5f )
 
    ! Elimination
 
    DO j1 = ki1sc, ki1ec
      !~ (original)
      !~ztd1 = 1.0_dp/(1.0_dp-pa5f(j1)*(pca2(j1,j3)*ztu6(j1,j3-1)          &
      !~                               +pcc2(j1,j3)*ztu8(j1,j3-1)))

      !~ (v1)
      !~ ztd1 = pa5f(j1)*pca2(j1, j3)*ztu6(j1, j3-1)

      !~ (v2)
      !~ztd1 = pa5f(j1)*ztu6(j1, j3-1)

      !~ (v3)
      ztd1 = ztu6(j1, j3-1)

      ! COMMENT THIS TO HAVE COE_SO run
       pflfu(j1,j3) = ztd1 ! *pa3f(j1)

       !~pflfu(j1,j3) = ztd1*( pa3f(j1)*( pca2(j1,j3)*pflfp(j1,j3)          &
       !~                                +pcc2(j1,j3)*pflcp(j1,j3) )        &
       !~                     +pa5f(j1)*( pca2(j1,j3)*pflfd(j1,j3)          &
       !~                                +pcc2(j1,j3)*pflcd(j1,j3) )   )

      !~~~~~~~~~~~~~~~~~~(1/16)
      !~ ztu1 (j1,j3) = ztd1*pa5f(j1)* ( pca2(j1,j3)*ztu7(j1,j3-1)          &
      !                               +pcc2(j1,j3)*ztu9(j1,j3-1))
      !~~~~~~~~~~~~~~~~~~(1/8)
      !~ztu2(j1,j3)  =  ztd1*pa4f(j1)*pca1(j1,j3)
      !~ztu3(j1,j3)  =  ztd1*pa4f(j1)*pcc1(j1,j3)
      !~ztd2         = pa5c(j1)*( pcb2(j1,j3)*ztu6(j1,j3-1)                &
      !~                         +pcd2(j1,j3)*ztu8(j1,j3-1) )
      !~ztd3         = 1.0_dp/( 1.0_dp-pa5c(j1)*(pcb2(j1,j3)*ztu7(j1,j3-1) &
      !~                                        +pcd2(j1,j3)*ztu9(j1,j3-1))&
      !~                       -ztd2*ztu1(j1,j3) )
      !~~~~~~~~~~~~~~~~~(1/4)
      !~pflcu(j1,j3) = ztd3 *(                                             &
      !~                        pa3c(j1)*( pcb2(j1,j3)*pflfp(j1,j3)        &
      !~                                  +pcd2(j1,j3)*pflcp(j1,j3) )      &
      !~                       +pa5c(j1)*( pcb2(j1,j3)*pflfd(j1,j3)        &
      !~                                  +pcd2(j1,j3)*pflcd(j1,j3) )      &
      !~                       +ztd2*pflfu(j1,j3)   )
      !~ztu4(j1,j3)    = ztd3 *( pa4c(j1)*pcb1(j1,j3)+ztd2*ztu2(j1,j3) )
      !~ztu5(j1,j3)    = ztd3 *( pa4c(j1)*pcd1(j1,j3)+ztd2*ztu3(j1,j3) )
      !~pflfp(j1,j3+1) = pa1f(j1)*(pca2(j1,j3)*pflfp(j1,j3)                &
      !~                          +pcc2(j1,j3)*pflcp(j1,j3))
      !~pflcp(j1,j3+1) = pa1c(j1)*(pcb2(j1,j3)*pflfp(j1,j3)                &
      !~                          +pcd2(j1,j3)*pflcp(j1,j3))
      !~ztd4 = pa4f(j1)*( pca2(j1,j3)*ztu6(j1,j3-1)                        &
      !~                 +pcc2(j1,j3)*ztu8(j1,j3-1) )
      !~ztd5 = pa4f(j1)*( pca2(j1,j3)*ztu7(j1,j3-1)                        &
      !~                 +pcc2(j1,j3)*ztu9(j1,j3-1) )
      !~~~~~~~~~~~~~~~ (1/2)
      !~pflfd(j1,j3+1) = pa2f(j1)*(pca2(j1,j3)*pflfp(j1,j3)                &
      !~                          +pcc2(j1,j3)*pflcp(j1,j3))               &
      !~                +pa4f(j1)*(pca2(j1,j3)*pflfd(j1,j3)                &
      !~                          +pcc2(j1,j3)*pflcd(j1,j3))               &
      !~                +ztd4*pflfu(j1,j3) + ztd5*pflcu(j1,j3)
      !~ztu6(j1,j3) = pa5f(j1)*pca1(j1,j3)                                 &
      !~                +ztd4*ztu2(j1,j3) + ztd5*ztu4(j1,j3)
      !~ztu7(j1,j3) = pa5f(j1)*pcc1(j1,j3)                                 &
      !~                +ztd4*ztu3(j1,j3) + ztd5*ztu5(j1,j3)
      !~ztd6 = pa4c(j1)*( pcb2(j1,j3)*ztu6(j1,j3-1)                        &
      !~                 +pcd2(j1,j3)*ztu8(j1,j3-1) )
      !~ztd7 = pa4c(j1)*( pcb2(j1,j3)*ztu7(j1,j3-1)                        &
      !~                  +pcd2(j1,j3)*ztu9(j1,j3-1) )
      !~pflcd(j1,j3+1) =  pa2c(j1)*(pcb2(j1,j3)*pflfp(j1,j3)               &
      !~                           +pcd2(j1,j3)*pflcp(j1,j3))              &
      !~                   + pa4c(j1)*(pcb2(j1,j3)*pflfd(j1,j3)            &
      !~                           +pcd2(j1,j3)*pflcd(j1,j3))              &
      !~                   +ztd6*pflfu(j1,j3) + ztd7*pflcu(j1,j3)
      !~ztu8(j1,j3) = pa5c(j1)*pcb1(j1,j3)                                 &
      !~             +ztd6*ztu2(j1,j3) + ztd7*ztu4(j1,j3)
      !~ztu9(j1,j3) = pa5c(j1)*pcd1(j1,j3)                                 &
      !~             +ztd6*ztu3(j1,j3) + ztd7*ztu5(j1,j3)
    ENDDO

    !~IF (ldebug .AND. j2b==jindex) THEN
    !~  print *,' inv_so j3=',j3, '; j2b=',j2b
    !~  print *,'pflfu(j1b,j2b,j3)  : ',pflfu(j1b,    j3)
    !~  print *,'pflcu(j1b,j2b,j3)  : ',pflcu(j1b,    j3)
    !~  print *,'pflfd(j1b,j2b,j3+1): ',pflfd(j1b,    j3+1)
    !~  print *,'pflcd(j1b,j2b,j3+1): ',pflcd(j1b,    j3+1)
    !~  print *,'pflfp(j1b,j2b,j3+1): ',pflfp(j1b,    j3+1)
    !~  print *,'pflcp(j1b,j2b,j3+1): ',pflcp(j1b,    j3+1)
    !~  print *,'ztu1 (j1b,j2b,j3)  : ',ztu1 (j1b,    j3)
    !~  print *,'ztu2 (j1b,j2b,j3)  : ',ztu2 (j1b,    j3)
    !~  print *,'ztu3 (j1b,j2b,j3)  : ',ztu3 (j1b,    j3)
    !~  print *,'ztu4 (j1b,j2b,j3)  : ',ztu4 (j1b,    j3)
    !~  print *,'ztu5 (j1b,j2b,j3)  : ',ztu5 (j1b,    j3)
    !~  print *,'ztu6 (j1b,j2b,j3)  : ',ztu6 (j1b,    j3)
    !~  print *,'ztu7 (j1b,j2b,j3)  : ',ztu7 (j1b,    j3)
    !~  print *,'ztu8 (j1b,j2b,j3)  : ',ztu8 (j1b,    j3)
    !~  print *,'ztu9 (j1b,j2b,j3)  : ',ztu9 (j1b,    j3)
    !~  print *,' .....'
    !~ENDIF 

  END DO       ! Vertical loop
!~#endif
!~ 
!~  ! Elimination and back-substitution at surface
!~ 
!~  !$acc parallel
!~  !$acc loop gang vector
!~  DO j1 = ki1sc, ki1ec
!~    ztds1  = 1.0_dp/(1.0_dp-palso(j1)*ztu6(j1,ki3ec))
!~    pflfu(j1,ki3ec+1)= ztds1 *(palp (j1)*pflfp(j1,ki3ec+1) &
!~                              +palso(j1)*pflfd(j1,ki3ec+1))
!~    ztus1  =  ztds1*palso(j1)*ztu7(j1,ki3ec)
!~    ztds2  =        palso(j1)*ztu8(j1,ki3ec)
!~    ztds3  = 1.0_dp/(1.0_dp-palso(j1)*ztu9(j1,ki3ec)-ztds2*ztus1)
!~    pflcu(j1,ki3ec+1) = ztds3 *(palp (j1)*pflcp(j1,ki3ec+1) &
!~                               +palso(j1)*pflcd(j1,ki3ec+1) &
!~                               +ztds2    *pflfu(j1,ki3ec+1))
!~    pflfu(j1,ki3ec+1) = pflfu(j1,ki3ec+1) +ztus1*pflcu(j1,ki3ec+1)
!~  ENDDO
!~  !$acc end parallel
!~
!~!XL_TODO/GPU_WRITE
!~#ifndef _OPENACC
!~  IF (ldebug .AND. j2b==jindex) THEN
!~     print *,' inv_so surface ------------------------------'
!~     print *,'pflfu(j1b,j2b,ki3ec+1) : ',pflfu(j1b,ki3ec+1)
!~     print *,'pflcu(j1b,j2b,ki3ec+1) : ',pflcu(j1b,ki3ec+1)
!~     print *,'palp (j1b,j2b): ',palp (j1b)
!~     print *,'palso(j1b,j2b): ',palso(j1b)
!~     print *,'ztds1               ',ztds1                  
!~     print *,'ztds2               ',ztds2                  
!~     print *,'ztds3               ',ztds3                  
!~     print *,'ztus1               ',ztus1                  
!~     print *,' .....'
!~  ENDIF
!~#endif
!~
!~  ! Layer-by-layer backsubstitution
!~
!~  IF (ldebug) print *,' inv_so BACKSUBSTITUTION'
!~
!~!------------------------------------------------------------------------------
!~  !$acc parallel
!~  !$acc loop seq
!~  DO j3 = ki3ec, ki3sc, -1
!~    !$acc loop gang vector
!~    DO j1 = ki1sc, ki1ec
!~      pflcd(j1,j3+1) =  pflcd(j1,j3+1)                             &
!~                              + ztu8(j1,j3)*pflfu(j1,j3+1)         &
!~                              + ztu9(j1,j3)*pflcu(j1,j3+1)
!~      pflfd(j1,j3+1) =  pflfd(j1,j3+1)                             &
!~                              + ztu6(j1,j3)*pflfu(j1,j3+1)         &
!~                              + ztu7(j1,j3)*pflcu(j1,j3+1)
!~      pflcu(j1,j3  ) =  pflcu(j1,j3  )                             &
!~                              + ztu4(j1,j3)*pflfu(j1,j3+1)         &
!~                              + ztu5(j1,j3)*pflcu(j1,j3+1)
!~      pflfu(j1,j3  ) =  pflfu(j1,j3  )                             &
!~                              + ztu2(j1,j3)*pflfu(j1,j3+1)         &
!~                              + ztu3(j1,j3)*pflcu(j1,j3+1)         &
!~                              + ztu1(j1,j3)*pflcu(j1,j3)
!~    ENDDO
!~!XL_TODO/GPU_WRITE
!~#ifndef _OPENACC
!~    IF (ldebug .AND. j2b==jindex) THEN
!~      print *,' inv_so j3=',j3
!~      print *,'pflfu(j1b,j2b,j3)  : ',pflfu(j1b,j3)
!~      print *,'pflcu(j1b,j2b,j3)  : ',pflcu(j1b,j3)
!~      print *,'pflfd(j1b,j2b,j3+1): ',pflfd(j1b,j3+1)
!~      print *,'pflcd(j1b,j2b,j3+1): ',pflcd(j1b,j3+1)
!~    ENDIF
!~#endif
!~ENDDO
  !$acc end parallel
 
!------------------------------------------------------------------------------
! End of the subroutine
!------------------------------------------------------------------------------

  !$acc end data

END SUBROUTINE inv_so

!==============================================================================
!==============================================================================
!+ Module procedure in "Radiation" 
!------------------------------------------------------------------------------

SUBROUTINE opt_th(prholwc  ,pdulwc  ,prhoiwc  ,pduiwc  ,                  &
                  paeq1    ,paeq2   ,paeq3    ,paeq4   , paeq5   ,        &
                  ki1sd    ,ki1ed   ,ki3sd    ,ki3ed   ,                  &
                  kspec    ,ki1sc   ,ki1ec    ,ki3sc   ,ki3ec    ,        &
                  ldebug   ,jindex  ,                                     &
                  podac    ,podaf   ,podsc    ,podsf   , pbsfc   ,pbsff   )

!------------------------------------------------------------------------------
!
! Description:
!
!   The module procedure opt_th calculates the optical properties of the 
!   non-gaseous constituents for one spectral interval in the thermal part 
!   of the spectrum.
!   Purpose is the calculation of (absorption and scattering) optical
!   depth and backward scattered fraction of diffuse radiation (excluding 
!   the contribution by gaseous constituents).
!
! Method:
!
! - determination of optical properies (i.e. extinction coefficient,
!   single scattering albedo and asymetry factor of the phase function)
!   using approximate relations for cloud water and cloud ice and
!   combination of five type of aerosols
!
! - calculation of optical depth (scattering and absorption) and back-
!   scattered fraction suitable for use in an implicit delta-two-stream
!   scheme
!
!------------------------------------------------------------------------------

! Subroutine arguments:
! --------------------

! Input data
! ----------
  INTEGER (KIND=iintegers), INTENT (IN) ::  &
     ki1sd,       & ! start index for first  array dimension
     ki1ed,       & ! end   index for first  array dimension
     ki3sd,       & ! start index for third  array dimension
     ki3ed,       & ! end   index for third  array dimension
     kspec,       & ! selected spectral interval

   ! and the same for the computations
     ki1sc,       & ! start index for first  array computation
     ki1ec,       & ! end   index for first  array computation
     ki3sc,       & ! start index for third  array computation
     ki3ec,       & ! end   index for third  array computation
     jindex         ! index for j-loop

  LOGICAL                 , INTENT (IN) ::  &
     ldebug         ! debug control switch       

  REAL    (KIND=dp)       , INTENT (IN) ::  &
           !  Liquid and ice water density and content within for the cloudy
           !  part of each layer
     prholwc(ki1sd:ki1ed,            ki3sd:ki3ed), &
     prhoiwc(ki1sd:ki1ed,            ki3sd:ki3ed), &
     pdulwc (ki1sd:ki1ed,            ki3sd:ki3ed), &
     pduiwc (ki1sd:ki1ed,            ki3sd:ki3ed), &

           !  Aerosole contents (optical depths at 0.55 micrometer) for 5 types
     paeq1  (ki1sd:ki1ed,            ki3sd:ki3ed), &
     paeq2  (ki1sd:ki1ed,            ki3sd:ki3ed), &
     paeq3  (ki1sd:ki1ed,            ki3sd:ki3ed), &
     paeq4  (ki1sd:ki1ed,            ki3sd:ki3ed), &
     paeq5  (ki1sd:ki1ed,            ki3sd:ki3ed)   

! Output data
! -----------
  REAL    (KIND=dp)       , INTENT (OUT) ::  &
     podac (ki1sd:ki1ed,            ki3sd:ki3ed), & ! absorption optical depth
     podaf (ki1sd:ki1ed,            ki3sd:ki3ed), & ! in cloudy and free part
     podsc (ki1sd:ki1ed,            ki3sd:ki3ed), & ! scattering optical depth
     podsf (ki1sd:ki1ed,            ki3sd:ki3ed), & ! in cloudy and free part
     pbsfc (ki1sd:ki1ed,            ki3sd:ki3ed), & ! backscattering fraction 
     pbsff (ki1sd:ki1ed,            ki3sd:ki3ed)    ! in cloudy and free part

! Local parameters: 
! ----------------
  REAL    (KIND=dp)       , PARAMETER ::  &
     z1dg   = 1.0_dp/9.80665_dp, & ! 1./g
     z1d8   = 0.125_dp         , & ! 1./8 
     zepopd = 1.0E-6_dp        , & ! Security constant for optical depth
     zepssa = 1.0E-6_dp            ! Security constant for single scattering albedo

! Local scalars:
! -------------
  INTEGER (KIND=iintegers) ::  &
    j1,j3,                 & ! loop indices over spatial dimensions
    ja                       ! local loop index

  REAL    (KIND=dp)        ::  &
    ! individual optical properties of liquid water and ice 
    z_lwe, z_iwe,          & ! extinction coefficient
    z_lww, z_iww,          & ! single scattering coefficient
    z_lwg, z_iwg,          & ! asymetry factor
    z_lwf, z_iwf,          & ! forward scattered fraction 
    zzg
 
! Local (automatic) arrays:
! ------------------------
!RUS_CHANGE/REMOVE/WKARR
!#!    optical properties (absorption, scattering, backscatter fraction)
!#!    for liquid water, ice and total aerosole
!#
!#  REAL    (KIND=dp)        ::  &
!#     zlwoda (ki1sd:ki1ed)            , & !
!#     zlwods (ki1sd:ki1ed)            , & ! 
!#     zlwb0  (ki1sd:ki1ed)            , & ! 
!#     ziwoda (ki1sd:ki1ed)            , & ! 
!#     ziwods (ki1sd:ki1ed)            , & ! 
!#     ziwb0  (ki1sd:ki1ed)            , & ! 
!#     zaeoda (ki1sd:ki1ed)            , & ! 
!#     zaeods (ki1sd:ki1ed)            , & ! 
!#     zaeb0  (ki1sd:ki1ed)                ! 
 
!- End of header
!==============================================================================

!------------------------------------------------------------------------------
! Start GPU data region
!------------------------------------------------------------------------------

  !$acc data                                                              &
  !---- Argument arrays - intent(in)
  !$acc present ( prholwc,pdulwc,prhoiwc,pduiwc,paeq1,paeq2,paeq3,paeq4 ) &
  !$acc present ( paeq5                                                 ) &
  !---- Argument arrays - intent(out)
  !$acc present ( podac,podaf,podsc,podsf,pbsfc,pbsff                   ) &
  !---- Data module arrays
  !$acc present ( zaeg,zaef,zlwg,zlww,zlwe,zlwemn,zlwemx,ziwg,ziww,ziwe ) &
  !$acc present ( ziwemn,ziwemx,zaea,zaes,zaeg,zrsc                     ) &
  !---- Local automatic arrays
  !$acc present ( zlwoda,zlwods,zlwb0,ziwoda,ziwods,ziwb0,zaeoda,zaeods ) &
  !$acc present ( zaeb0                                                 )

!------------------------------------------------------------------------------
! Begin Subroutine opt_th              
!------------------------------------------------------------------------------


  IF (ldebug .AND. j2b==jindex) THEN
     print *,' **** opt-th   start ********************'
     print *,' **** debug point : ',j1b,j2b
  ENDIF     
 
  !$acc parallel
  !$acc loop gang vector
  DO ja=1,5
    zaef(kspec,ja)  = zaeg(kspec,ja)**2 ! forward sc.fraction f.aerosols
  ENDDO
  !$acc end parallel
!  PRINT*,'ZAEF DEBUG OPT_TH',sum(zaef)
!XL_TODO/GPU_WRITE
#ifndef _OPENACC
  IF (ldebug .AND. j2b==jindex) THEN
     DO ja=1,5
       print *,'ja, zaef(kspec,ja): ',ja,zaef(kspec,ja)
     ENDDO
  ENDIF 
#endif

  IF (ldebug) print *,' In opt-th   vor vertical loop'

! Vertical loop
! ------------- 

  DO j3 = ki3sc, ki3ec
 
    IF (ldebug) print *,' In opt-th   j3 = ',j3  

    ! Optical properties of liquid water and ice as function of the specific
    ! liquid water and ice content
 
    !$acc parallel
    !$acc loop gang vector
    DO j1 = ki1sc, ki1ec

      ! Liquid water

      z_lwg = zlwg(1,kspec) + zlwg(2,kspec)*prholwc(j1,j3)
      z_lwg = MAX (0.0_dp,MIN(1.0_dp,z_lwg))
      z_lwf = z_lwg*z_lwg
      z_lww = zlww(1,kspec) + zlww(2,kspec)*prholwc(j1,j3)
      z_lww = MAX(zepssa,MIN(1.0_dp,z_lww)) 
      z_lwe = z1dg * (zlwe(1,kspec) + zlwe(2,kspec)/ &
              (zlwe(3,kspec)*prholwc(j1,j3)+zlwe(4,kspec)))
      z_lwe = MAX(zlwemn(kspec),MIN(zlwemx(kspec),z_lwe))

      zlwoda(j1)= z_lwe *pdulwc(j1,j3) * (1.0_dp-z_lww) 
      zlwods(j1)= z_lwe *pdulwc(j1,j3) *         z_lww  * (1.0_dp-z_lwf)
      zlwb0 (j1)= z1d8*(4.0_dp+z_lwg)/(1.0_dp+z_lwg)
 
      ! Ice
 
      z_iwg = ziwg(1,kspec) + ziwg(2,kspec)* LOG(prhoiwc(j1,j3))
      z_iwg = MAX(0.0_dp,MIN(1.0_dp,z_iwg))
      z_iwf = z_iwg*z_iwg
      z_iww = ziww(1,kspec) + ziww(2,kspec)* LOG(prhoiwc(j1,j3))
      z_iww = MAX(1.E-12_dp, MIN (1.0_dp, z_iww) )
      z_iwe = z1dg * (ziwe(1,kspec) + ziwe(2,kspec)/  &
              (ziwe(3,kspec)*prhoiwc(j1,j3)+ziwe(4,kspec)))
      z_iwe = MAX(ziwemn(kspec),MIN(ziwemx(kspec),z_iwe  ))
 
      ziwoda(j1) = z_iwe * pduiwc(j1,j3)*(1.0_dp-z_iww)
      ziwods(j1) = z_iwe * pduiwc(j1,j3)*        z_iww  *(1.0_dp-z_iwf)
      ziwb0 (j1) = z1d8*(4.0_dp+z_iwg)/(1.0_dp+z_iwg)
    END DO
    !$acc end parallel

!XL_TODO/GPU_WRITE
#ifndef _OPENACC
    IF (ldebug .AND. j2b==jindex) THEN
      print *,' prholwc (j1b,j2b) :',prholwc (j1b    ,j3)
      print *,' pdulwc  (j1b,j2b) :',pdulwc  (j1b    ,j3)
      print *,' zlwoda  (j1b,j2b) :',zlwoda  (j1b    )
      print *,' zlwods  (j1b,j2b) :',zlwods  (j1b    )
      print *,' zlwb0   (j1b,j2b) :',zlwb0   (j1b    )
      print *,' z_lwg                 :',z_lwg                
      print *,' z_lwf                 :',z_lwf                
      print *,' z_lww                 :',z_lww                
      print *,' z_lwe                 :',z_lwe                
      print *,' prhoiwc (j1b,j2b) :',prhoiwc (j1b    ,j3)
      print *,' pduiwc  (j1b,j2b) :',pduiwc  (j1b    ,j3)
      print *,' ziwoda  (j1b,j2b) :',ziwoda  (j1b    )
      print *,' ziwods  (j1b,j2b) :',ziwods  (j1b    )
      print *,' ziwb0   (j1b,j2b) :',ziwb0   (j1b    )
    ENDIF
#endif
 
    ! Aerosoles
 
    !$acc parallel
    !$acc loop gang vector
    DO j1 = ki1sc, ki1ec
      zaeoda(j1) =  paeq1(j1,j3)*zaea(kspec,1) &
                  + paeq2(j1,j3)*zaea(kspec,2) &
                  + paeq3(j1,j3)*zaea(kspec,3) &
                  + paeq4(j1,j3)*zaea(kspec,4) &
                  + paeq5(j1,j3)*zaea(kspec,5)
      zaeods(j1) =                                                    &
                ( paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1)) ) &
               +( paeq2(j1,j3)*zaes(kspec,2)*(1.0_dp-zaef(kspec,2)) ) &
               +( paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3)) ) &
               +( paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4)) ) &
               +( paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5)) )
      zzg=                                                                   &
          ((paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1)))*zaeg(kspec,1)  &
          +(paeq2(j1,j3)*zaes(kspec,2)*(1.0_dp-zaef(kspec,2)))*zaeg(kspec,2)  &
          +(paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3)))*zaeg(kspec,3)  &
          +(paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4)))*zaeg(kspec,4)  &
          +(paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5)))*zaeg(kspec,5)) &
          / MAX( zaeods(j1),zepopd)
      zaeb0 (j1) = z1d8*(4.0_dp+zzg)/(1.0_dp+zzg)
    ENDDO
    !$acc end parallel

#ifdef COSMOART
    IF(l_cosmo_art) THEN
      IF ((lrad_dust) .AND. (.NOT. lrad_seas) .AND. (.NOT. lrad_aero)) THEN
        !$acc parallel
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          zaeoda(j1) =   paeq1(j1,j3)*zaea(kspec,1) + tau_abs_dust(j1,j3,kspec)   &
                       + paeq2(j1,j3)*zaea(kspec,2)                               &
                       + paeq3(j1,j3)*zaea(kspec,3)                               &
                       + paeq4(j1,j3)*zaea(kspec,4)                               &
                       + paeq5(j1,j3)*zaea(kspec,5)

          zaeods(j1) = paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))+         &
                  tau_streu_dust(j1,j3,kspec)*(1.0_dp-(asym_ges(j1,j3,kspec)**2)) &     
                        + paeq2(j1,j3)*zaes(kspec,2)*(1.0_dp-zaef(kspec,2))       &
                        + paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))       &   
                        + paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))       &   
                        + paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))

          zzg=( paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))*zaeg(kspec,1) +           &
                          tau_streu_dust(j1,j3,kspec)*                                      &
                          (1.0_dp-(asym_ges(j1,j3,kspec)**2))*asym_ges(j1,j3,kspec)         &
                        + paeq2(j1,j3)*zaes(kspec,2)*(1.0_dp-zaef(kspec,2))*zaeg(kspec,2)   &
                        + paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))*zaeg(kspec,3)   &         
                        + paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))*zaeg(kspec,4)   &         
                        + paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))*zaeg(kspec,5))  &
                          / MAX( zaeods(j1),zepopd)
          zaeb0 (j1) = z1d8*(4.0_dp+zzg)/(1.0_dp+zzg)
        ENDDO
        !$acc end parallel

      ELSEIF ((lrad_dust) .AND. (.NOT. lrad_seas) .AND. (lrad_aero)) THEN

        !$acc parallel
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          zaeoda(j1) = paeq1(j1,j3)*zaea(kspec,1) + tau_abs_dust(j1,j3,kspec) &
                + paeq2(j1,j3)*zaea(kspec,2)                                  &
                + paeq3(j1,j3)*zaea(kspec,3) + tau_abs_aero(j1,j3,kspec)      &
                + paeq4(j1,j3)*zaea(kspec,4)                                  &
                + paeq5(j1,j3)*zaea(kspec,5)

          zaeods(j1) = paeq1(j1   ,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1)) +       &       
                  tau_streu_dust(j1,j3,kspec)*(1.0_dp-(asym_ges(j1,j3,kspec)**2))   &
                 +paeq2(j1,j3)*zaes(kspec,2)*(1.0_dp-zaef(kspec,2))                 &
                 +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3)) +               &
                  tau_streu_aero(j1,j3,kspec)*(1.0_dp-(asym_aero(j1,j3,kspec)**2))  &
                 +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))                 &
                 +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))

          zzg= ( paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))*zaeg(kspec,1) +                          &
               tau_streu_dust(j1,j3,kspec)*(1.0_dp-(asym_ges(j1,j3,kspec)**2))*asym_ges(j1,j3,kspec)        &
             + paeq2(j1,j3)*zaes(kspec,2)*(1.0_dp-zaef(kspec,2))*zaeg(kspec,2)                              &
             + paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))*zaeg(kspec,3)  +                           &
               tau_streu_aero(j1,j3,kspec)*(1.0_dp-(asym_aero(j1,j3,kspec)**2.0_dp))*asym_aero(j1,j3,kspec) &
             + paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))*zaeg(kspec,4)                              &
             + paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))*zaeg(kspec,5) )                            &
               / MAX( zaeods(j1),zepopd)
          zaeb0 (j1) = z1d8*(4.0_dp+zzg)/(1.0_dp+zzg)
        ENDDO
        !$acc end parallel

      ELSEIF ((.NOT. lrad_dust) .AND. (.NOT. lrad_seas) .AND. (lrad_aero)) THEN

        !$acc parallel
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          zaeoda(j1) = paeq1(j1,j3)*zaea(kspec,1)                         &
                + paeq2(j1,j3)*zaea(kspec,2)                              &
                + paeq3(j1,j3)*zaea(kspec,3) + tau_abs_aero(j1,j3,kspec)  &
                + paeq4(j1,j3)*zaea(kspec,4)                              &
                + paeq5(j1,j3)*zaea(kspec,5)

          zaeods(j1) = paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))                &
                 +paeq2(j1,j3)*zaes(kspec,2)*(1.0_dp-zaef(kspec,2))                     &
                 +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))+                    &
                  tau_streu_aero(j1,j3,kspec)*(1.0_dp-(asym_aero(j1,j3,kspec)**2.0_dp)) &
                 +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))                     &
                 +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))

          zzg=( paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))*zaeg(kspec,1)                               &
               +paeq2(j1,j3)*zaes(kspec,2)*(1.0_dp-zaef(kspec,2))*zaeg(kspec,2)                               &
               +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))*zaeg(kspec,3)  +                            &
                tau_streu_aero(j1,j3,kspec)*(1.0_dp-(asym_aero(j1,j3,kspec)**2.0_dp))*asym_aero(j1,j3,kspec)  &
               +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))*zaeg(kspec,4)                               &
               +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))*zaeg(kspec,5) )                             &
                   / MAX( zaeods(j1),zepopd)
          zaeb0 (j1) = z1d8*(4.0_dp+zzg)/(1.0_dp+zzg)
        ENDDO
        !$acc end parallel

      ELSEIF ((lrad_dust) .AND. (lrad_seas) .AND. (.NOT.lrad_aero)) THEN

        !$acc parallel
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          zaeoda(j1) = paeq1(j1,j3)*zaea(kspec,1) + tau_abs_dust(j1,j3,kspec) &
                  + tau_abs_seas(j1,j3,kspec)                                 &
                  + paeq3(j1,j3)*zaea(kspec,3)                                &
                  + paeq4(j1,j3)*zaea(kspec,4)                                &
                  + paeq5(j1,j3)*zaea(kspec,5)

          zaeods(j1) = paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))+           &
                  tau_streu_dust(j1,j3,kspec)*(1.0_dp-(asym_ges(j1,j3,kspec)**2))   &
                + tau_streu_seas(j1,j3,kspec)*(1.0_dp-(asym_seas(j1,j3,kspec)**2))  &
                + paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))                 &
                + paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))                 &
                + paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))

          zzg=( paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))*zaeg(kspec,1) +                       &
                tau_streu_dust(j1,j3,kspec)*(1.0_dp-(asym_ges(j1,j3,kspec)**2))*asym_ges(j1,j3,kspec)   &
               +tau_streu_seas(j1,j3,kspec)*(1.0_dp-(asym_seas(j1,j3,kspec)**2))*asym_seas(j1,j3,kspec) &
               +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))*zaeg(kspec,3)                         &
               +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))*zaeg(kspec,4)                         &
               +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))*zaeg(kspec,5) )                       &
             / MAX( zaeods(j1),zepopd)
          zaeb0 (j1) = z1d8*(4.0_dp+zzg)/(1.0_dp+zzg)
        ENDDO
        !$acc end parallel

      ELSEIF ((.NOT. lrad_dust) .and. (lrad_seas) .and. (.NOT. lrad_aero)) THEN

        !$acc parallel
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          zaeoda(j1) = paeq1(j1,j3)*zaea(kspec,1) &
                 + tau_abs_seas(j1,j3,kspec)      &
                 + paeq3(j1,j3)*zaea(kspec,3)     &
                 + paeq4(j1,j3)*zaea(kspec,4)     &
                 + paeq5(j1,j3)*zaea(kspec,5)

          zaeods(j1) =  paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))             &
                  + tau_streu_seas(j1,j3,kspec)*(1.0_dp-(asym_seas(j1,j3,kspec)**2))  &
                  + paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))                 &
                  + paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))                 &
                  + paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))

          zzg = ( paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))*zaeg(kspec,1)                   &
           +tau_streu_seas(j1,j3,kspec)*(1.0_dp-(asym_seas(j1,j3,kspec)**2))*asym_seas(j1,j3,kspec) &
           +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))*zaeg(kspec,3)                         &
           +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))*zaeg(kspec,4)                         &
           +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))*zaeg(kspec,5) )                       &
           / MAX( zaeods(j1),zepopd)
          zaeb0 (j1) = z1d8*(4.0_dp+zzg)/(1.0_dp+zzg)
        ENDDO
        !$acc end parallel

      ELSEIF ((lrad_dust) .AND. (lrad_seas) .AND. (lrad_aero)) THEN

        !$acc parallel
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          zaeoda(j1) = paeq1(j1,j3)*zaea(kspec,1) + tau_abs_dust(j1,j3,kspec) &
                + tau_abs_seas(j1,j3,kspec)                                   &
                + paeq3(j1,j3)*zaea(kspec,3) + tau_abs_aero(j1,j3,kspec)      &
                + paeq4(j1,j3)*zaea(kspec,4)                                  &
                + paeq5(j1,j3)*zaea(kspec,5)

          zaeods(j1) = paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1)) +          &
                  tau_streu_dust(j1,j3,kspec)*(1.0_dp-(asym_ges(j1,j3,kspec)**2))   &
                 +tau_streu_seas(j1,j3,kspec)*(1.0_dp-(asym_seas(j1,j3,kspec)**2))  &
                 +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3)) +               &
                  tau_streu_aero(j1,j3,kspec)*(1.0_dp-(asym_aero(j1,j3,kspec)**2))  &
                 +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))                 &
                 +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))

          zzg= ( paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))*zaeg(kspec,1) +                          &
               tau_streu_dust(j1,j3,kspec)*(1.0_dp-(asym_ges(j1,j3,kspec)**2))*asym_ges(j1,j3,kspec)        &
              +tau_streu_seas(j1,j3,kspec)*(1.0_dp-(asym_seas(j1,j3,kspec)**2))*asym_seas(j1,j3,kspec)      &
              +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))*zaeg(kspec,3)  +                           &
               tau_streu_aero(j1,j3,kspec)*(1.0_dp-(asym_aero(j1,j3,kspec)**2.0_dp))*asym_aero(j1,j3,kspec) &
              +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))*zaeg(kspec,4)                              &
              +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))*zaeg(kspec,5) )                            &
             / MAX( zaeods(j1),zepopd)
          zaeb0 (j1) = z1d8*(4.0_dp+zzg)/(1.0_dp+zzg)
        ENDDO
        !$acc end parallel

      ELSEIF ((.NOT. lrad_dust) .AND. (lrad_seas) .AND. (lrad_aero)) THEN

        !$acc parallel
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          zaeoda(j1) = paeq1(j1,j3)*zaea(kspec,1)                         &
                + tau_abs_seas(j1,j3,kspec)                               &
                + paeq3(j1,j3)*zaea(kspec,3) + tau_abs_aero(j1,j3,kspec)  &
                + paeq4(j1,j3)*zaea(kspec,4)                              &
                + paeq5(j1,j3)*zaea(kspec,5)

          zaeods(j1) = paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))                &
                 +tau_streu_seas(j1,j3,kspec)*(1.0_dp-(asym_seas(j1,j3,kspec)**2.0_dp)) &
                 +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3)) +                   &
                  tau_streu_aero(j1,j3,kspec)*(1.0_dp-(asym_aero(j1,j3,kspec)**2.0_dp)) &
                 +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))                     &
                 +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))

          zzg=( paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))*zaeg(kspec,1)                             &
             +tau_streu_seas(j1,j3,kspec)*(1.0_dp-(asym_seas(j1,j3,kspec)**2.0_dp))*asym_seas(j1,j3,kspec)  &
             +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))*zaeg(kspec,3) +                             &
              tau_streu_aero(j1,j3,kspec)*(1.0_dp-(asym_aero(j1,j3,kspec)**2.0_dp))*asym_aero(j1,j3,kspec)  &
             +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))*zaeg(kspec,4)                               &
             +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))*zaeg(kspec,5) )                             &
                 / MAX( zaeods(j1),zepopd)
          zaeb0 (j1) = z1d8*(4.0_dp+zzg)/(1.0_dp+zzg)
        ENDDO
        !$acc end parallel

      ENDIF
    ENDIF
#endif

!XL_TODO/GPU_WRITE
#ifndef _OPENACC
    IF (ldebug .AND. j2b==jindex) THEN
      print *,' zaeoda  (j1b,j2b) :',zaeoda  (j1b    )
      print *,' zaeods  (j1b,j2b) :',zaeods  (j1b    )
      print *,' zaeb0   (j1b,j2b) :',zaeb0   (j1b    )
    ENDIF
#endif
 
    ! Combined effects
 
    ! a) cloud free part of each layer

    !$acc parallel
    !$acc loop gang vector
    DO j1 = ki1sc, ki1ec
      podaf(j1,j3) = MAX(zaeoda(j1), zepopd)   
      podsf(j1,j3) = MAX(zaeods(j1), zepopd)
      pbsff(j1,j3) =     zaeb0 (j1)
    ENDDO
    !$acc end parallel

!XL_TODO/GPU_WRITE
#ifndef _OPENACC
    IF (ldebug .AND. j2b==jindex) THEN
      print *,' podaf   (j1b,j2b,j3) :',podaf   (j1b    ,j3)
      print *,' podsf   (j1b,j2b,j3) :',podsf   (j1b    ,j3)
      print *,' pbsff   (j1b,j2b,j3) :',pbsff   (j1b    ,j3)
    ENDIF
#endif
 
    ! b) cloudy part of each layer

    !$acc parallel
    !$acc loop gang vector
    DO j1 = ki1sc, ki1ec
      podac(j1,j3) = MAX( zlwoda (j1) + ziwoda (j1) + zaeoda(j1), &
                          zepopd)
      podsc(j1,j3) = MAX( zlwods (j1) + ziwods (j1) + zaeods(j1), &
                          zepopd)
      podsc(j1,j3) = MIN( podsc(j1,j3),                           &
              (1.0_wp-zepssa) * (podac(j1,j3)+podsc(j1,j3)))
      pbsfc(j1,j3) = (  zlwb0 (j1)*zlwods (j1)                    &
                      + ziwb0 (j1)*ziwods (j1)                    &
                      + zaeb0 (j1)*zaeods (j1) ) / podsc(j1,j3)
    ENDDO
    !$acc end parallel

!XL_TODO/GPU_WRITE
#ifndef _OPENACC
    IF (ldebug .AND. j2b==jindex) THEN
      print *,' podac   (j1b,j2b,j3) :',podac   (j1b,j3)
      print *,' podsc   (j1b,j2b,j3) :',podsc   (j1b,j3)
      print *,' pbsfc   (j1b,j2b,j3) :',pbsfc   (j1b,j3)
    ENDIF 
#endif
 
  ! End of vertical loop
  ! --------------------
  ENDDO       
 
!------------------------------------------------------------------------------
! End of the subroutine
!------------------------------------------------------------------------------

  !$acc end data

END SUBROUTINE opt_th

!==============================================================================
!==============================================================================
!+ Module procedure in "Radiation" 
!------------------------------------------------------------------------------

SUBROUTINE opt_so(prholwc  ,pdulwc  ,prhoiwc  ,pduiwc  ,                    &
                  paeq1    ,paeq2   ,paeq3    ,paeq4   , paeq5   ,          &
                  pdp      ,papra   ,psmu0    ,pqsmu0  ,                    &
                  ki1sd    ,ki1ed   ,ki3sd    ,ki3ed   ,                    &
                  kspec    ,ki1sc   ,ki1ec    ,ki3sc   ,ki3ec    ,          &
                  ldebug   ,jindex  ,                                       &
                  podac    ,podaf   ,podsc    ,podsf   , pbsfc   ,pbsff   , &
                  pusfc    ,pusff                                           )

!------------------------------------------------------------------------------
!
! Description:
!
!   The module procedure opt_so calculates the optical properties of the 
!   non-gaseous constituents for one spectral interval in the solar part 
!   of the spectrum.
!   Purpose is the calculation of (absorption and scattering) optical
!   depth and backward scattered fraction for diffuse and upward scattered 
!   fraction for direct solar radiation (excluding the contribution by 
!   gaseous constituents).
!
! Method:
!
! - determination of optical properies (i.e. extinction coefficient,
!   single scattering albedo and asymetry factor of the phase function)
!   using approximate relations for Rayleigh effects, cloud water,
!   cloud ice and a combination of five type of aerosols
!
! - calculation of optical depth (scattering and absorption), back-
!   scattered and upscattered fraction of radiation suitable for use
!   in an implicit delta-two-stream scheme
!     
!------------------------------------------------------------------------------

! Subroutine arguments:
! --------------------

! Input data
! ----------
  INTEGER (KIND=iintegers), INTENT (IN) ::  &
     ki1sd,       & ! start index for first  array dimension
     ki1ed,       & ! end   index for first  array dimension
     ki3sd,       & ! start index for third  array dimension
     ki3ed,       & ! end   index for third  array dimension

   ! and the same for the computations
     ki1sc,       & ! start index for first  array computation
     ki1ec,       & ! end   index for first  array computation
     ki3sc,       & ! start index for third  array computation
     ki3ec,       & ! end   index for third  array computation
     kspec,       & ! selected spectral interval
     jindex         ! index of j-loop

  LOGICAL                 , INTENT (IN) ::  &
     ldebug         ! debug control switch       

  REAL    (KIND=dp)       , INTENT (IN) ::  &
   !  Liquid and ice water density and content within for the cloudy
   !  part of each layer
     prholwc(ki1sd:ki1ed,            ki3sd:ki3ed), &
     prhoiwc(ki1sd:ki1ed,            ki3sd:ki3ed), &
     pdulwc (ki1sd:ki1ed,            ki3sd:ki3ed), &
     pduiwc (ki1sd:ki1ed,            ki3sd:ki3ed), &

   !  Aerosole contents (optical depths at 0.55 micrometer) for 5 types
     paeq1  (ki1sd:ki1ed,            ki3sd:ki3ed), &
     paeq2  (ki1sd:ki1ed,            ki3sd:ki3ed), &
     paeq3  (ki1sd:ki1ed,            ki3sd:ki3ed), &
     paeq4  (ki1sd:ki1ed,            ki3sd:ki3ed), &
     paeq5  (ki1sd:ki1ed,            ki3sd:ki3ed), &

   !  pressure thickness of layers 
     pdp    (ki1sd:ki1ed,            ki3sd:ki3ed), &

   !  zenith angle and it's inverse
     psmu0  (ki1sd:ki1ed)                        , &
     pqsmu0 (ki1sd:ki1ed)             

  REAL    (KIND=dp)       , INTENT (INOUT) ::      &
   ! mean layer pressure (TOA on input)
     papra  (ki1sd:ki1ed)                            

! Output data
! -----------
  REAL    (KIND=dp)       , INTENT (OUT) ::  &
     podac (ki1sd:ki1ed,            ki3sd:ki3ed), & ! absorption optical depth
     podaf (ki1sd:ki1ed,            ki3sd:ki3ed), & ! in cloudy and free part
     podsc (ki1sd:ki1ed,            ki3sd:ki3ed), & ! scattering optical depth
     podsf (ki1sd:ki1ed,            ki3sd:ki3ed), & ! in cloudy and free part
     pbsfc (ki1sd:ki1ed,            ki3sd:ki3ed), & ! backscattering fraction 
     pbsff (ki1sd:ki1ed,            ki3sd:ki3ed), & ! in cloudy and free part
     pusfc (ki1sd:ki1ed,            ki3sd:ki3ed), & ! upward scattered fraction
     pusff (ki1sd:ki1ed,            ki3sd:ki3ed)    ! in cloudy and free part

! Local parameters: 
! ----------------
  REAL    (KIND=dp)       , PARAMETER ::  &
     z1dg   = 1.0_dp/9.80665_dp, & ! 1./g
     z1d8   = 0.125_dp         , & ! 1./8 
     zepopd = 1.0E-6_dp        , & ! Security constant for optical depth
     zepssa = 1.0E-6_dp            ! Security constant for single scattering albedo

! Local scalars:
! -------------
  INTEGER (KIND=iintegers) ::  &
    j1,j2,j3,              & ! loop indices over spatial dimensions
    ja      ,              & ! local loop index
    isp                      ! (=kspec, but shorter for notation purposes)

  REAL    (KIND=dp)        ::  &
    ! individual optical properties of liquid water and ice 
    z_lwe, z_iwe,          & ! extinction coefficient
    z_lww, z_iww,          & ! single scattering coefficient
    z_lwg, z_iwg,          & ! asymetry factor
    z_lwf, z_iwf,          & ! forward scattered fraction 
    zzg
 
! Local (automatic) arrays:
! ------------------------
!RUS_CHANGE/REMOVE/WKARR
!#!    optical properties (absorption, scattering, back- and upscatter fraction)
!#!    for liquid water, ice and total aerosole
!#!    for Rayleigh scattering, only the optical depth is stored as array, since
!#!    back- and upscatter fractions are constant (=0.5)
!#
!#  REAL    (KIND=dp)        ::  &
!#     zlwoda (ki1sd:ki1ed)            , & !
!#     zlwods (ki1sd:ki1ed)            , & ! 
!#     zlwb0  (ki1sd:ki1ed)            , & ! 
!#     zlwb   (ki1sd:ki1ed)            , & ! 
!#     ziwoda (ki1sd:ki1ed)            , & ! 
!#     ziwods (ki1sd:ki1ed)            , & ! 
!#     ziwb0  (ki1sd:ki1ed)            , & ! 
!#     ziwb   (ki1sd:ki1ed)            , & ! 
!#     zaeoda (ki1sd:ki1ed)            , & ! 
!#     zaeods (ki1sd:ki1ed)            , & ! 
!#     zaeb0  (ki1sd:ki1ed)            , & ! 
!#     zaeb   (ki1sd:ki1ed)            , & ! 
!#     zraods (ki1sd:ki1ed)                ! 
 
!- End of header
!==============================================================================

!------------------------------------------------------------------------------
! Start GPU data region
!------------------------------------------------------------------------------

  !$acc data &
  !---- Argument arrays - intent(in)
  !$acc present ( prholwc,pdulwc,prhoiwc,pduiwc,paeq1,paeq2,paeq3,paeq4 ) &
  !$acc present ( paeq5,pdp,psmu0,pqsmu0                                ) &
  !---- Argument arrays - intent(inout)
  !$acc present ( papra                                                 ) &
  !---- Argument arrays - intent(out)
  !$acc present ( podac,podaf,podsc,podsf,pbsfc,pbsff,pusfc,pusff       ) &
  !---- Data module arrays
  !$acc present ( zaeg,zaef,zlwg,zlww,zlwe,zlwemn,zlwemx,ziwg,ziww,ziwe ) &
  !$acc present ( ziwemn,ziwemx,zaea,zaes                               ) &
  !---- Local automatic arrays
  !$acc present ( zlwoda,zlwods,zlwb0,zlwb,ziwoda,ziwods,ziwb0,ziwb     ) &
  !$acc present ( zaeoda,zaeods,zaeb0,zaeb,zraods                       )

!------------------------------------------------------------------------------
! Begin Subroutine opt_so              
!------------------------------------------------------------------------------

  isp      = kspec
!XL_TODO/GPU_WRITE
#ifndef _OPENACC
  IF (ldebug .AND. j2b==jindex) THEN
    print *,' **** opt-so   start **********************'
    print *,' **** debug point : ',j1b,j2b
    print *,' **** interval    : ',isp    
  ENDIF 
#endif
 
  !$acc parallel
  !$acc loop gang vector
  DO ja=1,5
    zaef(isp,ja) = zaeg(isp,ja)**2 ! forward sc.fraction f.aerosols
  ENDDO
  !$acc end parallel
!  PRINT*,'ZAEF DEBUG OPT_SO',sum(zaef)
!  PRINT*,zaef
!XL_TODO/GPU_WRITE
#ifndef _OPENACC
  IF (ldebug) THEN
     DO ja=1,5
       print *,'ja, zaef(isp,ja): ',ja,zaef(isp,ja)
     ENDDO 
  ENDIF 
#endif

  IF (ldebug) print *,' In opt-so   vor vertical loop'
 
! Vertical loop
! ------------ 

  DO j3=ki3sc,ki3ec
 
    if (ldebug) print *,' In opt-so   j3 = ',j3  

    !     Optical properties of liquid water and ice as function of the specific
    !     liquid water and ice content
 
    !$acc parallel
    !$acc loop gang vector
    DO j1=ki1sc,ki1ec
 
      ! liquid water effects
 
      z_lwg = zlwg(1,isp) + zlwg(2,isp)*prholwc(j1,j3)
      z_lwg = MAX(0.0_dp,MIN(1.0_dp,z_lwg))
      z_lwf = z_lwg*z_lwg 
      z_lww = zlww(1,isp) + zlww(2,isp)*prholwc(j1,j3)
      z_lww = MAX(zepssa,MIN(1.0_dp-zepssa,z_lww))
      z_lwe = z1dg * (zlwe(1,isp) + zlwe(2,isp)/ &
              (zlwe(3,isp)*prholwc(j1,j3)+zlwe(4,isp)))
      z_lwe = MAX(zlwemn(isp),MIN(zlwemx(isp),z_lwe))
 
      zlwoda(j1) = z_lwe*pdulwc(j1,j3)*(1.0_dp-z_lww)
      zlwods(j1) = z_lwe*pdulwc(j1,j3)*        z_lww *(1.0_dp-z_lwf)
      zlwb0 (j1) = z1d8*(4.0_dp+z_lwg)/(1.0_dp+z_lwg) 
      zlwb  (j1) = 0.5_dp-0.75_dp*psmu0(j1)*z_lwg/(1.0_dp+z_lwg)
 
      ! ice water effects
 
      z_iwg = ziwg(1,isp) + ziwg(2,isp)* LOG(prhoiwc(j1,j3))
      z_iwg = MAX(0.0_dp,MIN(1.0_dp,z_iwg))
      z_iwf = z_iwg*z_iwg
      z_iww = ziww(1,isp) + ziww(2,isp)* LOG(prhoiwc(j1,j3))
      z_iww = MAX(zepssa,MIN(1.0_wp-zepssa,z_iww))
      z_iwe = z1dg * (ziwe(1,isp) + ziwe(2,isp)/ &
                 (ziwe(3,isp)*prhoiwc(j1,j3)+ziwe(4,isp)))
      z_iwe = MAX(ziwemn(isp),MIN(ziwemx(isp),z_iwe  ))
 
      ziwoda(j1) = z_iwe*pduiwc(j1,j3)*(1.0_dp-z_iww)
      ziwods(j1) = z_iwe*pduiwc(j1,j3)*        z_iww *(1.0_dp-z_iwf)
      ziwb0 (j1) = z1d8*(4.0_dp+z_iwg)/(1.0_dp+z_iwg)
      ziwb  (j1) = 0.5_dp-0.75_dp*psmu0(j1)*z_iwg/(1.0_dp+z_iwg)
    END DO
    !$acc end parallel

!XL_TODO/GPU_WRITE
#ifndef _OPENACC
    IF (ldebug .AND. j2b==jindex) THEN
      print *,' prholwc (j1b,j2b) :',prholwc (j1b    ,j3)   
      print *,' pdulwc  (j1b,j2b) :',pdulwc  (j1b    ,j3)
      print *,' zlwoda  (j1b,j2b) :',zlwoda  (j1b    )
      print *,' zlwods  (j1b,j2b) :',zlwods  (j1b    )
      print *,' zlwb0   (j1b,j2b) :',zlwb0   (j1b    )
      print *,' zlwb    (j1b,j2b) :',zlwb    (j1b    )
      print *,' z_lwg             :',z_lwg                
      print *,' z_lwf             :',z_lwf                
      print *,' z_lww             :',z_lww                
      print *,' z_lwe             :',z_lwe                
      print *,' prhoiwc (j1b,j2b) :',prhoiwc (j1b    ,j3)
      print *,' pduiwc  (j1b,j2b) :',pduiwc  (j1b    ,j3)
      print *,' ziwoda  (j1b,j2b) :',ziwoda  (j1b    )
      print *,' ziwods  (j1b,j2b) :',ziwods  (j1b    )
      print *,' ziwb0   (j1b,j2b) :',ziwb0   (j1b    )
      print *,' ziwb    (j1b,j2b) :',ziwb    (j1b    )
    ENDIF 
#endif

    ! Optical properties of five aerosol types combined
 
    !$acc parallel
    !$acc loop gang vector
    DO j1=ki1sc,ki1ec

      zaeoda(j1)=                                          &
        paeq1(j1,j3)*zaea(isp,1)+paeq2(j1,j3)*zaea(isp,2)+ &
        paeq3(j1,j3)*zaea(isp,3)+paeq4(j1,j3)*zaea(isp,4)+ &
        paeq5(j1,j3)*zaea(isp,5)

      zaeods(j1)=                                            &
          ( paeq1(j1,j3)*zaes(isp,1)*(1.0_dp-zaef(isp,1)) )  &
         +( paeq2(j1,j3)*zaes(isp,2)*(1.0_dp-zaef(isp,2)) )  &
         +( paeq3(j1,j3)*zaes(isp,3)*(1.0_dp-zaef(isp,3)) )  &
         +( paeq4(j1,j3)*zaes(isp,4)*(1.0_dp-zaef(isp,4)) )  &
         +( paeq5(j1,j3)*zaes(isp,5)*(1.0_dp-zaef(isp,5)) )
 
      zzg=(                                                           &
         (paeq1(j1,j3)*zaes(isp,1)*(1.0_dp-zaef(isp,1)))*zaeg(isp,1)  &
        +(paeq2(j1,j3)*zaes(isp,2)*(1.0_dp-zaef(isp,2)))*zaeg(isp,2)  &
        +(paeq3(j1,j3)*zaes(isp,3)*(1.0_dp-zaef(isp,3)))*zaeg(isp,3)  &
        +(paeq4(j1,j3)*zaes(isp,4)*(1.0_dp-zaef(isp,4)))*zaeg(isp,4)  &
        +(paeq5(j1,j3)*zaes(isp,5)*(1.0_dp-zaef(isp,5)))*zaeg(isp,5)) &
        / MAX( zaeods(j1),zepopd)

      zaeb0(j1) = z1d8*(4.0_dp+zzg)/(1.0_dp+zzg)
      zaeb (j1) = 0.5_dp-0.75_dp*psmu0(j1)*zzg/(1.0_dp+zzg)

    ENDDO
    !$acc end parallel

#ifdef COSMOART
    IF(l_cosmo_art) THEN
      IF ((lrad_dust) .AND. (.NOT.lrad_seas) .AND. (.NOT. lrad_aero)) THEN    

        !$acc parallel
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          zaeoda(j1) =   paeq1(j1,j3)*zaea(kspec,1) + tau_abs_dust(j1,j3,kspec) &
                  + paeq2(j1,j3)*zaea(kspec,2)                                  &
                  + paeq3(j1,j3)*zaea(kspec,3)                                  &
                  + paeq4(j1,j3)*zaea(kspec,4)                                  &
                  + paeq5(j1,j3)*zaea(kspec,5)

          zaeods(j1) = paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))+         &
                  tau_streu_dust(j1,j3,kspec)*(1.0_dp-(asym_ges(j1,j3,kspec)**2)) &
                + paeq2(j1,j3)*zaes(kspec,2)*(1.0_dp-zaef(kspec,2))               &
                + paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))               &
                + paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))               &
                + paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))

          zzg=( paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))*zaeg(kspec,1) +                     &
                tau_streu_dust(j1,j3,kspec)*(1.0_dp-(asym_ges(j1,j3,kspec)**2))*asym_ges(j1,j3,kspec) &
               +paeq2(j1,j3)*zaes(kspec,2)*(1.0_dp-zaef(kspec,2))*zaeg(kspec,2)                       &
               +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))*zaeg(kspec,3)                       &
               +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))*zaeg(kspec,4)                       &
               +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))*zaeg(kspec,5) )                     &
             / MAX( zaeods(j1),zepopd)
          zaeb0 (j1) = z1d8*(4.0_dp+zzg)/(1.0_dp+zzg)
      ENDDO
      !$acc end parallel

      ELSEIF ((lrad_dust) .AND. (.NOT. lrad_seas) .AND. (lrad_aero)) THEN

        !$acc parallel
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          zaeoda(j1) = paeq1(j1,j3)*zaea(kspec,1) + tau_abs_dust(j1,j3,kspec) &
                + paeq2(j1,j3)*zaea(kspec,2)                                  &
                + paeq3(j1,j3)*zaea(kspec,3) + tau_abs_aero(j1,j3,kspec)      &
                + paeq4(j1,j3)*zaea(kspec,4)                                  &
                + paeq5(j1,j3)*zaea(kspec,5)

          zaeods(j1) = paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1)) +          &
                  tau_streu_dust(j1,j3,kspec)*(1.0_dp-(asym_ges(j1,j3,kspec)**2))   &
                + paeq2(j1,j3)*zaes(kspec,2)*(1.0_dp-zaef(kspec,2))                 &
                + paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3)) +               &
                  tau_streu_aero(j1,j3,kspec)*(1.0_dp-(asym_aero(j1,j3,kspec)**2))  &
                + paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))                 &
                + paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))

          zzg= (paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))*zaeg(kspec,1) +                               &
                  tau_streu_dust(j1,j3,kspec)*(1.0_dp-(asym_ges(j1,j3,kspec)**2))*asym_ges(j1,j3,kspec)         &
                + paeq2(j1,j3)*zaes(kspec,2)*(1.0_dp-zaef(kspec,2))*zaeg(kspec,2)                               &
                + paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))*zaeg(kspec,3)  +                            &
                  tau_streu_aero(j1,j3,kspec)*(1.0_dp-(asym_aero(j1,j3,kspec)**2.0_dp))*asym_aero(j1,j3,kspec)  &
                + paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))*zaeg(kspec,4)                               &
                + paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))*zaeg(kspec,5) )                             &
                / MAX( zaeods(j1),zepopd)
          zaeb0 (j1) = z1d8*(4.0_dp+zzg)/(1.0_dp+zzg)
        ENDDO
        !$acc end parallel

      ELSEIF ((.NOT. lrad_dust) .AND. (.NOT. lrad_seas) .AND. (lrad_aero)) THEN

        !$acc parallel
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          zaeoda(j1) = paeq1(j1,j3)*zaea(kspec,1)                         &
                + paeq2(j1,j3)*zaea(kspec,2)                              &
                + paeq3(j1,j3)*zaea(kspec,3) + tau_abs_aero(j1,j3,kspec)  &
                + paeq4(j1,j3)*zaea(kspec,4)                              &
                + paeq5(j1,j3)*zaea(kspec,5)

          zaeods(j1) = paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))                &
                 +paeq2(j1,j3)*zaes(kspec,2)*(1.0_dp-zaef(kspec,2))                     &
                 +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))+                    &
                  tau_streu_aero(j1,j3,kspec)*(1.0_dp-(asym_aero(j1,j3,kspec)**2.0_dp)) &
                 +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))                     &
                 +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))

          zzg=( paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))*zaeg(kspec,1)                               &
               +paeq2(j1,j3)*zaes(kspec,2)*(1.0_dp-zaef(kspec,2))*zaeg(kspec,2)                               &
               +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))*zaeg(kspec,3)  +                            &
                tau_streu_aero(j1,j3,kspec)*(1.0_dp-(asym_aero(j1,j3,kspec)**2.0_dp))*asym_aero(j1,j3,kspec)  &
               +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))*zaeg(kspec,4)                               &
               +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))*zaeg(kspec,5) )                             &
                   / MAX( zaeods(j1),zepopd)
          zaeb0 (j1) = z1d8*(4.0_dp+zzg)/(1.0_dp+zzg)
        ENDDO
        !$acc end parallel
   
      ELSEIF ((lrad_dust) .AND. (lrad_seas) .AND. (.NOT. lrad_aero)) THEN   

        !$acc parallel
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          zaeoda(j1) = paeq1(j1,j3)*zaea(kspec,1) + tau_abs_dust(j1,j3,kspec) &
                  + tau_abs_seas(j1,j3,kspec)                                 &
                  + paeq3(j1,j3)*zaea(kspec,3)                                &
                  + paeq4(j1,j3)*zaea(kspec,4)                                &
                  + paeq5(j1,j3)*zaea(kspec,5)

          zaeods(j1) = paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))+           &
                  tau_streu_dust(j1,j3,kspec)*(1.0_dp-(asym_ges(j1,j3,kspec)**2))   &
                + tau_streu_seas(j1,j3,kspec)*(1.0_dp-(asym_seas(j1,j3,kspec)**2))  &
                + paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))                 &
                + paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))                 &
                + paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))

          zzg=( paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))*zaeg(kspec,1) +                       &
                tau_streu_dust(j1,j3,kspec)*(1.0_dp-(asym_ges(j1,j3,kspec)**2))*asym_ges(j1,j3,kspec)   &
               +tau_streu_seas(j1,j3,kspec)*(1.0_dp-(asym_seas(j1,j3,kspec)**2))*asym_seas(j1,j3,kspec) &
               +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))*zaeg(kspec,3)                         &
               +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))*zaeg(kspec,4)                         &
               +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))*zaeg(kspec,5) )                       &
             / MAX( zaeods(j1),zepopd)
          zaeb0 (j1) = z1d8*(4.0_dp+zzg)/(1.0_dp+zzg)
        ENDDO
        !$acc end parallel

      ELSEIF ((.NOT.lrad_dust) .AND. (lrad_seas) .AND. (.NOT. lrad_aero)) THEN

        !$acc parallel
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          zaeoda(j1) = paeq1(j1,j3)*zaea(kspec,1) &
                 + tau_abs_seas(j1,j3,kspec)      &
                 + paeq3(j1,j3)*zaea(kspec,3)     &
                 + paeq4(j1,j3)*zaea(kspec,4)     &
                 + paeq5(j1,j3)*zaea(kspec,5)

          zaeods(j1) = paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))              &
                  + tau_streu_seas(j1,j3,kspec)*(1.0_dp-(asym_seas(j1,j3,kspec)**2))  &
                  + paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))                 &
                  + paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))                 &
                  + paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))

          zzg=   ( paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))*zaeg(kspec,1)                          &
                  +tau_streu_seas(j1,j3,kspec)*(1.0_dp-(asym_seas(j1,j3,kspec)**2))*asym_seas(j1,j3,kspec)  &
                  +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))*zaeg(kspec,3)                          &
                  +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))*zaeg(kspec,4)                          &
                  +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))*zaeg(kspec,5) )                        &
                  / MAX( zaeods(j1),zepopd)
          zaeb0 (j1) = z1d8*(4.0_dp+zzg)/(1.0_dp+zzg)
        ENDDO
        !$acc end parallel

      ELSEIF ((lrad_dust) .AND. (lrad_seas) .AND. (lrad_aero)) THEN

        !$acc parallel
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          zaeoda(j1) = paeq1(j1,j3)*zaea(kspec,1) + tau_abs_dust(j1,j3,kspec) &
                + tau_abs_seas(j1,j3,kspec)                                   &
                + paeq3(j1,j3)*zaea(kspec,3) + tau_abs_aero(j1,j3,kspec)      &
                + paeq4(j1,j3)*zaea(kspec,4)                                  &
                + paeq5(j1,j3)*zaea(kspec,5)

          zaeods(j1) = paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1)) +          &
                  tau_streu_dust(j1,j3,kspec)*(1.0_dp-(asym_ges(j1,j3,kspec)**2))   &
                 +tau_streu_seas(j1,j3,kspec)*(1.0_dp-(asym_seas(j1,j3,kspec)**2))  &
                 +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3)) +               &
                  tau_streu_aero(j1,j3,kspec)*(1.0_dp-(asym_aero(j1,j3,kspec)**2))  &
                 +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))                 &
                 +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))

          zzg= ( paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))*zaeg(kspec,1) +                              &
                  tau_streu_dust(j1,j3,kspec)*(1.0_dp-(asym_ges(j1,j3,kspec)**2))*asym_ges(j1,j3,kspec)         &
                 +tau_streu_seas(j1,j3,kspec)*(1.0_dp-(asym_seas(j1,j3,kspec)**2))*asym_seas(j1,j3,kspec)       &
                 +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))*zaeg(kspec,3)  +                            &
                  tau_streu_aero(j1,j3,kspec)*(1.0_dp-(asym_aero(j1,j3,kspec)**2.0_dp))*asym_aero(j1,j3,kspec)  &
                 +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))*zaeg(kspec,4)                               &
                 +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))*zaeg(kspec,5) )                             &
                / MAX( zaeods(j1),zepopd)
          zaeb0 (j1) = z1d8*(4.0_dp+zzg)/(1.0_dp+zzg)
        ENDDO
        !$acc end parallel

      ELSEIF ((.NOT. lrad_dust) .AND. (lrad_seas) .AND. (lrad_aero)) THEN

        !$acc parallel
        !$acc loop gang vector
        DO j1 = ki1sc, ki1ec
          zaeoda(j1) = paeq1(j1,j3)*zaea(kspec,1)                         &
                + tau_abs_seas(j1,j3,kspec)                               &
                + paeq3(j1,j3)*zaea(kspec,3) + tau_abs_aero(j1,j3,kspec)  &
                + paeq4(j1,j3)*zaea(kspec,4)                              &
                + paeq5(j1,j3)*zaea(kspec,5)

          zaeods(j1) = paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))                &
                 +tau_streu_seas(j1,j3,kspec)*(1.0_dp-(asym_seas(j1,j3,kspec)**2.0_dp)) &
                 +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3)) +                   &
                  tau_streu_aero(j1,j3,kspec)*(1.0_dp-(asym_aero(j1,j3,kspec)**2.0_dp)) &
                 +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))                     &
                 +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))

          zzg=( paeq1(j1,j3)*zaes(kspec,1)*(1.0_dp-zaef(kspec,1))*zaeg(kspec,1)                               &
               +tau_streu_seas(j1,j3,kspec)*(1.0_dp-(asym_seas(j1,j3,kspec)**2.0_dp))*asym_seas(j1,j3,kspec)  &   
               +paeq3(j1,j3)*zaes(kspec,3)*(1.0_dp-zaef(kspec,3))*zaeg(kspec,3) +                             &
                tau_streu_aero(j1,j3,kspec)*(1.0_dp-(asym_aero(j1,j3,kspec)**2.0_dp))*asym_aero(j1,j3,kspec)  &
               +paeq4(j1,j3)*zaes(kspec,4)*(1.0_dp-zaef(kspec,4))*zaeg(kspec,4)                               &
               +paeq5(j1,j3)*zaes(kspec,5)*(1.0_dp-zaef(kspec,5))*zaeg(kspec,5) )                             &
                   / MAX( zaeods(j1),zepopd)
          zaeb0 (j1) = z1d8*(4.0_dp+zzg)/(1.0_dp+zzg)
        ENDDO
        !$acc end parallel
   
      ENDIF
    ENDIF
#endif

!XL_TODO/GPU_WRITE
#ifndef _OPENACC
    IF (ldebug .AND. j2b==jindex) THEN
      print *,' zaeoda  (j1b,j2b) :',zaeoda  (j1b)
      print *,' zaeods  (j1b,j2b) :',zaeods  (j1b)
      print *,' zaeb0   (j1b,j2b) :',zaeb0   (j1b)
      print *,' zaeb    (j1b,j2b) :',zaeb    (j1b)
    ENDIF   
#endif

    ! Optical thickness for Rayleigh scattering

    !$acc parallel
    !$acc loop gang vector
    DO j1 = ki1sc, ki1ec
      zraods(j1) = zrsc(isp) * pdp(j1,j3) / (1.0_dp+ zrsc(isp) * &
             (papra(j1) + 0.5_dp* pdp(j1,j3) * pqsmu0(j1)))
      papra (j1) = papra(j1) + pdp(j1,j3) * pqsmu0(j1)
    ENDDO
    !$acc end parallel

!XL_TODO/GPU_WRITE
#ifndef _OPENACC
    IF (ldebug .AND. j2b==jindex) THEN
      !  print *,' Rayleigh coefficient:',zrsc(isp)
      !  print *,' Papra  (j1b,j2b)    :',papra   (j1b)
      !  print *,' Pqsmu0 (j1b,j2b)    :',pqsmu0  (j1b)
      !  print *,' Pdp    (j1b,j2b)    :',pdp     (j1b,j3)
         print *,' zraods (j1b,j2b)    :',zraods  (j1b)
    ENDIF
#endif

    !-----------------------------------------------------------------------
 
    ! Linear combination of individual contributions 
 

    ! a) cloud free part of layer

    !$acc parallel
    !$acc loop gang vector
    DO j1 = ki1sc, ki1ec
      podaf(j1,j3) = MAX ( zaeoda(j1)             , zepopd)
      podsf(j1,j3) = MAX ( zaeods(j1) + zraods(j1), zepopd)
      podsf(j1,j3) = MIN ( podsf (j1,j3),                          &
              (1.0_dp-zepssa) * (podaf(j1,j3) + podsf(j1,j3)) )
      pbsff(j1,j3) = (zaeb0(j1) * zaeods(j1)                       &
                      + 0.5_dp * zraods(j1)) / podsf(j1,j3)
      pusff(j1,j3) = (zaeb (j1) * zaeods(j1)                       &
                      + 0.5_dp * zraods(j1)) / podsf(j1,j3)
    ENDDO
    !$acc end parallel
 
!-------------------------------------------------------------------------------
    ! b) cloudy part of layer

    !$acc parallel
    !$acc loop gang vector
    DO j1 = ki1sc, ki1ec
      podac(j1,j3) = zlwoda(j1) + ziwoda(j1) + zaeoda(j1)
      podsc(j1,j3) = zlwods(j1) + ziwods(j1)                          &
                                + zaeods(j1) + zraods(j1)
      podac(j1,j3) = MAX( podac(j1,j3), zepopd)
      podsc(j1,j3) = MAX( podsc(j1,j3), zepopd)
      podsc(j1,j3) = MIN( podsc(j1,j3),                               &
                (1.0_dp-zepssa) * (podac(j1,j3) + podsc(j1,j3)))

      pbsfc(j1,j3) =(zlwb0(j1) * zlwods(j1)                           &
                   + ziwb0(j1) * ziwods(j1) + zaeb0(j1) * zaeods(j1)  &
                   + 0.5_dp * zraods(j1)) / podsc(j1,j3)
      pusfc(j1,j3) =(zlwb (j1) * zlwods(j1)                           &
                   + ziwb (j1) * ziwods(j1) + zaeb (j1) * zaeods(j1)  &
                   + 0.5_dp * zraods(j1)) / podsc(j1,j3)
    ENDDO
    !$acc end parallel
 
  ! End of vertical loop
  END DO  
 
!XL_TODO/GPU_WRITE
#ifndef _OPENACC
  IF (ldebug .AND. j2b==jindex) THEN
      print *,' podaf   (j1b,j2b,1) :',podaf   (j1b,1)
      print *,' podsf   (j1b,j2b,1) :',podsf   (j1b,1)
      print *,' pbsff   (j1b,j2b,1) :',pbsff   (j1b,1)
      print *,' pusff   (j1b,j2b,1) :',pusff   (j1b,1)
      print *,' podac   (j1b,j2b,1) :',podac   (j1b,1)
      print *,' podsc   (j1b,j2b,1) :',podsc   (j1b,1)
      print *,' pbsfc   (j1b,j2b,1) :',pbsfc   (j1b,1)
      print *,' pusfc   (j1b,j2b,1) :',pusfc   (j1b,1)
      print *,' -------------------------------------------------'
  ENDIF
#endif

!------------------------------------------------------------------------------
! End of the subroutine
!------------------------------------------------------------------------------

  !$acc end data

END SUBROUTINE opt_so

!==============================================================================
!==============================================================================
!+ Module procedure in "Radiation" 
!------------------------------------------------------------------------------

SUBROUTINE radiation_rg_wkarr_alloc(ki1ed,ki3ed,istat)
  IMPLICIT NONE
  INTEGER(KIND=iintegers), INTENT(IN)  :: ki1ed,ki3ed
  INTEGER(KIND=iintegers), INTENT(OUT) :: istat
  INTEGER(KIND=iintegers) :: ki1sd, ki3sd

  istat = 0
  ki1sd = 1
  ki3sd = 1

  !fesft_sp
  IF (wp == sp) THEN
  ALLOCATE( pti_dp       (ki1sd:ki1ed,ki3sd:ki3ed+1), STAT=istat)
  ALLOCATE( pdp_dp       (ki1sd:ki1ed,ki3sd:ki3ed)  , STAT=istat)
  ALLOCATE( pclc_dp      (ki1sd:ki1ed,ki3sd:ki3ed)  , STAT=istat)
  ALLOCATE( pwv_dp       (ki1sd:ki1ed,ki3sd:ki3ed)  , STAT=istat)
  ALLOCATE( psw_dp       (ki1sd:ki1ed,ki3sd:ki3ed)  , STAT=istat)
  ALLOCATE( pqlwc_dp     (ki1sd:ki1ed,ki3sd:ki3ed)  , STAT=istat)
  ALLOCATE( pqiwc_dp     (ki1sd:ki1ed,ki3sd:ki3ed)  , STAT=istat)
  ALLOCATE( pduco2_dp    (ki1sd:ki1ed,ki3sd:ki3ed)  , STAT=istat)
  ALLOCATE( pduo3_dp     (ki1sd:ki1ed,ki3sd:ki3ed)  , STAT=istat)
  ALLOCATE( paeq1_dp     (ki1sd:ki1ed,ki3sd:ki3ed)  , STAT=istat)
  ALLOCATE( paeq2_dp     (ki1sd:ki1ed,ki3sd:ki3ed)  , STAT=istat)
  ALLOCATE( paeq3_dp     (ki1sd:ki1ed,ki3sd:ki3ed)  , STAT=istat)
  ALLOCATE( paeq4_dp     (ki1sd:ki1ed,ki3sd:ki3ed)  , STAT=istat)
  ALLOCATE( paeq5_dp     (ki1sd:ki1ed,ki3sd:ki3ed)  , STAT=istat)
  ALLOCATE( psmu0_dp     (ki1sd:ki1ed)              , STAT=istat)
  ALLOCATE( palth_dp     (ki1sd:ki1ed)              , STAT=istat)
  ALLOCATE( palso_dp     (ki1sd:ki1ed)              , STAT=istat)
  ALLOCATE( pskyview_dp  (ki1sd:ki1ed)              , STAT=istat)
  ALLOCATE( pfcor_dp     (ki1sd:ki1ed)              , STAT=istat)
  ALLOCATE( papre_dp     (ki1sd:ki1ed)              , STAT=istat)
  ALLOCATE( pflt_dp      (ki1sd:ki1ed,ki3sd:ki3ed+1), STAT=istat)
  ALLOCATE( pfls_dp      (ki1sd:ki1ed,ki3sd:ki3ed+1), STAT=istat)
  ALLOCATE( pflt_s_dp    (ki1sd:ki1ed)              , STAT=istat)
  ALLOCATE( pfls_s_dp    (ki1sd:ki1ed)              , STAT=istat)
  ALLOCATE( pflsdir_dp   (ki1sd:ki1ed,ki3sd:ki3ed+1), STAT=istat)
  ALLOCATE( pfltd_dp     (ki1sd:ki1ed)              , STAT=istat)
  ALLOCATE( pfltu_dp     (ki1sd:ki1ed)              , STAT=istat)
  ALLOCATE( pflsd_dp     (ki1sd:ki1ed)              , STAT=istat)
  ALLOCATE( pflsu_dp     (ki1sd:ki1ed)              , STAT=istat)
  ALLOCATE( pflsp_dp     (ki1sd:ki1ed)              , STAT=istat)
  ALLOCATE( pflpar_dp    (ki1sd:ki1ed)              , STAT=istat)
  ALLOCATE( pflsu_par_dp (ki1sd:ki1ed)              , STAT=istat)
  ALLOCATE( pflsd_par_dp (ki1sd:ki1ed)              , STAT=istat)
  ALLOCATE( pflsp_par_dp (ki1sd:ki1ed)              , STAT=istat)
  !$acc enter data &
  !$acc create ( pti_dp,pdp_dp,pclc_dp,pwv_dp,psw_dp,pqlwc_dp   ) &
  !$acc create ( pqiwc_dp,pduco2_dp,pduo3_dp,paeq1_dp,paeq2_dp  ) &
  !$acc create ( paeq3_dp,paeq4_dp,paeq5_dp,psmu0_dp,palth_dp   ) &
  !$acc create ( palso_dp,pskyview_dp,pfcor_dp,papre_dp,pflt_dp ) &
  !$acc create ( pfls_dp,pflt_s_dp,pfls_s_dp,pflsdir_dp         ) &
  !$acc create ( pfltd_dp,pfltu_dp,pflsd_dp,pflsu_dp,pflsp_dp   ) &
  !$acc create ( pflpar_dp,pflsu_par_dp,pflsd_par_dp            ) &
  !$acc create ( pflsp_par_dp                                   )
  ENDIF

  !fesft_dp
  ALLOCATE( zketyp   (jpther)                    , STAT=istat )
  ALLOCATE( ztetyp   (jpther)                    , STAT=istat )
  ALLOCATE( zflux    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( zflux_c  (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( zfluxi   (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( zfluxu   (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( zfluxu_c (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( zfluxui  (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( zfluxd   (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( zfluxd_c (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( zfluxdi  (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( zfgas    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( zfgasu   (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( zfgasd   (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( pbbr     (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( pflpt    (ki1sd:ki1ed)               , STAT=istat )
  ALLOCATE( palp     (ki1sd:ki1ed)               , STAT=istat )
  ALLOCATE( pqsmu0   (ki1sd:ki1ed)               , STAT=istat )
  ALLOCATE( palogt   (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( palogp   (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( papra    (ki1sd:ki1ed)               , STAT=istat )
  ALLOCATE( pduh2oc  (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( pduh2of  (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( pdulwc   (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( pduiwc   (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( prholwc  (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( prhoiwc  (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( zduetpc  (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( zduetpf  (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( ztm      (ki1sd:ki1ed)               , STAT=istat )
  ALLOCATE( zzwv     (ki1sd:ki1ed)               , STAT=istat )
  ALLOCATE( zcpo     (ki1sd:ki1ed)               , STAT=istat )
  ALLOCATE( zcpn     (ki1sd:ki1ed)               , STAT=istat )
  ALLOCATE( zcmo     (ki1sd:ki1ed)               , STAT=istat )
  ALLOCATE( zcmn     (ki1sd:ki1ed)               , STAT=istat )
  ALLOCATE( podac    (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( podaf    (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( podsc    (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( podsf    (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( pbsfc    (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( pbsff    (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( pusfc    (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( pusff    (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( pca1     (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( pcb1     (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( pcc1     (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( pcd1     (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( pca2     (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( pcb2     (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( pcc2     (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( pcd2     (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
  ALLOCATE( pflfd    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( pflfu    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( pflfp    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( pflcd    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( pflcu    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  ALLOCATE( pflcp    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
  !$acc enter data &
  !$acc create  ( zketyp,ztetyp,zflux,zflux_c,zfluxi,zfluxu     ) &
  !$acc create  ( zfluxu_c,zfluxui,zfluxd,zfluxd_c,zfluxdi      ) &
  !$acc create  ( zfgas,zfgasu,zfgasd,pbbr,pflpt,palp,pqsmu0    ) &
  !$acc create  ( palogt,palogp,papra,pduh2oc,pduh2of,pdulwc    ) &
  !$acc create  ( pduiwc,prholwc,prhoiwc,zduetpc,zduetpf,ztm    ) &
  !$acc create  ( zzwv,zcpo,zcpn,zcmo,zcmn,podac,podaf,podsc    ) &
  !$acc create  ( podsf,pbsfc,pbsff,pusfc,pusff,pca1,pcb1,pcc1  ) &
  !$acc create  ( pcd1,pca2,pcb2,pcc2,pcd2,pflfd,pflfu,pflfp    ) &
  !$acc create  ( pflcd,pflcu,pflcp                             )

  !inv_th/so
  ALLOCATE( pa1c (ki1sd:ki1ed)            , STAT=istat)
  ALLOCATE( pa1f (ki1sd:ki1ed)            , STAT=istat)
  ALLOCATE( pa2c (ki1sd:ki1ed)            , STAT=istat)
  ALLOCATE( pa2f (ki1sd:ki1ed)            , STAT=istat)
  ALLOCATE( pa3c (ki1sd:ki1ed)            , STAT=istat)
  ALLOCATE( pa3f (ki1sd:ki1ed)            , STAT=istat)
  ALLOCATE( pa4c (ki1sd:ki1ed)            , STAT=istat)
  ALLOCATE( pa4f (ki1sd:ki1ed)            , STAT=istat)
  ALLOCATE( pa5c (ki1sd:ki1ed)            , STAT=istat)
  ALLOCATE( pa5f (ki1sd:ki1ed)            , STAT=istat)
  ALLOCATE( ztu1 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
  ALLOCATE( ztu2 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
  ALLOCATE( ztu3 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
  ALLOCATE( ztu4 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
  ALLOCATE( ztu5 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
  print *, "@@@@@ki1sd: ", ki1sd, " | ki1ed: ", ki1ed
  print *, "@@@@@ki3sd: " , ki3sd, " | ki3ed: ", ki3ed
  ALLOCATE( ztu6 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
  ALLOCATE( ztu7 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
  ALLOCATE( ztu8 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
  ALLOCATE( ztu9 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
  !$acc enter data &
  !$acc create  ( pa1c,pa1f,pa2c,pa2f,pa3c,pa4f,pa4c,pa5f,pa5c,pa3f   ) &
  !$acc create  ( ztu1,ztu2,ztu3,ztu4,ztu5,ztu6,ztu7,ztu8,ztu9        )
 
  !opt_th/so
  ALLOCATE( zlwoda (ki1sd:ki1ed), STAT=istat )
  ALLOCATE( zlwods (ki1sd:ki1ed), STAT=istat )
  ALLOCATE( zlwb0  (ki1sd:ki1ed), STAT=istat )
  ALLOCATE( zlwb   (ki1sd:ki1ed), STAT=istat )
  ALLOCATE( ziwoda (ki1sd:ki1ed), STAT=istat )
  ALLOCATE( ziwods (ki1sd:ki1ed), STAT=istat )
  ALLOCATE( ziwb0  (ki1sd:ki1ed), STAT=istat )
  ALLOCATE( ziwb   (ki1sd:ki1ed), STAT=istat )
  ALLOCATE( zaeoda (ki1sd:ki1ed), STAT=istat )
  ALLOCATE( zaeods (ki1sd:ki1ed), STAT=istat )
  ALLOCATE( zaeb0  (ki1sd:ki1ed), STAT=istat )
  ALLOCATE( zaeb   (ki1sd:ki1ed), STAT=istat )
  ALLOCATE( zraods (ki1sd:ki1ed), STAT=istat )
  !$acc enter data &
  !$acc create ( zlwoda,zlwods,zlwb0,zlwb,ziwoda,ziwods,ziwb0,ziwb     ) &
  !$acc create ( zaeoda,zaeods,zaeb0,zaeb,zraods                       )

END SUBROUTINE radiation_rg_wkarr_alloc

!==============================================================================
!==============================================================================
!+ Module procedure in "Radiation" 
!------------------------------------------------------------------------------

SUBROUTINE radiation_rg_wkarr_dealloc(istat)
  IMPLICIT NONE
  INTEGER(KIND=iintegers), INTENT(OUT) :: istat

  istat = 0

  !fesft_sp
  IF (wp == sp) THEN
  !$acc exit data &
  !$acc delete ( pti_dp,pdp_dp,pclc_dp,pwv_dp,psw_dp,pqlwc_dp   ) &
  !$acc delete ( pqiwc_dp,pduco2_dp,pduo3_dp,paeq1_dp,paeq2_dp  ) &
  !$acc delete ( paeq3_dp,paeq4_dp,paeq5_dp,psmu0_dp,palth_dp   ) &
  !$acc delete ( palso_dp,pskyview_dp,pfcor_dp,papre_dp,pflt_dp ) &
  !$acc delete ( pfls_dp,pflt_s_dp,pfls_s_dp,pflsdir_dp         ) &
  !$acc delete ( pfltd_dp,pfltu_dp,pflsd_dp,pflsu_dp,pflsp_dp   ) &
  !$acc delete ( pflpar_dp,pflsu_par_dp,pflsd_par_dp            ) &
  !$acc delete ( pflsp_par_dp                                   )
  DEALLOCATE( pti_dp       , STAT=istat)
  DEALLOCATE( pdp_dp       , STAT=istat)
  DEALLOCATE( pclc_dp      , STAT=istat)
  DEALLOCATE( pwv_dp       , STAT=istat)
  DEALLOCATE( psw_dp       , STAT=istat)
  DEALLOCATE( pqlwc_dp     , STAT=istat)
  DEALLOCATE( pqiwc_dp     , STAT=istat)
  DEALLOCATE( pduco2_dp    , STAT=istat)
  DEALLOCATE( pduo3_dp     , STAT=istat)
  DEALLOCATE( paeq1_dp     , STAT=istat)
  DEALLOCATE( paeq2_dp     , STAT=istat)
  DEALLOCATE( paeq3_dp     , STAT=istat)
  DEALLOCATE( paeq4_dp     , STAT=istat)
  DEALLOCATE( paeq5_dp     , STAT=istat)
  DEALLOCATE( psmu0_dp     , STAT=istat)
  DEALLOCATE( palth_dp     , STAT=istat)
  DEALLOCATE( palso_dp     , STAT=istat)
  DEALLOCATE( pskyview_dp  , STAT=istat)
  DEALLOCATE( pfcor_dp     , STAT=istat)
  DEALLOCATE( papre_dp     , STAT=istat)
  DEALLOCATE( pflt_dp      , STAT=istat)
  DEALLOCATE( pfls_dp      , STAT=istat)
  DEALLOCATE( pflt_s_dp    , STAT=istat)
  DEALLOCATE( pfls_s_dp    , STAT=istat)
  DEALLOCATE( pflsdir_dp   , STAT=istat)
  DEALLOCATE( pfltd_dp     , STAT=istat)
  DEALLOCATE( pfltu_dp     , STAT=istat)
  DEALLOCATE( pflsd_dp     , STAT=istat)
  DEALLOCATE( pflsu_dp     , STAT=istat)
  DEALLOCATE( pflsp_dp     , STAT=istat)
  DEALLOCATE( pflpar_dp    , STAT=istat)
  DEALLOCATE( pflsu_par_dp , STAT=istat)
  DEALLOCATE( pflsd_par_dp , STAT=istat)
  DEALLOCATE( pflsp_par_dp , STAT=istat)
  ENDIF
    
  !fesft
  !$acc exit data &
  !$acc delete ( zketyp,ztetyp,zflux,zflux_c,zfluxi,zfluxu     ) &
  !$acc delete ( zfluxu_c,zfluxui,zfluxd,zfluxd_c,zfluxdi      ) &
  !$acc delete ( zfgas,zfgasu,zfgasd,pbbr,pflpt,palp,pqsmu0    ) &
  !$acc delete ( palogt,palogp,papra,pduh2oc,pduh2of,pdulwc    ) &
  !$acc delete ( pduiwc,prholwc,prhoiwc,zduetpc,zduetpf,ztm    ) &
  !$acc delete ( zzwv,zcpo,zcpn,zcmo,zcmn,podac,podaf,podsc    ) &
  !$acc delete ( podsf,pbsfc,pbsff,pusfc,pusff,pca1,pcb1,pcc1  ) &
  !$acc delete ( pcd1,pca2,pcb2,pcc2,pcd2,pflfd,pflfu,pflfp    ) &
  !$acc delete ( pflcd,pflcu,pflcp                             )
  DEALLOCATE( zketyp   , STAT=istat )
  DEALLOCATE( ztetyp   , STAT=istat )
  DEALLOCATE( zflux    , STAT=istat )
  DEALLOCATE( zflux_c  , STAT=istat )
  DEALLOCATE( zfluxi   , STAT=istat )
  DEALLOCATE( zfluxu   , STAT=istat )
  DEALLOCATE( zfluxu_c , STAT=istat )
  DEALLOCATE( zfluxui  , STAT=istat )
  DEALLOCATE( zfluxd   , STAT=istat )
  DEALLOCATE( zfluxd_c , STAT=istat )
  DEALLOCATE( zfluxdi  , STAT=istat )
  DEALLOCATE( zfgas    , STAT=istat )
  DEALLOCATE( zfgasu   , STAT=istat )
  DEALLOCATE( zfgasd   , STAT=istat )
  DEALLOCATE( pbbr     , STAT=istat )
  DEALLOCATE( pflpt    , STAT=istat )
  DEALLOCATE( palp     , STAT=istat )
  DEALLOCATE( pqsmu0   , STAT=istat )
  DEALLOCATE( palogt   , STAT=istat )
  DEALLOCATE( palogp   , STAT=istat )
  DEALLOCATE( papra    , STAT=istat )
  DEALLOCATE( pduh2oc  , STAT=istat )
  DEALLOCATE( pduh2of  , STAT=istat )
  DEALLOCATE( pdulwc   , STAT=istat )
  DEALLOCATE( pduiwc   , STAT=istat )
  DEALLOCATE( prholwc  , STAT=istat )
  DEALLOCATE( prhoiwc  , STAT=istat )
  DEALLOCATE( zduetpc  , STAT=istat )
  DEALLOCATE( zduetpf  , STAT=istat )
  DEALLOCATE( ztm      , STAT=istat )
  DEALLOCATE( zzwv     , STAT=istat )
  DEALLOCATE( zcpo     , STAT=istat )
  DEALLOCATE( zcpn     , STAT=istat )
  DEALLOCATE( zcmo     , STAT=istat )
  DEALLOCATE( zcmn     , STAT=istat )
  DEALLOCATE( podac    , STAT=istat )
  DEALLOCATE( podaf    , STAT=istat )
  DEALLOCATE( podsc    , STAT=istat )
  DEALLOCATE( podsf    , STAT=istat )
  DEALLOCATE( pbsfc    , STAT=istat )
  DEALLOCATE( pbsff    , STAT=istat )
  DEALLOCATE( pusfc    , STAT=istat )
  DEALLOCATE( pusff    , STAT=istat )
  DEALLOCATE( pca1     , STAT=istat )
  DEALLOCATE( pcb1     , STAT=istat )
  DEALLOCATE( pcc1     , STAT=istat )
  DEALLOCATE( pcd1     , STAT=istat )
  DEALLOCATE( pca2     , STAT=istat )
  DEALLOCATE( pcb2     , STAT=istat )
  DEALLOCATE( pcc2     , STAT=istat )
  DEALLOCATE( pcd2     , STAT=istat )
  DEALLOCATE( pflfd    , STAT=istat )
  DEALLOCATE( pflfu    , STAT=istat )
  DEALLOCATE( pflfp    , STAT=istat )
  DEALLOCATE( pflcd    , STAT=istat )
  DEALLOCATE( pflcu    , STAT=istat )
  DEALLOCATE( pflcp    , STAT=istat )

  !inv_th/so
  !$acc exit data &
  !$acc delete ( pa1c,pa1f,pa2c,pa2f,pa3c,pa4f,pa4c,pa5f,pa5c,pa3f   ) &
  !$acc delete ( ztu1,ztu2,ztu3,ztu4,ztu5,ztu6,ztu7,ztu8,ztu9        )
  DEALLOCATE( pa1c, STAT=istat)
  DEALLOCATE( pa1f, STAT=istat)
  DEALLOCATE( pa2c, STAT=istat)
  DEALLOCATE( pa2f, STAT=istat)
  DEALLOCATE( pa3c, STAT=istat)
  DEALLOCATE( pa3f, STAT=istat)
  DEALLOCATE( pa4c, STAT=istat)
  DEALLOCATE( pa4f, STAT=istat)
  DEALLOCATE( pa5c, STAT=istat)
  DEALLOCATE( pa5f, STAT=istat)
  DEALLOCATE( ztu1, STAT=istat)
  DEALLOCATE( ztu2, STAT=istat)
  DEALLOCATE( ztu3, STAT=istat)
  DEALLOCATE( ztu4, STAT=istat)
  DEALLOCATE( ztu5, STAT=istat)
  DEALLOCATE( ztu6, STAT=istat)
  DEALLOCATE( ztu7, STAT=istat)
  DEALLOCATE( ztu8, STAT=istat)
  DEALLOCATE( ztu9, STAT=istat)

  !opt_th/so
  !$acc exit data &
  !$acc delete ( zlwoda,zlwods,zlwb0,zlwb,ziwoda,ziwods,ziwb0,ziwb     ) &
  !$acc delete ( zaeoda,zaeods,zaeb0,zaeb,zraods                       )
  DEALLOCATE( zlwoda, STAT=istat )
  DEALLOCATE( zlwods, STAT=istat )
  DEALLOCATE( zlwb0 , STAT=istat )
  DEALLOCATE( zlwb  , STAT=istat )
  DEALLOCATE( ziwoda, STAT=istat )
  DEALLOCATE( ziwods, STAT=istat )
  DEALLOCATE( ziwb0 , STAT=istat )
  DEALLOCATE( ziwb  , STAT=istat )
  DEALLOCATE( zaeoda, STAT=istat )
  DEALLOCATE( zaeods, STAT=istat )
  DEALLOCATE( zaeb0 , STAT=istat )
  DEALLOCATE( zaeb  , STAT=istat )
  DEALLOCATE( zraods, STAT=istat )

END SUBROUTINE radiation_rg_wkarr_dealloc

!==============================================================================

END MODULE radiation_rg

!==============================================================================
