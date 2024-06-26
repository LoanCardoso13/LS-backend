=begin

  Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.

  For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and "banana", the program should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.

=end

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(arr)
    arr.reject! { |ele| ele.downcase == word.downcase }
    answer = []
    arr.each do |candidate|
      answer << candidate if word.downcase.chars.sort == candidate.downcase.chars.sort
    end
    answer
  end
end
