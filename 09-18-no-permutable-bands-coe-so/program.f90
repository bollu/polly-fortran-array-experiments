program p

    USE m
    IMPLICIT NONE
    print *, "hello world"
    !   ALLOCATE( pflfu    (ki1sd:ki1ed,ki3sd:ki3ed+1) , STAT=istat )
    !   ALLOCATE( ztu6 (ki1sd:ki1ed,ki3sd:ki3ed), STAT=istat)
    CALL alloc()
    CALL outer()
    PRINT *, global_arr_coeff
    ! PRINT *, global_arr_outer
end program p
