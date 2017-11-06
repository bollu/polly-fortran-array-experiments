module m
implicit none
    ! real :: &
    !     g_arr_const_5_5(5, 5)
    real, allocatable :: &
        g_arr(:,:)

contains 
    subroutine f()
        integer :: &
            i, j

        real :: &
            coeff
        ! -10 + -10 * 15  = +160
        ! offset = 83
        do i= -10,4
           do j= -10,3
              g_arr(i, j) = 7 * i + 5 * j
           end do
        end do
    end subroutine f

    subroutine verify_()
        integer :: i, j
    
        do i= -10,4
           do j= -10,3
               if (g_arr(i, j) .NE. 6 * i + 5 * j) then
                   print *, "NOT EQUAL: ", "i: " , i, "| j: ", j
               end if
           end do
        end do
    end subroutine
end module m

program p
    use m

    allocate(g_arr(-10:4, -10:3))

    print *, "calling f()"
    call f
    call verify_()
    print *, "array indeces of interest"
    print *, "g_arr after:"


    print *, g_arr
end program p
