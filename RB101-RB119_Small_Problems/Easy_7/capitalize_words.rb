# rubocop:disable all
=begin

  Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

  You may assume that words are any sequence of non-blank characters.

PEDAC

Problem

  input: String
  output: new String with original value except for first character of every word capitalized and all others lowercase
  rules: 
    explicit:
    - write a method
    - words are defined by any sequence of non-blank characters
    implicit:
    - if first character of word is not a letter, nothing happens with it

Examples and test cases

  word_cap('four score and seven') == 'Four Score And Seven'
  word_cap('the javaScript language') == 'The Javascript Language'
  word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

Data structure

  string methods - string <=> array conversions - array iteration

Algorithm

  Define a method called word_cap with parameter: str
  Initialize answer to return value of Array#map method called by str being split by spaces
    Within the Array#map method call block argument, define iterative variable word
    Downcase all characters of word
    Upcase first character of word
    Return word
  Return answer joined by spaces

=end

def word_cap(str)
  answer = str.split(' ').map do |word|
    word.downcase!
    word.capitalize!
    word
  end
  answer.join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
