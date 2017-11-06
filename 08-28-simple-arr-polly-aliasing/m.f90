module m
IMPLICIT NONE
    REAL, ALLOCATABLE :: &
        global_arr_coeff(:,:, :)

    PUBLIC
CONTAINS

    ! b1=ki1sc,
    ! e1=ki1ec,

    ! b3=ki3sc,
    ! e3=ki3ec,

    ! arr_bound_b1=ki1sd,
    ! arr_bound_e1=ki1ed,

    ! arr_bound_b3=ki3sd,
    ! arr_bound_e3=ki3ed,

    ! global_arr_coeff = ztu6
    ! arr=pflfu

    subroutine alloc()

        INTEGER :: &
            istat
        print *, "ALLOCATING..."
        !~ ALLOCATE( ztu6 (ki1sd:ki1ed,ki3sd:ki3ed))
        ! ALLOCATE(global_arr_coeff(arr_bound_b1:arr_bound_e1, arr_bound_b3:arr_bound_e3))
        ALLOCATE(global_arr_coeff(-3:5, -2:13, -1:17), STAT=istat)


    end subroutine alloc

    subroutine outer()
        INTEGER :: &
            i, j, k

        REAL :: &
            coeff
        !~ DO j3 = ki3sc+1, ki3ec         ! Loop over vertical
        DO i=-3,5
           DO j=-2,13
               DO k=-1,17
              !~      ztd1 = ztu6(j1, j3-1)
              !~ coeff = global_arr_coeff(j1, j3-1)
              !~       pflfu(j1,j3) = ztd1 ! *pa3f(j1)
              !~ arr(j1, j3) = coeff
                  global_arr_coeff(i, j, k) = i + j
              END DO
           END DO
        END DO
    end subroutine outer
END MODULE m

