require_relative '../spec_helper'

describe LemonadeStand::Game do

  describe "starting a game" do

    [
      [4],
      [3],
    ].map { |x| Struct.new(:player_count).new *x }.each do |example|

      describe "multiple examples" do

        let(:game) { LemonadeStand::Game.new example.player_count }

        it "should require the number of players" do
          game.players.count.must_equal example.player_count
        end

        it "should return player objects for each player" do
          game.players.each { |p| p.is_a?(LemonadeStand::Player).must_equal true }
        end

        it "should set the player index on each as an incrementing index" do
          game.players.each_with_index do |player, index|
            player.index.must_equal index
          end
        end

      end

    end

  end

end
