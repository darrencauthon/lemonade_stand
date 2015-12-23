require_relative '../spec_helper'

describe LemonadeStand::Bank do
  it "holds a balance" do
    bank = LemonadeStand::Bank.new(20)
    assert_equal bank.balance, 20
  end
end
