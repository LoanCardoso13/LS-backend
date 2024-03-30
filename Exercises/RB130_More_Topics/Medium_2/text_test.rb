# rubocop:disable all
require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test

  def setup
    @sample_text = open('sample_text.txt')
    @text_string = @sample_text.read
    @text_obj = Text.new(@text_string)
  end

  def teardown
    @sample_text.close
    @text_string = ''
    @text_obj = nil
  end

  def test_swap
    expected = @text_string.gsub('a', 'e')

    assert_equal expected, @text_obj.swap('a', 'e')
  end

  def test_word_count
    expected = @text_string.split.size

    assert_equal expected, @text_obj.word_count
  end

end
