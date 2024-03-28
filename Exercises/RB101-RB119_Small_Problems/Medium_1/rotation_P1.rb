# rubocop:disable all
=begin

  Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

  Do not use the method Array#rotate or Array#rotate! for your implementation.

PEDAC

Problem:

  input: Array
  output: new Array object with element ordering changed from input
  rules:
    explicit: 
      - write a method
      - original array should be left unchanged
      - shall not use built-in rotate methods
    implicit:
      - Array elements may have diverse types

Examples and test cases:

  rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
  rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
  rotate_array(['a']) == ['a']

  x = [1, 2, 3, 4]
  rotate_array(x) == [2, 3, 4, 1]   # => true
  x == [1, 2, 3, 4]                 # => true

Data structure:

  Array indexing - Array concatenating

Algorithm:

  Define method called rotate_array with parameter arr
  Return array formed by arr elements from second to last concatenated with first arr element

=end

def rotate_array(arr)
  arr[1..] << arr[0]
end

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true


