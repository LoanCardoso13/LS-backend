# rubocop:disable all
=begin

  Write a program that will take a string of digits and return all the possible consecutive number series of a specified length in that string.

  For example, the string "01234" has the following 3-digit series:

  012
  123
  234
  Likewise, here are the 4-digit series:

  0123
  1234
  Finally, if you ask for a 6-digit series from a 5-digit string, you should throw an error.

=end

class Series
  attr_reader :sequence

  def initialize(sequence)
    @sequence = sequence.chars.map(&:to_i)
  end

  def slices(size)
    raise ArgumentError if size > sequence.length

    answer = []
    (sequence.length - size + 1).times do |idx|
      answer << sequence[idx, size]
    end
    answer
  end

end
