=begin

  Write a method named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise.

  Problem:

    input: 2 arguments 
    output: boolean result of truthy evaluation of both arguments under xor logic

  Examples and test cases:

    xor?(5.even?, 4.even?) == true
    xor?(5.odd?, 4.odd?) == true
    xor?(5.odd?, 4.even?) == false
    xor?(5.even?, 4.odd?) == false

  Data structure:

    conditionals

  Algorithm:

    * Define a method called xor that has 2 arguments, cond1 and cond2
    * Return not (cond1 and cond2) and (cond1 or cond2)
=end

def xor?(cond1, cond2)
  !!( !(cond1 and cond2) and (cond1 or cond2) )
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false