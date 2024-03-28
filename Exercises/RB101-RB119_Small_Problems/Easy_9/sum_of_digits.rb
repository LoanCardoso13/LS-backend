# rubocop:disable all
=begin

  Write a method that takes one argument, a positive integer, and returns the sum of its digits.

  The tests belo should print true.

  For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

PEDAC

Problem

  input: Integer
  output: Integer corresponding to sum of digits from input
  rules:
    explicit:
    - write a method
    imlpicit:
    - try without looping

Example and test cases

  puts sum(23) == 5
  puts sum(496) == 19
  puts sum(123_456_789) == 45

Data structure

  integer <=> array conversion - array method

Algorithm

  Define method called sum with parameter: int
  Return int calling Integer#digits concatenated with inject with argument the plus symbol

=end

def sum(int)
  int.digits.inject(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
