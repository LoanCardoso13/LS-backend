# rubocop:disable all
=begin

  Create a custom set type.

  Sometimes it is necessary to define a custom data structure of some type, like a set. In this exercise you will define your own set type. How it works internally doesn't matter, as long as it behaves like a set of unique elements that can be manipulated in several well defined ways.

  In some languages, including Ruby and JavaScript, there is a built-in Set type. For this problem, you're expected to implement your own custom set type. Once you've reached a solution, feel free to play around with using the built-in implementation of Set.

  For simplicity, you may assume that all elements of a set must be numbers.

=end

class CustomSet

  def initialize(set = [])
    @set = set
  end

  def empty?
    set.empty?
  end

  def contains?(member)
    set.include?(member)
  end

  def subset?(other)
    return false if set.any? { |member| !other.set.include?(member) }
    true
  end

  def disjoint?(other)
    return false if set.any? { |member| other.set.include?(member) }
    true
  end

  def eql?(other)
    set.uniq.sort == other.set.uniq.sort
  end
  alias_method :==, :eql?

  def add(number)
    set.push(number)
    self
  end

  def intersection(other)
    common_arr = set.intersection other.set
    CustomSet.new(common_arr)
  end

  def difference(other)
    diff_arr = set.difference other.set
    CustomSet.new(diff_arr)
  end

  def union(other)
    union_arr = set.union other.set
    CustomSet.new(union_arr)
  end

  protected
  
  attr_reader :set

end
