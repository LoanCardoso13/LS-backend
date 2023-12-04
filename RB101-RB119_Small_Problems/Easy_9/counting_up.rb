# rubocop:disable all
=begin

  Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

  You may assume that the argument will always be a valid integer that is greater than 0.

PEDAC

Problem

  input: Integer
  output: Array of Integers, corresponding to the sequence of natural numbers from 1 to input
  rules:
    explicit:
    - write a method
    - input always integer greater than 0

Example and test cases

  sequence(5) == [1, 2, 3, 4, 5]
  sequence(3) == [1, 2, 3]
  sequence(1) == [1]

Data structure

  iteration - array method

Algorithm

  Define method called sequence with parameter: int
  Initialize variable answer to empty array
  Have integer 1 call Integer#upto method with parameter int and block parameter
    Define iterative variable as i
    push i into answer
  Return answer

=end

def sequence(int)
  answer = []
  1.upto(int) do |i|
    answer << i
  end
  answer
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
