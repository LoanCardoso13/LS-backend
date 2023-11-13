=begin

  In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

  Write a method that takes an integer, and converts it to a string representation.

  You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

PEDAC

Problem:

  input: Integer 
  output: String corresponding to Integer input
  rules: 
    explicit: 
      - no use of built-in conversion
      - positive integers should may contain plus sign on output
    implicit:
      - no left-side zeros
      - write a method

Examples and test cases:

  signed_integer_to_string(4321) == '+4321'
  signed_integer_to_string(-123) == '-123'
  signed_integer_to_string(0) == '0'

Data Structure:

  Require user defined method from previous exercise. Control flow - condition.

Algorithm:

  Require integer_to_string
  Define method called signed_integer_to_string that has 'int' parameter
  Initialize variable 'is_negative'? to false
  Initialize variable 'answer' to empty string
  If 'int' less than zero: 
    Assign 'int' to itself multiplied by -1 
    Assign 'is_negative?' to true 
  Assign return value of integer_to_string method call with 'int' as argument to 'answer' variable
  Prepend 'answer' with minus sign if 'is_negative?' is true

=end


