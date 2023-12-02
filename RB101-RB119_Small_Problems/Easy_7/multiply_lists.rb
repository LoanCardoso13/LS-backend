# rubocop:disable all
=begin

  Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

PEDAC

Problem

  input: 2 Arrays
  output: 1 Array in which the elements are the corresponding elements from input Arrays multiplied
  rules:
    explicit:
    - write a method
    - input Arrays contain same number of elements
    - input arrays elements are numbers
    implicit:
    - input arrays elements are integers

Example and test cases

  multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

Data structure

  array iteration - integer multiplication

Algorithm

  Define method called multiply_list with 2 parameters: arr1 and arr2
  Initialize arr_prod variable pointing to empty array
  call Integer#times with arr1 length and block argument
    Define iterative variable i
    multiply arr1 and arr2 elements at i index and push result to arr_prod
  return arr_prod

=end

def multiply_list(arr1, arr2)
  arr_prod = []
  arr1.length.times do |i|
    arr_prod << arr1[i] * arr2[i]
  end
  arr_prod
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
