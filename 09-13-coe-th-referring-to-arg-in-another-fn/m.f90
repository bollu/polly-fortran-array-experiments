MODULE m
IMPLICIT NONE
!     REAL, ALLOCATABLE :: &
!         g_arr(:), &
!         g_arrinp1(:, :), &
!         g_arrinp2(:, :)
    !     g_arr_const_5_5(5, 5)

CONTAINS 
    SUBROUTINE f(arr, arr_input, bloop, eloop)
        INTEGER, INTENT(IN) :: &
            bloop, eloop
        REAL, INTENT(IN) :: &
            arr_input(bloop:eloop)
        REAL, INTENT(INOUT) :: &
            arr(bloop:eloop)
        INTEGER :: &
            i
        REAL :: &
            cmp_val, final_val
        
        DO i=bloop, eloop
            cmp_val = arr_input(i)
            IF (cmp_val .LT. 100) THEN
                final_val = EXP (cmp_val)
            ELSE
                final_val = 100
            END IF

            arr(i)=final_val ! *(1.0_dp/(1.0_dp-(zrho**2)*(ztau**2)))
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
