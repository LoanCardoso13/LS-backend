=begin

Write a method that will take a short line of text, and print it within a box.

PEDAC

- Problem:

  input: string
  output: printed string within box

  requires a method that takes exactly 1 string

- Examples and test cases:

  print_in_box('To boldly go where no one has gone before.')
  +--------------------------------------------+
  |                                            |
  | To boldly go where no one has gone before. |
  |                                            |
  +--------------------------------------------+

  print_in_box('')
  +--+
  |  |
  |  |
  |  |
  +--+

- Data structure:

  Strings and integers representing their lenghts

- Algorithm:

  * Define a method called print_in_box that has a 'str' parameter
  * Prepend 'str' with '| '
  * Append 'str' with ' |'
  * Point variable 'l' to string length
  * Multiply 'l' by dash and point to variable 'dashes'
  * Modify first and last characters of variable 'dashes' to '+'
  * Multiply 'l' by space character and point to variable 'spaces'
  * Modify first and last characters of variable 'spaces' to '|'
  * Print 'dashes', 'spaces', 'str', 'spaces', 'dashes'

=end

def print_in_box(str)
  str.insert(0,'| ')
  str.insert(-1,' |')
  l = str.length
  dashes =  '-' * l
  dashes[0] = '+'
  dashes[-1] = '+'
  spaces =  ' ' * l
  spaces[0] = '|'
  spaces[-1] = '|'
  puts dashes
  puts spaces
  puts str
  puts spaces
  puts dashes
  puts
end

# Test cases
print_in_box('To boldly go where no one has gone before.')

print_in_box('')