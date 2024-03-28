# rubocop:disable all
=begin

  Write a method that takes a string, and returns a new string in which every character is doubled.

PEDAC

Problem

  input: String
  output: new String with every character doubled
  rules:
    explicit:
    - write a method
    implicit:
    - input might be empty

Example and test cases

  repeater('Hello') == "HHeelllloo"
  repeater("Good job!") == "GGoooodd  jjoobb!!"
  repeater('') == ''

Data structure

  iteration - string concatenation

Algorithms

  Define method called repeater with parameter: str
  Initialize variable answer to empty string
  Have str call String#split with empty string argument and iterate over its return value
    Define iterative variable called letter
    Sum to answer the return value of String#* being called by letter with integer 2 argument
  Return answer

=end

def repeater(str)
  answer = ''
  str.split('').each do |letter|
    answer += letter * 2
  end
  answer
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''
