=begin

  Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

  PEDAC

  Problem:

    input: string
    output: boolean corresponding to string case-insensitive and ignoring non-alphanumeric being palindrome

  Examples and test cases: 

    real_palindrome?('madam') == true
    real_palindrome?('Madam') == true           # (case does not matter)
    real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
    real_palindrome?('356653') == true
    real_palindrome?('356a653') == true
    real_palindrome?('123ab321') == false

  Data structure:

    importing method, filtering string

  Algorithm:

    * Import palindrome? 
    * Define method called real_palindrome? that has a str parameter
    * Return palindrome? with downcased and non-alphanumeric filtered str as argument 
  
=end

require './palindrome.rb'
puts 
def real_palindrome?(str)
  # str.downcase.delete('^a-z') == str.downcase.delete('^a-z').reverse
  palindrome?(str.downcase.delete('^a-z0-9'))
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false
