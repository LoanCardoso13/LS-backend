# Write a method to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".

# Example 1:

# Input: ["flower", "flow", "flight"]
# Output: "fl"

# Example 2: 

# Input: ["dog", "racecar", "car"]
# Output: ""
# Explanation there is no common prefix among the input strings
# Note:
# All given inputs are lowercase letters a-z.

# Problem:
# Given an array of strings, find the greatest substring starting from the first character (on each string) that is common/contained in all strings. 

# Algorithm:
# Initialize answer to empty string
# Start a loop with index starting at 0
#   break loop if character at index is not the same for all strings
#   push character at index into answer
#   increase index by 1
# Return answer

def common_prefix(arr)
  answer = "" 
  index = 0
  loop do
    test_char = arr[0][index]
    break unless arr.all? { |string| string[index] == test_char }
    answer << test_char
    index += 1
    break if index >= arr[0].length
  end
  answer
end

p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"
