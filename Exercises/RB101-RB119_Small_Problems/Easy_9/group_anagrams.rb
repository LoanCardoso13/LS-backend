# rubocop:disable all
=begin

  Given the array...

  words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
            'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
            'flow', 'neon']

  Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

  ["demo", "dome", "mode"]
  ["neon", "none"]
  #(etc)

PEDAC

Problem

  input: Array of Strings which are all anagrams
  output: Arrays of anagrams PRINTED to the screen in groups
  rules: 
    explicit:
    - write a method
    implicit:
    - all given words are already anagrams
    - all given words have 4 letters

Example and test cases

  words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
            'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
            'flow', 'neon'] # => ["demo", "dome", "mode", "neon", "none"]

Data structure

  string <=> array conversion - array sort - array iteration

Algorithm

  Define method called group_anagrams with parameter: arr
  Initialize variable answer to empty array
  Iterate over elements of arr
    Define iterative variable word1
    Initialize empty variable called inner_arr
    Iterate over elements of arr
      Define iterative variable called word2
      If word1 contains the same letters as word2
        Push word1 and word2 into inner_arr
    Get rid of duplicates in inner_arr
    Sort inner_arr
    Push inner_arr into answer
  Flatten answer
  Get rid of duplicates in answer
  Print each element from answer

=end

def group_anagrams(arr)
  answer = []
  arr.each do |word1|
    inner_arr = []
    arr.each do |word2|
      if word1.split('').sort == word2.split('').sort
        inner_arr.push(word1, word2)
      end
    end
    inner_arr.uniq!
    answer << inner_arr.sort
  end
  answer.uniq!
  answer.each do |element|
    p element
  end
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon'] # => ["demo", "dome", "mode", "neon", "none"]

group_anagrams(words)
