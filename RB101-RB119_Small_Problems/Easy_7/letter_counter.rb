# rubocop:disable all
=begin

  Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one represents the number of characters that are uppercase letters, and one represents the number of characters that are neither.

PEDAC

Problem

  input: String
  output: Hash representing upper, lower and neither case letters from input
  rules: 
    explicit:
    - write a method
    implicit:
    - string might be empty
    - string might contain numbers
    - spaces are counted as neither case characters

Examples and test cases

  letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
  letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
  letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
  letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

Data structure

  iteration over string characters/elements - control flow

Algorithm

  Define method called letter_case_count with parameter: str
  Initialize hsh variable pointing to Hash composed of lowercase, uppercase and neither symbolic keys, each with integer 0 value
  Split str into characters and iterate through it
    Define iterative variable char
    If char is lowecase, increase value at :lowercase key from hsh by 1
    If char is uppercase, increase value at :uppercase key from hsh by 1
    Else increase value at :neither key from hsh by 1
  return hsh

=end

def letter_case_count(str)
  hsh = { lowercase: 0, uppercase: 0, neither: 0 }
  str.split('').each do |char|
    hsh[:lowercase] += 1 if char.count('a-z') == 1
    hsh[:uppercase] += 1 if char.count('A-Z') == 1
    hsh[:neither] += 1 if char.count('A-Za-z') == 0
  end
  hsh
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
