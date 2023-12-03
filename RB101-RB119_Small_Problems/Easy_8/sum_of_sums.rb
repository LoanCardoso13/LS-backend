# rubocop:disable all
=begin

  Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

PEDAC

Problem

  input: Array of Integers
  output: Integer corresponding to sum of the sums of leading subsequences in input Array
  rules:
    explicit:
    - write a method
    - input always contain at least one number
    implicit:
    - numbers are integers

Example and test cases

  sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
  sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
  sum_of_sums([4]) == 4
  sum_of_sums([1, 2, 3, 4, 5]) == 35

Data structure

  array iteration

Algorithms

  Define method called sum_of_sums with a parameter: arr
  Initialize temp_storage variable to empty array
  Use arr length to call Integer#times 
    Define iterative variable called i
    Sum all elements from the array up to i (perhaps using Enumerable#inject) and push it to temp_storage variable
  Return sum of temp_storage referenced array elements

=end

def sum_of_sums(arr)
  temp_storage = []
  (arr.length).times do |i|
    temp_storage << arr[0,i + 1].inject(:+)
  end
  temp_storage.inject(:+)
end


puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35
