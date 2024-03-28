=begin

Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

PEDAC

Problem:
    
    input: integer [-inf, inf]
    output: returned boolean expressing if absolute value is odd

    requires a method that takes - necessarily - exactly 1 argument. 
    argument is valid integer

Example and test cases:

    puts is_odd?(2)    # => false
    puts is_odd?(5)    # => true
    puts is_odd?(-17)  # => true
    puts is_odd?(-8)   # => false
    puts is_odd?(0)    # => false
    puts is_odd?(7)    # => true

Data structure:

    test involving mathematical property of input

Algorithm:

    * Define a method called is_odd? that has one parameter 'number'
    * Take module of 'number' by 2
    * compare it to 1
    * return it

=end

def is_odd?(number)
  number.abs % 2 == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true