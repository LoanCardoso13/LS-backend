# rubocop:disable all
=begin

  Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

PEDAC

Problem

  input: String
  output: String with alternating upper and lower cases
  rules: 
    explicit:
    - write a method
    - non-letter characters won't be changed but will be counted for alternating purposes
    implicit:
    - the order of upper and lower cases is predefined and never changes, starts with upper and changes for the next character while ignoring non-letter characters

Example and test cases

  staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
  staggered_case('ALL_CAPS') == 'AlL_CaPs'
  staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

Data structure

  string <=> array conversion - array iteration - string methods

Algorithm

  Define method called staggered_case with parameter: str
  Initialize variable i pointing to zero
  Return String#split with empty string as argument and str as caller concatenated with Array#map with block argument concatenated with Array#join with empty string as argument
    Within block, define iterative variable char
    Increase i by 1
    If i is odd, call String#upcase with char
    Else, if i is even, call String#downcase with char

=end

def staggered_case(str)
  i = 0
  str.split('').map do |char|
    i += 1
    if i.odd?
      char.upcase
    else
      char.downcase
    end
  end.join('')
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

