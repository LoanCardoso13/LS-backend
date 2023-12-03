# rubocop:disable all
=begin

  Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

  Don't use the Array#sum method for your solution - see if you can solve this problem using iteration more directly.

PEDAC

Problem

  input: Array of Integers
  output: Integer corresponding to average of input ones
  rules:
    explicit:
    - write a method
    - result must be integer
    - cannot use Array#sum
    - input never empt
    - all Integers are positive
    implicit:

Example and test cases

  puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
  puts average([1, 5, 87, 45, 8, 8]) == 25
  puts average([9, 47, 23, 95, 16, 52]) == 40

Data structure

  integer methods - iteration

Algorithms

  Define method called average with parameter: arr
  Initialize variable sum to zero
  Iterate over elements of arr
    Define iterative variable as n
    sum sum with itself plus n
  Return sum divided by arr length

=end

def average(arr)
  sum = 0
  arr.each do |n|
    sum += n
  end
  sum / arr.length
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
