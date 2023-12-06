# rubocop:disable all
=begin

	Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).


PEDAC

Problem: 

        input: String with alphabetic and non-alphabetic characters 
        output: String with non-alphabetic characters reduced to single space
        rules: 
          explicit: 
            - write a method
            - input is all lower cased
          implicit: 
            - input have multiple words

Examples and test cases:

	cleanup("---what's my +*& line?") == ' what s my line '

Data structure:

        String methods.

Algorithm:

        Define method called cleanup with 'str' parameter
        Use string method to substitute all non-alphanumeric characters of 'str' with space and squeeze it

=end

def cleanup(str)
  str.tr_s('^a-z^0-9', ' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '

