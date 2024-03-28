# rubocop:disable all
=begin

  Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

PEDAC

Problem

  input: Array of arrays of String and Integer
  output: Array of Strings corresponding to each String from input repeated as many times as its associated Integer
  rules: 
    explicit:
    - write a method
    implicit:
    - input always contains at least 1 element in its whole underlying structure

Example and test cases

  buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]

Data structure

  array iteration - integer method - array method

Algorithm

  Define method called buy_fruit with parameter: arr
  Initialize variable answer to empty array
  Iterate over arr elements
    Define iterative variable item
    Have second element from item call Integer#times
      Define iterative variable _
      Push item's first element into answer
  Return answer

=end

def buy_fruit(arr)
  answer = []
  arr.each do |item|
    item[1].times do |_|
      answer << item[0]
    end
  end
  answer
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]
