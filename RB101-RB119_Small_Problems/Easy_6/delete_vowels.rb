=begin 

	Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

PEDAC

Problem:

	input: Array of String objects
	output: Array of String objects without any vowels
	rules:
	  explicit:
	    - write a method

Examples and test cases:

	remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
        remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
        remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

Data structure:

        String method with character selector. Array iteration. 

Algorithm:

	Define method called remove_vowels with parameter 'arr'
        Iterate over 'arr' value
          Use string destructive method to eliminate vowels from each element of 'arr'

=end


