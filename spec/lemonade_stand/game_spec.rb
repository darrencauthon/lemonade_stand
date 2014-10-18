require_relative '../spec_helper'

describe LemonadeStand::Game do

  describe "starting a game" do

    [
      [4],
      [3],
    ].map { |x| Struct.new(:player_count).new *x }.each do |example|
      describe "multiple examples" do
        it "should require the number of players" do
          game = LemonadeStand::Game.new example.player_count
          game.players.count.must_equal example.player_count
        end
      end
    end
  end

end
