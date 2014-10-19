require_relative '../spec_helper'

describe LemonadeStand::Calculation do

  describe "calculate sales" do

    let(:day)    { Object.new }
    let(:choice) { Object.new }

    describe "sales factor" do

      [
        [1,  51.6],
        [2,  49.2],
        [3,  46.8],
        [7,  37.2],
        [8,  34.8],
        [9,  32.4],
        [10, 30.0],
        [11, 24.79],
        [12, 20.83],
        [16, 11.72],
        [17, 10.38],
        [18,  9.26],
      ].map { |x| Struct.new(:price, :expected).new(*x) }.each do |example|

        describe "price is #{example.price}" do

          let(:choice) { Struct.new(:price_per_glass).new example.price }

          it "should have a sales factor of #{example.expected}" do
            result = LemonadeStand::Calculation.sales_factor choice
            result.round(2).must_equal example.expected
          end
        end

      end

    end

  end

  describe "signs factor" do
    [
      [0,   0],
      [1,   0.39],
      [2,   0.63],
      [5,   0.92],
      [10,  0.99],
      [100, 1.0],
    ].map { |x| Struct.new(:signs, :expected).new(*x) }.each do |example|

      describe "purchased #{example.signs} signs" do

        let(:choice) { Struct.new(:signs).new example.signs }

        it "should return factor of #{example.expected}" do
          result = LemonadeStand::Calculation.signs_factor choice
          result.round(2).must_equal example.expected
        end

      end

    end

  end

  describe "base sales" do
    [
      [1,    0,   51.60],
      [1,    1,   71.90],
      [1,    2,   84.22],
      [1,  100,  103.20],
      [9,    0,   32.40],
      [9,    0,   32.40],
      [9,    1,   45.15],
      [9,    5,   62.14],
      [9,   10,   64.58],
      [9,   100,  64.80],
    ].map { |x| Struct.new(:price_per_glass, :signs, :expected).new(*x) }.each do |example|

      describe "#{example.price_per_glass} glasses with #{example.signs} signs" do

        let(:choice) { example }

        it "should return sales of #{example.expected}" do
          result = LemonadeStand::Calculation.base_sales choice
          result.round(2).must_equal example.expected
        end

      end

    end

  end

end
