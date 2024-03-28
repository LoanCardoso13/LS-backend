=begin

  Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

  PEDAC

  Problem:

    input: 1 number
    output: the result of its square
    implicit rule: number is integer

  Examples and test cases:

    square(5) == 25
    square(-8) == 64

  Data structure:

    importing method for another file in folder

  Algorithm:

    * Import file multiplying_two.rb
    * Define a method called square that has 1 parameter, num
    * Use multiply with num as both of its parameters
    * Test it

=end

require './multiplying_two.rb'

def square(num)
  multiply(num, num)
end

puts square(5) == 25
puts square(-8) == 64