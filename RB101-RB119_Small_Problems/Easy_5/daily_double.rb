=begin

	Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

PEDAC

Problem: 

        input: String
        output: String without consecutive duplicate character
        rules: 
          explicit: 
            - can't use String#squeeze(!) built in methods
            - write a method
            - returns new string, i.e. new object
          implicit: 
            - there may be single spaces within string input 

Examples and test cases:

	crunch('ddaaiillyy ddoouubbllee') == 'daily double'
	crunch('4444abcabccba') == '4abcabcba'
	crunch('ggggggggggggggg') == 'g'
	crunch('a') == 'a'
	crunch('') == ''

Data structure:

        String iteration.

Algorithm:

        Define method called crunch with parameter 'str'
        Initialize 'temp' variable to empty string
        Initialize 'answer' variable to empty string
        Iterate over characters of 'str'
          if character is different from 'temp' value, push it into 'answer' variable
          reassign 'temp' to character
        Return 'answer'

=end


