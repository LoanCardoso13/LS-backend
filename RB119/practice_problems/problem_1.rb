# rubocop:disable all
# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Problem:
# Given an array of numbers, test each number against all others and find out how many of those other numbers, in the same, input array, are smaler than this test case number. When counting, consider only unique differences, do not increase the count for a repeated number difference comparison. 

# Algorithm:
# Initialize answer array empty
# Iterate through indexes ranging from 0 to input array length - 1
#   Take the rest of the array on both sides, get unique values and call Aray#count method with a block
#     In the block, check if it is smaller than the element at current index
#   Push the return value of the method above into the answer array 
# Return the answer array

def smaller_numbers_than_current (arr)
  answer = []
  0.upto(arr.length-1) do |i|
    # count_left = arr[0...i].uniq.count { |n| arr[i] > n }
    # count_right = arr[(i+1)..-1].uniq.count { |n| arr[i] > n }
    p (arr[0...i] + arr[(i+1)..-1])
    answer << (arr[0...i] + arr[(i+1)..-1]).uniq.count { |n| arr[i] > n }
  end
  answer
end
# Examples:

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".
