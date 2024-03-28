# rubocop:disable all
=begin

  Write a program that, given a natural number and a set of one or more other numbers, can find the sum of all the multiples of the numbers in the set that are less than the first number. If the set of numbers is not given, use a default set of 3 and 5.

  For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

=end

class SumOfMultiples
  attr_reader :numbers

  def self.to(limit)
    answer = []
    numbers = [3, 5]
    numbers.each do |starter|
      iterator = 1
      current_multiple = starter * iterator
      while current_multiple < limit
        answer << current_multiple
        iterator += 1
        current_multiple = starter * iterator
      end
    end
    answer.uniq!
    answer.sum
  end

  def initialize(*numbers)
    @numbers = numbers
  end

  def to(limit)
    answer = []
    numbers.each do |starter|
      iterator = 1
      current_multiple = starter * iterator
      while current_multiple < limit
        answer << current_multiple
        iterator += 1
        current_multiple = starter * iterator
      end
    end
    answer.uniq!
    answer.sum
  end

end
