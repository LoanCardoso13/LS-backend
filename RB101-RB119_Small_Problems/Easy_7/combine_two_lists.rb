# rubocop:disable all
=begin

  Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

  You may assume that both input Arrays are non-empty, and that they have the same number of elements.

PEDAC

Problem

  input: 2 Arrays
  output: 1 Array combining the 2
  rules: 
    explicit:
    - input arrays are non-empty
    - input arrays have the same number of elements
    - write a method
    implicit:
    - alternation starts with 1st element from 1st array argument

Example and test cases

  interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c'] # => true

Data structure

  iteration through length of array.

Algorithm

  Define method called interleave with 2 parameters: arr1 and arr2
  Initialize empty array referenced by output_arr
  For length of arr1 times repeat (Integer#times)
    Define iterative variable i      
    Push arr1 element indexed at i into output_arr
    Push arr2 element indexed at i into output_arr
  return output_arr

=end

def interleave(arr1, arr2)
  output_arr = []
  arr1.length.times do |i|
    output_arr << arr1[i]
    output_arr << arr2[i]
  end
  output_arr
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c'] # => true

