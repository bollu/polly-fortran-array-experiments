MODULE m
IMPLICIT NONE

  REAL      ::  &
    rad_csalbw(10)     !  slope of solar albedo with respect to soil water content
                       ! as a function of depth of upper soil layer
                       ! (has been computed every radiation time step before,
                       !  and is now computed in init_radiation)

  REAL    , ALLOCATABLE ::  &

  ! Input for the radiation routine fesft
  zti     (:,:) , & ! Tempeature at layer boundaries
  zclc    (:,:) , & ! Cloud cover in each layer
  zwv     (:,:) , & ! Water vapour mixing ratio
  zsw     (:,:) , & ! Saturation water vapour mixing ratio over water
  zse     (:,:) , & ! Saturation water vapour mixing ratio over ice
  zclwc   (:,:) , & ! liquid water mixing ratio
  zciwc   (:,:) , & ! ice mixing ratio
  zduco2f (:,:) , & ! CO2 content in layer
  zduo3f  (:,:) , & ! O3  content in layer
  zaeq1   (:,:) , & ! Type1-Aerosole optical depth at 0.55 micrometer
  zaeq2   (:,:) , & ! Type2  "
  zaeq3   (:,:) , & ! Type3  "
  zaeq4   (:,:) , & ! Type4  "
  zaeq5   (:,:) , & ! Type5  "
  zapre   (:)   , & ! Surface pressure
  zalso   (:)   , & ! Solar surface albedo
  zalth   (:)   , & ! Thermal surface albedo 

  ! other values for intermediate storage
  zclcmax (:,:) , & !
  zclcmin (:,:) , & !
  zclcm1  (:)   , & !

  ! Output from the radiation routine fesft
  zflt    (:,:) , & ! Thermal radiative flux at layer boundary
  zfls    (:,:) , & ! Solar radiative flux at layer boundary
  zflsdir (:,:) , & ! solar direct downward radiative flux at 
                          ! layer boundary
 !T.R. comment: for zfsldir a 1d field would be sufficent since only (:,ke1) is used

  ! surface flux of photosynthetic active radiation and components
  zflpar    (:) , & ! surface flux of photosynthetic acive radiation
  zflsp_par (:) , & ! direct component
  zflsd_par (:) , & ! diffuse downward component
  zflsu_par (:) , & ! diffuse upward   component

  ! 2D fields for averaging and distribution, if working on a coarse grid
  zzflsp_par(:) , & ! direct component
  zzflsd_par(:) , & ! diffuse downward component
  zzflsu_par(:)     ! diffuse upward component

  REAL , ALLOCATABLE ::  &

  ! corrected solar and thermal fluxes at layer boundary and components
  zfls_s    (:) , & ! Corrected solar
  zflt_s    (:) , & !         thermal
  zflsp     (:) , & ! direct component of solar radiative flux
  zflsd     (:) , & ! diffuse downward component of solar flux
  zflsu     (:) , & ! diffuse upward   component of solar flux
  zfltd     (:) , & ! diffuse downward component of thermal flux
  zfltu     (:)        ! diffuse upward   component of thermal flux

  REAL , ALLOCATABLE ::  &

  ! Other local utility arrays
  zqcfo    (:) , &
  zo3h     (:) , &
  zqofo    (:) , &
  zaeqdo   (:) , &
  zaequo   (:) , &
  zaeqlo   (:) , &
  zaeqso   (:) , &
  zaetr_top(:) , &

  ! Constants for vertical distribution of aerosole      
  ! (output from routine aerdis)
  zsign    (:) , &
  zvdaes   (:) , &
  zvdael   (:) , &
  zvdaeu   (:) , &
  zvdaed   (:) , &
  zaeadk   (:)

! in case of nradcoarse > 1: fields on coarse grid: !T.R.

  REAL , ALLOCATABLE :: &
  tg_ra     (:,:)          ! ground temperature

  REAL , ALLOCATABLE :: &

  zsohr      (:,:,:)   , & ! rate of solar heating                     ( k/s )
  zthhr      (:,:,:)   , & ! rate of thermal heating                   ( k/s )
  zsobs        (:,:)   , & ! solar radiation at ground                 ( w/m2)
  zsobt        (:,:)   , & ! solar radiation at upper boundary of atmosphere
  zthbs        (:,:)   , & ! thermal radiation at ground               ( w/m2)
  zthbt        (:,:)   , & ! thermal radiation at upper boundary of atmosphere
  zpabs        (:,:)   , & ! photosynthetic active radiation at ground ( w/m2)
  zsodwddm     (:,:)   , &

  ! 2D fields for averaging and distribution, if working on a coarse grid
  z_zzfltd     (:,:)   , & ! diffuse downward component of thermal flux
  z_zzfltu     (:,:)   , & ! diffuse upward   component of thermal flux
  z_zzflsp     (:,:)   , & ! direct component of solar radiative flux
  z_zzflsd     (:,:)   , & ! diffuse downward component of solar flux
  z_zzflsu     (:,:)   , & ! diffuse upward   component of solar flux

  ! photosynthetic active radiation at the ground ( w/m2): components
  z_zzflsp_par (:,:)   , & ! direct component
  z_zzflsd_par (:,:)   , & ! diffuse downward component
  z_zzflsu_par (:,:)       ! diffuse upward   component

!==============================================================================

!XL_TIMING/XL_TODO: eventually remove these timers
LOGICAL, PARAMETER :: lloc_timing             = .FALSE. 
INTEGER :: itim_fesft  = 20

  REAL                    ::           &
    pi              ! circle constant

! 2. physical constants and related variables
! -------------------------------------------

  REAL                ::           &
    t0_melt,      & ! melting temperature of ice
    r_d,          & ! gas constant for dry air
    r_v,          & ! gas constant for water vapor
    rdv,          & ! r_d / r_v
    o_m_rdv,      & ! 1 - r_d/r_v
    rvd_m_o,      & ! r_v/r_d - 1
    cp_d,         & ! specific heat of dry air at constant pressure
    cpdr,         & ! 1 / cp_d
    rdocp,        & ! r_d / cp_d
    gamma,        & ! 1 / (1 - rdocp)   ( = cp_d/cv_d)
    lh_v,         & ! latent heat of vapourization
    lh_f,         & ! latent heat of fusion
    lh_s,         & ! latent heat of sublimation
    lhocp,        & ! lh_v / cp_d
    rcpv,         & ! cp_d / cp_v - 1
    rcpl,         & ! cp_d / cp_l - 1
    con_m,        & ! kinematic viscosity (m2/s)
    con_h,        & ! scalar conductivity (m2/s)
    g,            & ! acceleration due to gravity
    gq,           & ! g * g
    gh,           & ! g / 2
    gr,           & ! 1 / g
    r_earth,      & ! mean radius of the earth (m)
    day_len,      & ! mean length of the day (s)
    rho_w,        & ! density of liquid water (kg/m^3)
    rho_ice,      & ! density of ice          (kg/m^3)
    K_w,          & ! dielectric constant for water
    K_ice,        & ! dielectric constant for ice
    sigma,        & ! Boltzmann-constant
    solc            ! solar constant

