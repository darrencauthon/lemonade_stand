require_relative '../spec_helper'

describe LemonadeStand::Result do

  # let(:result) { LemonadeStand::Result.new( { glasses_sold: glasses_sold,
  #                                             choice:       choice,
  #                                             day:          day } ) }
  # let(:choice)       { LemonadeStand::Choice.new }
  # let(:day)          { LemonadeStand::Day.new }
  # let(:glasses_sold) { nil }

  # describe "expenses" do
  #   [
  #     [1,      2, 0,   2],
  #     [1,      2, 2,  32],
  #     [2,      2, 0,   4],
  #     [3,      4, 0,  12],
  #     [3,      4, 1,  27],
  #     [50,    15, 9, 885],
  #     [1.001,  2, 0,   2],
  #   ].map { |x| Struct.new(:cost_per_glass, :glasses_made, :signs, :expected).new(*x) }.each do |example|

  #     describe "multiple examples" do

  #       before do
  #         choice.signs        = example.signs
  #         choice.glasses_made = example.glasses_made
  #         day.stubs(:cost_per_glass).returns example.cost_per_glass
  #       end

  #       it "should be the cost per glass times the number of glasses made" do
  #         result.expenses.must_equal example.expected
  #       end

  #     end

  #   end

  # end

  # describe "income" do
  #   [
  #     [1, 2,       2],
  #     [2, 2,       4],
  #     [3, 8,      24],
  #     [3, 8.0001, 24],
  #   ].map { |x| Struct.new(:price_per_glass, :glasses_sold, :expected).new(*x) }.each do |example|

  #     describe "multiple examples" do

  #       let(:glasses_sold) { example.glasses_sold }

  #       before do
  #         choice.price_per_glass = example.price_per_glass
  #       end

  #       it "should be the price of the glass " do
  #         result.income.must_equal example.expected
  #       end

  #     end

  #   end
  # end

  # describe "profit" do
  #   [
  #     [200,     100,  100],
  #     [401,     500,  -99],
  #     [400.001, 500, -100],
  #   ].map { |x| Struct.new(:income, :expenses, :expected).new *x }.each do |example|
  #     describe "so many tests" do
  #       before do
  #         result.stubs(:income).returns example.income
  #         result.stubs(:expenses).returns example.expenses
  #       end
  #       it "should be the income minus expenses" do
  #         result.profit.must_equal example.expected
  #       end
  #     end
  #   end
  # end

end
