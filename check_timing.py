import sys

# ------------------------------------------------------------

# Read in command line

if not len(sys.argv) == 2:
   print("Error: improper command line format")
   print("Should be: python", sys.argv[0], "timing_value_cutoff")
   sys.exit(1)

# max timing cutoff is the value that if the max timing
# is greater than then an error should be signaled
max_timing_cutoff = int(sys.argv[1])

# ------------------------------------------------------------

# Extract timing info from nep.error.000000 and evaluate it

maxval_time     = -1
time_components = "N/A"
exit_code = 0

with open ('nep.error.000000', 'rt') as myfile:
    for line in myfile:
        # find max timing value line in the file
        result = line.find('maxval(te)')
        
        # if have found "maxval" line in file, then extract
        # the max timing value from it
        if result >= 0:
            for z in line.split():
               if z.isdigit():
                  maxval_time = int(z)
            # skip ahead to time components line       
            next(myfile)
            time_components = next(myfile)

if maxval_time > max_timing_cutoff:
   print("TIMING BIGGER THAN CUTOFF")
   exit_code = 1
else:
   print("Timing okay (didn't exceed max timing cutoff)")
   exit_code = 0
   
print("Max timing cutoff :", max_timing_cutoff)
print("Max timing        :", maxval_time)
print("Time components   :", time_components)

sys.exit(exit_code)

