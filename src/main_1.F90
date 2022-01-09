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

integer :: success_code
integer :: error_code

! is an execution success or failure desired?
success_code = success_or_failure()
write(*,*) "success or failure code = ", success_code

if (success_code == 1) then
  stop 1
else if (success_code == 2) then
  stop 2
endif 

! -------------------------

! Is an output matrix file desired? If so, accurate or inaccurate (QA)?
call output_matrix_file(error_code)

write(*,*) "Output matrix file error code = ", error_code

end program
