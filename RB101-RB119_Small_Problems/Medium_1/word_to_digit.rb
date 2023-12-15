# rubocop:disable all
=begin

  Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.  

PEDAC

Problem:

  input: String with words that might be numbers in written form
  output: String equivalent to input but with any number converted from written form to arabic numbered system form
  rules:
    explicit:
      - write a method
    implicit:
      - input written numbers will be downcased 

Examples and test cases:

  word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

Data structure:

  Array for digits conversion - String <=> Array conversion - Iteration - Control flow

Algorithm:

  Create constant array with string digits called WRITTEN_DIGITS
  Define method called word_to_digit with parameter: str
  Iterate over elements of str split per spaces, mapping it
    Define iterative variable word
    If word is included in WRITTEN DIGITS
      Find index of word in WRITTEN DIGITS and return its stringfied version
    If not
      Return word
  Initialize variable unfiltered to array result from map
  Iterate through unfiltered, mapping it
    Define iterative variable word
    If WRITTEN_DIGITS include word stripped of non-alphanumerical characters and WRITTEN_DIGITS does not include word
      Find index of word stripped of non-alphanumerical characters in WRITTEN_DIGITS, stringfied and add to word stripped of alphanumerical characters returning it
    Else
      Return word
  Join result of unfiltered mapped array with spaces

=end

WRITTEN_DIGITS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']

def word_to_digit(str)
  unfiltered = str.split.map do |word|
    if WRITTEN_DIGITS.include?(word)
      WRITTEN_DIGITS.index(word).to_s
    else
      word
    end
  end
  unfiltered.map do |word|
    if WRITTEN_DIGITS.include?(word.delete('^a-zA-Z0-9')) && !WRITTEN_DIGITS.include?(word)
      WRITTEN_DIGITS.index(word.delete('^a-zA-Z0-9')).to_s + word.delete('a-zA-Z0-9')
    else
      word
    end
  end.join(' ')
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

