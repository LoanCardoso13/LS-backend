# rubocop:disable all
=begin

  Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).

=end

require 'minitest/autorun'

class MyClass < Minitest::Test

  def test_isa
    value = [ 13, 13.0, Numeric.new ].sample
    assert( value.is_a? Numeric )
  end

end
