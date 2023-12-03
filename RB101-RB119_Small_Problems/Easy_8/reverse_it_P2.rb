# rubocop:disable all
=begin

  Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

PEDAC

Problem

  input: String
  output: input string but if a word has five or more characters, it shall be reversed
  rules:
    explicit:
    - write a method
    - no non-alphabetic character shall be given as input
    - spaces should be collapsed if only one word is given
    implicit:
    - case sensitive

Example and test cases

  puts reverse_words('Professional')          # => lanoisseforP
  puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
  puts reverse_words('Launch School')         # => hcnuaL loohcS

Data structure

  string <=> array conversion - iteration - control flow 

Algorithms

  Define method called reverse_words with parameter str
  Return return value of str calling split with space argument concatented with Array#map with block argument concatenated with Array#join method with space character argument
    Define iterative variable as word
    If word length greater or equal to 5
      reverse it 
    Else 
      return word
=end

def reverse_words(str)
  str.split(' ').map do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end.join(' ')
end

puts reverse_words('Professional') == 'lanoisseforP'         # => lanoisseforP
puts reverse_words('Walk around the block') == 'Walk dnuora the kcolb'# => Walk dnuora the kcolb
puts reverse_words('Launch School') == 'hcnuaL loohcS'        # => hcnuaL loohcS
