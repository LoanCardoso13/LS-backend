=begin 

	Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

PEDAC

Problem:

	input: two Arrays 
	output: one Array with all elements from the input Array with no duplication of elements
	rules: 
	  explicit:
	    - write a method
            - output array only have unique elements
          implicit:
	    - the order of the output elements is the same of the input arrays
            - the order of the arguments is how it should be returned

Examples and test cases:

	merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

Data structure:

        Array methods.

Algorithm:

	Define a method called merge with 2 parameters, 'arr1' and 'arr2'
        Initialize variable 'answer' to merge/join of the arrays (Array#+)
        Filter out duplicate elements from arrays (Array#uniq) and return it 

=end

def merge(arr1, arr2)
  answer = arr1 + arr2
  answer.uniq
end


puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
