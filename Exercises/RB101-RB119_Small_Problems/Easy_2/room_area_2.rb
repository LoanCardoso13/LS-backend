=begin

  Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet. Modify this program to ask for the input measurements in feet, and display the results in square feet, square inches, and square centimeters.

  PEDAC

  Problem:

    input: 2 float numbers from user
    output: printed string interpolated by calculated area

  Examples and test cases:

    Enter the length of the room in meters:
    10
    Enter the width of the room in meters:
    7
    The area of the room is 70.0 square meters (753.47 square feet).

  Data structure:

    float numbers and string interpolation

  Algorithm:

    * Ask user for length
    * Point it to l
    * Ask user for width
    * Point it to w
    * Calculate square feet result in 'sqf'
    * Calculate square inches using conversion constant and point result 'sqi'
    * Calculate square centimeters using constant and point it to 'sqc'
    * Print string interpolated by 'sqf', 'sqi' and 'sqc'

=end
SQFEET_TO_SQINCHES = 144
SQINCHES_TO_SQCENTIMETERS = 6.4516

print 'Enter the length of the room in feet: '
l = gets.chomp.to_f
print 'Enter the width of the room in feet: '
w = gets.chomp.to_f
sqf = l * w
sqi = sqf * SQFEET_TO_SQINCHES
sqc = sqi * SQINCHES_TO_SQCENTIMETERS
puts "The area of the room is #{sqf} square feet (#{sqi} square inches, or #{sqc} square centimeters)."