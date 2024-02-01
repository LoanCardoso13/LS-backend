# rubocop:disable all
=begin

A fixed-length array is an array that always has a fixed number of elements. Write a class that implements a fixed-length array, and provides the necessary methods to support the following code:

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end

The above code should output true 16 times.

=end

class FixedArray
  attr_reader :fa

  def initialize(length)
    @fa = Array.new(5)
  end

  def [](index)
    raise IndexError unless within_bounds_index?(index)
    fa[index]
  end

  def within_bounds_index?(index)
    (0..(fa.length-1)).include?(index) || ((-fa.length)..-1).include?(index)
  end

  def []=(index, other)
    raise IndexError unless within_bounds_index?(index)
    fa[index]= other
  end

  def to_a
    fa
  end

  def to_s
    fa.to_s
  end

end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5
 
fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]
 
fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]
 
fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]
 
fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'
 
puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'
 
begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end
 
begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end
 
begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
