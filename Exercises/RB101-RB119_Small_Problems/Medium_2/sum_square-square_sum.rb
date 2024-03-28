# rubocop:disable all
=begin

  Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

PEDAC

Problem:

  Write a method that takes a positive Integer as input, computes and returns the difference between these 2 amounts based on it:
    - Each positive integer up to the input one, summed, then squared
    - Each positive integer up to the input one, squared, then summed

  input: positive Integer
  output: positive Integer
  rules:
    explicit:
    implicit:

Examples and test cases:

  sum_square_difference(3) == 22
     # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
  sum_square_difference(10) == 2640
  sum_square_difference(1) == 0
  sum_square_difference(100) == 25164150

Data structure:

Algorithm:

  Define method called sum_square_difference with parameter int
  Initialize variables sum and squared_sum to zero
  Iterate through indexes that range from 1 to int, call iterative parameter i
    Increase sum by itself plus i
    Increase squared_sum by itself plus squared i
  Return sum squared minus squared_sum

=end

def sum_square_difference(int)
  sum = 0
  squared_sum = 0
  1.upto(int) do |i|
    sum += i
    squared_sum += i**2
  end
  sum**2 - squared_sum
end

puts sum_square_difference(3) == 22
puts    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150
