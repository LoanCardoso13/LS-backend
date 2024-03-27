# rubocop:disable all
=begin

  Write a program that can generate the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.

=end

class BeerSong

  def self.verse(number)
    if number > 1
      "#{number} #{number == 1 ? 'bottle' : 'bottles'} of beer on the wall, #{number} #{number == 1 ? 'bottle' : 'bottles'} of beer.\n" \
        "Take one down and pass it around, #{number - 1} #{(number - 1) == 1 ? 'bottle' : 'bottles'} of beer on the wall.\n" \
    elsif number == 1
      "#{number} bottle of beer on the wall, #{number} bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n" \
    else
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n" \
    end
  end

  def self.verses(first, last)
    answer = []
    first.downto(last) { |n| answer << BeerSong.verse(n) }
    answer.join("\n")
  end

  def self.lyrics
    BeerSong.verses(99, 0)
  end

end
