require_relative '../spec_helper'

describe LemonadeStand::Squeezer do
  it 'gets a profit figure from player' do
    player = LemonadeStand::Player.new
    audit = LemonadeStand::Audit.new
    squeeze = LemonadeStand::Squeezer.new(audit, player)
    assert_equal 300, squeeze.player
  end
end
