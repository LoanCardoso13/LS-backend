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

  input:
  output:
  rules:
    explicit:
    implicit:

Examples and test cases:

  block_word?('BATCH') == true
  block_word?('BUTCH') == false
  block_word?('jest') == true

Data structure:

Algorithm:

=end
