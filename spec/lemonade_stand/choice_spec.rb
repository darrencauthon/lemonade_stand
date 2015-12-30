require_relative '../spec_helper'

describe LemonadeStand::Choice do

  it 'is how players buy inventory' do
    player = LemonadeStand::Player.new
    choice = LemonadeStand::Choice.new( player: player )
    choice.buy 5
    assert_equal 5, choice.inventory
  end

  it 'is how players choose what to retail lemonade for' do
    player = LemonadeStand::Player.new
    choice = LemonadeStand::Choice.new( player: player )
    choice.set_retail 995
    assert_equal 995, choice.retail
  end

  it 'is how players choose how many signs to purchase' do
    player = LemonadeStand::Player.new
    choice = LemonadeStand::Choice.new( player: player )
    choice.buy_signs 3
    assert_equal 3, choice.signs
  end

  it 'knows what cost per cup is' do
    player = LemonadeStand::Player.new
    choice = LemonadeStand::Choice.new( player: player )
    assert_equal 5.50, choice.cost_of_goods
  end

  # let(:choice) { LemonadeStand::Choice.new }

  # describe "calculate sales" do

  #   describe "sales factor" do

  #     [
  #       [1,  51.6],
  #       [2,  49.2],
  #       [3,  46.8],
  #       [7,  37.2],
  #       [8,  34.8],
  #       [9,  32.4],
  #       [10, 30.0],
  #       [11, 24.79],
  #       [12, 20.83],
  #       [16, 11.72],
  #       [17, 10.38],
  #       [18,  9.26],
  #     ].map { |x| Struct.new(:price, :expected).new(*x) }.each do |example|

  #       describe "price is #{example.price}" do

  #         before do
  #           choice.price_per_glass = example.price
  #         end

  #         it "should have a sales factor of #{example.expected}" do
  #           choice.send(:sales_factor).round(2).must_equal example.expected
  #         end
  #       end

  #     end

  #   end

  # end

  # describe "signs factor" do
  #   [
  #     [0,   0],
  #     [1,   0.39],
  #     [2,   0.63],
  #     [5,   0.92],
  #     [10,  0.99],
  #     [100, 1.0],
  #   ].map { |x| Struct.new(:signs, :expected).new(*x) }.each do |example|

  #     describe "purchased #{example.signs} signs" do

  #       before do
  #         choice.signs = example.signs
  #       end

  #       it "should return factor of #{example.expected}" do
  #         choice.send(:signs_factor).round(2).must_equal example.expected
  #       end

  #     end

  #   end

  # end

  # describe "max sales" do
  #   [
  #     [1,     0,   51.60],
  #     [1,     1,   71.90],
  #     [1,     2,   84.22],
  #     [1,   100,  103.20],
  #     [9,     0,   32.40],
  #     [9,     0,   32.40],
  #     [9,     1,   45.15],
  #     [9,     5,   62.14],
  #     [9,    10,   64.58],
  #     [9,   100,   64.80],
  #     [16,    0,   11.72],
  #     [16,  100,   23.44],
  #   ].map { |x| Struct.new(:price_per_glass, :signs, :expected).new(*x) }.each do |example|

  #     describe "#{example.price_per_glass} glasses with #{example.signs} signs" do

  #       before do
  #         choice.price_per_glass = example.price_per_glass
  #         choice.signs           = example.signs
  #       end

  #       it "should return max sales of #{example.expected}" do
  #         choice.max_sales.round(2).must_equal example.expected
  #       end

  #     end

  #   end

  # end

  # describe "dropping decimal points" do
  #   [:signs, :price_per_glass, :glasses_made].each do |property|
  #     describe property do
  #       it "drop the decimal points" do
  #         choice = LemonadeStand::Choice.new
  #         choice.send("#{property}=".to_sym, 1.01)
  #         choice.send(property).must_equal 1
  #         choice.send("#{property}=".to_sym, 2.99)
  #         choice.send(property).must_equal 2
  #       end
  #     end
  #   end
  # end

end
