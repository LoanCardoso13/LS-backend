# rubocop:disable all
=begin

  In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

  In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.  

PEDAC

Problem:

  input: Integer
  output: Integer corresponding to the last digit of the Fibonacci sequence result at the input's place
  rules:
    explicit:
      - write a method
    implicit:
      - input always integer

Examples and test cases:

  fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
  fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
  fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
  fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
  fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
  fibonacci_last(123456789) # -> 4

Data structure:

  Loop through Fibonacci sequence - Control flow - Tracking variables - Integer methods

Algorithm:

  Define method called fibonacci_last with parameter: n
  Initialize variables place1 and place2 to value 1
  Initialize current iteration to 2
  Start looping
    Calculate next_place as place1 + place2
    Increase current_iteration by 1
    If current_iteration is n, break the loop returning next_place calling Integer#digits, Array#reverse chained with Array#last
    Update place1 to place2's value
    update place2 to next_place value

=end

def fibonacci_last(n)
  place1 = 1
  place2 = 1
  current_iteration = 2
  loop do
    next_place = place1 + place2
    current_iteration += 1
    break next_place.digits.reverse.last if current_iteration == n

    place1 = place2
    place2 = next_place
  end
end

puts fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# puts fibonacci_last(123456789) # -> 4
