# rubocop:disable all
=begin

	Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

	You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces.

PEDAC

Problem: 

        input: String with words separated by spaces 
        output: Strig with first and last character of every word swapped
        rules: 
          explicit: 
            - no empty input 
            - words have at least 1 character
            - write a method
            - no invalid characters
          implicit: 
            - no invalid characters

Examples and test cases:

	swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
	swap('Abcde') == 'ebcdA'
	swap('a') == 'a'

Data structure:

        Type conversion to Array. Array iteration. String method.

Algorithm:

        Define method called swap that has 'str' parameter
        Initialize variable 'arr' to 'str' splitted by its spaces
        Initialize variable 'arr2' to empty array
        Iterate over 'arr'
          Define iterative variable 'word'
          Swap first and last characters of 'word' and push it to 'arr2' if 'word' length greater than 1
        Join 'arr2' with spaces into string and return it 

=end

def swap(str)
  str.split.each do |word|
    word[0], word[-1] = word[-1], word[0]
  end.join(' ')
end # This mutates the collection while iterating over it.

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
