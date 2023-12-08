# rubocop:disable all
=begin

	The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

	Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

	You may not use ruby's Date and Time classes.

	Disregard Daylight Savings and Standard Time and other complications.

PEDAC

Problem: 

        input: Integer  
        output: String in format "hh:mm" 
        rules: 
          explicit: 
            - output in 24h format (no AM or PM notation) 
            - write a method
            - input integer represents strictly the number of minutes
          implicit: 
            - input integer may be 0, negative or positive
            - input may be more than 12h
            - (assumption) input may NOT be more than 24h
	      - During implementation this assumption proved wrong

Examples and test cases:

	time_of_day(0) == "00:00"
	time_of_day(-3) == "23:57"
	time_of_day(35) == "00:35"
	time_of_day(-1437) == "00:03"
	time_of_day(3000) == "02:00"
	time_of_day(800) == "13:20"
	time_of_day(-4231) == "01:29"

Data structure:

        Integer operations - Type conversion - Control flow. 

Algorithm:

  Define method called time_of_day with parameter: total_minutes
  Create a loop to transform negative arguments into their corresponding positive
    If negative, it will add the minutes of a day to itself until it becomes positive
  Initialize 'hours' variable to integer division of (absolute) 'total_minutes' by 60
  Reassign 'hours' to itself modulus 24 (for the case of looping through multiple days)
  Initialize 'minutes' variable to modulus of (absolute) 'total_minutes' by 60
  Interpolate conversion of 'hours' to string with 2 digits, with ':' and conversion of 'minutes'

=end

def time_of_day(total_minutes)
  while total_minutes < 0
    total_minutes += 24*60
  end
  hours = total_minutes.abs / 60
  hours %= 24
  minutes = total_minutes.abs % 60
  format('%.2d:%.2d', hours, minutes)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
# Refactored 1
