=begin

  Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

  PEDAC

  Problem:

    input: 2 float from user
    output: printed string(s)

  Examples and test cases:

    What is the bill? 200
    What is the tip percentage? 15

    The tip is $30.0
    The total is $230.0

  Data structure:

    float numbers and string interpolation

  Algorithm:

    * Ask user for bill amount.
    * Convert result to float and round it by 2, point to 'bill'
    * Ask user for tip percentage.
    * Convert to float and point it to 'tip_rate'
    * Calculate 'tip'
    * Calculate 'total'
    * Print string interpolated by calculations 

=end

print "What is the bill? "
bill = gets.chomp.to_f.round(2)
print "What is the percentage? "
tip_rate = gets.chomp.to_f
tip = bill * tip_rate / 100
total = bill + tip
puts "The tip is $#{tip} \nThe total is $#{total}"
