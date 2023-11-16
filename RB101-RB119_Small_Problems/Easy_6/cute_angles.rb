=begin 

	Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

        Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

        You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

        You may use this constant to represent the degree symbol:

        DEGREE = "\xC2\xB0"

PEDAC

Problem:

	input: Integer or Float number representing degrees
	output: String representing degrees with minutes and seconds notation
	rules:
	  explicit:
            - write a method
            - leading zero must be included for minutes and seconds (always 2 digits)
            - degree notation given

Examples and test cases:

	dms(30) == %(30°00'00")
        dms(76.73) == %(76°43'48")
        dms(254.6) == %(254°36'00")
        dms(93.034773) == %(93°02'05")
        dms(0) == %(0°00'00")
        dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

Data structure:

        String formatting. Control flow. Float operations. 

Algorithm:

        Define a method called dms with parameter 'dg'
        Initialize variable 'D' to integer part of value from 'dg'
        Initialize variable 'd' to decimal part of value from 'dg'
        Calculate 'M' as the integer part of 60*'d'
        Calculate 'S' as 60 * the decimal part of 60*'d' multiplied by 60 but keep only the first 2 digits
        Return a string formatted appropriately with 'D', 'M' and 'S' 

=end


