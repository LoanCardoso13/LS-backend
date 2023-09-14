=begin

Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

PEDAC

Problem:
    input: integer (optional conditional defaulting to 1)
    output: string => alternating 1/0 => starts with 1 => same length as integer
            (if conditional set to 0, alternating 0/1 => starts with 0)
    requires a method that takes - necessarily - exactly 1 argument.
    (optionally 2, second argument defaulting to 1) 
    argument is positive integer
    (second argument should be either 1 or 0)
    can the argument be zero?

Example and test cases:

    puts stringy(6) == '101010' true
    puts stringy(6, 0) == '010101' true

Data structure:

    string object, loop, conditional to modify

Algorithm:

    * Define a method called stringy that has one parameter 'num' (optionally a 'cond' defaulting to 1)
    * Initializes empty string called 'str'
    * Loops for 'num' many times
      * Append iterator+1, module 2, stringfyed, to string
    * If 'cond' is 0:
      * Remove last character 
      * Add a starting zero 
    return 'str'

=end

def stringy(num, cond=1)
  str = ''
  num.times do |i|
    str << ((i+1)%2).to_s   
  end
  if cond == 0
    str.slice!(str.length-1)
    str.insert(0,'0')
  end
  return str
end

# These tests should all return true
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts 
puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7, 0) == '0101010'