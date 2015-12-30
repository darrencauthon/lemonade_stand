require_relative '../spec_helper'

describe LemonadeStand::Market do
  it 'knows price of lemonade for the day' do
    market = LemonadeStand::Market.new
    assert_equal 5.50, market.price
  end

  it 'knows price of signs' do
    market = LemonadeStand::Market.new
    assert_equal 4, market.sign_cost
  end
end
