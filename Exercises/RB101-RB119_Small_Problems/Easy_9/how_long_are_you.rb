# rubocop:disable all
=begin

  Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

  You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

PEDAC

Problem

  input: String
  output: Array in which elements are Strings corresponding to input appended by space and number representation of how many words are in it
  rules: 
    explicit:
    - write a method
    - words in input will be separated by exactly 1 space
    - any substring of non-space chatacter is defines as a word

Example and test cases

  word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

  word_lengths("baseball hot dogs and apple pie") ==
    ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

  word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

  word_lengths("Supercalifragilisticexpialidocious") ==
    ["Supercalifragilisticexpialidocious 34"]

  word_lengths("") == []

Data structure

  string <=> array conversion - array iteration - string method

Algorithm

  Define method called word_lengths with parameter: str
  Iterate over return value of str split by spaces with map
    Define iterative variable word
    Append space and word length to word

=end

def word_lengths(str)
  str.split(' ').map do |word|
    word + ' ' + word.length.to_s
  end
end

puts word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
puts word_lengths("baseball hot dogs and apple pie") == ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
puts word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
puts word_lengths("Supercalifragilisticexpialidocious") == ["Supercalifragilisticexpialidocious 34"]
puts word_lengths("") == []
