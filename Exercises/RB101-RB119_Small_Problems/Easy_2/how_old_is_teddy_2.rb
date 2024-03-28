=begin

  Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200. Modify this program to ask for a name, and then print the age for that person. For an extra challenge, use "Teddy" as the name if no name is entered.

  PEDAC

  Problem:

    input: none
    output: string with randomly generated integer within, printed on screen

  Examples and test cases:

    Teddy is 69 years old!

  Data structure:

    integer and string with interpolation

  Algorithm:

    * Generate random number between 20 and 200 and point to variable 'age'
    * Print string interpolated by 'age'

=end
print "Enter a name: "
name = gets.chomp
name = 'Teddy' if name == ""
age = rand(21..200)
puts "#{name} is #{age} years old"