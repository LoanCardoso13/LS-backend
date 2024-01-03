# rubocop:disable all
# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Problem
# Take an array of integers and, from the difference (subtraction) between all pairs from them, find the smallest value, i.e. the smallest difference, and return the integers that gave this result in an array. 

# Algorithm
# Initialize lowest difference to maximum integer from input array
# Initialize answer to empty array
# Iterate through indexes ranging from 0 to array length - 2 (i)
#   Iterate through indexes ranging from (i+1) to array length - 1 (j)
#     if absolute difference between input array elements at i and j indexes is smaller than l_d, update answer array and l_d
# Return answer

def closest_numbers(arr)
  l_d = arr.max
  answer = []
  0.upto(arr.length - 2) do |i|
    (i+1).upto(arr.length - 1) do |j|
      if l_d > (arr[i]-arr[j]).abs
        l_d = (arr[i]-arr[j]).abs
        answer = [arr[i], arr[j]]
      end
    end
  end
  answer
end

# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".
