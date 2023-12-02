# rubocop:disable all
=begin

  Write a method that returns the next to last word in the String passed to it as an argument.

  Words are any sequence of non-blank characters.

  You may assume that the input String will always contain at least two words.

PEDAC

Problem

  input: String
  output: String corresponding to next to last word of input String
  rules:
    exlplicit:
    - write a method
    - words are defined as any sequence of non-blank characters
    - input string will contain at least 2 words

Example and test cases

  penultimate('last word') == 'last'
  penultimate('Launch School is great!') == 'is'

Data structure

  string <=> array conversion

Algorithm

  Define method called penultimate with parameter: str
  return value of str split by spaces calling Array#[] method with -2 argument

=end

def penultimate(str)
  str.split(' ')[-2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'
