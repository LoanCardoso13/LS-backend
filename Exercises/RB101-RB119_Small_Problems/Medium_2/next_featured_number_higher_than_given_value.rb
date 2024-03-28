# rubocop:disable all
=begin

  A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

  Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

PEDAC

Problem:

  Given an Integer, write a method that find the next featured number greater than it. Featured number rules:
    - is odd
    - multiple of 7
    - has no repeated digits
  If there is no next featured number, method should return an error message

  input: Integer
  output: next featured number greater than input, if it exists, otherwise error message
  rules:
    explicit:
    implicit:

Examples and test cases:

  featured(12) == 21
  featured(20) == 21
  featured(21) == 35
  featured(997) == 1029
  featured(1029) == 1043
  featured(999_999) == 1_023_547
  featured(999_999_987) == 1_023_456_987

  featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

Data structure:

Algorithm:

  Require timeout library
  Define method called featured with parameter: int
  Use timeout structure with 13 seconds limit
    Initialize current_int to int
    Create a loop
      Increase current_int by 1
      initialize cond1 to return of current int being odd or not
      initialize cond2 to return of current int being multiple of 7 or not
      initialize cond3 to array of digits of current int chained with tally and size equating array of digits of current int chained with size
      If cond1, cond2 and cond3
        Return current_int

=end

require 'timeout'
def featured(int)
  Timeout::timeout(60) {
    current_int = int
    loop do
      current_int += 1
      cond1 = current_int.odd?
      cond2 = current_int % 7 == 0
      cond3 = current_int.digits.tally.size == current_int.digits.size
      if cond1 && cond2 && cond3
        return current_int
      end
    end
  }
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987

# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
