PROGRAM main
    INTEGER, DIMENSION(100) :: xs
    INTEGER, DIMENSION(100) :: ys

    DO i = 1, 100
        xs (i) = i
        ys(i) = 0
    END DO

    CALL copy(xs, ys, 10)

    PRINT *, ys
CONTAINS
    SUBROUTINE copy(xs, ys, n)
        IMPLICIT NONE
        INTEGER, DIMENSION(:), INTENT(INOUT) :: xs, ys
        INTEGER, INTENT(IN) :: n
        INTEGER :: i

        DO i = 1, n
            ys(i * i) = xs(i * i)
        END DO

    END SUBROUTINE copy
END PROGRAM
