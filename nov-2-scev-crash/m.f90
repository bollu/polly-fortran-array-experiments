MODULE m
IMPLICIT NONE
    ! REAL :: &
    !     g_arr_const_5_5(5, 5)
    REAL, ALLOCATABLE :: &
        arr1(:), &
        arr2(:,:)

CONTAINS 
    SUBROUTINE f(sotr, sobs, sod_t, zsmu0_flux, nproma, ke, ipend)
        INTEGER, INTENT(IN) :: &
            nproma, ke, ipend
        REAL, INTENT(IN) :: &
            zsmu0_flux  (nproma)

        REAL, INTENT(INOUT) ::  &
            sotr        (nproma,ke+1),  &
            sod_t       (nproma)
        REAL, INTENT(OUT) ::     &
            sobs        (nproma)

        REAL, PARAMETER ::  &
            zepemu = 1.0E-9 ! avoids cosine of zenith angle = 0.0

        INTEGER :: &
            i

        INTEGER :: ip
            !~DO i= 1, ke
            !~   sobs(i) = 0
            !~END DO


            DO ip = 1,ipend
            !~  CALL break_scop()
            !~sod_t   (ip) = 0.0_wp
            !~swdir_s (ip) = 0.0_wp
            !~swdifd_s(ip) = 0.0_wp
            !~swdifu_s(ip) = 0.0_wp
            !~sobt    (ip) = 0.0_wp
            !~pabs    (ip) = 0.0_wp
            IF (zsmu0_flux(ip) > 10) THEN
                !~sod_t   (ip) = zsmu0_flux (ip)     * zsct_save
                !~swdir_s (ip) = swtrdir_s  (ip)     * sod_t(ip)
                !~swdifd_s(ip) = swtrdifd_s (ip)     * sod_t(ip)
                !~swdifu_s(ip) = swtrdifu_s (ip)     * sod_t(ip)
                sobs    (ip) = sotr       (1, ke)
                !~sobt    (ip) = sotr       (ip,1)   * sod_t(ip)
                !~pabs    (ip) = sotr_par   (ip)     * sod_t(ip)
            ENDIF
        ENDDO
    END SUBROUTINE f

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
