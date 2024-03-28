# rubocop:disable all
=begin

  In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number. In a language that is not optimized for recursion, some (not all) recursive methods can be extremely slow and require massive quantities of memory and/or stack space.

  Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; as a result, the Fibonacci solution is only useful up to about fibonacci(40). With higher values of nth, the recursive solution is impractical. (Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)

  Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

  Rewrite your recursive fibonacci method so that it computes its results without recursion.  

PEDAC

Problem:

  input: Integer
  output: the Fibonacci sequence result at the input's place
  rules:
    explicit:
      - write a method
      - do not use recursion
    implicit:

Examples and test cases:

  fibonacci(20) == 6765
  fibonacci(100) == 354224848179261915075
  fibonacci(100_001) # => 4202692702.....8285979669707537501

Data structure:

  Loop through Fibonacci sequence - Control flow - Tracking variables

Algorithm:

  Define method called fibonacci with parameter: n
  Initialize variables place1 and place2 to value 1
  Initialize current iteration to 2
  Start looping
    Calculate next_place as place1 + place2
    Increase current_iteration by 1
    If current_iteration is n, break the loop returning next_place
    Update place1 to place2's value
    update place2 to next_place value

=end

def fibonacci(n)
  place1 = 1
  place2 = 1
  current_iteration = 2
  loop do
    next_place = place1 + place2
    current_iteration += 1
    break next_place if current_iteration == n

    place1 = place2
    place2 = next_place
  end
end

puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
puts fibonacci(100_001) # => 4202692702.....8285979669707537501
