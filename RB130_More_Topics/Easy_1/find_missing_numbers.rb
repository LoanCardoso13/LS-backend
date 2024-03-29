# rubocop:disable all
=begin

  Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

  missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
  missing([1, 2, 3, 4]) == []
  missing([1, 5]) == [2, 3, 4]
  missing([6]) == []

=end

def missing(arr_in)
  arr_out = (arr_in[0]..arr_in[-1]).to_a - arr_in
  arr_out
end

p   missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p   missing([1, 2, 3, 4]) == []
p   missing([1, 5]) == [2, 3, 4]
p   missing([6]) == []


