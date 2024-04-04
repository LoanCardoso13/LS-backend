=begin

  Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

  An equilateral triangle has all three sides the same length.

  An isosceles triangle has exactly two sides of the same length.

  A scalene triangle has all sides of different lengths.

  Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.

=end

class Triangle
  attr_reader :s1, :s2, :s3

  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
    raise ArgumentError if s1 <= 0 || s2 <= 0 || s3 <= 0
    sorted_array = [s1, s2, s3].sort
    biggest_side = sorted_array[-1]
    smallest_sides_sum = sorted_array[0] + sorted_array[1]
    raise ArgumentError if biggest_side >= smallest_sides_sum
  end

  def kind
    if s1 == s2 && s2 == s3
      'equilateral'
    elsif s1 == s2 || s2 == s3 || s1 == s3
      'isosceles'
    else
      'scalene'
    end
  end
end
