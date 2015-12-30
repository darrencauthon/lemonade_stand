require_relative '../spec_helper'

describe LemonadeStand::WeatherPattern do
  it "holds a balance" do
    bank = LemonadeStand::Bank.new(20)
    assert_equal bank.balance, 20
  end

  it 'manages cents' do
    bank = LemonadeStand::Bank.new(200)
    assert_equal 2.00, bank.money
  end
end
