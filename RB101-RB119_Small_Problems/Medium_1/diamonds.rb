# rubocop:disable all
=begin

  Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.  

PEDAC

Problem:

  input: odd Integer
  output: 4-pointed diamond printed to the screen, consisting of an n x n grid (where n is input)
  rules:
    explicit:
      - write a method
    implicit:
      - grid is shaped with 2 orthogonal axis, horizontal and vertical, of size n

Examples and test cases:

  diamond(1)

  *

  diamond(3)

   *
  ***
   *

   diamond(9)

      *
     ***
    *****
   *******
  *********
   *******
    *****
     ***
      *

Data structure:

  String-Integer operations - Iteration

Algorithm:

  Print the following
  spaces from n/2 (integer division) subtracting 1 until zero and then adding 1 up to n/2 (integer division) PLUS starts from 1 adding 2 until n and then subtracting 2 until 1

  Define method called diamong with parameter n
  Initialize j to 1
  From n/2 down to 0 do 
    Define iterative variable i
    print i spaces plus j times stars
    Increase j by 2
  Initialize l to n-2
  From 1 to n/2 do 
    Define iterative variable k
    print k spaces plus l times stars
    Decrease l by 2

=end

def diamonds(n)
  j = 1
  (n/2).downto(0) do |i|
    puts " "*i + '*'*j
    j += 2
  end
  l = n - 2
  1.upto(n/2) do |k|
    puts ' '*k + '*'*l
    l -= 2
  end
end

diamonds(1)
puts
diamonds(3)
puts
diamonds(9)
