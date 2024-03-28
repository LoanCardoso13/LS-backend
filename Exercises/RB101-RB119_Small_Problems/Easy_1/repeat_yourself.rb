=begin

    Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

    PEDAC

    - Problem:
        input: string, natural integer
        output: string printed for integer many times

        requires a method that takes - necessarily - exactly 2 arguments. 
        
        1 argument is string, 1 argument is integer - order assumed. 



    - Example and test cases:

        repeat('Hello', 3)
        Hello
        Hello
        Hello

    - Data Structure:

        Loop

    - Algorithm:

        * Define a method called repeat that takes 2 parameters, 'str' and 'int'
        * Loop for 'int' many times
          * print 'str'

=end

def repeat(str, int)
  int.times do
    puts str
  end
end

repeat('Hello', 3)