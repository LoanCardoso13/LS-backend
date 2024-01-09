# rubocop:disable all
=begin
Find the length of the longest substring in the given string that is the same in reverse.

As an example, if the input was "I like racecars that go fast", the substring (racecars) length would be 7.

If the length of the input string is 0, return value must be 0.

Example:
"a" -> 1
"aab" -> 2
"abcde" -> 1
"zzbaabcd" -> 4
"" -> 0

Problem:
Given a string, among all its palindromic substrings (including 1 character), find the longest and return its length. If input is empty string, return 0.

Algorithm:
Get an array with all the palindromic substrings of a string, including, 1 character
Sort by length
Get the longest
=end

def longest_palindrome(str)
  all_subs = []
  0.upto(str.length - 1) do |i|
    i.upto(str.length - 1) do |j|
      all_subs << str[i..j] if str[i..j] == str[i..j].reverse
    end
  end
  all_subs.sort_by! { |sub| sub.length }
  all_subs[-1].size
end

p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4 
p longest_palindrome("baablkj12345432133d") == 9
