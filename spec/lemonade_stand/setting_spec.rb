require_relative '../spec_helper'

describe LemonadeStand::Setting do
  it "#player_count" do
    setting = LemonadeStand::Setting.new({ players: 5, rounds: 2 })
    assert_equal 5, setting.player_count
  end

  it "#round_count" do
    setting = LemonadeStand::Setting.new({ players: 5, rounds: 2 })
    assert_equal 2, setting.round_count
  end
end
