# rubocop:disable all
=begin

  Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

  Numerical Score Letter	Grade
  90 <= score <= 100	'A'
  80 <= score < 90	'B'
  70 <= score < 80	'C'
  60 <= score < 70	'D'
  0 <= score < 60	'F'

  Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

PEDAC

Problem

  input: 3 Integers
  output: String corresponding to letter graded average of input
  rules:
    explicit:
    - write a method
    - all input integers are between 0 and 100

Example and test cases

  get_grade(95, 90, 93) == "A"
  get_grade(50, 50, 95) == "D"

Data structure

  control flow - integer operation

Algorithm

  Define method called get_grade with parameters: int1, int2 and int3
  Initialize average variable to sum of ints divided by 3
  Create an if statement for each average scenario

=end

def get_grade(int1, int2, int3)
  average = (int1 + int2 + int3) / 3
  if average > 90
    'A'
  elsif average > 80
    'B'
  elsif average > 70
    'C'
  elsif average > 60
    'D'
  else
    'F'
  end
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"
