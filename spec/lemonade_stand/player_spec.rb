require_relative '../spec_helper'

describe LemonadeStand::Player do

  let(:player) { LemonadeStand::Player.new }

  it "should default the assets to 200 pennies" do
    player.assets.must_equal 200
  end

end
