=begin

  Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

  PEDAC

  Problem:

    input: string
    output: boolean corresponding to characters being uppercase or not

  Example and test cases:

    uppercase?('t') == false
    uppercase?('T') == true
    uppercase?('Four Score') == false
    uppercase?('FOUR SCORE') == true
    uppercase?('4SCORE!') == true
    uppercase?('') == true

  Data structure:

    string => array conversion, iteration and comparison

  Algorithm:

    * Define method called uppercase? that has a str parameter
    * Initialize result pointing to true
    * Create arr as return of object str calling chars method
    * Iterate through arr
      * If any element of arr is not equal its uppercase version:
        * Point result to false
        * Break iteration
    * Return result

=end

def uppercase?(str)
  result = true
  arr = str.chars
  arr.each do |char|
    if char != char.upcase
      result = false
      break
    end
  end
  result
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true