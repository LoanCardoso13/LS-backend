# rubocop:disable all
=begin

  Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

PEDAC

Problem

  input: Array of elements
  output: Array of every other element from input
  rules:
    explicit:
    - write a method
    implicit:
    - elements from input may have different types

Example and test cases

  oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
  oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
  oddities(['abc', 'def']) == ['abc']
  oddities([123]) == [123]
  oddities([]) == []
  oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

Data structure

  array iteration - control flow

Algorithm

  Define method called oddities with parameter: arr
  Initialize answer to empty array
  Have arr length call Integer#times with block argument
    Define iterative variable i
    If i+1 is odd, push arr element indexed at i into answer
  Return answer

=end

def oddities(arr)
  answer = []
  arr.length.times do |i|
    if (i+1).odd?
      answer << arr[i]
    end
  end
  answer
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
puts oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
