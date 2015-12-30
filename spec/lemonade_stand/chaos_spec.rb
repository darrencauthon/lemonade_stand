require_relative '../spec_helper'

describe LemonadeStand::Chaos do
  it "returns a hash of options for the game" do
    event = LemonadeStand::Event.new
    wind = LemonadeStand::Chaos.new(event)
    assert_equal 1, wind.effect
  end
end
