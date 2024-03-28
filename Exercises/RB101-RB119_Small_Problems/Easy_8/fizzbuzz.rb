# rubocop:disable all
=begin

  Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers from the starting number to the ending number, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

PEDAC

Problem

  input: 2 Integers
  output: Printed sequence from first to second Integer input, but if number is divisible by 3 and/or 5 print certain words 
  rules:
    explicit:
    - "Fizz" for divisible by 3, "Buzz" for divisible by 5 and "FizzBuzz" for divisible by both
    - write a method
    implicit:
    - input integers will be provided in the correct order

Example and test cases

  fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

Data structure

  iteration - control flow - integer methods

Algorithms

  Define method called fizzbuzz with 2 parameters: int1 and int2
  Use int1 and int2 as caller and argument to Integer#upto method, respectively, with block argument
    Define iterative variable n
    If n divisible by 3 and 5
      print "FizzBuzz"
    Else, if n is divisible by 5
      print "Buzz"
    Else, if n is divisible by 3
      print "Fizz"
    Else
      print n

=end

def fizzbuzz(int1, int2)
  int1.upto(int2) do |n|
    if n % 3 == 0 && n % 5 == 0
      puts "FizzBuzz"
    elsif n % 5 == 0
      puts "Buzz"
    elsif n % 3 == 0
      puts "Fizz"
    else 
      puts n
    end
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
