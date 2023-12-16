# rubocop:disable all
=begin

  A collection of spelling blocks has two letters per block, as shown in this list:

  B:O   X:K   D:Q   C:P   N:A
  G:T   R:E   F:S   J:W   H:U
  V:I   L:Y   Z:M

  This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

  Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

PEDAC

Problem:

  input: a list of spelling blocks and a String word
  output: Boolean true or false corresponding to the given word following rules defined by list of blocks or not
  rules:
    explicit:
      - write a method
      - words should not use use both letters of any given block
      - words should not repeat a letter given in any block
    implicit:
      - case-insensitive problem

Examples and test cases:

  block_word?('BATCH') == true
  block_word?('BUTCH') == false
  block_word?('jest') == true

Data structure:

  Constant Array of Strings - 

Algorithm:

  Define constant BLOCKS to list of string blocks
  Define method called block_word? with parameter: word
  Reassign word to its uppercased version

  Iterate through elements BLOCK
    Define iterative variable ele
    Initialize/reassign count1 and count2 to zero
    Iterate through characters of word
      Define iterative variable char
      if first character of ele equals char, count1++
      if last character of ele equals char, count2++
      Return false if count1 or count2 equals 2

  Iterate through elements of BLOCKS
    Define iterative variable ele
    Count how many characters of ele appear in word
    Return false if that results to 2

  true

=end


BLOCKS = [  'B:O',   'X:K',   'D:Q',   'C:P',   'N:A',
  'G:T',   'R:E',   'F:S',   'J:W',   'H:U',
  'V:I',   'L:Y',   'Z:M' ]

def block_word?(word)
  word = word.upcase
  count = 0
  
  BLOCKS.each do |ele|
    count1 = 0; count2 = 0
    word.chars.each do |char|
      count1 += 1 if ele[0] == char
      count2 += 1 if ele[-1] == char
      return false if count1 == 2 || count1 == 2
    end
  end

  BLOCKS.each do |couple|
    return false if word.count(couple) == 2
  end

  true
end


puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true
