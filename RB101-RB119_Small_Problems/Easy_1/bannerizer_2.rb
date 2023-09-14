=begin

Write a method that will take a line of text, and print it within a box. Wrap very long messages so they appear on multiple lines, but still within a box.

PEDAC

Problem:

  input: string longer than 80 characters
  output: boxed wrapped long printed strings/messages

  requires a method that takes exactly 1 string 

Examples and test cases:

Data structure:

  Strings and integers representing their lengths

Algorithm:

  * Create empty array, name it lines_container
  * Create variable max_line_width and set to 76 (tweaked afterwards)
  * Get string length, name it full_length
  * Divide full_length by max_line_width, name result number_of_lines
  * For number_of_lines + 1 times
      * Slice string starting from iterating index times max_line_width, by max_line_width characters, and append it to lines_container
  * Iterate through lines_container and use method from bannerizer for each item

=end

# Method built previously
def bannerizer(str)
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

def print_in_box(str)
  lines_container = []
  max_line_width = 120 # In my terminal it worked well with 120
  full_length = str.length
  number_of_lines = full_length / max_line_width + 1
  number_of_lines.times do |index|
    lines_container << str[index*max_line_width, max_line_width]
  end
  lines_container.each do |item|
    bannerizer(item)
  end
end

# These are all test cases
print_in_box('To boldly go where no one has gone before.')


print_in_box('')

print_in_box('Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box). For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.')

print_in_box("This is a fairly straightforward solution. To simplify matters, we start out by setting horizontal_rule and empty_line to appropriate values for the top and bottom 2 lines of the box. The expression '-' * (message.size + 2) simply creates a string of message.size + 2 hyphens; combined with the + at the beginning and end of the string, this is just wide enough to draw the horizontal lines while leaving room for one blank on either side of the message.")