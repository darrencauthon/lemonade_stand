require_relative '../spec_helper'

describe LemonadeStand::Bank do
  it "holds a balance" do
    player = LemonadeStand::Player.new
    bank = LemonadeStand::Bank.new({assets: 20, player: player })
    assert_equal bank.balance, 20
  end

  it 'manages cents' do
    player = LemonadeStand::Player.new
    bank = LemonadeStand::Bank.new({assets: 200, player: player })
    assert_equal 2.00, bank.money
  end

  it 'deposits add to balance' do
    player = LemonadeStand::Player.new
    bank = LemonadeStand::Bank.new({assets: 200, player: player })
    bank.deposit(500)
    assert_equal 700, bank.balance
  end

  it "remembers last transaction" do
    player = LemonadeStand::Player.new
    bank = LemonadeStand::Bank.new({assets: 200, player: player })
    bank.deposit(500)
    hash = { transaction: 'debit', amount: 500 }
    assert_equal bank.last_transaction, hash
  end
end
