=begin

  A continuation of the previous exercise.

  The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

  Using this information, update the method from the previous exercise to determine leap years both before and after 1752.


PEDAC

Problem:

  input: Integer representing year
  output: Boolean indicating if year is a leap one or not
  rules: 
    explicit: 
      - input is Integer greater than zero
      - write a method 

Examples and test cases:

  leap_year?(2016) == true
  leap_year?(2015) == false
  leap_year?(2100) == false
  leap_year?(2400) == true
  leap_year?(240000) == true
  leap_year?(240001) == false
  leap_year?(2000) == true
  leap_year?(1900) == false
  leap_year?(1752) == true
  leap_year?(1700) == true
  leap_year?(1) == false
  leap_year?(100) == true
  leap_year?(400) == true



Data Structure:

  Control flow - conditionals.

Algorithm:

  Define a method called leap_year? with parameter year
  Write if expression with condition of year > 1752 then: 
    Write logical expression exp1 && (exp2 || exp3) as follows:
      exp1 is year modulus by 4 is equal to zero condition
      exp2 is year modulus by 100 is not equal to zero condition
      exp3 is year modulus by 400 is equal to zero condition 
  Else: 
    year modulus by 4 is equal to zero condition

=end

def leap_year?(year) 
  if year > 1752
    year % 4 == 0 && ( year % 100 != 0 || year % 400 == 0 )
  else 
    year % 4 == 0
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true


