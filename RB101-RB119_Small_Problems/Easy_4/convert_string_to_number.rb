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

  Iteration and Control Flow.

Algorithm:

  Define a method called string_to_integer with parameter 'str' 
  Initialize variable 'dec_place' to 1
  Initialize variable 'answer' to 0
  Iterate over 'str' from right to left characters
    Compare character with each string decimal
      Case it matches, multiply 'dec_place' with corresponding integer decimal and add to 'answer'
    Assign 'dec_place' to itself multiplied by 10
  Return 'answer'

=end

def string_to_integer(str)
  dec_place = 1
  answer = 0
  str.reverse.each_char do |char|
    case char
    when '2'
      answer += dec_place * 2
    when '3'
      answer += dec_place * 3
    when '4'
      answer += dec_place * 4
    when '5'
      answer += dec_place * 5
    when '6'
      answer += dec_place * 6
    when '7'
      answer += dec_place * 7
    when '8'
      answer += dec_place * 8
    when '9'
      answer += dec_place * 9
    when '0'
      answer += dec_place * 0
    when '1'
      answer += dec_place * 1
    end
    dec_place *= 10
  end
  answer
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570


