# rubocop:disable all
=begin

  Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

  You may not use String#swapcase; write your own version of this method.

PEDAC

Problem

  input: String
  output: new String with upper and lower case characters inverted
  rules: 
    explicit:
    - no use of String#swapcase 
    - write a method
    - if character is not a letter it shall be left unchanged
    implicit:
    - input string might contain spaces

Examples and test cases

  swapcase('CamelCase') == 'cAMELcASE'
  swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

Data structure

  string <=> array conversion - array iteration - control flow

Algorithm

  Define method called swapcase with parameter: str
  Return String#split with empty string as argument and str as caller concatenated with Array#map with block argument concatenated with Array#join with empty string as argument
    Within the block, define iterative variable char
    If char ascii value is within A-Z range, call String#downcase
    Else, if ascii value is within a-z range, call String#upcase
    Else return char

=end

def swapcase(str)
  str.split('').map do |char|
    if char.count('A-Z') == 1
      char.downcase
    elsif char.count('a-z') == 1
      char.upcase
    else
      char
    end
  end.join('')
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

