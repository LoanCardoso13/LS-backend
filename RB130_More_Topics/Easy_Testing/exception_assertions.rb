# rubocop:disable all
=begin

  Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

=end

require 'minitest/autorun'

class MyClass < Minitest::Test

  def test_raising
    assert_raises(NoExperienceError)
  end

end
