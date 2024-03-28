# rubocop:disable all
=begin

  Write a minitest assertion that will fail if value is not nil.

=end

require 'minitest/autorun'

class MyClass < Minitest::Test

  def test_nilly
    value = ['not nil', nil ].sample
    assert_nil(value, "Ops!")
  end

end
