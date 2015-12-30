require_relative '../spec_helper'

describe LemonadeStand::Bank do
  it "holds a balance" do
    bank = LemonadeStand::Bank.new(20)
    assert_equal bank.balance, 20
  end

  it 'manages cents' do
    bank = LemonadeStand::Bank.new(200)
    assert_equal 2.00, bank.money
  end

  it 'deposits add to balance' do
    bank = LemonadeStand::Bank.new(200)
    bank.deposit(500)
    assert_equal 700, bank.balance
  end

  it "remembers last transaction" do
    bank = LemonadeStand::Bank.new(200)
    bank.deposit(500)
    hash = { transaction: 'debit', amount: 500 }
    assert_equal bank.last_transaction, hash
  end
end
