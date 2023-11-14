=begin

	As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

	Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

	You may not use ruby's Date and Time methods.

PEDAC

Problem: 

        input: String representing time of day in 24h format 
        output: positive Integer, representing minutes after or before midnight, depending on method chosen
        rules: 
          explicit: 
            - write 2 methods
            - return integer must be within range 0.. 1439
            - must not use built-in Date and Time methods

Examples and test cases:

	after_midnight('00:00') == 0
	before_midnight('00:00') == 0
	after_midnight('12:34') == 754
	before_midnight('12:34') == 686
	after_midnight('24:00') == 0
	before_midnight('24:00') == 0

Data structure:

        Type conversion. Integer operations. Control flow.

Algorithm:

        Define method called get_integers with parameter 'hours_string'
          Initialize variable 'hours' to conversion of 2 first characters of 'hours_string' into integer
          Initialize variable 'minutes' to conversion of 2 last characters of 'hours_string' into integer
          Return 'hours', 'minutes'
        Define method called after_midnight with parameter 'hours_string'
          Initialize 'hours' and 'minutes' to return values of get_integers with 'hours_string' argument
          Reassing 'hours' to zero if it equals 24
          Return 'hours' multiplied by 60 plus 'minutes'
        Define method called before_midnight with parameter 'hours_string'
          Initialize 'hours' and 'minutes' to return values of get_integers with 'hours_string' argument
          Reassign 'hours' to 24 if both 'hours' and 'minutes' equals zero
          Return (24 minus 'hours') multiplied by 60 minus 'minutes'

=end


