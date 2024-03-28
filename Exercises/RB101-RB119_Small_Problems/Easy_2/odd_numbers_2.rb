=begin

  Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line. Repeat this exercise with a technique different from the one you just used.

  PEDAC 

  Problem:

    input: none
    output: all odd numbers in (1, 99] outputed on console, each on separate line 

  Examples and test cases:

      none

  Data structure:

      iteration

  Algorithm:

      * Iterate over [2, 99]
        * print unless mod 2 == 0

=end

2.upto 99 do |i|
  puts i unless i % 2 == 0
end