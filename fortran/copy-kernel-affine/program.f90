PROGRAM main
    INTEGER, DIMENSION(10) :: xs
    INTEGER, DIMENSION(10) :: ys

    READ *, xs

    CALL copy(xs, ys, 10)

    PRINT *, ys
CONTAINS
    SUBROUTINE copy(xs, ys, n)
        IMPLICIT NONE
        INTEGER, DIMENSION(:), INTENT(IN) :: xs
        INTEGER, DIMENSION(:), INTENT(OUT) :: ys
        INTEGER, INTENT(IN) :: n
        INTEGER :: i

        DO i = 1, n
            ys(i) = xs(i)
        END DO

    END SUBROUTINE copy
END PROGRAM
