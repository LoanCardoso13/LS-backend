# Given 2 strings, your job is to find out if there is a substring that appears in both strings. You will return true if you find a substring that appears in both strings, or false if you do not. We only care about substrings that are longer than 1 character long.

# Problem:
# Given 2 strings, find out if there is any substring of length greater than 1 that is common to both of them. Case insensitive. 

# Algorithm:
# Initialize all_subs1 and all_subs2 to empty arrays
# Iterate from indexes 0 to string1 length - 2 (i)
#   Iterate from indexes i to string1 length -1 (j)
#     Push string indexed at string1[i..j] into all_subs1
# Iterate from indexes 0 to string2 length - 2 (i)
#   Iterate from indexes i to string2 length -1 (j)
#     Push string indexed at string2[i..j] into all_subs2
# 
# Iterate over elements of all_subs1 (ele1)
#   Iterate over elmeents of all_subs2 (ele2)
#     return true if ele1 == ele2
# Return false

def substring_test(string1, string2)
  string1 = string1.downcase
  string2 = string2.downcase

  all_subs1, all_subs2 = [], []
  0.upto(string1.length-2) do |i|
    (i+1).upto(string1.length-1) do |j|
      all_subs1 << string1[i..j]
    end
  end
  0.upto(string2.length-2) do |i|
    (i+1).upto(string2.length-1) do |j|
      all_subs2 << string2[i..j]
    end
  end

  all_subs1.each do |ele1|
    all_subs2.each do |ele2|
      return true if ele1 == ele2
    end
  end
  false
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true
