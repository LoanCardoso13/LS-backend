# rubocop:disable all
require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test

  def test_accept_money
    register = CashRegister.new(0)
    transaction = Transaction.new(0)
    transaction.amount_paid = 13
    register.accept_money(transaction)

    assert_equal 13, register.total_money
  end

  def test_change
    transaction = Transaction.new(10)
    transaction.amount_paid = 13
    register = CashRegister.new(1000)

    assert_equal 3, register.change(transaction)
  end

  def test_give_receipt
    transaction = Transaction.new(10)
    transaction.amount_paid = 13
    register = CashRegister.new(1000)

    assert_output("You've paid $10.\n", nil) do
      register.give_receipt(transaction)
    end
  end

end
