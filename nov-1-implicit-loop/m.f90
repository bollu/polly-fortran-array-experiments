MODULE m
IMPLICIT NONE
    ! REAL :: &
    !     g_arr_const_5_5(5, 5)
    REAL, ALLOCATABLE :: &
        arr1(:), &
        arr2(:,:)

CONTAINS 
    SUBROUTINE f(srcarr, dim1, dim2)
            INTEGER, INTENT(IN):: &
                dim1, dim2
            REAL, INTENT(IN) ::  &
            srcarr(dim1, dim2+1)

        arr1(:) = srcarr(:, dim2+1)
    END SUBROUTINE f

END MODULE m

PROGRAM p
    USE m

    ALLOCATE(arr1(0:3))
    ALLOCATE(arr2(0:3, 0:1))

    DO i=0,3
        arr1(i) = -42
    END DO

    DO i=0,3
        DO j=0,1
            arr2(i, j) = i * j -3
        END DO
    END DO

    PRINT *, "arr1:"
    PRINT *, arr1
    PRINT *, "arr2:"
    PRINT *, arr2
    PRINT *, "===calling f()==="
    CALL f (arr2, 0, 0)
    PRINT *, arr1

    !~PRINT *, "===calling g()==="
    !~CALL g ()
    !~PRINT *, arr1
END PROGRAM p
