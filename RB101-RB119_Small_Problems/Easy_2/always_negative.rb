=begin

  Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

  PEDAC

  Problem: 

    input: number 
    output: number, if negative, or minus that, if positive
    requires a method that takes exactly 1 argument

  Examples and test cases:

    negative(5) == -5
    negative(-3) == -3
    negative(0) == 0      # There's no such thing as -0 in ruby

  Data structure:
    
    conditional flow

  Algorithm:

    * Define a method called 'negative' that has 1 parameter, 'user_number'
      * modify 'user_number' to its oposite if it is > 0
      * return 'user_number' 

=end

def negative(user_number)
  user_number > 0 ? (-1) * user_number : user_number
end

# These tests should all return true
puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0      # There's no such thing as -0 in ruby