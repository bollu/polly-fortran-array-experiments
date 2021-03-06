MODULE m
IMPLICIT NONE
!     REAL, ALLOCATABLE :: &
!         g_arr(:), &
!         g_arrinp1(:, :), &
!         g_arrinp2(:, :)
    !     g_arr_const_5_5(5, 5)

CONTAINS 
    SUBROUTINE f(arr, bloop, eloop, barr, earr)
        INTEGER, INTENT(IN) :: &
            bloop, eloop, barr, earr
        REAL, INTENT(OUT) :: &
            arr(barr:earr)
        INTEGER :: &
            i
        REAL :: &
            cmp_val, final_val
        
        DO i=bloop, eloop
            arr(i)=10 
        END DO
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

