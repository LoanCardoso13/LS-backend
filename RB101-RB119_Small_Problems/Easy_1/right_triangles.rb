=begin

  Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

  PEDAC

  Problem:

    input: positive integer 'n'
    output: printed right triangle whose sides have 'n' stars, sides down and right

  Examples and test cases:

triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

  Data structure:

    string size n, iterations

  Algorithm:

    * Define a method called triangle that has an 'n' parameter
    * Initializes empty string 'str' with 'n' characters
    * For 'n' times
      * Place a '*' in the last empty character of 'str', modifying it
      * Print 'str'

=end

def triangle(n)
  str = ' ' * n
  n.times do |i|
    str[-(i+1)] = '*'
    puts str
  end
end

# Test cases
triangle(6)
puts
triangle(9)