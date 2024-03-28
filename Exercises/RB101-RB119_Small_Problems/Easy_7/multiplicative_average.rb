# rubocop:disable all
=begin

  Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

PEDAC

Problem
  
  input: Array of Integers
  output: Float representing all input Integers multiplied and divided by input Array length
  rules:
    explicit:
    - write a method
    - array is non-empty
    - output float must be have to 3 decimal places
    - result must be printed to screen

Examples and test cases

  show_multiplicative_average([3, 5])                # => The result is 7.500
  show_multiplicative_average([6])                   # => The result is 6.000
  show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

Data structure

  integer <=> float conversion - array iteration

Algorithm

  Define method called show_multiplicative_average with parameter arr
  Initialize variable prod pointing to 1.0
  Iterate through elements of arr
    Define iterative variable int
    Reassign prod to the result of the multiplication of its value by int
  Print(may use ?#format method) prod divided by length of arr with 3 decimal cases

=end

def show_multiplicative_average(arr)
  prod = 1.0
  arr.each do |int|
    prod *= int
  end
  puts format('%.3f',prod/arr.length)
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
