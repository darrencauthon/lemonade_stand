require_relative '../spec_helper'

describe "display" do
  describe "money" do
    it "should convert 0 to $0.00" do
      LemonadeStand::Display.money(0).must_equal '$0.00'
    end
  end
end
