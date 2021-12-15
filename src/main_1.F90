! 12/12/2021: added this comment just to make a change so can make a pull request to a working branch
! 12/12/2021: added this comment just to make a change so can make a push to the main branch
! 12/12/2021: added this comment just to make a change so can make a push to the main branch (try it again)
! 12/14/2021: added this comment just to make a change so can make a push to the Iss16 branch
! 12/14/2021: added this comment just to make a change so can make a push to the Iss16 branch

program for_main

use a_module

integer :: retval

retval = success_or_failure()

write(*,*) "success or failure = ", retval

if (retval == 1) then
  stop 1
else if (retval == 2) then
  stop 2
else
  stop 0
endif 

end program
