=begin

  Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

  PEDAC

  Problem:

    input: positive integer and boolean
    output: bonus given, i.e., half integer or zero, depending on boolean

    requires method that takes necessarily 2 arguments

    if boolean is true, bonus is salary/2
    if boolean is false, bonus is 0

  Example and test cases:

    puts calculate_bonus(2800, true) == 1400
    puts calculate_bonus(1000, false) == 0
    puts calculate_bonus(50000, true) == 25000

    The test above should print true.

  Data structure:

    Conditional flow.

  Algorithm:

  * Define a method called calculate_bonus that has 2 parameters: 'salary' and 'cond'  
  * Return salary/2 if 'cond' is true, and zero otherwise

=end

def calculate_bonus(salary, cond)
  cond ? salary/2 : 0
end

# These tests should all return true
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000