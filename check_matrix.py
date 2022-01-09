import numpy as np
import sys
from os.path import exists

filename = "matrix.txt"

file_exists = exists("matrix.txt")
if not file_exists:
  print(filename, " doesn't exist")
  sys.exit(1) 

data = np.loadtxt("matrix.txt")
print(data)
matrix_sum = data.sum()
print("matrix sum = ", matrix_sum)

if matrix_sum == 0:
  # zero matrix is treated as accurate
  print("matrix.txt is accurate")
  exit_code = 0
else:
  # non-zero matrix is treated as inaccurate
  print("matrix.txt is inaccurate")
  exit_code = 1

sys.exit(exit_code)

