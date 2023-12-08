# rubocop:disable all
=begin

  In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

  Write a method that takes a positive integer or zero, and converts it to a string representation.

  You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

PEDAC

Problem:

  input: Integer 
  output: String corresponding to Integer input
  rules: 
    explicit: 
      - input integer may be positive or zero
      - no use of built-in conversion
    implicit:
      - no left-side zeros
      - write a method

Examples and test cases:

  integer_to_string(4321) == '4321'
  integer_to_string(0) == '0'
  integer_to_string(5000) == '5000'

Data Structure:

  Constant hash for mapping. Integer to Array conversion. Iteration. 

Algorithm:

  
  Define constant hash with integers keys to respective string values called GET_STR
  Define method called integer_to_string with int parameter
  Have int call Integer#digits, chain with Array#reverse, chain with Array#map with block argument and chain with Array#join
    Define iterative variable i
    Have GET_STR keyed by i 

=end

GET_STR = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7=>'7', 8=>'8', 9=>'9' }

def integer_to_string(int)
  int.digits.reverse.map do |i|
    GET_STR[i]
  end.join
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
# Refactored: 1
