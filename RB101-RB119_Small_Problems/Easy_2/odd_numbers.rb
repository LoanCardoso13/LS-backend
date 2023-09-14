=begin

  Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

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
        * print if module by 2 is 1

=end

Array(2..99).each do |i|
  puts i if i % 2 == 1
end