=begin 

	Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

        You may not use Array#reverse or Array#reverse!.

        Note: for the test case list = ['abc'], we want to reverse the elements in the array. The array only has one element, a String, but we're not reversing the String itself, so the reverse! method call should return ['abc'].
PEDAC

Problem:

	input: Array
	output: same Array object with elements reversed
	rules:
	  explicit:
            - may not use built-in reverse method 
            - write a method
            - return the same object that was used as argument
          implicit:
	    - array may be composed of different types of elements
            - array might have 1 or 0 elements

Examples and test cases:

	list = [1,2,3,4]
        result = reverse!(list)
        result == [4, 3, 2, 1] # true
        list == [4, 3, 2, 1] # true
        list.object_id == result.object_id # true

        list = %w(a b e d c)
        reverse!(list) == ["c", "d", "e", "b", "a"] # true
        list == ["c", "d", "e", "b", "a"] # true

        list = ['abc']
        reverse!(list) == ["abc"] # true
        list == ["abc"] # true

        list = []
        reverse!(list) == [] # true
        list == [] # true

Data structure:

        Array iteration. Array index assignment method. Buffer variables.

Algorithm:

	Define method called reverse! with 'arr' parameter
        Initialize variable 'i_limit' to 'arr' length divided by 2 (integer division)
        From 1 up to 'i_limit' do 
          Define iterative variable as 'i'
          Assign 'first_element' to 'arr' at index 'i' - 1
          Assign 'last_element' to 'arr' at index -'i'
          Use array index assignment to change 'arr' at index 'i' - 1 to 'last_element' value
          Use array index assignment to change 'arr' at index -'i' to 'first_element' value
	Return 'arr'

=end

def reverse!(arr)
  i_limit = arr.length / 2
  1.upto(i_limit) do |i|
    first_element = arr[i - 1]
    last_element = arr[-i]
    arr[i - 1]= last_element
    arr[-i]= first_element
  end
  arr
end


list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

