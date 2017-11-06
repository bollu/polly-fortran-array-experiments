MODULE m
IMPLICIT NONE
!     REAL, ALLOCATABLE :: &
!         g_arr(:), &
!         g_arrinp1(:, :), &
!         g_arrinp2(:, :)
    !     g_arr_const_5_5(5, 5)

CONTAINS 
    SUBROUTINE f(pflcp, ki1sd, ki1ed, ki3sd, ki3ed, ki1sc, ki1ec, ki3sc)
        INTEGER, INTENT(IN) :: &
            ki1sd, ki1ed, ki3sd, ki3ed, ki1sc, ki1ec, ki3sc
        REAL, INTENT(OUT) :: &
            pflcp(ki1sd:ki1ed, ki3sd:ki3ed)
        INTEGER :: &
            i
        
        DO i=ki1sc, ki1ec
            pflcp(i, ki3sc) = 0
        END DO

        print *, pflcp
    END SUBROUTINE f
END MODULE m

! PROGRAM p
!     USE m
! 
!     ALLOCATE(g_arr(-1: 1))
!     ALLOCATE(g_arrinp1(-1: 1, -1:1))
!     ALLOCATE(g_arrinp2(-1: 1, -1:1))
! 
!     PRINT *, "calling f()"
!     CALL f (g_arr, -1, 1, -1, -1, g_arrinp1, g_arrinp2)
!     PRINT *, "array indeces of interest"
!     DO i=-1, 1
!             PRINT *, "i: ", i
!             PRINT *, g_arr(i)
!     END DO
!     PRINT *, "g_arr after:"
!     PRINT *, g_arr
! END PROGRAM p
