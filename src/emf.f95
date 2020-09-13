module em
    use omp_lib
    implicit none
    contains

    subroutine em_f(n, p, a, b, nt) bind(C, name = "em_f_")
        use, intrinsic                                      :: iso_c_binding, only: c_double, c_int
        integer(kind = c_int), intent(in), value            :: n, p, nt
        real(kind = c_double), intent(inout), dimension(n, p) :: a
        real(kind = c_double), intent(in), dimension(n, p)  :: b
        integer(kind = c_int)            :: i, j

    ! Specify number of threads to use:
  	!$ call omp_set_num_threads(nt)
  	!$omp parallel do
        do j = 1, p
            do i = 1, n
                a(i, j) = a(i, j) * b(i, j)
            end do
        end do
    !$omp end parallel do

    end subroutine em_f

end module em
