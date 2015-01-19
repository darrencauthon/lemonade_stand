require_relative '../spec_helper'

describe "display" do
  [
    [0,   '$0.00'],
    [1,   '$0.01'],
    [10,  '$0.10'],
    [100, '$1.00'],
    [123, '$1.23'],
  ].map { |a| Struct.new(:input, :expected).new *a }.each do |example|
    describe "money" do
      it "should convert #{example.input} to #{example.expected}" do
        LemonadeStand::Display
          .money(example.input).must_equal example.expected
      end
    end
  end
end
