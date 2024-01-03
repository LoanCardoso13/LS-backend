=begin
Write function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise return false.

For example: 
str1 is 'rkqodlw' abd str2 is 'world' the output should return true
str1 is 'cedewaraaossoqqyt' and str2 is 'codewars' should return true
str1 is 'katas' and str2 is 'steak' should return false

Only lower case letters will be used (a-z). No punctuation or digits will be included.

Problem:
Given 2 strings, str1 and str2, check if all characters in str2 are included in str1 and return true if they are, otherwise false.

Algorithm:
Check if all characters in str2 are contained in str1
If they are, then
Check if the counting for each of the characters from str1 is equal or bigger in str2

=end

def scramble(str1, str2)
  str2.chars.each do |char|
    return false if str1.count(char) < str2.count(char)
  end
  true
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true 
p scramble('scriptingjava', 'javascript') == true
