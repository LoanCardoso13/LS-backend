=begin

	As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

	Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

	You may not use ruby's Date and Time methods.

PEDAC

Problem: 

Examples and test cases:

	after_midnight('00:00') == 0
	before_midnight('00:00') == 0
	after_midnight('12:34') == 754
	before_midnight('12:34') == 686
	after_midnight('24:00') == 0
	before_midnight('24:00') == 0

Data structure:

Algorithm:

=end
