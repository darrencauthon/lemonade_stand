require_relative '../spec_helper'

describe LemonadeStand::Audit do
  it "determines who the winner is" do
    audit = LemonadeStand::Audit.new
    assert_equal 1, audit.squeeze
  end
end
