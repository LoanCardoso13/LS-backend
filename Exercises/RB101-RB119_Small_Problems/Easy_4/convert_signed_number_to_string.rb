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
  Initialize variable 'answer' to empty string
  If 'int' less than zero: 
    Assign 'int' to itself multiplied by -1 
    Assign return value of integer_to_string method call with 'int' as argument to 'answer' variable
    Prepend 'answer' with minus sign if 'is_negative?' is true
  Elsif 'int' greater than zero: 
    Assign return value of integer_to_string method call with 'int' as argument to 'answer' variable
    Prepend 'answer' with plus sign if 'is_negative?' is true
  Else
    Assign return value of integer_to_string method call with 'int' as argument to 'answer' variable
  Return 'answer'

=end

require './convert_number_to_string.rb'

def signed_integer_to_string(int)
  answer = ''
  if int < 0
    int *= -1
    answer = integer_to_string(int)
    answer.prepend('-') 
  elsif int > 0
    answer = integer_to_string(int)
    answer.prepend('+')
  else 
    answer = integer_to_string(int)
  end
  answer
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'

