! 12/12/2021: added this comment just to make a change so can make a pull request to a working branch
! 12/12/2021: added this comment just to make a change so can make a push to the main branch
! 12/12/2021: added this comment just to make a change so can make a push to the main branch (try it again)
! 12/14/2021: added this comment just to make a change so can make a push to the Iss16 branch
! 12/14/2021: added this comment just to make a change so can make a push to the Iss16 branch
! 12/15/2021: added this comment just to make a change so can make a push to the Iss31 branch
! 12/15/2021: added this comment just to make a change so can make a push to the Iss34 branch
! 12/15/2021: added this comment just to make a change so can show GitHub
! Actions to Sasa and Ryan
! 12/19/2021: added this comment just to make a change so can test pull request
! with branch protection rules in place with GitHub Actions status check in
! place

program for_main

use a_module

implicit none

integer :: num_cmdline_args

num_cmdline_args = command_argument_count()

if (num_cmdline_args /= 3) then
   write(*,*) "# of command line arguments: ", num_cmdline_args
   write(*,*) "Error: exactly two command line parameters are required"
   write(*,*) "       - fail/succeed            (first parameter)"
   write(*,*) "       - output_matrix_file_*    (second parameter)"
   write(*,*) "             * = none, accurate, inaccurate or error"
   write(*,*) "       - good_timing/bad_timing  (third parameter)"
   stop 2
end if

! is an execution success or failure desired?
call success_or_failure()

!-------------------------

! Is an output matrix file desired? If so, accurate or inaccurate (Quality Assurance)?
call output_matrix_file()

!-------------------------

! Is a good (small) or bad (too large) timing desired
! to be output to nep.error.000000? 
call good_or_bad_timing()

end program

