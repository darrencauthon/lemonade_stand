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

end
