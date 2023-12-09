# rubocop:disable all
=begin 

	Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

PEDAC

Problem:

	input: Array of unordered Integers
        output: the only duplicate Integer from the Array input 
	rules:
	  explicit:
	    - write a method
            - there is only 1 duplicate value in the array
          implicit:
            - there are only integers in the array 

Examples and test cases:

	find_dup([1, 5, 3, 1]) == 1
        find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
                  38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
                  14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
                  78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
                  89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
                  41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
                  55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
                  85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
                  40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
                  7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

Data structure:

        Array iteration. Array methods.

Algorithm:

	Define method called find_dup with 'arr' argument
        Initialize 'temp_storage' variable pointing to empty array
        Iterate over elements from 'arr'
          For each element, check if 'temp_storage' contains the element and, if not, push it to 'temp_storage'
          If it contains the element, return the element from the function

=end

# def find_dup(arr)
#   temp_storage = []
#   arr.each do |element|
#     if temp_storage.include?(element)
#       return element
#     else
#       temp_storage << element
#     end 
#   end
# end

def find_dup(arr)
  arr.each_with_object([]) do | element, new_arr |
    if new_arr.include?(element)
      return element
    else
      new_arr << element
    end
  end
end


puts find_dup([1, 5, 3, 1]) == 1
puts find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
# Refactored: 1
