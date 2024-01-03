# rubocop:disable all
# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Problem:
# Given string full of words, return a similar string but, every 2nd character, i.e. 2nd, 4th, 6th, 8th ... , of the words in multiple of 3 places, i.e. 3rd, 6th, 9th... , should be made uppercase.

# Algorithm
# Iterate through words in input string with index (word, i)
#   If (i+1) is multiple of 3, iterate through the word with index (char, j)
#     If (j+1) is multiple of 2 then
#       Take the j position in word and mutate it to the uppercase value of char
# Join all mutate words

def to_weird_case(str)
  str.split.each_with_index do |word, i|
    if (i+1) % 3 == 0
      word.chars.each_with_index do |char, j|
        if (j+1) % 2 == 0 
          word[j]= char.upcase
        end
      end
    end
  end.join(' ')
end
# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==  'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case( 'It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case( 'Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".
