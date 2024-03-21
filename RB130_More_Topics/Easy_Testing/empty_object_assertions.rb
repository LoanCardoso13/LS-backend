# rubocop:disable all
=begin

  Write a minitest assertion that will fail if the Array list is not empty.

=end

require 'minitest/autorun'

class MyClass < Minitest::Test

  def test_emptiness
    list = [[], [1, :b, 'a']].sample
    assert_equal([], list)
  end

end
