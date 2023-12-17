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

  To write a method that returns true or false corresponding to whether the argument can be spelled based on the list of blocks.
  The blocks limits the words that can be spelled:
    - the word cannot use both letters of any block; i.e. each block cannot have both of its letters in word
    - each letter in the whole list can only be used once; i.e. each letter from each block cannot be counted more than once in the word

  input: word (String); a list of blocks (Array of strings)
  output: true or false (Boolean)

Examples and test cases:

  block_word?('BATCH') == true
  block_word?('BUTCH') == false
  block_word?('jest') == true

Data structure:

  Array of Strings - Iteration - Control Flow with Return statement

Algorithm:

  Define constant BLOCKS referencing array of strings of blocks
  Define method called block_word? with parameter: word
  Iterate through elements of BLOCKS, with element parameter being block
    If block's first and last characters are included in word
      Return false
    If block's first or last character can be counted in word more than once
      Return false
  true

=end

BLOCKS = [
  'B:O',   'X:K',   'D:Q',   'C:P',   'N:A',
  'G:T',  'R:E',   'F:S',   'J:W',   'H:U',
  'V:I',   'L:Y',   'Z:M'
]

def block_word?(word)
  BLOCKS.each do |block|
    return false if word.include?(block[0]) && word.include?(block[-1])
    return false if word.count(block[0]) > 1 || word.count(block[-1]) > 1
  end
  true
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true
