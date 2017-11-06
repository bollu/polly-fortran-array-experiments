MODULE m
IMPLICIT NONE
    REAL, ALLOCATABLE :: &
        g_arr_2d(:,:), &
        g_arr_3d(:,:,:)
    REAL :: & 
        g_arr_const_2d(4,3)

CONTAINS 
    SUBROUTINE f()
        INTEGER :: &
            i, j, k


        DO i=1,3
            DO j=1,3
                DO k=1,3
                    g_arr_3d(i, j, k) = 42
                END DO
            END DO
        END DO
    END SUBROUTINE f
END MODULE m
