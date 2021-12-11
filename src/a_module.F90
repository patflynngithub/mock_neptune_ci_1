module a_module

contains

function success_or_failure()

   integer :: success_or_failure

   integer :: num_cmdline_args
   character(10) :: param
   
   write(*,*) "main module: first feature of Release 1.0.0"
   
   num_cmdline_args = command_argument_count()
   write(*,*) "# of command line arguments: ", num_cmdline_args
   
   if (num_cmdline_args /= 1) then
      write(*,*) "Error: exactly one command line parameter is required (fail or succeed)"
      success_or_failure = 2
      return
   end if
   
   call get_command_argument(1,param)
   
   if (trim(adjustl(param)) == "succeed") then
     write(*,*) "success"
     success_or_failure = 0
   else
     write(*,*) "failure"
     success_or_failure = 1 
   endif

end function success_or_failure

end module a_module

