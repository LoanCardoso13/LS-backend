# rubocop:disable all
=begin

  Write a method that takes an array as an argument, and a block that returns true or false depending on the value of the array element passed to it. The method should return a count of the number of times the block returns true.

  You may not use Array#count or Enumerable#count in your solution.

  count([1,2,3,4,5]) { |value| value.odd? } == 3
  count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
  count([1,2,3,4,5]) { |value| true } == 5
  count([1,2,3,4,5]) { |value| false } == 0
  count([]) { |value| value.even? } == 0
  count(%w(Four score and seven)) { |value| value.size == 5 } == 2

=end

def count(arr)
  count = 0
  arr.each do |ele|
    count += 1 if yield(ele)
  end
  count
end

p  count([1,2,3,4,5]) { |value| value.odd? } == 3
p  count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p  count([1,2,3,4,5]) { |value| true } == 5
p  count([1,2,3,4,5]) { |value| false } == 0
p  count([]) { |value| value.even? } == 0
p  count(%w(Four score and seven)) { |value| value.size == 5 } == 2
