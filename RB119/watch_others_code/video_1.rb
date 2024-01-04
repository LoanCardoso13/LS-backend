# Given an array of strings made only of lower case letters, return an array of all characters that show up in all strings within the given array (including duplicates). For example, if a character occurs 3 times on all strings but not 4 times, you need to include that character 3 times in the final answer

# Approach #1) Algorithm
# Run through the alphabet checking which letters are included in all strings
# When found, get the smallest count and use it to add letter into answer

# Approach #2) Algorithm
# Get any string and run through its characters searching the ones included in all strings
# When found, add to answer and remove from other strings
#
# ---
#
# 1) Initialize alphabet Array
# 2) Iterate through each letter/element of the alphabet Array
# 3)    Check condition of letter being included on all input strings
# 3.1)  Use Array#all? with block containing String#include? with letter argument
# 4)        If condition is satisfied, get minimum count of letter on all strings
# 4.1)      Map input Array into Array#tally version of its String#split characters, sort by value of current iteration letter and get the first
# 5)        Add this amount of the letter into the answer Array
# 5.1)      Multiply this amount, then split, add to array
# 6) Return flattened answer Array
#
# ---
#
# 1) Get first input word and iterate through its characters
# 2)    Check condition of character being included on all other strings
# 2.1)  Use Array#all? with block containing String#include? with letter argument on the Array formed by the rest of the strings
# 3)          If condition is satisfied, add letter to answer and remove it from all other strings
# 3.1)        Use Array#<< with char argument and substitute 1 instance of letter from each one of the other strings
# 3.1.1)      Iterate through the rest of the strings and mutate them with String#sub!, with current letter and empty string arguments
# 4) Return answer
#

def common_chars(arr)
  alphabet = ('a'..'z').to_a
  answer = []
  alphabet.each do |letter|
    if arr.all? { |string| string.include?(letter)}
      # answer << (letter * arr.min { |a, b| a.count(letter) <=> b.count(letter) }.count(letter)).split('')
      # answer << (letter * (arr.map { |word| word.chars.tally }.sort_by { |hsh| hsh[letter] }[0][letter])).chars
			answer << letter * (arr.map { |word| word.count.letter }.min)
    end
  end
  answer.flatten
end

def common_chars2(arr)
  one_word = arr.shift
  answer = []
  one_word.chars.each do |letter|
    if arr.all? { |string| string.include?(letter) }
      answer << letter
      arr.each { |word| word.sub!(letter,'') }
    end
  end
  answer
end

p common_chars2(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars2(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars2(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars2(["aabbaaaa", "ccddddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []
