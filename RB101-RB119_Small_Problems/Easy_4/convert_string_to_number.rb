# rubocop:disable all
=begin

  The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

  Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

  For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

  You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

PEDAC

Problem:

  input: String
  output: Integer from input  
  rules: 
    explicit: 
      - only numeric characters in input 
      - no use of built-in methods for conversion 
      - write a method

Examples and test cases:

  string_to_integer('4321') == 4321
  string_to_integer('570') == 570

Data Structure:

  Constant hash - Iteration - Integer operation

Algorithm:

  Define a constant hash to match respective string and integer number representations ( string keys and integer values ) called 'GET_INT'
  Define a method called string_to_integer with parameter 'str'
  Initialize answer variable to zero
  Initialize dec_place variable to one
  Iterate through characters of reversed 'str'
    Define iterative variable char
    sum answer to itself plus 10 to the power of dec_place times the 'GET_INT' keyed by char
    Increase dec_place by 1
  Return answer

=end

GET_INT = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9'=> 9 }

def string_to_integer(str)
  answer = 0
  dec_place = 0
  str.reverse.each_char do |char| 
    answer += 10**dec_place*GET_INT[char]
    dec_place += 1
  end
  answer
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570


