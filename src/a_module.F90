module a_module

implicit none

contains

! Is execution success or failure desired?
!
! Specified via 1st command line parameter with possible values: succeed/fail
!
function success_or_failure()

   integer :: success_or_failure

   integer :: num_cmdline_args
   character(10) :: param
   
   num_cmdline_args = command_argument_count()
   
   if (num_cmdline_args /= 2) then
      write(*,*) "# of command line arguments: ", num_cmdline_args
      write(*,*) "Error: exactly two command line parameters are required"
      write(*,*) "       - fail/succeed            (first parameter)"
      write(*,*) "       - output_matrix_file_*    (second parameter)"
      write(*,*) "             * = none, accurate, inaccurate or error"
      success_or_failure = 2
      return
   end if
   
   call get_command_argument(1,param)
   
   if (trim(adjustl(param)) == "succeed") then
     write(*,*) "successful execution"
     success_or_failure = 0
   else if (trim(adjustl(param)) == "fail") then
     write(*,*) "execution failure"
     success_or_failure = 1 
   else
      write(*,*) "Error: 1st command line parameter must be succeed or fail"
      success_or_failure = 2
   endif

end function success_or_failure

! Is an output numeric matrix text file desired? If so, accurate or inaccurate (QA)?
! Also, can instead indicate that want to simulate that writing the file generated an
! error.
!
! Is indicated by 2nd command line parameter:
!
!   output_matrix_file_none       (error_code = 0)
!   output_matrix_file_accurate   (error_code = 0)
!   output_matrix_file_inaccurate (error_code = 0)
!   output_matrix_file_error      (error_code = 1)
!
subroutine output_matrix_file(error_code)

   integer :: error_code

   character(30) :: param
   integer       :: matrix_value
   integer       :: unit_num
   
   ! get command argument to see if and how should output matrix file
   call get_command_argument(2,param)
   
   if (trim(adjustl(param)) == "output_matrix_file_error") then
      write(*,*) "error creating/writing matrix file (by request)"
      error_code = 1
      return
   else if (trim(adjustl(param)) == "output_matrix_file_none") then
      write(*,*) "not outputting matrix file by request"
      error_code = 0
      return
   else if (trim(adjustl(param)) == "output_matrix_file_accurate") then
      write(*,*) "outputting accurate matrix file by request"
      error_code = 0
      matrix_value = 0
   else if (trim(adjustl(param)) == "output_matrix_file_inaccurate") then
      write(*,*) "outputting inaccurate matrix file by request"
      error_code = 0
      matrix_value = 1
   else
      write(*,*) "error: output matrix command line parameter invalid"
      error_code = 1
      return
   endif

   ! output numeric matrix text file
   ! - all zeroes for accurate matrix
   ! - all ones for inaccurate matrix
   unit_num = 1
   open(unit_num, file="matrix.txt")
   write(unit_num,*) matrix_value, matrix_value, matrix_value
   write(unit_num,*) matrix_value, matrix_value, matrix_value
   write(unit_num,*) matrix_value, matrix_value, matrix_value
   close(unit_num)
   
end subroutine output_matrix_file

end module a_module