! 3. constants for parametrizations
! ---------------------------------

  REAL                  ::           &
    p0ref,        & ! reference pressure for Exner-function (Pa)
    b1,           & ! variables for computing the saturation vapour pressure
    b2w,          & ! over water (w) and ice (i) according to Teten's formula
    b2i,          & !               -- " --
    b3,           & !               -- " --
    b4w,          & !               -- " --
    b4i,          & !               -- " --
    b234w,        & ! b2w * (b3 - b4w)
    uc1,          & ! variable for computing the rate of cloud cover in 
    uc2,          & ! the unsaturated case
    ucl,          & !               -- " --
    aks2,         & ! variable for horizontal diffusion of second order
    aks4            ! variable for horizontal diffusion of fourth order

! 4. tuning constants for radiation, cloud physics, turbulence
! ------------------------------------------------------------

  REAL               ::           &
    qi0,          & ! cloud ice threshold for autoconversion
    qc0             ! cloud water threshold for autoconversion
  
REAL,      ALLOCATABLE       ::           &
    czmls(:),     & ! depth of the main soil layers in meters
    czhls(:)        ! depth of the half soil layers in meters


  REAL     ::  &
!   a) parameters describing the soil water budget
    cporv (10), &  !  pore volume (fraction of volume)
    cfcap (10), &  !  field capacity (fraction of volume)
    cpwp  (10), &  !  plant wilting point (fraction of volume)
    cadp  (10), &  !  air dryness point (fraction of volume)
    cik2  (10), &  !  minimum infiltration rate (kg/s*m**2)
    ckw0  (10), &  !  parameter for determination of hydr. conductivity (m/s)
    ckw1  (10), &  !  parameter for determination of hydr. conductivity (1)
    cdw0  (10), &  !  parameter for determination of hydr. diffusivity (m**2/s)
    cdw1  (10), &  !  parameter for determination of hydr. diffusivity (1)
    crock (10), &  !  rock/ice/water indicator (hydrological calculations 
                   !  only for crock=1)

!   b) parameters describing the soil heat budget
    cdz1  (10), &  !  top layer thickness (EFR-method)
    crhoc (10), &  !  soil heat capacity  (J/K*m**3)
    cala0 (10), &  !  parameters for the determination of
    cala1 (10), &  !      the soil heat conductivity (W/(K*m))
    csalb (10), &  !  solar albedo for dry soil                            
    csalbw(10), &  !  slope of solar albedo with respect to soil water content     

!   c) additional parameters for the BATS scheme (Dickinson)
    ck0di (10), &  !  (m/s)
    cbedi (10), &  !  (1)
    clgk0 (10), &  !  auxiliary variable

!   d) additional parameters for soil water content dependent freezing/melting
    csandf(10), &  !  mean fraction of sand (weight percent)
    cclayf(10)     !  mean fraction of clay (weight percent)

  INTEGER         ::           &
    nincrad,      & ! time step increment for running the radiation
    nextrad,      & ! next step for running the radiation
    nradcoarse,   & ! number of horiz. gridpoints for radiation on coarser grid
    ninctura,     & ! time step increment for running the vertical diffusion
    nincconv,     & ! time step increment for running the convection scheme 
    nincsso,      & ! time step increment for running the SSO scheme

    itype_trvg,   & ! type of vegetation transpiration parameterization
    itype_evsl,   & ! type of parameterization of bare soil evaporation

    itype_gscp,   & ! type of grid-scale precipitaiton physics

    itype_wcld,   & ! type of water cloud diagnosis
    itype_tran,   & ! type of surface-atmosphere transfer
    itype_turb,   & ! type of turbulent diffusion parametrization
    itype_synd,   & ! type of diagnosis of synop. station values

    imode_tran,   & ! mode of surface-atmosphere transfer
    imode_turb,   & ! mode of turbulent diffusion parametrization

    ico2_rad,     & ! type of CO2 concentration in radiation parametrization
    iy_co2_stab,  & ! year when CO2 gets constant
    icldm_rad,    & ! mode of cloud representation in radiation parametr.
    icldm_tran,   & ! mode of cloud representation in transfer parametr.
    icldm_turb,   & ! mode of cloud representation in turbulence parametr.

    itype_conv,   & ! type of convection parameterization:
                    !  0:  Tiedtke scheme (Default)
                    !  1:  Kain-Fritsch scheme
                    !  2:  Bechtold scheme (not yet implemented)
                    !  3:  Shallow convection based on Tiedtke scheme
    itype_aerosol,& ! type of aerosol map
                    !  1:  Tanre (Default)
                    !  2:  Tegen (exp)
    itype_root   ,& ! type of root distribution
                    ! 1: uniform (Default)
                    ! 2: exponential (exp)
    itype_heatcond,&! type of soil heat conductivity
                    ! 1: use average soil moisture
                    ! 2: take into account soil moisture/soil ice
    itype_hydbound,&! type of hydraulic lower boundary
                    ! 1: allow for drainage but not diffusion
                    ! 2: rigid lid
                    ! 3: ground water with drainage and diffusion
    itype_hydcond, &! type of hydraulic conductivity
                    ! 0: standard
                    ! 1: exponentional profile of saturated hydraulic conductivity
    itype_sher,   & ! type of shear production for TKE
                    !  1:  only vertical shear
                    !  2:  full isotropic 3D-shear
                    !  3:  vertical shear and separted horizontal shear mode

    itype_albedo, & ! type of surface albedo treatment
                    ! 1 (default) surface albedo is a function of soiltype
                    ! 2 surface albedo is prescribed by external fields
                    ! 3 background albedo is prescribed by external fields
                    ! 4 vegetation albedo is modified by forest fraction

    nlgw_ini,     & ! number of prognostic soil water levels in initial data
    nlgw_bd,      & ! number of prognostic soil water levels in boundary data
    nlgw,         & ! number of prognostic soil water levels

    ibot_w_so,    & ! number of hydrological active soil layers
    nhori,        & ! number of sectors for the horizont array by the topographic
                    ! correction of the radiation
    nproma,       & ! block size for physical parameterizations
    nlastproma,   & ! size of last block
    nblock          ! number of blocks
  REAL     ::  &
