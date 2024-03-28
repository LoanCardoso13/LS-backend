# rubocop:disable all
=begin

  Write a method that counts the number of occurrences of each element in a given array.

  The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.

PEDAC

Problem

  input: Array of Strings
  output: Printed word count of Strings in Array
  rules: 
    explicit: 
    - write a method
    - words are case-sensitive
    implicit:
    - output to be formated as: word => integer

Example and test cases

  vehicles = [
    'car', 'car', 'truck', 'car', 'SUV', 'truck',
    'motorcycle', 'motorcycle', 'car', 'truck'
  ]

  count_occurrences(vehicles)

  car => 4
  truck => 3
  SUV => 1
  motorcycle => 2

Data structure

  array iteration - string <=> hash conversion - hash indexing methods - hash check key method

Algorithm

  Define method called count_occurrences with parameter: arr
  Initialize hsh variable to empty hash
  Iterate through arr elements
    Define iterative variable as word
    If word calling String#to_s method is key of hsh
      Increase value of hsh[word.to_s] by 1
    Else 
      Add word.to_s and Integer one as key-value pair into hsh
  Iterate through elements of hsh
    Define iterative variables as k, v
    Print interpolated string with k => v

=end

def count_occurrences(arr)
  hsh = {}
  arr.each do |word|
    if hsh.has_key?(word.to_s)
      hsh[word.to_s] += 1
    else
      hsh[word.to_s] = 1
    end
  end
  hsh.each do |k, v|
    puts "#{k} => #{v}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
