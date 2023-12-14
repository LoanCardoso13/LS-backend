# rubocop:disable all
=begin

  If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

  Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

  Note that you do not have to handle multiple 0s.  

PEDAC

Problem:

  input: Integer
  output: maximum rotation version of input, Integer
  rules:
    explicit:
      - write a method
      - recommended usage of rotate_rightmost_digits method from previous exercise
      - leading zeros do not have to be displayed/dealt with
    implicit:
      - number may come in the form number_number_number

Examples and test cases:

  max_rotation(735291) == 321579
  max_rotation(3) == 3
  max_rotation(35) == 53
  max_rotation(105) == 15 # the leading zero gets dropped
  max_rotation(8_703_529_146) == 7_321_609_845

Data structure:

  Iteration - Usage of previously built method

Algorithm:

  Inject method from previous exercise
  Define method called max_rotation with parameter num
  Initialize variable length to num digits length
  Iterate for length minus 1 times, i.e. with index from 0 to length minus 2
    Define iterative variable i
    update num to the return value from rotate_rightmost_digits with num and length minus i as argument
  Return num
      
=end

require './rotation_P2.rb'

def max_rotation(num)
  length = num.digits.length
  (length - 1).times do |i|
    num = rotate_rightmost_digits(num, length - i)
  end
  num
end


puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
