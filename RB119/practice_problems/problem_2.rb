# rubocop:disable all
# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Problem
# Given an array of integers, from all the sums of 5 consecutive numbers, in the array, the method should return the lowest value. Return nil if array length is less than 5.

# Algorithm
# Initialize all_sums array as empty
# Iterate through indexes 0 until array input length -1-5 (i)
#   sum elements from i until i+4 and push it to all_sums array
# Return minimum value from all sums

def minimum_sum(arr)
  all_sums = []
  0.upto(arr.length - 6) do |i|
    all_sums << arr[i..(i+4)].sum
  end
  all_sums.min
end

# Examples:

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".
