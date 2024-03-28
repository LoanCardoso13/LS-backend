# rubocop:disable all
=begin

  Write a test that will fail if 'xyz' is one of the elements in the Array list:

=end

require 'minitest/autorun'

class MyClass < Minitest::Test

  def test_include
    list = [['abc', 'efd'], ['xyz', 'lll']].sample
    p list
    refute(list.include? 'xyz')
  end

end
