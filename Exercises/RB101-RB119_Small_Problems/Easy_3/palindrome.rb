=begin

  Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

  Write a method that determines whether an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array. Now write a method that determines whether an array or a string is palindromic; that is, write a method that can take either an array or a string argument, and determines whether that argument is a palindrome. You may not use an if, unless, or case statement or modifier.

  PEDAC

  Problem:

    input: string
    output: boolean corresponding to string being palindrome or not

  Examples and test cases:

    palindrome?('madam') == true
    palindrome?('Madam') == false          # (case matters)
    palindrome?("madam i'm adam") == false # (all characters matter)
    palindrome?('356653') == true

  Data structure:

    string method reverse, strings, comparison

  Algorithm:

    * Define method called palindrome? that has a arr_or_str parameter
    * Return comparison between arr_or_str and return of arr_or_str calling method reverse

=end

def palindrome?(arr_or_str)
  arr_or_str == arr_or_str.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
puts palindrome?([1, 2, 3, 3, 2, 1]) == true
puts palindrome?(['a', 'b', 'c']) == false
puts palindrome?([[1, 2], [3, 4], [1, 2]]) == true