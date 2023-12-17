# rubocop:disable all
=begin

  A triangle is classified as follows:

  * right One angle of the triangle is a right angle (90 degrees)
  * acute All 3 angles of the triangle are less than 90 degrees
  * obtuse One angle is greater than 90 degrees.
  
  To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

  Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

  You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

PEDAC

Problem:

  Write a method that takes 3 Integers representing the angles of a triangle. The method should return a symbol representing whether the triangle is right, acute, obtuse or invalid.
    - If the sum of the angles is different than 180, it is invalid
    - If any of the angles is 0 or less, it is invalid
    - If any angle is greater than 90, it is obtuse
    - If 1 angle is equal to 90, it is right
    - If all angles are less than 90, it is acute

  input: 3 Integers
  output: Symbol classifying triangle represented by input angles
  rules:
    explicit:
    implicit:

Examples and test cases:

  triangle(60, 70, 50) == :acute
  triangle(30, 90, 60) == :right
  triangle(120, 50, 10) == :obtuse
  triangle(0, 90, 90) == :invalid
  triangle(50, 50, 50) == :invalid

Data structure:

  Array for angles - Iteration for 1 rule - Array methods

Algorithm:

  Define method called triangle with 3 parameters: angle1, angle2 and angle3
  Initialize angles_array to an array with arguments sorted
  Iterate through angles_array, with element parameter angle
    If angle is 0 or less
      Return :invalid
  If sum of elements of angles_array is not 180
    Return :invalid
  If last element of angles_array is greater than 90
    Return :obtuse
  Else, if last element of angles_array is 90
    Return :right
  Else
    Return :acute

=end

def triangle(angle1, angle2, angle3)
  angles_array = [angle1, angle2, angle3].sort
  angles_array.each do |angle|
    return :invalid if angle <= 0
  end
  return :invalid if angles_array.sum != 180
  if angles_array[-1] > 90
    return :obtuse
  elsif angles_array[-1] == 90
    return :right
  else
    return :acute
  end
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid
