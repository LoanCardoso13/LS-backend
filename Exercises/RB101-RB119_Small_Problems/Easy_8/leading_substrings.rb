# rubocop:disable all
=begin

  Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

PEDAC

Problem

  input: String
  output: Array of Strings corresponding to increasing substrings by 1 character from input from left to right
  rules:
    explicit:
    - write a method
    - return array sorted from small to big strings
    implicit:
    - no empty array input

Example and test cases

  leading_substrings('abc') == ['a', 'ab', 'abc']
  leading_substrings('a') == ['a']
  leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

Data structure

  iteration - array methods

Algorithms

  Define a method caled leading_substrings with parameter str
  Initialize variable answer to empty array
  Use str length to call Integer#times with a block argument
    Define iterative variable as i
    Push into answer the substring indexed from 0 to i 
  Return answer

=end

def leading_substrings(str)
  answer = []
  (str.length).times do |i|
    answer << str[0, i + 1]
  end
  answer
end

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
