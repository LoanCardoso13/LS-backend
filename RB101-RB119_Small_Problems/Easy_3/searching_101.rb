=begin

  Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

  PEDAC

  Problem:

  input: 6 numbers from the user, sequentially 
  output: printed message expressing if the 6th appears in the first 5
  implicit rule: numbers are integers

  Examples and test cases:

  (vide web page)

  Data structure:

  Array. Destructive method. Searching iteration. 

  Algorithm:

  Define empty array called arr.
  For 5 times:
    Ask user for input integer and push it into arr.
  Ask user last number and refer it to variable to_be_found.
  Define variable answer as "appears" or "does not appears" according to result of include? method.
  Print interpolated string.

=end

arr = []
1.upto 5 do
  |i|
  print "==> (#{i}) Please enter an integer: "
  arr << gets.chomp.to_i
end
print "==> Please enter the last integer, to be found: "
to_be_found = gets.chomp.to_i

answer = arr.include?(to_be_found) ? "appears" : "does not appear"
puts "The number #{to_be_found} #{answer} in #{arr}."