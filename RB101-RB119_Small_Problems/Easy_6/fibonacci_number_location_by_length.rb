=begin 

	The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

        Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

        Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

        You may assume that the argument is always greater than or equal to 2.

PEDAC

Problem:

	input: Integer representing the number of digits of the Fibonacci series
	output: The index of the first Fibonacci number that has the digits represented by input
	rules:
	  explicit:
            - the Fibonacci series starts at index 1.
            - input is at least 2
            - write a method 
          implicit:
	    - the search is for the Fibonacci number whose number of digits is Greater Or Equal to input integer

Examples and test cases:

	find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
        find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
        find_fibonacci_index_by_length(10) == 45
        find_fibonacci_index_by_length(100) == 476
        find_fibonacci_index_by_length(1000) == 4782
        find_fibonacci_index_by_length(10000) == 47847

Data structure:

        Recursion. Control flow.

Algorithm:

	Define method called find_fibonacci_index_by_length with 'dec_place' argument
        'number_1' starts as 1
        'number_2' starts as 1
        'next_number' starts as 2
        'index' starts as 3
        Repeat the following until 'next_number' length is greater or equal to 'dec_place'
          'number_1' becomes 'number_2'
          'number_2' becomes 'next_number'
          'next_number' becomes the result of 'number_1' + 'number_2'
          'index' is equal to itself plus 1
        Return 'index'

=end


