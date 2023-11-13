=begin

  Write a metod that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

PEDAC

Problem:

  input: two String arguments
  output: concatenation of strings like shortlongshort
  rules:
    explicit: strings have different lengths. 
    implicit: String can be empty
              always 2 arguments are given

Examples and test cases:

  short_long_short('abc', 'defgh') == "abcdefghabc"
  short_long_short('abcde', 'fgh') == "fghabcdefgh"
  short_long_short('', 'xyz') == "xyz"

Data structure:

  String built-in methods.

Algorithm:

  Define method called short_long_short with 2 parameters, str1 and str2
  return result of the ternary expression exp1 ? exp2 : exp3 where
    exp1 is conditional expression claiming length of str1 is bigger than of str2
    exp2 is str2 + str1 + str2
    exp3 is str1 + str2 + str1

=end

def short_long_short(str1, str2)
  str1.length > str2.length ? str2 + str1 + str2 : str1 + str2 + str1
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
