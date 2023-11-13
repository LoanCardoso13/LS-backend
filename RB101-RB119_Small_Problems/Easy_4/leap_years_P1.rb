=begin

  In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

  Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.

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
  leap_year?(1700) == false
  leap_year?(1) == false
  leap_year?(100) == false
  leap_year?(400) == true

Data Structure:

  Control flow - conditionals.

Algorithm:

  Define a method called leap_year? with parameter year
  Write logical expression exp1 && (exp2 || exp3) as follows:
    exp1 is year modulus by 4 is equal to zero condition
    exp2 is year modulus by 100 is not equal to zero condition
    exp3 is year modulus by 400 is equal to zero condition 

=end


