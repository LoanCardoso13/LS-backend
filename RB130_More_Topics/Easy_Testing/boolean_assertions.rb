# rubocop:disable all
=begin

  Write a minitest assertion that will fail if the value.odd? is not true.

=end

require 'minitest/autorun'

class MyClass < Minitest::Test

  def test_oddity
    value = (1..10).to_a.sample
    assert value.odd?, "Value is not odd..."
  end

end
