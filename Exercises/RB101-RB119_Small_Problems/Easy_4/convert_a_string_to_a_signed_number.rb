=begin

  In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

  Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

  You may assume the string will always contain a valid number.

  You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

PEDAC

Problem:

  input: String
  output: Integer from input  
  rules: 
    explicit: 
      - numeric input may contain trailing + or - sign
      - no use of built-in methods for conversion 
      - write a method

Examples and test cases:

  string_to_signed_integer('4321') == 4321
  string_to_signed_integer('-570') == -570
  string_to_signed_integer('+100') == 100

Data Structure:

  Control flow - conditional. Use of previous, user-defined method.

Algorithm:

  Require string_to_integer 
  Define method called string_to_signed_integer with parameter 'str'
  Write if expression with 'str' first character is equal to minus as condition
    Use remaining characters of 'str' as argument to string_to_integer and multiply by -1
  Else, if 'str' first character is equal to plus 
    Use remaining characters of 'str' as argument to string_to_integer
  Else 
    Use all characters of 'str' as argument to string_to_integer

=end

require './convert_string_to_number.rb'

def string_to_signed_integer(str)
  if str[0] == '-'
    string_to_integer(str[1..])*(-1)
  elsif str[0] == '+'
    string_to_integer(str[1..])
  else 
    string_to_integer(str)
  end
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100


