# rubocop:disable all
=begin

  Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

  You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

  Your solution should not mutate the input arrays.

PEDAC

Problem:
  To write a method that will take 2 Arrays, each being empty or containing Integers in sorted order, and return all those Integers, from both Arrays, in one Array, sorted. Cannot use built-in sort methods. Cannot mutate input Arrays. 

  input: 2 Arrays of sorted Integers, or empty
  output: 1 Array of sorted Integers containing all numbers from input
  rules:
    explicit:
    implicit:

Examples and test cases:

  merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
  merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
  merge([], [1, 4, 5]) == [1, 4, 5]
  merge([1, 4, 5], []) == [1, 4, 5]

Data structure:

Algorithm:

  Initialize answer empty array
  Initialize index A and index B to zero.
  Loop until answer array size is equal to arrays a and b sizes summed
    Do this only if none of the values at array_a index_a and array_b index_b is nil:
      Create if-else expression as follows: 
      if exp1; exp2; elsif exp3; exp4; else; exp5; end
      Where: 
      exp1 is checking if array_a at index_a is greater than array_b at index_b
      exp2 is push array_b at index_b to answer and increase index_b
      exp3 is checking if array_b at index_b is greater than array_a at index_a
      exp4 is push array_a at index_a to answer and increase index_a
      exp5 is push array_a at index_a to answer and increase index_a and push array_b at index_b to answer and increase index_b
    If either of them is nil, get all remaining values of the other array into answer
  Return answer

=end

def merge(array_a, array_b)
  answer = []
  index_a, index_b = 0, 0
  while answer.size < (array_a.size + array_b.size)
    if !!array_a[index_a] && !!array_b[index_b]  
      if array_a[index_a] > array_b[index_b]
        answer << array_b[index_b]
        index_b += 1
      elsif array_b[index_b] > array_a[index_a]
        answer << array_a[index_a]
        index_a += 1
      else
        answer << array_a[index_a]
        index_a += 1
        answer << array_b[index_b]
        index_b += 1
      end
    else
      answer << array_a[index_a..-1] if !array_b[index_b]
      answer << array_b[index_b..-1] if !array_a[index_a]
      answer.flatten!
    end
  end
  answer
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
