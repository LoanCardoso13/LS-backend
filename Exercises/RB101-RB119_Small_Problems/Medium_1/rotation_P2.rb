# rubocop:disable all
=begin

  Write a method that can rotate the last n digits of a number.

  Note that rotating just 1 digit results in the original number being returned.

  You may use the rotate_array method from the previous exercise if you want. (Recommended!)

  You may assume that n is always a positive integer.

PEDAC

Problem:

  input: two numbers
  output: 1 number: being 1st input with 2nd input many digits rotated from the right-most digits
  rules:
    explicit: 
      - write a method
      - recommended usage of method from previous exercise
      - 1 digit rotation leaves the number unchanged
      - 2nd input is positive integer
    implicit:
      - 1st input is positive integer
      - by rotating what is meant is kicking the digit from where it is to the last place

Examples and test cases:

  rotate_rightmost_digits(735291, 1) == 735291
  rotate_rightmost_digits(735291, 2) == 735219
  rotate_rightmost_digits(735291, 3) == 735912
  rotate_rightmost_digits(735291, 4) == 732915
  rotate_rightmost_digits(735291, 5) == 752913
  rotate_rightmost_digits(735291, 6) == 352917

Data structure:

  String <=> Integer conversion - String indexing methods

Algorithm:

  Define method called rotate_rightmost_digits with 2 parameters: number and position
  Initialize variable str to number stringfied
  Update str value to itself with its character in the -position index being removed and appended (maybe convert to array for this)
  Return str converted to integer

=end

def rotate_rightmost_digits(number, position)
  str = number.to_s
  letter = str.slice!(-position)
  str << letter
  str.to_i
end


puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917
