# rubocop:disable all
=begin

  Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

  You may assume that neither argument is an empty Array.

PEDAC

Problem

  input: 2 Arrays with number elements
  output: Array containing combinations of input Arrays elements multiplied 
  rules: 
    explicit:
    - write a method
    - output array must be sorted by increasing values
    - no empty input array
    implicit:
    - numbers are integers

Examples and test cases

  multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

Data structure

  array nested iteration <=> integer multiplication <=> array sorting method 

Algorithm

  Define method called multiply_all_pairs with 2 parameters: arr1 and arr2
  Initialize variable arr pointing to empty array
  For each element of arr1
    Define iterative variable i
    For each element of arr2
      Define iterative variable j
      multiply i by j and push the result to arr
  Sort arr by increasing value and return it

=end

def multiply_all_pairs(arr1, arr2)
  arr = []
  arr1.each do |i|
    arr2.each do |j|
      arr << i*j
    end
  end
  arr.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
