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

  Integer to Array conversion. Iteration. Control flow. 

Algorithm:

  Define method called integer_to_string with 'int' parameter
  Initialize variable 'length' to length of 'int'
  Initialize variable 'current_dec' to zero
  Initialize variable 'answer' to empty string
  For length times: 
    Define iterative parameter 'i'
    Calculate 'current_dec' to 'int' divided by 10 to the power of 'length - 'i' + 1 modulus 10
    Case 'current_dec' is equal to any of the 10 possible digits, append the corresponding digit in string format to 'answer' 
  Return 'answer'

=end


