# rubocop:disable all
=begin

  In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

  Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

  You may assume that the string will always contain at least one character.

PEDAC

Problem:

  Write a method that takes a non-empty String and returns the percentage of lower, upper cases and neither. Spaces are considered/counted as neither. 

  input: String
  output: Hash with lower, uppercases and neither percentages
  rules:
    explicit:
    implicit:

Examples and test cases:

  letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
  letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
  letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

Data structure:

  built-in count method - Float conversion/operations

Algorithm:

  Define method called letter_percentages with parameter: str
  Initialize variable length to length/size of str
  Initialize variable lower_count to count of lower cases in str
  Initialize variable upper_count to count of upper cases in str
  Initialize variable neither_countto length - lower_count - upper_count
  Return Hash where keys are lowercase, uppercase and neither, and values are lowercase_count to float divided by length times 100,
                                                                              uppercase_count to float divided by length times 100 and
                                                                              neither to float divided by length times 100, respectively

=end

def letter_percentages(str)
  length = str.length
  lower_count = str.count('a-z')
  upper_count = str.count('A-Z')
  neither_count = length - lower_count - upper_count
  {
    lowercase: (lower_count.to_f / length)*100,
    uppercase: (upper_count.to_f / length)*100,
    neither: (neither_count.to_f / length)*100
  }
end

puts letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
puts letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
