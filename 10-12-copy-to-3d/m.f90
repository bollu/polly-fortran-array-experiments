MODULE m
IMPLICIT NONE
   INTEGER, PARAMETER :: &
   iintegers = KIND  (1)
   integer, parameter :: dp = selected_real_kind(13)
   !
   !>  4 byte real kind parameter
   !
   integer, parameter :: sp = selected_real_kind(6)
   !
   !>  working precision used in the program
   !
!#ifdef SINGLEPRECISION
   integer, parameter :: wp = sp
!#else
!   integer, parameter :: wp = dp


INTEGER,  ALLOCATABLE    ::           &
  global_idx_array (:),  & ! keeps the i (longitude) index 
  mind_jlat (:,:)     ! keeps the j (latitude)  index  
                      ! for every grid point in the (nproma,nblock) ordering

CONTAINS 

SUBROUTINE fn(in_array, out_array)

!------------------------------------------------------------------------------
!
! Description:
!   Actual implementation of copy to block for 2d and 3d fields
!------------------------------------------------------------------------------

  IMPLICIT NONE

! Subroutine arguments:
! --------------------
  REAL(KIND=wp), INTENT(IN)  :: in_array(:)
  REAL(KIND=wp), INTENT(OUT) :: out_array(:)

! Local parameters:
! ---------------- 
  INTEGER :: i, indirect_idx

!------------------------------------------------------------------------------
! Begin Subroutine  fn
!------------------------------------------------------------------------------

!GPU_PHYS_EDIT: uncomment once the copy to block has to be issued on the GPU
!               (i.e. once the global fields and the block fields are on the GPU)
  !$acc data present(in_array, out_array, global_idx_array, mind_jlat)
  !$acc parallel
  !~DO k = 1, ksize
    !$acc loop gang vector
    DO i = 1, 100
      indirect_idx = global_idx_array(i)
      !~ j = mind_jlat(ip,ib)            
      out_array(i) = in_array(indirect_idx)
      !~ out_array(i) = 10
    END DO
  !~END DO
  !$acc end parallel
  !$acc end data

END SUBROUTINE fn
!==============================================================================
! Working arrays - inv_th/so
!==============================================================================

