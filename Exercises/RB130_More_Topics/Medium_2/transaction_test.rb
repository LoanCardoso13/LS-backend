# rubocop:disable all
require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < Minitest::Test

  def test_prompt_for_payment
    input = StringIO.new("30\n")
    output = StringIO.new
    transaction = Transaction.new(13)
    transaction.prompt_for_payment(input: input, output: output)

    assert_equal 30, transaction.amount_paid
  end

end
