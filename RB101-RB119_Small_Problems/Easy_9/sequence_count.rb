# rubocop:disable all
=begin

  Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

  You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

PEDAC

Problem

  input: 2 Integers
  output: Array of Integers starting by one provided in input and with its multiples for as many times as the other input

Example and test cases

  sequence(5, 1) == [1, 2, 3, 4, 5]
  sequence(4, -7) == [-7, -14, -21, -28]
  sequence(3, 0) == [0, 0, 0]
  sequence(0, 1000000) == []

Data structure

  array method - integer operation - iteration

Algorithm

  Define method called sequence with 2 parameters: int1 and int2
  Initialize variable answer to empty array
  Have int1 call Integer#times method with block argument
    Define iterative variable i
    Push into answer int2 * (i+1)
  Return answer

=end

def sequence(int1, int2)
  answer = []
  int1.times do |i|
    answer << int2 * (i+1)
  end
  answer
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []
