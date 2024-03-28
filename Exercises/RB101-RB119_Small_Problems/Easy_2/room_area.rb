=begin

  Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

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
    * Calculate square meters result in 'sqm'
    * Calculate square feet result in 'sqf'
    * Print string interpolated by 'sqm' and 'sqf'

=end

print 'Enter the length of the room in meters: '
l = gets.chomp.to_f
print 'Enter the width of the room in meters: '
w = gets.chomp.to_f
sqm = l * w
sqf = sqm * 10.7639
puts "The area of the room is #{sqm} square meters (#{sqf} square feet)."