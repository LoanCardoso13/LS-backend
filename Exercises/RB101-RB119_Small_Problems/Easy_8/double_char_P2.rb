# rubocop:disable all
=begin

  Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

PEDAC

Problem

  input: a String
  output: a String corresponding to input string with consonant characters doubled
  rules:
    explicit:
    - write a method
    implicit:
    - input might be empty

Example and test cases

  double_consonants('String') == "SSttrrinngg"
  double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
  double_consonants("July 4th") == "JJullyy 4tthh"
  double_consonants('') == ""

Data structure

  string <=> array conversion - iteration - string concatenation - control flow

Algorithms

  Define method called double_consonantes with parameter str
  Initialize variable called answer to empty string
  Have str call String#split methd with empty string as argument and iterate over its return value
    Define iterative variable letter
    If letter is not vowel, digit, punctuation or whitespace
      Concatenate letter * 2 onto answer
    Else
      Concatenate letter onto answer
  Return answer

=end

def double_consonants(str)
  answer = ''
  str.split('').each do |letter|
    if letter.count('^aeiou','^1-9','^,.;:!? ','^-') == 1
      answer += letter * 2
    else
      answer += letter
    end
  end
  answer
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
