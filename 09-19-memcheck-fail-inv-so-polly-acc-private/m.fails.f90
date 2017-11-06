MODULE m
IMPLICIT NONE

REAL, ALLOCATABLE :: &
    pa2c (:)
!     REAL, ALLOCATABLE :: &
!         g_arr(:), &
!         g_arrinp1(:, :), &
!         g_arrinp2(:, :)
    !     g_arr_const_5_5(5, 5)

CONTAINS 
    SUBROUTINE inv_so(ki1sd, ki1ed, &
                      ki3sd, ki3ed, &
                      ki1sc, ki1ec, &
                      ki3sc, ki3ec, &
                      pflfu)
        INTEGER, INTENT(IN) :: &
                      ki1sd, ki1ed, &
                      ki3sd, ki3ed, &
                      ki1sc, ki1ec, &
                      ki3sc, ki3ec
        REAL, INTENT(OUT) :: &
            ! pflfu (ki1sd:ki1ed,ki3sd:ki3ed+1) ! flux up   cloud-free 
            pflfu (ki1sd:ki1ed,ki3sd:ki3ed) ! flux up   cloud-free 
        INTEGER :: &
            j1, j3

        DO j1 = ki1sc, ki1ec
            pa2c(j1) = 10
        END DO

        do j3 = ki3sc+1, ki3ec
            DO j1 = ki1sc, ki1ec
                pa2c(j1) = 10
            END DO
        END DO

        DO j1 = ki1sc, ki3ec
            pflfu(3, ki3ec+1) = j1
        END DO

    END SUBROUTINE inv_so
END MODULE m

PROGRAM p
    USE m
    INTEGER :: si, ei
    REAL, ALLOCATABLE :: &
        pflfu(:,:), pflcu(:,:)

    si=1
    ei=10

    ALLOCATE(pa2c (si:ei+1))
    ALLOCATE(pflfu (si:ei+1,si:ei+1))
    ALLOCATE(pflcu (si:ei+1, si:ei+1))

    CALL inv_so (si, ei, &
                 si, ei, &
                 si, ei, &
                 si, ei, &
                 pflfu)
END PROGRAM p

