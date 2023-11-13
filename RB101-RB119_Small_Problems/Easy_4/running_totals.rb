=begin

  Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

  A running total is the sum of all values in a list up to and including the current element. Thus, the running total when looking at index 2 of the array [14, 11, 7, 15, 20] is 32 (14 + 11 + 7), while the running total at index 3 is 47 (14 + 11 + 7 + 15).

PEDAC

Problem:

  input: Array of numbers
  output: Array with the running totals of input Array
  rules: 
    Explicit: 
      - write a method
    Implicit: 
      - elements of input array are Integers
      - input can be empty array

Examples and test cases:

  running_total([2, 5, 13]) == [2, 7, 20]
  running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
  running_total([3]) == [3]
  running_total([]) == []

Data Structure:

  Iteration. 

Algorithm:

  Define method called running_total with parameter 'arr'
  Initialize variable 'sum' to zero
  Initialize variable 'answer' to empty array
  Iterate over elements of 'arr'
    Assign 'sum' to itself plus current element
    Push 'sum' value to 'answer' array
  Return 'answer'

=end

def running_total(arr)
  sum = 0
  answer = []
  arr.each do |element|
    sum += element
    answer << sum
  end
  answer 
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []


