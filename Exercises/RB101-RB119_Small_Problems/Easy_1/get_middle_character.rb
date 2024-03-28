=begin

  Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

  PEDAC

  Problem:

    input: non-empty string 
    output: either middle character, if odd, or middle characters, if even

  Examples and test cases:

    center_of('I love ruby') == 'e'
    center_of('Launch School') == ' '
    center_of('Launch') == 'un'
    center_of('Launchschool') == 'hs'
    center_of('x') == 'x'

  Data structure:

    Strings, conditionals

  Algorithim:

    * Define a method called center_of that has a 'str' parameter
    * Set 'half' to 'str' length divided by 2
    * return str[half-1] and str[half] if 'str' length is even
    * return str[half] if 'str' length is odd

=end

def center_of(str)
  half = str.length / 2
  return str[half-1, 2] if str.length % 2 == 0
  str[half] 
end

# These tests should all return true
puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'