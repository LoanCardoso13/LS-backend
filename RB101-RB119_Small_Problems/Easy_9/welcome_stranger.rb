# rubocop:disable all
=begin

  Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

PEDAC

Problem

  input: Array with the names and Hash with title and occupation
  output: String with greeting
  rules:
    explicit: 
    - write a method
    - at least 2 names will be provided
    - returns a string, doesn't output it
    implicit:

Example and test cases

  greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) #=> "Hello, John Q Doe! Nice to have a Master Plumber around."  

Data structure

  string interpolation - array and hash indexing

Algorithm

  Define method called greetings with 2 parameters: arr and hsh
  Return an interpolated string with arr joined by spaces and references to the values of hsh.

=end

def greetings(arr, hsh)
  "Hello, #{arr.join(' ')}! Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) #=> "Hello, John Q Doe! Nice to have a Master Plumber around."  
