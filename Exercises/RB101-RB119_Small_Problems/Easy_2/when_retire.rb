=begin

  Build a program that displays when the user will retire and how many years she has to work till retirement.

  PEDAC

  Problem:

    input: user actual and retiring ages
    output string interpolated by actual and retiring years for user and number of years in between

  Examples and test cases:

    What is your age? 30
    At what age would you like to retire? 70

    It's 2016. You will retire in 2056.
    You have only 40 years of work to go!

  Data structure:

    integers and string interpolation

  Algorithm:

    * Ask user for current age.
    * Point response to 'current_age' variable. 
    * Ask user for retiring age.
    * Point response to 'retiring_age' variable.
    * Point current year to 'current_year' variable.
    * Calculate 'remaining_years'.
    * Calculate 'retiring_year'.
    * Print interpolated string.

=end

print "What is your age? "
current_age = gets.chomp.to_i
print "At what age would you like to retire? "
retiring_age = gets.chomp.to_i
current_year = Time.new.year
remaining_years = retiring_age - current_age
retiring_year = current_year + remaining_years
puts "It's #{current_year}. You will retire in #{retiring_year}. \nYou have only #{remaining_years} of work to go!"