=begin

  Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself). What if we wanted to generalize this method to a "power to the n" type method: cubed, to the 4th power, to the 5th, etc. How would we go about doing so while still using the multiply method?

  PEDAC

  Problem:

    input: 2 number
    output: the result of first number to the power of the second one
    implicit rule: numbers are integers, second number is positive

  Examples and test cases:

    square(5) == 25
    square(-8) == 64

  Data structure:

    importing method from another file in folder 
    iteration and conditional further multiplication

  Algorithm:

    * Import file multiplying_two.rb
    * Define a method called powered_to that has 2 parameter, num and power
    * Define a result variable pointing to 1
    * For 1 upto power divided by 2 do
      * result points to multiply with num as both of its parameters
    * Multiply result by the remainder of power divided by 2 multiplied by num
    * Test it

=end

require './multiplying_two.rb'
require 'pry'

def powered_to(num, power)
  result = 1
  1.upto (power / 2) do
    result *= multiply(num, num)
  end
  result *= num if (power % 2) > 0
  result
end

puts powered_to(3, 3) == 27
puts powered_to(5, 5) == 3125
puts powered_to(2, 8) == 256