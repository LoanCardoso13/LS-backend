# rubocop:disable all
=begin

  Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly. value may not be an instance of one of Numeric's superclasses.

=end

require 'minitest/autorun'

class MyClass < Minitest::Test

  def test_numeric
    value = [Numeric.new, 13].sample
    assert_equal(Numeric, value.class)
  end

end
