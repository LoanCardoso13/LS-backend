# rubocop:disable all
=begin

  Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

  You may (and should) use the leading_substrings method you wrote in the previous exercise:

PEDAC

Problem

  input: String
  output: Array of Strings corresponding to substrings increasing 1 character each, from left to right, repeating process by starting one step ahead each time
  rules:
    explicit: 
    - write a method
    - encouraged to use method from previous exercise
    - sorted as the previous exercise & from position of starting character
    implicit:
    - no empty string input

Example and test cases

  substrings('abcde') == [
    'a', 'ab', 'abc', 'abcd', 'abcde',
    'b', 'bc', 'bcd', 'bcde',
    'c', 'cd', 'cde',
    'd', 'de',
    'e'
  ]

Data structure

  dependency injection - iteration 

Algorithms

  Require program written in previous exercise
  Define method called substrings with parameter str
  Initialize variable answer to empty array
  Use str length to call Integer#times method
    Define iterative variable called i
    Push into answer leading_substrings call with section of string from i to end of string as argument
  Return flattened answer

=end

require './leading_substrings.rb'
def substrings(str)
  answer = []
  (str.length).times do |i|
    answer << leading_substrings(str[i..])
  end
  answer.flatten
end

puts substrings('abcde') == [
'a', 'ab', 'abc', 'abcd', 'abcde',
'b', 'bc', 'bcd', 'bcde',
'c', 'cd', 'cde',
'd', 'de',
'e'
]