!==============================================================================

    csalb_p    = 0.15  , & !  solar albedo of ground covered by plants
    csalb_snow = 0.70  , & !  solar albedo of ground covered by snow
    csalb_snow_min = 0.400, &
                           ! min. solar albedo of snow for forest free surfaces
    csalb_snow_max = 0.700, &
                           ! max. solar albedo of snow for forest free surfaces
  ! for possible later use:
    csalb_snow_fe  = 0.200 , &  ! solar albedo of snow for surfaces with evergreen forest
    csalb_snow_fd  = 0.200 , &  ! solar albedo of snow for surfaces with deciduous forest
    ctalb      = 0.004 , & !  thermal albedo ( of all soil types )   
    cf_snow    = 0.0150, & !  parameter for the calculation of the 
                                  !  fractional snow coverage
  ! for the multi-layer soil model
    cwhc       = 0.04,   & !  water holding capacity of snow ()
    chcond     = 0.01,   & !  saturation hydraulic conductivity of snow ()
    ca2        = 6.6E-07,& !  activation energy (for snow metamorphosis) (J)
    csigma     = 75.,    & !  snow metamorphosis, Pa

  ! cf_w changed from 0.0004 to 0.0010 (in agreement with GME)
    cf_w       = 0.0010, & !  parameter for the calculation of the
                                  !  fractional water coverage

    csvoro     = 1.0000, & !  parameter to estimate the subgrid-scale 
                                  !  variation of orography
    cik1       = 0.0020, & !  parameter for the determination of the 
                                  !  maximum infiltaration
    cwimax     = 0.0005, & !  parameter for the determination of the 
    cwimax_ml  = 1.E-6,  & !  maximum interception water content
    ctau_i     = 1000.0, & !  time constatant for the drainage from the 
                                  !  interception storeage 
    cakw       = 0.8000, & !  parameter for averaging the water contents
                                  !  of the top and middle soil water layers to 
                                  !  calculate the hydraulic diffusivity and 
                                  !  conductiviy

    ctau1      = 1.0000, & !  first adjustment time period in EFR-method
    ctau2      = 5.0000, & !  second adjustment time period in EFR-method
    chc_i      = 2100.0, & !  heat capacity of ice     
    chc_w      = 4180.0, & !  heat capacity of water     

    cdzw12     = 0.1000, & !  thickness of upper soil water layer in 
                                  !  two-layer model         
    cdzw22     = 0.9000, & !  thickness of lower soil water layer in 
                                  !  two-layer model      
    cdzw13     = 0.0200, & !  thickness of upper soil water layer in 
                                  !  three-layer model
    cdzw23     = 0.0800, & !  thickness of middle soil water layer in 
                                  !  three-layer model 
    cdzw33     = 0.9000    !  thickness of lower soil water layer in 
                                  !  three-layer model

  REAL       ::  &
    cdsmin     = 0.0100, & !  minimum snow depth
    crhosmin   = 500.00, & !  minimum density of snow
    crhosmax   = 800.00, & !  maximum density of snow
    crhosmin_ml=  50.00, & !  minimum density of snow
    crhosmax_ml= 400.00, & !  maximum density of snow
    crhosminf  =  50.00, & !  minimum density of fresh snow
    crhosmaxf  = 150.00, & !  maximum density of fresh snow
    crhosmint  =   0.20, & !  minimum value of time constant for ageing 
                                  !  of snow
    crhosmaxt  =   0.40, & !  maximum value of time constant for ageing 
                                  !  of snow
    csnow_tmin = 258.15, & !  lower threshold temperature of snow for 
                                  !  ageing and fresh snow density computation 
                                  !  ( = 273.15-15.0)
    crhos_dw   = 300.00, & !  change of snow density with water content
    calasmin   = 0.2000, & !  minimum heat conductivity of snow (W/m K)
    calasmax   = 1.5000, & !  maximum heat conductivity of snow (W/m K)
    calas_dw   = 1.3000, & !  change of snow heat conductivity with
                                  !  water content                (W/(m**2) K)

    crhowm     =    0.8    , & !  BATS (1)
    cdmin      =    0.25E-9, & !  BATS (m**2/s)
    cfinull    =    0.2    , & !  BATS (m)
    ckrdi      =    1.0E-5 , & !  BATS (m/s)
    cdash      =    0.05   , & !  BATS ((m/s)**1/2)
    clai       =    3.0    , & !  BATS
    cparcrit   =  100.0    , & !  BATS (W/m**2)
    ctend      =  313.15   , & !  BATS (K)
    csatdef    = 4000.0    , & !  BATS (Pa)

    !Minimum and maximum value of stomatal resistance (s/m)
    !used by the Pen.-Mont. method for vegetation transpiration
    !(itype_trvg=2):
    crsmin     = 150.0     , & !  BATS (s/m)
    crsmax     = 4000.0        !  BATS (s/m)
    ! REAL :: &
    !     g_arr_const_5_5(5, 5)
    REAL, ALLOCATABLE :: &
        arr1(:), &
        arr2(:,:)
  REAL, PARAMETER  ::                                      &
       repsilon = 1.0E8*TINY(1.0),                             &
              !
              ! Very small number near zero.
              ! To be used mainly to avoid division by zero, e.g.
              ! eps_div = repsilon ; x = y / MAX(z,eps_div) ! for z > 0.
              ! Note that the factor 1.0E8 has been chosen rather
              ! arbitrarily to get some distance to zero.
              !

       rprecision = 10.0**(-PRECISION(1.0))

  LOGICAL                          ::           &
    lphys,        & ! forecast with physical parametrizations
    lrad,         & ! forecast with radiation
    lforest,      & ! if .true., run with forest (evergreen and deciduous)
    lsso,         & ! process parameters for sso scheme
    lemiss,       & ! external surface emissivity map
    lstomata,     & ! minimum stomata resistance map
    ltur,         & ! forecast with vertical diffusion
    l3dturb,      & ! 3D-turbulence: CALL explicit_horizontal_diffusion (RK)
    l3dturb_metr, & ! switch on/off additional metric terms for 3D-turbulence
    l_dzeta_d_needed = .FALSE., &
                    ! metric coeff. dzeta_dlam, dzeta_dphi are needed
    lprog_tke,    & ! prognostic treatment of TKE (for itype_turb=5/7)
    limpltkediff, & ! use semi-implicit TKE diffusion
    lconv,        & ! forecast with convection
    lconv_inst,   & ! output of instantaneous values of top_con/bas_con
                    ! instead of min/max for an output interval
    lgsp,         & ! forecast with grid scale precipitation
    ldiniprec,    & ! diagnostic initialisation of prognostic precip (qr, qs)
    lsoil,        & ! forecast with soil model
    lmelt,        & ! soil model with melting process
    lmelt_var,    & ! freezing temperature dependent on water content
    lmulti_layer, & ! run multi-layer soil model
    lmulti_snow,  & ! run multi-layer snow model
    lseaice,      & ! forecast with sea ice model
    llake,        & ! forecast with lake model
    lconf_avg,    & ! average convective forcings in case of massflux closure
    lradf_avg,    & ! average radiative forcings if radiation is calculated on coarser grid
    lcape,        & ! convection with CAPE closure
    lconv_clo,    & ! if .TRUE. use new shallow convection closure (SB14)
    lctke,        & ! convection with turbulent convective energy closure
                    ! warning: lctke not yet fully implemented
    ltkesso,      & ! calculation SSO-wake turbulence production for TKE
    ltkecon,      & ! consider convective buoyancy production for TKE
    lexpcor,      & ! explicit corrections of the implicit calculated
                    ! turbulent diffusion (only if itype_turb=3)
    ltmpcor,      & ! consideration of thermal TKE-sources in the 
                    ! enthalpy budget
    lprfcor,      & ! using the profile values of the lowest main level instead
                    ! of the mean value of the lowest layer for surface flux
                    ! calulations
    lnonloc,      & ! nonlocal calculation of vertical gradients used
                    ! for turbulent diffusion (only if itype_turb=3)
    lcpfluc,      & ! consideration of fluctuations of the heat capacity of air
    lco2_stab,    & ! enable CO2 stabilisation
    lradtopo        ! if .TRUE., calculate topographic correction of radiation

