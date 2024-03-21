# rubocop:disable all
=begin

  Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

=end

require 'minitest/autorun'

class MyClass < Minitest::Test

  def test_dc
    value = 'XyZx'
    assert_equal('xyz', value.downcase)
  end

end
