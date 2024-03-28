=begin

  Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer. Try to use #inject in your solution to this problem.

  PEDAC

  Problem:

    input: user's integer and user's choice (sum or product)
    output: string interpolated by result (according to user's choice)

  Examples and test cases:

    >> Please enter an integer greater than 0:
    5
    >> Enter 's' to compute the sum, 'p' to compute the product.
    s
    The sum of the integers between 1 and 5 is 15.


    >> Please enter an integer greater than 0:
    6
    >> Enter 's' to compute the sum, 'p' to compute the product.
    p
    The product of the integers between 1 and 6 is 720.

  Data structure: 

    conditional flow and iteration

  Algorithm:

    * Ask user integer > 0
    * Point it to 'user_number'
    * Ask user choice, sum or product
    * Point it to 'user_choice'
    * If user chose sum
      * Inject sum method between members of group consisting of sequence from 1 to 'user_number' and point it to 'sum' variable
      * Print string interpolated by 'user_number' and 'sum'
    * If user chose product
      * Inject product method between members of group consisting of sequence from 1 to 'user_number' and point it to 'prod' variable 
      * Print string interpolated by 'user_number' and 'prod'

=end

print "Please enter an integer greater than 0: "
user_number = gets.chomp.to_i
print "Enter 's' to compute sum, 'p' to compute the product: "
user_choice = gets.chomp
if user_choice == 's'
  sum = (1..user_number).inject(:+)
  puts "The sum of the integers between 1 and #{user_number} is #{sum}."
elsif user_choice == 'p'
  prod = (1..user_number).inject(:*)
  puts "The product of the integers between 1 and #{user_number} is #{prod}."
end