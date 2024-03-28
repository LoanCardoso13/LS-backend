# rubocop:disable all
=begin

  You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

  Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.  

PEDAC

Problem:

  input: Integer representing total number of switches
  output: Which lights are on after switching 
  rules:
    explicit:
      - write a method
      - Lights are initially off
    implicit:
      - output should be array representing the places of the lights left on

Examples and test cases:

Example with n = 5 lights:

  round 1: every light is turned on
  round 2: lights 2 and 4 are now off; 1, 3, 5 are on
  round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
  round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
  round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

  The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

  With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

Data structure:

  Array of Booleans - Integer operations - Iteration - Array of Integers from mapped Booleans

Algorithm:

  Define method called light_switcher with parameter n
  Initialize array of n false elements to variable arr
  Iterate n times, with index from 1 to n
    Define iterative variable i
    Iterate over arr elements
      Define iterative variable ele
      Toggle ele if index of ele plus 1 modulus i equals zero
  Initialize answer to empty array
  Iterate through arr elements
    Define iterative variable ele
    append index of ele plus 1 into answer if ele is true
  Return answer

=end

def light_switcher(n)
  arr = (1..n).to_a.map { |_| false }
  1.upto(n) do |i|
    arr.map!.with_index do |ele, j|
      if (j+1)%i == 0
        !ele
      else
        ele
      end
    end
  end
  answer = []
  arr.each.with_index do |ele, k|
    answer << (k+1) if ele
  end
  answer
end

puts light_switcher(5) == [1, 4]
puts light_switcher(10) == [1, 4, 9]
