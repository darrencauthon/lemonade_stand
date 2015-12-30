require_relative '../spec_helper'

describe LemonadeStand::Player do
  it 'knows how much profit he has' do
    player = LemonadeStand::Player.new
    assert_equal 300, player.profit
  end
end