CONTAINS 
SUBROUTINE radiation_rg_organize(                                     &
    ierror      ,yerrmsg     ,ydate_ini   ,lzradstep   ,              &
    nproma      ,ke          ,ke_soil     ,ke_snow     ,ipend       , &
  ! INTENT(IN) read-only
    aer_bc      ,aerlan      ,aer_or      ,aersea      ,aer_ss      , &
    aer_su      ,aerurb      ,alb_dif     ,alb_dry     ,alb_sat     , &
    clc_con     ,depth_lk    ,dp0         ,emis_rad    ,for_d       , &
    for_e       ,freshsnow   ,h_ice       ,hmo3        ,llandmask   , &
    p0          ,p0hl        ,plcov       ,pp          ,ps          , &
    qc          ,qi          ,qv          ,rcld        ,soiltyp     , &
    swdir_cor   ,t           ,t_g         ,t_ice       ,t_s         , &
    t_snow      ,t_snow_mult ,vio3        ,w_g1        ,w_snow      , &
    w_so        ,zskyview    ,zsmu0_fesft ,zsmu0_flux  ,              &
  ! INTENT(INOUT) conditional write-only
    alb_rad     ,clch        ,clcl        ,clcm        ,clct        , &
    lwd_s       ,lwu_s       ,qc_rad      ,qi_rad      ,sodwddm     , &
    thbs        ,thbt        ,thhr        ,                           &
  ! INTENT(INOUT) read-write
    aerdes      ,aer_du      ,clc_sgs     ,sod_t       ,sotr        , &
    sotr_par    ,swtrdifd_s  ,swtrdifu_s  ,swtrdir_s                , &
  ! INTENT(OUT) unconditional write-only
    pabs        ,sobs        ,sobt        ,swdifd_s    ,swdifu_s    , &
    swdir_s     ,sohr                                               )

