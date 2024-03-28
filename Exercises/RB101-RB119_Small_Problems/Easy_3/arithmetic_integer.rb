=begin

  Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

  PEDAC

  Problem:

  input: two positive integers from the user
  output: printed results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power
  implicit rule: user only inputs integers to program

  Examples and test cases:

  ==> Enter the first number:
  23
  ==> Enter the second number:
  17
  ==> 23 + 17 = 40
  ==> 23 - 17 = 6
  ==> 23 * 17 = 391
  ==> 23 / 17 = 1
  ==> 23 % 17 = 6
  ==> 23 ** 17 = 141050039560662968926103

  Data structure: 

  2 integers and 6 interpolated strings, each with 3 interpolations

  Algorithm:

  Get first integer and store it into num1
  Get second integer and store it into num2
  print interpolated sum expression
  print interpolated subtraction expression
  print interpolated multiplication expression
  print interplated division expression
  print interpolated remainter expression
  print interpolated power expression

=end

puts "==> Enter the first number:"
num1 = gets.chomp.to_i
puts "==> Enter the second number:"
num2 = gets.chomp.to_i

puts "==> #{num1} + #{num2} = #{num1 + num2}"
puts "==> #{num1} - #{num2} = #{num1 - num2}"
puts "==> #{num1} * #{num2} = #{num1 * num2}"
puts "==> #{num1} / #{num2} = #{num1 / num2}"
puts "==> #{num1} % #{num2} = #{num1 % num2}"
puts "==> #{num1} ** #{num2} = #{num1 ** num2}"