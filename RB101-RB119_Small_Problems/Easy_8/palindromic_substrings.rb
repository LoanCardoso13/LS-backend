# rubocop:disable all
=begin

  Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

  You may (and should) use the substrings method you wrote in the previous exercise.

  For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

PEDAC

Problem

  input: String
  output: all subStrings that are palindromes
  rules:
    explicit:
    - write a method
    - encouraged to use method from previous exercise
    - duplicate strings to be included in output
    - returned strings shall be ordered as they appear in input
    - single characters are not palindromes
    implicit:
    - there will not be empty input but there might be empty output

Example and test cases

  palindromes('abcd') == []
  palindromes('madam') == ['madam', 'ada']
  palindromes('hello-madam-did-madam-goodbye') == [
    'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
    'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
    '-madam-', 'madam', 'ada', 'oo'
  ]
  palindromes('knitting cassettes') == [
    'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
  ]

Data structure

  dependency injection - string comparison

Algorithms

  Require program from previous exercise
  Define method called palindromes with parameter str
  Initialize variable all_subs to return value of substrings method with str argument
  Have all_subs call Array#select with block parameter
    Define iterative variable word
    Compare word with its reverse if word length is greater than 1

=end

require './all_substrings.rb'

def palindromes(str)
  all_subs = substrings(str)
  all_subs.select do |word|
    word == word.reverse if word.length > 1
  end
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
'-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
