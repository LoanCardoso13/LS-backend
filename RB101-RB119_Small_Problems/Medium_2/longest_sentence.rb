# rubocop:disable all
=begin

  Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

  Example text:

        Four score and seven years ago our fathers brought forth
	on this continent a new nation, conceived in liberty, and
	dedicated to the proposition that all men are created
	equal.

	Now we are engaged in a great civil war, testing whether
	that nation, or any nation so conceived and so dedicated,
	can long endure. We are met on a great battlefield of that
	war. We have come to dedicate a portion of that field, as
	a final resting place for those who here gave their lives
	that that nation might live. It is altogether fitting and
	proper that we should do this.

	But, in a larger sense, we can not dedicate, we can not
	consecrate, we can not hallow this ground. The brave
	men, living and dead, who struggled here, have
	consecrated it, far above our poor power to add or
	detract. The world will little note, nor long remember
	what we say here, but it can never forget what they
	did here. It is for us the living, rather, to be dedicated
	here to the unfinished work which they who fought
	here have thus far so nobly advanced. It is rather for
	us to be here dedicated to the great task remaining
	before us -- that from these honored dead we take
	increased devotion to that cause for which they gave
	the last full measure of devotion -- that we here highly
	resolve that these dead shall not have died in vain
	-- that this nation, under God, shall have a new birth
	of freedom -- and that government of the people, by
	the people, for the people, shall not perish from the
	earth.

  The longest sentence in the above text is the last sentence; it is 86 words long. (Note that each -- counts as a word.)

PEDAC

Problem:

  input: File with text
  output: print: 1) the longest sentence in the file based on the number of words 2) the number of words in that sentence
  rules:
    explicit:
      - sentences are defined by ending in either: ., ! or ?
      - anything else (other than spaces) is a word
    implicit:

Examples and test cases:

  Download the book at http://www.gutenberg.org/cache/epub/84/pg84.txt, and run your program on this file.

  The longest sentence in this book is 157 words long.

Data structure:

  Array of Arrays

Algorithm:

  Initialize variable text to content of file
  Initialize variable parsed_text to empty array
  Initialize variable marks to array with zero value
  Iterate through characters of string referenced by text, with index
    Define iterative variable char, and index i
    If char is ., ! or ?, push i into marks
  Repeat the following block of code marks length minus 1 times
    Define iterative variable j
    Push text indexed from marks array at j until j + 1 into parsed_text
  Iterate through elements of parsed_text with object empty hash, as it gets initialized referenced by sentence_sizes
    Define iterative variable sentence, and hsh
    Create key-value pair as hsh[sentence]= sentence split length
  Initialize answer variable to Hash#max_by return with block-parameter value filling block
  Print answer at index 0 as the greatest sentence
  Print answer at index 1 as the number of words in the sentence

=end

text = File.read('./Exercise_Material/frankenstein.txt')
parsed_text = []
marks = [0]

text.chars.each_with_index do |char, i|
  marks << (i+1) if '.!?'.include?(char)
end

(marks.length - 1).times do |j|
  parsed_text << text[marks[j]..marks[j+1]]
end

sentence_sizes = parsed_text.each_with_object({}) do |sentence, hsh|
  hsh[sentence]= sentence.split.length
end

answer = sentence_sizes.max_by { |k,v| v }
puts "Greatest sentence by number of words is:"
puts answer[0]
puts 
puts "It has #{answer[1]} words in it"
