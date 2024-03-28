# rubocop:disable all
=begin

	Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

PEDAC

Problem: 

Examples and test cases:

	word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
	word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
	word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
	word_sizes('') == {}

Data structure:

Algorithm:

        Define method called word_sizes with parameter 'str'
	Initialize variable hsh to new Hash defaulting to zero
	Iterate over str words
	  Delete non-alphabetical characters from words
	  Increase value of word key in hsh
	Return hsh

=end

def word_sizes(str)
	str.split.each_with_object(Hash.new(0)) do |word, hsh|
    word.delete!('^A-Z^a-z^0-9') 
    hsh[word.size] += 1 
	end
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
# Refactored 2
