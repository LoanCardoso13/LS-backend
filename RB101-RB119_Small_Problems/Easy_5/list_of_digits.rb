=begin

	Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

PEDAC

Problem: 

        input: Integer
        output: Array corresponding to digits from input number, preserving order
        rules: 
          explicit: 
            - input always positive
            - write a method
          implicit: 
            - no empty or zero input

Examples and test cases:

	puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
	puts digit_list(7) == [7]                     # => true
	puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
	puts digit_list(444) == [4, 4, 4]             # => true

Data structure:

        Type conversion. String method.

Algorithm:

        Define method called digit_list with 'int' parameter
        Initialize 'arr' variable to return value of Call Integer#to_s, then String#split with empty string as argument
        Iterate over 'arr' with Array#map 
          Have each element Call String#to_i

=end

def digit_list(int)
  arr = int.to_s.split('')
  arr.map { |num| num.to_i }
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true


