=begin

  Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

  PEDAC

  Problem:

    input: user string
    ouput: number of characters of said string
    explicit rule: do not count spaces

  Examples and test cases:

    Please write word or multiple words: walk
    There are 4 characters in "walk".

    Please write word or multiple words: walk, don't run
    There are 13 characters in "walk, don't run".

  Data structure:

    string and string methods

  Algorithm:

    * Ask user for string, refer response to user_string variable
    * Call strip, delete with a space parameter, and length on user_string and refer to number_of_characters
    * Interpolate program output with number_of_characters and user_String

=end

print "Please write a word or multiple words: "
user_string = gets.chomp

number_of_characters = user_string.strip.delete(' ').length
puts "There are #{number_of_characters} characters in \"#{user_string}\"."