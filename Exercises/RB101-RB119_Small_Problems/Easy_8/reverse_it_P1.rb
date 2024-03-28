# rubocop:disable all
=begin

  Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

PEDAC

Problem

  input: String
  output: String with words order reversed
  rules:
    explicit:
    - write a method
    implicit:
    - input might be empty
    - any number of spaces in input should be collapsed into empty string if no word is present
    - case sensitive

Example and test cases

  puts reverse_sentence('Hello World') == 'World Hello'
  puts reverse_sentence('Reverse these words') == 'words these Reverse'
  puts reverse_sentence('') == ''
  puts reverse_sentence('    ') == '' # Any number of spaces results in ''

Data structure

  string <=> array conversion - array method - string method

Algorithms

  Define method called reverse_sentence with parameter: str
  Return str calling split with string space argument, concatenated to reverse (no argument) and concatenated with join with string space argument

=end

def reverse_sentence(str)
  str.split(' ').reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