!~  REAL    (KIND=dp), ALLOCATABLE ::  &
!~
!~    ! layer properties calculated in *coe_th*
!~    pa1c (:)  , & !
!~    pa1f (:)  , & ! 
!~    pa2c (:)  , & ! 
!~    pa2f (:)  , & ! 
!~    pa3c (:)  , & ! 
!~    pa3f (:)  , & ! 
!~    pa4c (:)  , & ! 
!~    pa4f (:)  , & ! 
!~    pa5c (:)  , & ! 
!~    pa5f (:)  , & ! 
!~
!~    ! Utility arrays
!~    ztu1 (:,:), & !
!~    ztu2 (:,:), & !
!~    ztu3 (:,:), & !
!~    ztu4 (:,:), & !
!~    ztu5 (:,:), & !
!~    ztu6 (:,:), & !
!~    ztu7 (:,:), & !
!~    ztu8 (:,:), & !
!~    ztu9 (:,:)    !
!~! Local (automatic) arrays:
!~! ------------------------
!~! Arrays local to *fesft* or required for communication with
!~! subroutines called from *fesft*
!~
!~  REAL    (KIND=dp), ALLOCATABLE        ::  &
!~  ! 'Grey' and gaseous fluxes for individual spectral intervals
!~  ! "_c" means: corrected if lradtopo
!~  zflux    (:,:)  , & ! (W/m**2)
!~  zflux_c  (:,:)  , & ! (W/m**2)
!~  zfluxi   (:,:)  , & ! 1./(W/m**2)
!~  zfluxu   (:,:)  , & ! (W/m**2)
!~  zfluxu_c (:,:)  , & ! (W/m**2)
!~  zfluxui  (:,:)  , & ! 1./(W/m**2)
!~  zfluxd   (:,:)  , & ! (W/m**2)
!~  zfluxd_c (:,:)  , & ! (W/m**2)
!~  zfluxdi  (:,:)  , & ! 1./(W/m**2)
!~  zfgas    (:,:)  , & ! (W/m**2)
!~  zfgasu   (:,:)  , & ! (W/m**2)
!~  zfgasd   (:,:)      ! (W/m**2)
!~
!~  REAL    (KIND=dp), ALLOCATABLE        ::  &
!~  pbbr     (:,:)  , & ! (W/m**2) Black body radiation at layer boundaries
!~  pflpt    (:)    , & ! Solar flux at TOA
!~  palp     (:)    , & ! Solar surface albedo for parallel radiation
!~  pqsmu0   (:)    , & ! Inverse of cosine of zenith angle
!~  palogt   (:,:)  , & ! ln T
!~  palogp   (:,:)  , & ! ln p
!~  papra    (:)    , & ! (Pa) pressure at one level
!~  pduh2oc  (:,:)  , & ! layer water vapour content (Pa), cloudy
!~  pduh2of  (:,:)  , & ! layer water vapour content (Pa), cloud-free)
!~  pdulwc   (:,:)  , & ! (Pa H2O-liquid) layer
!~                                                      ! incloud liquid water content
!~  pduiwc   (:,:)  , & ! (Pa H2O-ice) layer incloud ice content
!~  prholwc  (:,:)  , & ! (kg/m**3)
!~  prhoiwc  (:,:)  , & ! (kg/m**3)
!~  zduetpc  (:,:)  , & ! water vapour e-type contribution (cloudy)
!~  zduetpf  (:,:)  , & ! water vapour e-type contribution (cloud-free)
!~
!~  ! layer mean temperature, water vapour mixing ratio, utility arrays
!~  ztm      (:)    , & !
!~  zzwv     (:)    , & !
!~  zcpo     (:)    , & !
!~  zcpn     (:)    , & !
!~  zcmo     (:)    , & !
!~  zcmn     (:)        !
!~
!~  REAL    (KIND=dp), ALLOCATABLE        ::  &
!~  ! Output data from opt_th/opt_so
!~  podac   (:,:)   , & ! absorption optical depth
!~  podaf   (:,:)   , & ! in cloudy and free part
!~  podsc   (:,:)   , & ! scattering optical depth
!~  podsf   (:,:)   , & ! in cloudy and free part
!~  pbsfc   (:,:)   , & ! backscattering fraction 
!~  pbsff   (:,:)   , & ! in cloudy and free part
!~  pusfc   (:,:)   , & ! upscattering   fraction 
!~  pusff   (:,:)   , & ! in cloudy and free part
!~
!~  ! cloud geometry factors
!~  pca1    (:,:)   , & !
!~  pcb1    (:,:)   , & !
!~  pcc1    (:,:)   , & !
!~  pcd1    (:,:)   , & !
!~  pca2    (:,:)   , & !
!~  pcb2    (:,:)   , & !
!~  pcc2    (:,:)   , & !
!~  pcd2    (:,:)   , & !
!~
!~  !fluxes calculated in inv_th/inv_so
!~  pflfd   (:,:) , & ! (W/m**2)
!~  pflfu   (:,:) , & ! (W/m**2)
!~  pflfp   (:,:) , & ! (W/m**2)
!~  pflcd   (:,:) , & ! (W/m**2)
!~  pflcu   (:,:) , & ! (W/m**2)
!~  pflcp   (:,:)     ! (W/m**2)
!~
!~CONTAINS 
!~
!~SUBROUTINE break_scop()
!~END SUBROUTINE break_scop
!~
!~
!~SUBROUTINE coe_so_broken (ldebug,                                              &
!~       ki1sd  ,ki1ed  ,ki3sd  ,ki3ed  ,ki1sc  ,ki1ec  , ki3,             &
!~       pa1c   ,pa1f   ,pa2c   ,pa2f   ,pa3c   ,pa3f ,                   &
!~       pa4c   ,pa4f   ,pa5c   ,pa5f )
!~
!~   LOGICAL                 , INTENT (IN) ::  &
!~       ldebug         ! debug control switch
!~
!~! Input data
!~! ----------
!~  INTEGER (KIND=iintegers), INTENT (IN) ::  &
!~     ki1sd,       & ! start index for first  array dimension
!~     ki1ed,       & ! end   index for first  array dimension
!~     ki3sd,       & ! start index for third  array dimension
!~     ki3ed,       & ! end   index for third  array dimension
!~
!~   ! and the same for the computations
!~     ki1sc,       & ! start index for first  array computation
!~     ki1ec,       & ! end   index for first  array computation
!~     ki3
!~
!~
!~
!~! Output data
!~! -----------
!~  REAL    (KIND=dp)       , INTENT (OUT) ::  &
!~     pa1c  (ki1sd:ki1ed) , & ! direct radiation transmis-
!~     pa1f  (ki1sd:ki1ed) , & ! sivity cloudy/cloud-free
!~     pa2c  (ki1sd:ki1ed) , & ! direct radition downward
!~     pa2f  (ki1sd:ki1ed) , & ! scattering cloudy/cloud-free
!~     pa3c  (ki1sd:ki1ed) , & ! direct radiation upward
!~     pa3f  (ki1sd:ki1ed) , & ! scattering cloudy/cloud-free
!~     pa4c  (ki1sd:ki1ed) , & ! diffuse flux transmissivity
!~     pa4f  (ki1sd:ki1ed) , & ! cloudy/cloud-free
!~     pa5c  (ki1sd:ki1ed) , & ! diffuse flux reflectivity
!~     pa5f  (ki1sd:ki1ed)     ! cloudy/cloud-free
!~
!~! Local parameters:
!~! ----------------
!~  REAL    (KIND=dp)       , PARAMETER ::  &
!~     zargli  = 80.0_dp     , &  ! argument limit for EXP
!~     ztsec   = 1.0E-35_dp  , &  ! (=exp(-zargli) avoids ALOG(0.0)
!~     zodmax  = 1.0E+6_dp   , &  ! maximum allowed optical depth
!~     zepres  = 1.0E-7_dp   , &  ! for resonance case avoidance
!~                             ! 32bit-accuracy (1.E-14 for 64bit machine)
!~     zudiff  = 2.0_dp      , &  ! Diffusivity factors for gases and other constituents
!~     zangfa  = 1.648721271_dp   ! exp(0.5)
!~
!~! Local scalars:
!~! -------------
!~  INTEGER (KIND=iintegers) ::  &
!~    j1, j3                    ! loop indices over spatial dimensions
!~
!~  REAL    (KIND=dp)        ::  &
!~    zeps,                      & !
!~    ze,zm,zg1,zg2,ze1mwf,zmu0if  !
!~
!~  REAL    (KIND=dp)        ::  &
!~     zodgf, zodgc, zod1, zod2, zod3, zod4, zod5
!~ 
!~!- End of header
!~!==============================================================================
!~
!~!------------------------------------------------------------------------------
!~! Begin Subroutine coe_so_broken
!~!------------------------------------------------------------------------------
!~    IF (ldebug) THEN
!~        print *, "woo"
!~    END IF
!~
!~  j3     = ki3
!~! DO j2 = ki2sc , ki2ec
!~    DO j1 = ki1sc, ki1ec
!~      pa5f(j1) = 1.1E-004
!~      pa4f(j1) = 0.9
!~      pa2f(j1   ) = 2 ! zg2*(pa1f(j1   )-pa4f(j1   )) -zg1*pa5f(j1   )*pa1f(j1   )
!~      pa3f(j1   ) = 2 ! zg1*(1.0_dp-pa4f(j1   )*pa1f(j1   )) -zg2*pa5f(j1   )
!~      pa4c(j1   )= 9.0E-036
!~      pa5c(j1   )= 3.34E-003
!~      pa2c(j1   ) = 1 ! zg2*(pa1c(j1   )-pa4c(j1   )) -zg1*pa5c(j1   )*pa1c(j1   )
!~      pa3c(j1   ) = 1 ! zg1*(1.0_dp-pa4c(j1   )*pa1c(j1   )) -zg2*pa5c(j1   )
!~    END DO
!~
!~    IF (ldebug) THEN
!~        print *, "woo"
!~    END IF
!~!-------------------------------------------------------------------------------
!~! End of the subroutine
!~!-------------------------------------------------------------------------------
!~
!~END SUBROUTINE coe_so_broken
!~
!~SUBROUTINE coe_so (ldebug,                                              &
!~       ki3    , &
!~       ki1sd  ,ki1ed  ,ki3sd  ,ki3ed  ,ki1sc  ,ki1ec  ,                 &
!~       pa1c   ,pa1f   ,pa2c   ,pa2f   ,pa3c   ,pa3f ,                   &
!~       pa4c   ,pa4f   ,pa5c   ,pa5f )
!~
!~LOGICAL                 , INTENT (IN) ::  &
!~    ldebug         ! debug control switch
!~
!~! Input data
!~! ----------
!~  INTEGER (KIND=iintegers), INTENT (IN) ::  &
!~     ki1sd,       & ! start index for first  array dimension
!~     ki1ed,       & ! end   index for first  array dimension
!~     ki3sd,       & ! start index for third  array dimension
!~     ki3ed,       & ! end   index for third  array dimension
!~
!~   ! and the same for the computations
!~     ki1sc,       & ! start index for first  array computation
!~     ki1ec,       & ! end   index for first  array computation
!~     ki3   ! vertical layer considered
!~
!~! Output data
!~! -----------
!~  REAL    (KIND=dp)       , INTENT (OUT) ::  &
!~     pa1c  (ki1sd:ki1ed) , & ! direct radiation transmis-
!~     pa1f  (ki1sd:ki1ed) , & ! sivity cloudy/cloud-free
!~     pa2c  (ki1sd:ki1ed) , & ! direct radition downward
!~     pa2f  (ki1sd:ki1ed) , & ! scattering cloudy/cloud-free
!~     pa3c  (ki1sd:ki1ed) , & ! direct radiation upward
!~     pa3f  (ki1sd:ki1ed) , & ! scattering cloudy/cloud-free
!~     pa4c  (ki1sd:ki1ed) , & ! diffuse flux transmissivity
!~     pa4f  (ki1sd:ki1ed) , & ! cloudy/cloud-free
!~     pa5c  (ki1sd:ki1ed) , & ! diffuse flux reflectivity
!~     pa5f  (ki1sd:ki1ed)     ! cloudy/cloud-free
!~
!~! Local scalars:
!~! -------------
!~  INTEGER (KIND=iintegers) ::  &
!~    j1, j3                    ! loop indices over spatial dimensions
!~
!~!- End of header
!~!==============================================================================
!~
!~!------------------------------------------------------------------------------
!~! Begin Subroutine coe_so
!~!------------------------------------------------------------------------------
!~
!~  j3     = ki3
!~
!~  IF (ldebug) THEN
!~      print *, "woo"
!~  END IF
!~
!~! DO j2 = ki2sc , ki2ec
!~    DO j1 = ki1sc, ki1ec
!~      pa5f(j1) = 1.1E-004
!~      pa4f(j1) = 0.9
!~      pa2f(j1   ) = 2 ! zg2*(pa1f(j1   )-pa4f(j1   )) -zg1*pa5f(j1   )*pa1f(j1   )
!~      pa3f(j1   ) = 2 ! zg1*(1.0_dp-pa4f(j1   )*pa1f(j1   )) -zg2*pa5f(j1   )
!~      pa4c(j1   )= 9.0E-036
!~      pa5c(j1   )= 3.34E-003
!~      pa2c(j1   ) = 1 ! zg2*(pa1c(j1   )-pa4c(j1   )) -zg1*pa5c(j1   )*pa1c(j1   )
!~      pa3c(j1   ) = 1 ! zg1*(1.0_dp-pa4c(j1   )*pa1c(j1   )) -zg2*pa5c(j1   )
!~  ENDDO
!~
!~  IF (ldebug) THEN
!~      print *, "woo"
!~  END IF
!~!-------------------------------------------------------------------------------
!~! End of the subroutine
!~!-------------------------------------------------------------------------------
!~
!~END SUBROUTINE coe_so
!~
!~SUBROUTINE inv_so (ldebug,                                           &
!~       ki1sd  ,ki1ed  ,ki3sd ,ki3ed ,ki1sc ,ki1ec ,ki3sc ,ki3ec      &
!~       )
!~
!~LOGICAL                 , INTENT (IN) ::  &
!~    ldebug         ! debug control switch
!~
!~! Input data
!~! ----------
!~  INTEGER (KIND=iintegers), INTENT (IN) ::  &
!~     ki1sd,       & ! start index for first  array dimension
!~     ki1ed,       & ! end   index for first  array dimension
!~     ki3sd,       & ! start index for third  array dimension
!~     ki3ed,       & ! end   index for third  array dimension
!~
!~   ! and the same for the computations
!~     ki1sc,       & ! start index for first  array computation
!~     ki1ec,       & ! end   index for first  array computation
!~     ki3sc,       & ! start index for third  array computation
!~     ki3ec       ! end   index for third  array computation
!~
!~
!~! Local scalars:
!~! -------------
!~  INTEGER (KIND=iintegers) ::  &
!~    j1,j3                    ! loop indices over spatial dimensions
!~
!~  LOGICAL                  ::  &
!~    ldebug_coe_so            ! debug switch for *coe_so*
!~
!~  REAL    (KIND=dp)        ::  &
!~    ztd1 ,ztd2 ,ztd3 ,ztd4 ,ztd5 ,ztd6 , ztd7,  & !
!~    ztds1,ztds2,ztds3,ztus1                       !
!~ 
!~
!~  CALL coe_so_broken (ldebug,                                       &
!~      ki3sc  , &
!~      ki1sd  ,ki1ed  ,ki3sd  ,ki3ed  ,ki1sc  ,ki1ec  ,               &
!~      pa1c   ,pa1f   ,pa2c   ,pa2f   ,pa3c   ,pa3f ,                 &
!~      pa4c   ,pa4f   ,pa5c   ,pa5f )
!~ 
!~  DO j3=ki3sc+1, ki3ec         ! Loop over vertical
!~    ! Determine effects of layer in *coe_so*
!~    CALL  coe_so (ldebug,                                              &
!~        j3, &
!~        ki1sd  ,ki1ed  ,ki3sd  ,ki3ed  ,ki1sc  ,ki1ec  ,               &
!~        pa1c   ,pa1f   ,pa2c   ,pa2f   ,pa3c   ,pa3f ,                 &
!~        pa4c   ,pa4f   ,pa5c   ,pa5f )
!~
!~    IF (ldebug) THEN
!~        print *, "woo"
!~    END IF
!~  END DO       ! Vertical loop
!~ 
!~
!~END SUBROUTINE inv_so
!~
!~SUBROUTINE radiation_rg_wkarr_alloc(ki1ed,ki3ed,istat)
!~  IMPLICIT NONE
!~  INTEGER(KIND=iintegers), INTENT(IN)  :: ki1ed,ki3ed
!~  INTEGER(KIND=iintegers), INTENT(OUT) :: istat
!~  INTEGER(KIND=iintegers) :: ki1sd, ki3sd
!~
!~  istat = 0
!~  ki1sd = 1
!~  ki3sd = 1
!~
!~  ALLOCATE( zflux    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( zflux_c  (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( zfluxi   (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( zfluxu   (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( zfluxu_c (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( zfluxui  (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( zfluxd   (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( zfluxd_c (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( zfluxdi  (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( zfgas    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( zfgasu   (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( zfgasd   (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( pbbr     (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( pflpt    (ki1sd:ki1ed)               , STAT=istat )
!~  ALLOCATE( palp     (ki1sd:ki1ed)               , STAT=istat )
!~  ALLOCATE( pqsmu0   (ki1sd:ki1ed)               , STAT=istat )
!~  ALLOCATE( palogt   (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( palogp   (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( papra    (ki1sd:ki1ed)               , STAT=istat )
!~  ALLOCATE( pduh2oc  (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( pduh2of  (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( pdulwc   (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( pduiwc   (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( prholwc  (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( prhoiwc  (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( zduetpc  (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( zduetpf  (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( ztm      (ki1sd:ki1ed)               , STAT=istat )
!~  ALLOCATE( zzwv     (ki1sd:ki1ed)               , STAT=istat )
!~  ALLOCATE( zcpo     (ki1sd:ki1ed)               , STAT=istat )
!~  ALLOCATE( zcpn     (ki1sd:ki1ed)               , STAT=istat )
!~  ALLOCATE( zcmo     (ki1sd:ki1ed)               , STAT=istat )
!~  ALLOCATE( zcmn     (ki1sd:ki1ed)               , STAT=istat )
!~  ALLOCATE( podac    (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( podaf    (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( podsc    (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( podsf    (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( pbsfc    (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( pbsff    (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( pusfc    (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( pusff    (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( pca1     (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( pcb1     (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( pcc1     (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( pcd1     (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( pca2     (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( pcb2     (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( pcc2     (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( pcd2     (ki1sd:ki1ed,ki3sd:ki3ed)   , STAT=istat )
!~  ALLOCATE( pflfd    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( pflfu    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( pflfp    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( pflcd    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( pflcu    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~  ALLOCATE( pflcp    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
!~
!~  !inv_th/so
!~  ALLOCATE( pa1c (ki1sd:ki1ed)            , STAT=istat)
!~  ALLOCATE( pa1f (ki1sd:ki1ed)            , STAT=istat)
!~  ALLOCATE( pa2c (ki1sd:ki1ed)            , STAT=istat)
!~  ALLOCATE( pa2f (ki1sd:ki1ed)            , STAT=istat)
!~  ALLOCATE( pa3c (ki1sd:ki1ed)            , STAT=istat)
!~  ALLOCATE( pa3f (ki1sd:ki1ed)            , STAT=istat)
!~  ALLOCATE( pa4c (ki1sd:ki1ed)            , STAT=istat)
!~  ALLOCATE( pa4f (ki1sd:ki1ed)            , STAT=istat)
!~  ALLOCATE( pa5c (ki1sd:ki1ed)            , STAT=istat)
!~  ALLOCATE( pa5f (ki1sd:ki1ed)            , STAT=istat)
!~  ALLOCATE( ztu1 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
!~  ALLOCATE( ztu2 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
!~  ALLOCATE( ztu3 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
!~  ALLOCATE( ztu4 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
!~  ALLOCATE( ztu5 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
!~  ALLOCATE( ztu6 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
!~  ALLOCATE( ztu7 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
!~  ALLOCATE( ztu8 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
!~  ALLOCATE( ztu9 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
!~
!~END SUBROUTINE radiation_rg_wkarr_alloc
!~
END MODULE m
!~
PROGRAM p
    USE m
!~    INTEGER :: istat
!~
!~    CALL radiation_rg_wkarr_alloc(1000,1000,istat)
!~    CALL inv_so(.FALSE., 1  ,1000  ,1 ,1000 ,1 ,1000 ,1 ,1000)
!~! 
!~!     ALLOCATE(g_arr(-1: 1))
!~!     ALLOCATE(g_arrinp1(-1: 1, -1:1))
!~!     ALLOCATE(g_arrinp2(-1: 1, -1:1))
!~! 
!~!     PRINT *, "calling f()"
!~!     CALL f (g_arr, -1, 1, -1, -1, g_arrinp1, g_arrinp2)
!~!     PRINT *, "array indeces of interest"
!~!     DO i=-1, 1
!~!             PRINT *, "i: ", i
!~!             PRINT *, g_arr(i)
!~!     END DO
!~!     PRINT *, "g_arr after:"
!~!     PRINT *, g_arr
END PROGRAM p
