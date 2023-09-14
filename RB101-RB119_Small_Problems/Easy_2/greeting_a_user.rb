=begin

  Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

  PEDAC

  Problem:

    input: user's name
    output: greeting string with user's name or yell with user's name

  Examples and test cases:

    What is your name? Bob
    Hello Bob.

    What is your name? Bob!
    HELLO BOB. WHY ARE WE SCREAMING?

  Data structure:

    strings, interpolation and conditional

  Algorithm:

    * Ask user's name
    * Refer it to 'user_name'
    * Does it end with "!" ?
      * if so, print interpolated yell
      * if not, print interpolated greeting

=end

print "What is your name? "
user_name = gets.chomp
output = user_name[-1] == "!" ? 
  "HELLO #{user_name[0, user_name.length - 1].upcase!}. WHY ARE WE SCREAMING" :  
  "Hello #{user_name}."
puts output