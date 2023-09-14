=begin

  Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

  PEDAC

  Problem:

    input: none
    output: even numbers in [1, 99] printed on separate lines

  Examples and test cases:

    none

  Data structure:

    iteration and conditional

  Algorithm:

    * From 1 up to 99
      * print iterator unless its module by 2 is 1

=end

1.upto 99 do |i|
  puts i unless i % 2 == 1
end