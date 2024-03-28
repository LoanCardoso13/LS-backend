# rubocop:disable all
=begin

  Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

=end

require 'minitest/autorun'

class MyClass < Minitest::Test

  def test_including
    list = 13, '13'
    list << ['abc', 'xyz'].sample

    assert list.include?('xyz'), "It does not include xyz"
  end

end
