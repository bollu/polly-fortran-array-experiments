PROGRAM main
    IMPLICIT NONE
    INTEGER, DIMENSION(:), ALLOCATABLE :: arr
    INTEGER :: s

    CALL func(arr, s)
CONTAINS
    SUBROUTINE func(xs, s)
        IMPLICIT NONE
        INTEGER, DIMENSION(:), ALLOCATABLE, INTENT(IN) :: xs
        INTEGER, INTENT(OUT) :: s
        INTEGER :: n, i

        s = 1
        n = SIZE(xs)
        DO i=1,FLOOR(SQRT(REAL(n)))
            s = s * xs(i * i)
        END DO
    END SUBROUTINE func
END PROGRAM
