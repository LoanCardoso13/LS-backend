=begin

  Write a simple linked list implementation. The linked list is a fundamental data structure in computer science, often used in the implementation of other data structures.

  The simplest kind of linked list is a singly linked list. Each element in the list contains data and a "next" field pointing to the next element in the list of elements. This variant of linked lists is often used to represent sequences or push-down stacks (also called a LIFO stack; Last In, First Out).

  Let's create a singly linked list whose elements may contain a range of data such as the numbers 1-10. Provide methods to reverse the linked list and convert a linked list to and from an array.

=end

class Element
  attr_reader :datum, :next_element

  def initialize(datum, next_element = nil)
    @datum = datum
    @next_element = next_element
  end

  def tail?
    !next_element
  end

  def next
    next_element
  end
end

class SimpleLinkedList
  def initialize
    @container = []
  end

  def size
    container.size
  end

  def empty?
    self.size == 0
  end

  def push(datum)
    if empty?
      ele = Element.new(datum)
    else
      companion = head
      ele = Element.new(datum, companion)
    end
    container.push(ele)
  end

  def peek
    return nil unless container[-1]

    container[-1].datum
  end

  def head
    container[-1]
  end

  def pop
    container.pop.datum
  end

  def self.from_a(arr)
    arr ||= []

    new_list = new
    arr.reverse.each { |datum| new_list.push(datum) }
    new_list
  end

  def to_a
    container.reverse.map(&:datum)
  end

  def reverse
    new_list = self.class.new
    container.reverse.each { |ele| new_list.push(ele.datum) }
    new_list
  end

  private

  attr_reader :container
end
