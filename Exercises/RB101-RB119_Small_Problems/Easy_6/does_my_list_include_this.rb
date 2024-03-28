# rubocop:disable all
=begin 

	Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

PEDAC

Problem:

	input: one Array and a search value
        output: Boolean corresponding to the value being in the Array or not
	rules:
	  explicit:
	    - write a method
            - cannot use built-in method Array#include?
          implicit:
	    - there might be other types of elements than integers
            - input might be empty

Examples and test cases:

	include?([1,2,3,4,5], 3) == true
        include?([1,2,3,4,5], 6) == false
        include?([], 3) == false
        include?([nil], nil) == true
        include?([], nil) == false

Data structure:

        Array iteration. Comparisson expression. 

Algorithm:

	Define method called include? with parameters 'arr' and 'searched_one'
        Initialize variable 'found' to false
        Iterate over elements of 'arr'
          compare 'arr' element with 'searched_one' and change 'found' to true and break the loop if they're the same
        Return 'found'

=end

# def include?(arr, searched_one) # use the Array#uniq algorithm
#   arr = arr.uniq # to account for the possibility of given array having repeated elements 
#   (arr + [searched_one]).size != (arr + [searched_one]).uniq.size 
# end

def include?(arr, searched_one) # simulate searching for the index of element
  !!arr.index(searched_one)
end

# def include?(arr, searched_one)
#   found = false
#   arr.each do |element|
#     if element == searched_one
#       found = true
#       break
#     end
#   end
#   found
# end


puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false
# Refactored: 3
