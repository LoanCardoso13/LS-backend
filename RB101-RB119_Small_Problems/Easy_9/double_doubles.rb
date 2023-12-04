# rubocop:disable all
=begin

  A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

  Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

  Note: underscores are used for clarity below. Ruby lets you use underscores when writing long numbers; however, it does not print the underscores when printing long numbers. Don't be alarmed if you don't see the underscores when running your tests.

PEDAC

Problem

  input: Integer
  output: Integer, input itself or double it, according to input being double-double or not
  rules:
    explicit:
    - write a method
    - input always provided

Example and test cases

  twice(37) == 74
  twice(44) == 44
  twice(334433) == 668866
  twice(444) == 888
  twice(107) == 214
  twice(103103) == 103103
  twice(3333) == 3333
  twice(7676) == 7676
  twice(123_456_789_123_456_789) == 123_456_789_123_456_789
  twice(5) == 10

Data structure

  integer <=> conversion - string method - control flow

Algorithm

  Define method called twice, with parameter: int
  If even number of digits of int
    Convert to string
    Compare halves
    If halves are equal
      Return int
    Else
      Return int * 2
  Else
    Return int * 2
    
=end

def twice(int)
  if int.digits.length.even?
    str = int.to_s
    if str[0, str.length/2] == str[str.length/2, str.length/2]
        int
    else
      int * 2
    end
  else
    int * 2
  end
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10
