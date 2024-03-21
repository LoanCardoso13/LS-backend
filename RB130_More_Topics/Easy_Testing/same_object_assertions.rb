# rubocop:disable all
=begin

  Write a test that will fail if list and the return value of list.process are different objects.

=end

require 'minitest/autorun'

class List

  def process
    13
  end

end

class MyClass < Minitest::Test

  def test_objs
    list = List.new
    assert_equal(list, list.process)
  end

end
