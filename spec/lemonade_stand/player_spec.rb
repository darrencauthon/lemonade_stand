require_relative '../spec_helper'

describe LemonadeStand::Player do

  let(:player) { LemonadeStand::Player.new }

  it "should default the assets to 200 pennies" do
    player.assets.must_equal 200
  end

  describe "making a choice" do

    let(:game)   { Object.new }
    let(:choice) { Object.new }

    before do
      player.game = game
    end

    it "should pass the choice up to the game" do
      game.expects(:make_choice).with choice, { player: player }
      player.choose choice
    end

  end

end