!------------------------------------------------------------------------------
!
! Description:
!
! The module procedure organize_radiations forms the interface between
! the model and the radiation code adapted from the global model gm_e.
!
! Method:
!
! All variables that are required for the radiation code (i.e. input arrays
! and scalars) are provided or calculated from the model variabels.
! The results are stored as solar and thermal heating rates on the 
! corresponding global arrays sohr and thhr.
!     
!------------------------------------------------------------------------------
!
! T.R.:
! Die Variablen zfltf und zflsf (pfltf pflsf in fesft) wurden entfernt, da sie
! nicht weiterverwemdet werden. lcrf and ldebug wurden von Variablen zu
! Parametern.
! Methode fuer Strahlungsrechnung auf groeberem Gitter:
! Die Eingangsgroessen fuer die Routine fesft werden auf groeberes Gitter gemittelt
! (Variablennamen der gemittelten Groessen: XXX_rn).
! Dann Aufruf von fesft mit _rn-Variablen.
! Dann Zurueckspeichern auf LM-Gitter.
! Dann Abziehen der jeweils auf dem groben Gitter berechneten therm. Ausstrahlung und
! reflektierten Solarstrahlung.
! Dann Filtern der Strahlungsinkremente mit diskretem Filter (analog lconf_avg),
! falls lradf_avg==.TRUE.
! Dann Hinzufuegen der therm. Ausstrahlung (gemaess tg auf feinem Gitter) und der
! solaren Rueckstrahlung (gemaess Albedo auf feinem Gitter).
! Kurzerklaerung zu einigen Variablen:
! nradcoarse: Zahl der GP (je x-/y-Richtung, ueber die gemittelt wird
!          1 = wie bisher, 2 = 2-mal-2-Gebiet usw.
! lradave = interner Schalter, der abfragt, ob ueberhaupt gemittelt werden soll
!           (ist true fuer nradcoarse > 1) ==> bei nradcoarse==1 wird nichts gemacht
! alb_rad am Ende, wie es ausgegeben wird, ist die originale Albedo!
! qc_rad und qi_rad sind ebenfalls originale Felder (urspruengliches LM-Gitter)!
! Version auk9_neu8.
!
! The variables zfltf and zflsf (pfltf,pflsf inside fesft) were removed since they
! are not used. lcrf and ldebug were made parameters.
! Method for radiation calculation on coarser grid:
! Input fields for subroutine fesft are averaged onto coarser grid (variable names
! of coarse-grid variables: XXX_rn).
! Then subroutine fesft is called with _rn variables.
! Then coarse-grid fields are stored back onto original (LM) grid.
! Then surface outgoing thermal radiation (calculated with coarse-grid t_g) and
! reflected solar radiation (calculated with coaerse-grid albedo) are substracted from
! thbs and sobs, resp.
! Then the radiative increments are filtered with discrete filter (analogous to
! lconf_avg), if lradf_avg == .true.
! Then surface outgoing thermal radiation (calculated with coarse-grid t_g) and
! reflected solar radiation (calculated with coaerse-grid albedo) are added to thbs
! and sobs, resp.
!
! nradcoarse: number of gridpoints (per x/y direction) to be averaged
!          1: as hitherto; 2: 2-times-2 area and so on
! lradave = internal switch, whether radiation calculation on coarser grid is applied
! at all (.true. for nradcoarse > 1) ==> if nradcoarse==1, then lradave=.false. and
! nothing new is done
! alb_rad at end, as in output, is original (LM fine-scale) albedo!
! qc_rad and qi_rad are also original (LM fine-scale) fields!

!==============================================================================

  IMPLICIT NONE

! Subroutines arguments
! --------------------

  CHARACTER (LEN=14), INTENT(IN) :: &
    ydate_ini ! start of the forecast yyyymmddhh (year,month,day,hour,min,sec)

  LOGICAL, INTENT(IN) :: &
    lzradstep ! true if full radiation timestep, otherwise
              ! only recalculation of sohr, sobs, and sobt,
              ! based on actual zenith angle

  INTEGER, INTENT(IN) :: &
    ipend, nproma, ke, ke_soil, ke_snow

  INTEGER, INTENT(OUT) :: &
    ierror

  CHARACTER(LEN=*), INTENT(OUT) :: &
    yerrmsg

  REAL, INTENT(IN) ::      &
    aer_bc      (nproma)          , &
    aerlan      (nproma)          , &
    aer_or      (nproma)          , &
    aersea      (nproma)          , &
    aer_ss      (nproma)          , &
    aer_su      (nproma)          , &
    aerurb      (nproma)          , &
    alb_dif     (nproma)          , &
    alb_dry     (nproma)          , &
    alb_sat     (nproma)          , &
    clc_con     (nproma,ke)       , &
    depth_lk    (nproma)          , &
    dp0         (nproma,ke)       , &
    emis_rad    (nproma)          , &
    for_d       (nproma)          , &
    for_e       (nproma)          , &
    freshsnow   (nproma)          , &
    h_ice       (nproma)          , &
    hmo3        (nproma)          , &
    p0hl        (nproma,ke+1)     , &
    p0          (nproma,ke)       , &
    plcov       (nproma)          , &
    pp          (nproma,ke)       , &
    ps          (nproma)          , &
    qc          (nproma,ke)       , &
    qi          (nproma,ke)       , &
    qv          (nproma,ke)       , &
    rcld        (nproma,ke+1)     , &
    soiltyp     (nproma)          , &
    swdir_cor   (nproma)          , &
    t_g         (nproma)          , &
    t_ice       (nproma)          , &
    t           (nproma,ke)       , &
    t_snow_mult (nproma,ke_snow)  , & ! only allocated if lmulti_layer.AND.multi_snow
    t_snow      (nproma)          , &
    t_s         (nproma)          , &
    vio3        (nproma)          , &
    w_g1        (nproma)          , &
    w_snow      (nproma)          , &
    w_so        (nproma,ke_soil)  , &
    zskyview    (nproma)          , &
    zsmu0_fesft (nproma)          , &
    zsmu0_flux  (nproma)
  
  LOGICAL, INTENT(IN) ::            &
    llandmask   (nproma)

  ! These variables are write-only, i.e. INTENT(OUT), but since there is an
  ! immediate RETURN in the case l_zenith_update.AND.lzradstep, they are not
  ! written in every case and thus need to be INTENT(INOUT).
  REAL, INTENT(INOUT) ::   &
    alb_rad     (nproma)          , &
    clch        (nproma)          , &
    clcl        (nproma)          , &
    clcm        (nproma)          , &
    clct        (nproma)          , &
    lwd_s       (nproma)          , &
    lwu_s       (nproma)          , &
    sodwddm     (nproma)          , &
    thbs        (nproma)          , &
    thbt        (nproma)          , &
    qc_rad      (nproma,ke)       , &
    qi_rad      (nproma,ke)       , &
    thhr        (nproma,ke)

  REAL, INTENT(INOUT) ::   &
    aer_du      (nproma)          , &
    aerdes      (nproma)          , &
    sod_t       (nproma)          , &
    sotr_par    (nproma)          , &
    swtrdifd_s  (nproma)          , &
    swtrdifu_s  (nproma)          , &
    swtrdir_s   (nproma)          , &
    clc_sgs     (nproma,ke)       , &
    sotr        (nproma,ke+1)

  REAL, INTENT(OUT) ::     &
    pabs        (nproma)          , &
    sobs        (nproma)          , &
    sobt        (nproma)          , &
    swdifd_s    (nproma)          , &
    swdifu_s    (nproma)          , &
    swdir_s     (nproma)          , &
    sohr        (nproma,ke)

! Local parameters: 
! ----------------

  LOGICAL, PARAMETER ::          &
    lcrf             = .FALSE. , &
    ldebug           = .FALSE.
!#  l_zenith_update  = .TRUE.     ! zenith angle update !RUS_CHANGE/REMOVE: Moved into data_runctontrol

  REAL          , PARAMETER ::  &
     z_1d7200 = 1.0 /7200.0 ,&
     zcent  = 0.2500, & ! centre weight in a nine point stencil !T.R.
     zside  = 0.1250, & ! weight for side points !T.R.
     zedge  = 0.0625, & ! weight for edge points !T.R.
     zepclc = MAX(1.0E-8,rprecision), &
                           ! avoids cloud cover =1.0 and = 0.0 
     zeph2o = 1.0E-9, & ! minimum value for specific humidity
     zepemu = 1.0E-9, & ! avoids cosine of zenith angle = 0.0
     zclwcm = 1.0E-9, & ! avoids cloud water content = 0.0
     rtod  = 57.2957795 ! conversion from radians to degrees

! the former parameter zqco2 =  0.5014E-3_wp is now a variable 
! (for specifying different co2 scenarios in the Climate-LM Version).
! It is set later in this subroutine dependent on the setting of the Namelist
! Parameter ico2_rad

! Local scalars:
! -------------

! Input for the radiation routine fesft
! -------------------------------------
  INTEGER   ::  &
     ki1sd,       & ! start index for first  array dimension
     ki1ed,       & ! end   index for first  array dimension
     ki3sd,       & ! start index for third  array dimension
     ki3ed,       & ! end   index for third  array dimension

   ! and the same for the computations
     ki1sc,       & ! start index for first  array computation
     ki1ec,       & ! end   index for first  array computation
     ki3sc,       & ! start index for third  array computation
     ki3ec          ! end   index for third  array computation

  LOGICAL                  ::  &
     lradave,     & ! internal switch whether radiation is coarse-grid ! T.R.
     lrady          ! for radiation on coarse-grid !T.R.
!#     lsolar          ! control switch for solar calculations !RUS_CHANGE/REMOVE: Moved into data_radiation.

  REAL           ::  &
     zstb           ! Stefan-Boltzman constant 
!#     zsct           ! solar constant (at time of year) !RUS_CHANGE/REMOVE: Moved into data_radiation.

  INTEGER  ::  &
    kzdims(24),            &
!#    istartradheat,iendradheat,jstartradheat,jendradheat, & !RUS_CHANGE/REMOVE: Moved into data_radiation
    j_rn,nradcoarse_y,     & ! for radiation on coarse grid! T.R.
    izz,ii,jz1, n,         & ! for radiation on coarse grid! T.R.
    i, j, js, k, i_ld,     & ! loop indices over spatial dimensions
!#  nzx     , i_std, i_etd,& ! time level of prognostic variables
              i_std, i_etd,& ! time level of prognostic variables
    nzrad,                 & !
    jj   , itaja,          & ! output from routine get_utc_dat
    ist  ,                 & ! loop index for soil type  
    izstata,               & ! error status at allocation !T.R.
    izstatd,               & ! error status at deallocation !T.R.
    izerror, izdebug         ! for error status
 
  REAL           ::  &
    zalbfak,                   & ! albedo correction factor !T.R.
    zfactor,zfactor_b,         & ! for radiation on coaerse grid !T.R.
    ztrbga, zvobga, zstbga,    & ! output from routine aerdis
    zaeops, zaeopl, zaeopu,    & !   "
    zaeopd, ztrpt , zaeadm,    & !   "
    zstunde,                   & ! output from routine get_utc_dat
    ztwo  , ztho  ,            & !
    zdek  ,                    & !
!#    zsocof, zeit0 ,            & ! !RUS_CHANGE/REMOVE: Moved zeit0 into data_radiation.
    zsocof ,                   & !
!#    zmaxmu0        ,           & !
!#    zeitrad(ie_tot),           & !
!#    zsinphi(ie_tot),           & !
!#    zcosphi(ie_tot),           & !
    zcosthi,zsnow  , zvege  ,  & !
    zph    ,zsigma , zdthdz ,  & !
    zpio   ,zpiu   , zpim   ,  & !
    zpnf   ,zphf   , zphfo  ,  & !
    zthvo  ,zthvu  , zuc    ,  & !
    zclwfs ,zclwcs ,           & !
    zclics ,zclws  ,           & !
    zclick ,zclwck , zclwk,    & !
    zclwfk ,                   & !
    zcs    ,zck    , zfac   ,  & !
    zt_ice1,zt_ice2,           & !
    fgew   ,fgee   , fgqv   ,  & ! name of statement functions
    ztt    ,zzpv   , zzpa   ,  & ! dummy arguments of stat. func.
    zsmu0_loc               ,  & ! dummy arguments of stat. func.
    zsalb_snow, zsnow_alb   ,  & !
    zqdw, zsex, zf_ice, zdpo,  & !
    zdpn, x1, x2, phi_s

  CHARACTER (LEN=14)   yrad1         ! output from routine get_utc_dat
  CHARACTER (LEN=28)   yrad2         ! output from routine get_utc_dat
  CHARACTER (LEN=255)  yzerrmsg      ! for error message
  CHARACTER (LEN=25)   yzroutine
 
  REAL          ::  &
    zyear, zqco2,              &     ! for specifying different CO2 scenarios
                                     ! in the Climate-LM Version
    zyearmin, zyearmax               ! in the Climate-LM Version

  REAL          ::  &
    zsct_h

!# REAL   (KIND=wp),     SAVE ::              &
!#    & zsct_save, zdtzgl_save,         &
!#    & zdeksin_save,zdekcos_save

!# INTEGER , SAVE :: itaja_zsct_previous = 0

  INTEGER :: jmu0, nz_zsct
  
!#  INTEGER :: nz_cosmu0pos(ie,je) !RUS_CHANGE/REMOVE: Now in compute_sunshine_conditions

!RUS_CHANGE/REMOVE: Added to subroutine interface
!#LOGICAL :: lzradstep,& ! true if full radiation timestep, otherwise
!#                       ! only recalculation of sohr, sobs, and sobt,
!#                       ! based on actual zenith angle
  LOGICAL :: lzprog_qi

  INTEGER :: ip

  REAL :: zdt

  REAL  ::  &
  zqcfn,     &
  zqofn,     &
  zaeqdn,    &
  zaequn,    &
  zaeqln,    &
  zaeqsn,    &
  zaetr_bot, &
  zaetr

  REAL  ::  &
  t_test,               &
  zwetfrac                ! relative soil moisture saturation for top layer
  
! Local (automatic) arrays:
! ------------------------

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!#  REAL    (KIND=wp)        ::  &

!#  ! Input for the radiation routine fesft
!#  zti         (ie,je,ke1)  , & ! Tempeature at layer boundaries
!#  zclc        (ie,je,ke )  , & ! Cloud cover in each layer
!#  zwv         (ie,je,ke )  , & ! Water vapour mixing ratio
!#  zsw         (ie,je,ke )  , & ! Saturation water vapour mixing ratio over water
!#  zse         (ie,je,ke )  , & ! Saturation water vapour mixing ratio over ice
!#  zclwc       (ie,je,ke )  , & ! liquid water mixing ratio
!#  zciwc       (ie,je,ke )  , & ! ice mixing ratio
!#  zduco2f     (ie,je,ke )  , & ! CO2 content in layer
!#  zduo3f      (ie,je,ke )  , & ! O3  content in layer
!#  zaeq1       (ie,je,ke )  , & ! Type1-Aerosole optical depth at 0.55 micrometer
!#  zaeq2       (ie,je,ke )  , & ! Type2  "
!#  zaeq3       (ie,je,ke )  , & ! Type3  "
!#  zaeq4       (ie,je,ke )  , & ! Type4  "
!#  zaeq5       (ie,je,ke )  , & ! Type5  "
!#  zapre       (ie,je )     , & ! Surface pressure
!#!#  zsmu0_fesft (ie,je )     , & ! Cosine of zenith angle (used in fesft)
!#!#  zsmu0_flux  (ie,je )     , & ! Cosine of zenith angle (used in flux computations)
!#  zalso       (ie,je )     , & ! Solar surface albedo
!#  zalth       (ie,je )     , & ! Thermal surface albedo 
!#!#  zskyview    (ie,je)      , & ! used as argument for SR fesft

!#  ! other values for intermediate storage
!#  zclcmax(ie,je,ke )     , & !
!#  zclcmin(ie,je,ke )     , & !
!#  zclcm1 (ie,je)         , & !
!#! zclx   (ie,ke )     , & !

!#  ! Output from the radiation routine fesft
!#  zflt   (ie,ke1)     , & ! Thermal radiative flux at layer boundary
!#  zfls   (ie,ke1)     , & ! Solar radiative flux at layer boundary
!#  zflsdir(ie,ke1)     , & ! solar direct downward radiative flux at 
!#                          ! layer boundary
!#!T.R. comment: for zfsldir a 1d field would be sufficent since only (:,ke1) is used

!#  ! surface flux of photosynthetic active radiation and components
!#  zflpar    (ie )     , & ! surface flux of photosynthetic acive radiation
!#  zflsp_par (ie )     , & ! direct component
!#  zflsd_par (ie )     , & ! diffuse downward component
!#  zflsu_par (ie )     , & ! diffuse upward   component

!#  ! 2D fields for averaging and distribution, if working on a coarse grid
!#  zzflsp_par(ie,je)   , & ! direct component
!#  zzflsd_par(ie,je)   , & ! diffuse downward component
!#  zzflsu_par(ie,je)       ! diffuse upward component

!#  REAL    (KIND=wp)        ::  &

!#  ! corrected solar and thermal fluxes at layer boundary and components
!#  zfls_s    (ie)      , & ! Corrected solar
!#  zflt_s    (ie)      , & !         thermal
!#  zflsp     (ie)      , & ! direct component of solar radiative flux
!#  zflsd     (ie)      , & ! diffuse downward component of solar flux
!#  zflsu     (ie)      , & ! diffuse upward   component of solar flux
!#  zfltd     (ie)      , & ! diffuse downward component of thermal flux
!#  zfltu     (ie)             ! diffuse upward   component of thermal flux

!#  REAL    (KIND=wp)        ::  &

!#  ! Other local utility arrays
!#  zqcfo    (ie,je), zqcfn ,                 &
!#  zo3h     (ie,je),                         &
!#  zqofo    (ie,je), zqofn,                  &
!#  zaeqdo   (ie,je), zaeqdn,                 &
!#  zaequo   (ie,je), zaequn,                 &
!#  zaeqlo   (ie,je), zaeqln,                 &
!#  zaeqso   (ie,je), zaeqsn,                 &
!#  zaetr_top(ie,je), zaetr_bot, zaetr,       &

!#! in case of nradcoarse > 1: fields on coarse grid: !T.R.

!#  REAL (KIND=wp)      , ALLOCATABLE :: &
!#  tg_rn     (:  )      , & ! ground temperature
!#  tg_ra     (:,:)          ! ground temperature

!#  ! Input arrays for fesft (in double precision).
!#  REAL (KIND=dp)      , ALLOCATABLE :: &
!#  ! Input for the radiation routine fesft
!#  zti_rn    (:,:)      , & ! Tempeature at layer boundaries
!#  zdpr_rn   (:,:)      , & ! Pressure thickness of layers
!#  zclc_rn   (:,:)      , & ! Cloud cover in each layer
!#  zwv_rn    (:,:)      , & ! Water vapour mixing ratio
!#  zsw_rn    (:,:)      , & ! Saturation water vapour mixing ratio over water
!#  zclwc_rn  (:,:)      , & ! liquid water mixing ratio
!#  zciwc_rn  (:,:)      , & ! ice mixing ratio
!#  zduco2f_rn(:,:)      , & ! CO2 content in layer
!#  zduo3f_rn (:,:)      , & ! O3  content in layer
!#  zaeq1_rn  (:,:)      , & ! Type1-Aerosole optical depth at 0.55 micrometer
!#  zaeq2_rn  (:,:)      , & ! Type2  "
!#  zaeq3_rn  (:,:)      , & ! Type3  "
!#  zaeq4_rn  (:,:)      , & ! Type4  "
!#  zaeq5_rn  (:,:)      , & ! Type5  "
!#  zapre_rn  (:  )      , & ! Surface pressure
!#  zsmu0_rn  (:  )      , & ! Cosine of zenith angle
!#  zalth_rn  (:  )      , & ! Thermal surface albedo
!#  zalso_rn  (:  )      , & ! Solar surface albedo
!#  zskyv_rn  (:  )      , & ! sky view
!#  zscor_rn  (:  )          ! direct short wave radiation correction factor actual value

!#  REAL (KIND=wp)      , ALLOCATABLE :: &

!#  ! Output from the radiation routine fesft
!#  zflt_rn      (:,:)   , & ! Thermal radiative flux at layer boundary
!#  zfls_rn      (:,:)   , & ! Solar radiative flux at layer boundary
!#  zflsdir_rn   (:,:)   , & ! solar direct downward radiative flux at layer boundary
!#  !T.R. comment: for zfsldir_rn a 1d field would be sufficent since only (:,ke1) is used

!#  ! surface flux of photosynthetic active radiation and components
!#  zflpar_rn    (:  )   , & ! surface flux of photosynthetic acive radiation
!#  zflsp_par_rn (:  )   , & ! direct component
!#  zflsu_par_rn (:  )   , & ! diffuse upward component
!#  zflsd_par_rn (:  )   , & ! diffuse downward component

!#  ! corrected solar and thermal fluxes at layer boundary and components
!#  zfls_s_rn    (:  )   , & ! corrected solar radiative flux
!#  zflt_s_rn    (:  )   , & ! thermal flux
!#  zflsp_rn     (:  )   , & ! direct component of solar flux at surface
!#  zflsd_rn     (:  )   , & ! diffuse downward component of solar flux
!#  zflsu_rn     (:  )   , & ! diffuse upward   component of solar flux
!#  zfltd_rn     (:  )   , & ! diffuse downward component of thermal flux
!#  zfltu_rn     (:  )   , & ! diffuse upward   component of thermal flux

!#  zsohr      (:,:,:)   , & ! rate of solar heating                     ( k/s )
!#  zthhr      (:,:,:)   , & ! rate of thermal heating                   ( k/s )
!#  zsobs        (:,:)   , & ! solar radiation at ground                 ( w/m2)
!#  zsobt        (:,:)   , & ! solar radiation at upper boundary of atmosphere
!#  zthbs        (:,:)   , & ! thermal radiation at ground               ( w/m2)
!#  zthbt        (:,:)   , & ! thermal radiation at upper boundary of atmosphere
!#  zpabs        (:,:)   , & ! photosynthetic active radiation at ground ( w/m2)
!#  zsodwddm     (:,:)   , &

!#  ! 2D fields for averaging and distribution, if working on a coarse grid
!#  z_zzfltd     (:,:)   , & ! diffuse downward component of thermal flux
!#  z_zzfltu     (:,:)   , & ! diffuse upward   component of thermal flux
!#  z_zzflsp     (:,:)   , & ! direct component of solar radiative flux
!#  z_zzflsd     (:,:)   , & ! diffuse downward component of solar flux
!#  z_zzflsu     (:,:)   , & ! diffuse upward   component of solar flux

!#  ! photosynthetic active radiation at the ground ( w/m2): components
!#  z_zzflsp_par (:,:)   , & ! direct component
!#  z_zzflsd_par (:,:)   , & ! diffuse downward component
!#  z_zzflsu_par (:,:)       ! diffuse upward   component
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

! Tracer pointers
!----------------
!RUS_CHANGE/REMOVE: Now obsolete
!#  REAL (KIND=wp),     POINTER :: &
!#  qv  (:,:,:)=> NULL(),           & ! QV at nzx
!#  qc  (:,:,:)=> NULL(),           & ! QC at nzx
!#  qi  (:,:,:)=> NULL()              ! QI at nzx

!----------- End of header ----------------------------------------------------

! statement function to calculate saturation vapour pressure over water
  fgew(ztt)       = b1 * EXP( b2w*(ztt - b3)/(ztt - b4w) ) ! ztt: temperature

! statement function to calculate saturation vapour pressure over ice
  fgee(ztt)       = b1 * EXP( b2i*(ztt - b3)/(ztt - b4i) ) ! ztt: temperature

! statement function to calculate specific humitdity  
  fgqv(zzpv,zzpa) = rdv*zzpv/(zzpa - o_m_rdv*zzpv)   ! zzpv: vapour pressure
                                                     ! zzpa: total air pressure

    CALL break_scop()

    !$acc parallel
    !$acc loop gang vector
    ! UNMODELLABLE LOOP: Bailing-out because of unfeasible context (early)
    DO ip = 1, ipend
      CALL break_scop()
      IF (lemiss) THEN
        zalth(ip) = 1.0-emis_rad(ip) ! geographical dependent thermal albedo
      ELSE
        zalth(ip) = ctalb
      ENDIF

      ist = 10

      ! In the following IF statement, t_snow has been used up to now.
      ! In NetCDF files, t_snow is undefined (-1E20) where no snow exists.
      ! This leads to ice-points over the whole sea. t_g could be used instead,
      ! but this changes the results and has to be tested more intensively.
      ! As an intermediate solution, we use t_snow, where it is defined,
      ! otherwise t_g (in grib-files, t_snow is defined as t_s, where no
      ! snow exists.

      IF(lmulti_snow) THEN
        IF (t_snow_mult(ip,1) < 0.0) THEN
          t_test = t_g (ip)
        ELSE
          t_test = t_snow_mult(ip,1)
        ENDIF
      ELSE
      IF (t_snow(ip) < 0.0) THEN
          t_test = t_g(ip)
        ELSE
          t_test = t_snow(ip)
        ENDIF
      ENDIF

      IF ( llandmask(ip) .OR. t_test >= t0_melt - 1.7 ) THEN
        ist = NINT(soiltyp(ip)) ! water (ist=9) and sea ice (ist=10) included
      ENDIF
      zalso(ip) = csalb(ist)

      IF (lsoil .AND. llandmask(ip)) THEN

        IF     (itype_albedo == 1) THEN
          IF(lmulti_layer) THEN
            zalso(ip) = csalb(ist) - rad_csalbw(ist)*w_so(ip,1)
          ELSE
            zalso(ip) = csalb(ist) - rad_csalbw(ist)*w_g1(ip)
          ENDIF

        ELSEIF (itype_albedo == 2) THEN
          IF(lmulti_layer) THEN
            zwetfrac = (0.5*w_so(ip,1)/czmls(1)-cadp(ist))/ &
                       (cporv(ist)-cadp(ist))
            zwetfrac = MIN(1.0,MAX(0.0,zwetfrac))
            zalso(ip) = (1.0-zwetfrac)*alb_dry(ip) + zwetfrac*alb_sat(ip)
          ELSE
            IF (nlgw == 2) THEN
              zwetfrac = (w_g1(ip)/cdzw12-cadp(ist))/ &
                         (cporv(ist)-cadp(ist))
            ELSE
              zwetfrac = (w_g1(ip)/cdzw13-cadp(ist))/ &
                         (cporv(ist)-cadp(ist))
            ENDIF
            zwetfrac = MIN(1.0,MAX(0.0,zwetfrac))
            zalso(ip) = (1.0-zwetfrac)*alb_dry(ip) + zwetfrac*alb_sat(ip)
          ENDIF

        ELSEIF (itype_albedo == 3) THEN
          ! some points use soiltyp albedo, predefined in EXTPAR
          zalso(ip) = alb_dif(ip)  ! MODIS background albedo
        ENDIF

      ENDIF  ! lsoil, llandmask

    ENDDO
    !$acc end parallel
    CALL break_scop()

END SUBROUTINE radiation_rg_organize

SUBROUTINE break_scop()
END SUBROUTINE break_scop

END MODULE m

PROGRAM p
    USE m

!~    ALLOCATE(arr1(0:3))
!~    ALLOCATE(arr2(0:3, 0:1))
!~
!~    DO i=0,3
!~        arr1(i) = -42
!~    END DO
!~
!~    DO i=0,3
!~        DO j=0,1
!~            arr2(i, j) = i * j -3
!~        END DO
!~    END DO
!~
!~    PRINT *, "arr1:"
!~    PRINT *, arr1
!~    PRINT *, "arr2:"
!~    PRINT *, arr2
!~    PRINT *, "===calling f()==="
!~    CALL f (arr2, 0, 0)
!~    PRINT *, arr1
!~
    !~PRINT *, "===calling g()==="
    !~CALL g ()
    !~PRINT *, arr1
END PROGRAM p
