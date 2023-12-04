# rubocop:disable all
=begin

  Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

PEDAC

Problem

  input: String with name and last name
  output: String with name and last name but on different format
  rules:
    explicit:
    - write a method
    implicit:
    - always name and last name provided, separated by space

Example and test cases

  swap_name('Joe Roberts') == 'Roberts, Joe'

Data structure

  string methods

Algorithm

  Define method called swap_name with parameter: str
  Return interpolated string with str sectioned after the space, comma and sr sectioned before the space

=end

def swap_name(str)
  mark = str.index(' ')
  "#{str[mark+1..]}, #{str[0,mark]}"
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'
