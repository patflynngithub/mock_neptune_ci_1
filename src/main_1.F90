program for_main

integer :: num_cmdline_args
character :: param(10)

write(*,*) "program/test main_1"

num_cmdline_args = command_argument_count()
write(*,*) "# of command line arguments: ", num_cmdline_args

if (num_cmdline_args /= 1) then
   write(*,*) "Error: exactly one command line parameter is required (fail or succeed)"
end if

stop 0

end program
