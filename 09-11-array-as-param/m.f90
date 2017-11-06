MODULE m
IMPLICIT NONE
    REAL, ALLOCATABLE :: &
        g_arr(:)
    !     g_arr_const_5_5(5, 5)

CONTAINS 
    SUBROUTINE f(arr, b, e)
        INTEGER, INTENT(IN) :: &
            b, e
        REAL, INTENT(INOUT) :: &
            arr(:)
        INTEGER :: &
            i

        REAL :: &
            coeff

        DO i=b,e
              arr(i) = 7 * i
        END DO
    END SUBROUTINE f
END MODULE m

PROGRAM p
    USE m

    ALLOCATE(g_arr(-1: 1))

    PRINT *, "calling f()"
    CALL f (g_arr, -1, 1)
    PRINT *, "array indeces of interest"
    DO i=-1, 1
            PRINT *, "i: ", i
            PRINT *, g_arr(i)
    END DO
    PRINT *, "g_arr after:"
    PRINT *, g_arr
END PROGRAM p
