# rubocop:disable all
=begin

  Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

PEDAC

Problem

  input: String
  output: String with alternating upper and lower cases
  rules: 
    explicit:
    - modify method from previous exercise
    - do not count non-alphabetical characters when toggling case state

Examples and test cases

  staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
  staggered_case('ALL CAPS') == 'AlL cApS'
  staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

Data structure

  modify previous method such that within iteration there's a control flow to detect if character is alphabetical and increase counter only within each flow branch

Algorithm

  Define method called staggered_case with parameter: str
  Initialize variable i pointing to zero
  Return String#split with empty string as argument and str as caller concatenated with Array#map with block argument concatenated with Array#join with empty string as argument
    Within block, define iterative variable char
    If a-zA-Z includes char
      Increase i by 1
      If i is odd, call String#upcase with char
      Else, if i is even, call String#downcase with char
    Else, if a-zA-Z does not include char
      return char

=end

def staggered_case(str)
  i = 0
  str.split('').map do |char|
    if char.count('a-zA-Z') == 1
      i += 1
      if i.odd?
        char.upcase
      else
        char.downcase
      end
    else
      char
    end
  end.join('')
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
