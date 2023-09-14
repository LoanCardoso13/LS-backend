=begin

  Create a method that takes two arguments, multiplies them together, and returns the result.

  PEDAC

  Problem:

    input: two numbers
    output: the result of their multiplication 
    implicit rule: those numbers are integers

  Examples and test cases:

    multiply(5, 3) == 15

  Data structure:

    method with 2 parameters that returns a value

  Algorithm:

    * Define a method called multiply that has 2 parameters, num1 and num2.
    * Multiply num1 and num2.
    * Use test case to call method.

=end

def multiply(num1, num2)
  num1 * num2
end

puts multiply(5, 3) == 15