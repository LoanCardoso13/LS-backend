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

        Define method called time_of_day with parameter 'total_minutes'
        Initialize 'hours' variable to integer division of (absolute) 'total_minutes' by 60
        Initialize 'minutes' variable to modulus of (absolute) 'total_minutes' by 60
        Write If expression with 'total_minutes' being greater or equal to zero as condition
          Interpolate conversion of 'hours' to string with 2 digits, with ':' and conversion of 'minutes'
        Else 
          Reassign 'hours' to 24 minus its value
          Reassign 'minutes' to 60 minus its value
          Interpolate conversion of 'hours' to string with 2 digits, with ':' and conversion of 'minutes'

=end


