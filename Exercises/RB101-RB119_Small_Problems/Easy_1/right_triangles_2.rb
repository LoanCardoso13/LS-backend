=begin

  Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. Try modifying your solution so that you can display the triangle with the right angle at any corner of the grid.

  PEDAC

  Problem:

    input: positive integer 'n' and string of either 'NW', 'NE', 'SE' or 'SW', defaulted to 'SE'
    output: printed right triangle whose sides have 'n' stars and with corner at given coordinates

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

triangle(6, 'SW')

*
**
***
****
*****
******

  Data structure:

  string size n, iterations, conditionals to teak previous code as per coordinates choice

  Algorithm:

  * Define a method called triangle that has 2 parameters: 'n' and 'corner_coord' (latter defaults to 'SE')
  * If 'coorner_coord' starts with 'N', initializes 'str' with 'n+1' '*' characters
  * If 'coorner_coord starts with 'S', initializes empty string 'str' with 'n' characters
  * For n times: 
    * Place '*' at the last empty character of 'str' if 'corner_coord' is 'SE'
    * Place '*' at the first empty character of 'str' if 'corner_coord' is 'SW'
    * Place ' ' at the last non-empty character of 'str' if 'corner_coord' is 'NW'
    * Place ' ' at the first non-empty character of 'str' if 'corner_coord' is 'NE'
    * print 'str'

=end

def triangle(n, corner_coord='SE')
  str = '*' * (n+1) if corner_coord[0] == 'N'
  str = ' ' * n if corner_coord[0] == 'S'
  n.times do |i|
    case corner_coord
    when 'SE'
      str[-(i+1)] = '*'
    when 'SW'
      str[i] = '*'
    when 'NW'
      str[n-i] = ' '
    when 'NE'
      str[i] = ' '
    end
    puts str
  end
end

# Test cases
triangle(6)
puts
triangle(9, 'SW')
puts
triangle(4, 'NW')
puts
triangle(5, 'NE')