=begin

  Write a method that takes a positive integer as an argument and returns that number with its digits reversed.

  PEDAC 

  Problem:

    input: positive integer
    output: positive integer with reversed digits
    leading zeros can be ignored

  Examples and test cases:

    reversed_number(12345) == 54321
    reversed_number(12213) == 31221
    reversed_number(456) == 654
    reversed_number(12000) == 21 # No leading zeros in return value!
    reversed_number(12003) == 30021
    reversed_number(1) == 1

  Data structure:

    string <=> integer conversions

  Algorithm:

  * Define a method called reversed_number that has an 'n' parameter
  * Convert 'n' to string
  * Reverse it
  * Convert it to integer
  * return it

=end

def reversed_number(n)
  return n.to_s.reverse!.to_i
end

# These tests should all return true
puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1