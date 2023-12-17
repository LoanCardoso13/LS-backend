# rubocop:disable all
=begin

  Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

  Note that balanced pairs must each start with a (, not a ).

PEDAC

Problem:

  Write a method that check if a given String has properly balanced parentheses usage. Being properly balanced, means following this set of rules:
    There are 2 types of parenthesis: opening and closing
    - There never can be more closing than opening parenthesis, at any moment
    - If there are more opening than closing parenthesis, these need to be balanced by the same number of closing ones
    - When no parenthesis, check ok

  input: String
  output: true or false (Boolean)
  rules:
    explicit:
    implicit:

Examples and test cases:

  balanced?('What (is) this?') == true
  balanced?('What is) this?') == false
  balanced?('What (is this?') == false
  balanced?('((What) (is this))?') == true
  balanced?('((What)) (is this))?') == false
  balanced?('Hey!') == true
  balanced?(')Hey!(') == false
  balanced?('What ((is))) up(') == false
  balanced?('What ())(is() up') == false

Data structure:

  Variable for parentheses counting - Control Flow 

Algorithm:

  Define method called balanced? with parameter str
  Initialize variable parentheses_count to zero
  Iterate through characters of str, with element variable char
    If opening parenthesis is found, increase parentheses_count
    Else If closing parenthesis is found, decrease parentheses_count
    Return false if parentheses_count is negative
  Return true if parentheses_count is zero, false otherwise

=end

def balanced?(str)
  parentheses_count = 0
  str.chars.each do |char|
    if char.include?('(')
      parentheses_count += 1
    elsif char.include?(')')
      parentheses_count -= 1
    end
    return false if parentheses_count < 0
  end
  if parentheses_count == 0
    true
  else
    false
  end
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
puts balanced?('What ())(is() up') == false
