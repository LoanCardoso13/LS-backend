# rubocop:disable all
=begin

	Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

	zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

PEDAC

Problem: 

        input: Array of Integers
        output: Integers sorted alphabetically
        rules: 
          explicit: 
            - input integers between 0 and 19
            - write a method

Examples and test cases:

	alphabetic_number_sort((0..19).to_a) == [
	  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
	  6, 16, 10, 13, 3, 12, 2, 0
	]

Data structure:

        Hash as database. String iteration. ASCII value comparison.

Algorithm:

        Create a constant hash named 'HSH' where keys are integers between 0 and 19 and values are their string representation
        Define method called alphabetic_number_sort with 'arr' parameter
        Use Array#sort with a block and assign its return value to 'answer'
          define iterative variables as 'pre' and 'post'
          compare HSH['pre'] to HSH['post']
       Return 'answer'
 
=end

HSH = { 0 => "zero", 
	  1 => "one", 
	  2 => "two",
	  3 => "three", 
	  4 => "four", 
	  5 => "five", 
	  6 => "six", 
	  7 => "seven", 
	  8 => "eight", 
	  9 => "nine", 
	  10 => "ten", 
	  11 => "eleven", 
	  12 => "twelve", 
	  13 => "thirteen", 
	  14 => "fourteen", 
	  15 => "fifteen", 
	  16 => "sixteen", 
	  17 => "seventeen", 
	  18 => "eighteen", 
	  19 => "nineteen" }

def alphabetic_number_sort(arr)
  arr.sort do |pre, post|
    HSH[pre] <=> HSH[post]
  end
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
# Refactored 1
