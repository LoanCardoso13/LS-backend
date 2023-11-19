=begin 

	Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

        You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

PEDAC

Problem:

	input: Array
	output: new Array object with elements of original from input reversed
	rules:
	  explicit:
	    - write a method
            - may not use built in reverse methods
            - may not use previously written method
            - must return a new object
            - must not modify original object
          implicit:
	    - input array may contain different types of elements

Examples and test cases:

	reverse([1,2,3,4]) == [4,3,2,1]          # => true
        reverse(%w(a b e d c)) == %w(c d e b a)  # => true
        reverse(['abc']) == ['abc']              # => true
        reverse([]) == []                        # => true

        list = [1, 3, 2]                      # => [1, 3, 2]
        new_list = reverse(list)              # => [2, 3, 1]
        list.object_id != new_list.object_id  # => true
        list == [1, 3, 2]                     # => true
        new_list == [2, 3, 1]                 # => true

Data structure:

        Integer division. Array iteration. Array index assignment. Array sum.

Algorithm:

	Define a method called reverse with argument 'arr'
        Reassign 'arr' to the result of itself plus empty array
        Initialize 'i_limit' to result of integer division of 'arr' length by 2
        From 1 up to 'i_limit' do 
          Define iterative variable as 'i'
          Assign 'first_element' to 'arr' element at 'i' - 1 index
          Assign 'last_element' to 'arr' element at -'i' index
          Use array indexed assignment to make 'arr' element at 'i' - 1 index point to 'last_element'
          Use array indexed assignment to make 'arr' element at -'i' index point to 'first_element'
        Return 'arr'

=end

def reverse(arr)
  arr = arr + []
  i_limit = arr.length / 2
  1.upto(i_limit) do |i|
    first_element = arr[i-1]
    last_element = arr[-i]
    arr[i-1]= last_element
    arr[-i]= first_element
  end
  return arr
end


puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

