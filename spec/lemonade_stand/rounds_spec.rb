require_relative '../spec_helper'

describe LemonadeStand::Round do
  it "knows what round the game is on" do
    day = LemonadeStand::Day.new
    round = LemonadeStand::Round.new({
      index: 1,
      round_count: 2,
      player_count: 3,
      day: day
      })
    assert_equal 1, round.current_round
  end
end
