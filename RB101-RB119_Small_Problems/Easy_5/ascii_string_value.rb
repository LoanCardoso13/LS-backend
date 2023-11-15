=begin

        Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

PEDAC

Problem: 

        input: String 
        output: Integer corresponding to sum of ASCII values for each input character
        rules: 
          explicit: 
            - write a method
          implicit: 
            - input may be empty

Examples and test cases:

        ascii_value('Four score') == 984
        ascii_value('Launch School') == 1251
        ascii_value('a') == 97
        ascii_value('') == 0

Data structure:

        Iteration.

Algorithm:

        Define method called ascii_value with parameter str
        Initialize variable sum to zero
        Iterate over 'str'
          Define iterative variable 'char'
          Reassign 'sum' to itself plus the ascii equivalent of char
        Return sum

=end

def ascii_value(str)
  sum = 0
  str.each_char { |char| sum += char.codepoints[0] }
  sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0


