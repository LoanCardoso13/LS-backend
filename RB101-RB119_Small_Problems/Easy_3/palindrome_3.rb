=begin

  Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

  PEDAC

  Problem:

    input: integer
    output: boolean corresponding to integer being palindrome or not

  Example and test cases:

    palindromic_number?(34543) == true
    palindromic_number?(123210) == false
    palindromic_number?(22) == true
    palindromic_number?(5) == true

  Data structure:

    data conversion, importing method

  Algorithm:

    * Import palindrome?
    * Define method called palindromic_number? that has an int parameter
    * Return palindrome? with stringified int

=end

require './palindrome.rb'
puts

def palindromic_number?(int)
  palindrome?(int.to_s)
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true