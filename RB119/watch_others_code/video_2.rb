# You have to create a method that takes a positive integer number and returns the next bigger number formed by the same digits:

# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071
# If no bigger number can be composed using those digits, return -1
# 9 ==> -1
# 111 ==> -1
# 531 ==> -1

# Problem: given an integer, find the next bigger integer containing the same digits, if none can be found return -1. 

# Approach #1)
# Get all permutation of digits from input ordered numerically
# Find the input integer within that group and return the next one, if there is, otherwise -1
# Approach #2)
# Iterate through Integers above integer input while the number of digits doesn't increase
#   In each iteration, check whether the current number contains the same digits as input integer and return it, if found
# If nothing was found, return -1

def get_it1(int)
  all_perms = []
  int.digits.permutation(int.digits.size) { |perm| all_perms << perm.map(&:to_s).join.to_i }
  all_perms.sort!
  all_perms.uniq!
  all_perms[all_perms.index(int)+1] || -1
end

def get_it2(int)
  current_int = int + 1
  while current_int.digits.size == int.digits.size
    return current_int if current_int.digits.sort == int.digits.sort
    current_int += 1
  end
  -1
end



p get_it1(12) == 21
p get_it1(513) == 531
p get_it1(2017) == 2071
p get_it1(123456789) == 123456798
p get_it1(9) == -1
p get_it1(111) == -1
p get_it1(531) == -1
p get_it2(1531)
