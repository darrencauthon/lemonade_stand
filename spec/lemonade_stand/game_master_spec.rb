require_relative '../spec_helper'

describe LemonadeStand::GameMaster do
  it "creates the number of players" do
    players = LemonadeStand::GameMaster.new(2)
    assert_equal players.player_count, 2
  end

  it 'keeps track of number of days in the game' do
    days_to_play = 5
    players = LemonadeStand::GameMaster.new(2)
    players.total_days days_to_play
    assert_equal players.game_in_days, days_to_play
  end

  it 'starts the game' do
    players = LemonadeStand::GameMaster.new
    boom = players.start_game
    assert_equal boom, 'boom'
  end
end
