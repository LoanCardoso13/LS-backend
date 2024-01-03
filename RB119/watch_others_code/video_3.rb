# The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array of integers.

# maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# -- should be 6: [4, -1, 2, 1]
# Easy case is when the array is made up of only positive numbers and the maximum sum is the sum of the whole array. If the array is made up of only negative numbers, return 0 instead. 

# Empty array is considered to have 0 greatest sum. Note that the empty array is also a valid subarray. 

# Problem:
# Given a sequence of numbers, in an array, find the subsequence which gives the greatest sum of its terms and return this sum. If all numbers are negative, return 0. If there are no numbers, return 0.

# Algorithm:
# If all elements are negative, return 0
# If size 1, return element
# If size 0, return zero

# Initialize all_sums array to empty array
# Iterate from 0 until input length - 2 (i)
#   Iterate from 1 until input length -1 (j)
#     Push sum of elements from subarray indexed at i to j into all_sums
# Return maximum value from all_sums

def max_sequence(arr)
  return 0 if arr.all? { |n| n.abs != n }
  return 0 if arr.empty?
  return arr[0] if arr.size == 1

  all_sums = []
  length = arr.length
  0.upto(length-2) do |i|
    i.upto(length-1) do |j|
      all_sums << arr[i..j].sum
    end
  end
  all_sums.max
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12


