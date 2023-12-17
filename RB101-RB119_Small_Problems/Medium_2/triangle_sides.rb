# rubocop:disable all
=begin

  A triangle is classified as follows:

  * equilateral All 3 sides are of equal length
  * isosceles 2 sides are of equal length, while the 3rd is different
  * scalene All 3 sides are of different length
  
  To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

  Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

PEDAC

Problem:

  Write a method that takes 3 numbers (Integer or Float), representing the lengths of the sides of a triangle. The method shall return the classification of the triangle based on the following rules:
    - If the sum of the 2 shortest sides is less or equal to the longest one, it is invalid
    - If any side is of 0 or less length, it is invalid
    - If all sides have equal length, it is equilateral
    - If 2 sides are equal length, it is isosceles
    - If No side is equal, it is scalene

  input: 3 numbers (Integers or Floats)
  output: Symbol classifying triangle
  rules:
    explicit:
    implicit:

Examples and test cases:

  triangle(3, 3, 3) == :equilateral
  triangle(3, 3, 1.5) == :isosceles
  triangle(3, 4, 5) == :scalene
  triangle(0, 3, 3) == :invalid
  triangle(3, 1, 1) == :invalid

Data structure:

  Array with arguments - Control Flow - Array method for counting repeating elements

Algorithm:

  Define method called triangle with 3 parameters: num1, num2 and num3
  Initialize variable triangle_array to an array of sorted arguments 
  If the sum of the first two elements of triangle_array is equal or less than the last element
    Return :invalid
  Iterate through elements of triangle_array, with element parameter side
    If side is equal or less than zero
      Return :invalid
  Initialize variable sides_count to Hash returned by Array method of counting repeated elements
  If sides_count length/size equals 3
    Return :scalene
  Else If sides_count length/size equals 2
    Return :isosceles
  Else If sides_count length/size equals 1
    Return :equilateral

=end

def triangle(num1, num2, num3)
  triangle_array = [ num1, num2, num3 ].sort
  if (triangle_array[0] + triangle_array[1] <= triangle_array[-1])
    return :invalid
  end
  triangle_array.each do |side|
    return :invalid if side <= 0
  end
  sides_count = triangle_array.tally
  if sides_count.size == 3
    :scalene
  elsif sides_count.size == 2
    :isosceles
  elsif sides_count.size == 1
    :equilateral
  end
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
