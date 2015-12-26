require_relative '../spec_helper'

describe LemonadeStand::Audit do
  it "determines who the winner is" do
    LemonadeStand::GameMaster.any_instance.stubs(:reconcile).returns({})
    config     = { players: 3, rounds: 4 }
    gamemaster = LemonadeStand::GameMaster.new(config)
    audit      = LemonadeStand::Audit.new(gamemaster)
    assert_equal Hash, audit.squeeze.class
  end
end
