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

        Define method called alphabetic_number_sort with 'arr' parameter
        Create a hash named 'hsh' where keys are integers between 0 and 19 and values are their string representation
        Use Array#sort with a block and assign its return value to 'answer'
          define iterative variables as 'pre' and 'post'
          compare hsh['pre'] to hsh['post']
       Return 'answer'
 
end
