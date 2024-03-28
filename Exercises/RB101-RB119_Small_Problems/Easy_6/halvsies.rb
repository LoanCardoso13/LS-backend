=begin 

	Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

PEDAC

Problem:

	input: one Array
	output: two Arrays with half the elements from each, halves respective of order of argument 
	rules:
	  explicit:
	    - write a method
            - if input array has odd number of elements, the middle elements goes to first output array
          implicit:
	    - if not enough elements to output, returning empty array is valid

Examples and test cases:

	halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
        halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
        halvsies([5]) == [[5], []]
        halvsies([]) == [[], []]

Data structure:

        Array methods. Array indexation.

Algorithm:

        Define method called halvsies with paramaters 'arr'
        Initialize variable 'half' to length of 'arr' divided by 2 then subtracted by 1 if length is even, and just divided by 2 otherwise
        Build array of two elements, first is 'arr' from range 0 to 'half' and second is 'arr' minus 'arr' from range 0 to 'half'

=end

def halvsies(arr)
  half = arr.length.even? ? arr.length / 2 - 1 : arr.length / 2
  [ arr[0..half], arr - arr[0..half] ]
end


puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
