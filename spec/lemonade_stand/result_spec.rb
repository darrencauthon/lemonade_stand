require_relative '../spec_helper'

describe LemonadeStand::Result do

  let(:result) { LemonadeStand::Result.new( { glasses_sold: glasses_sold,
                                              choice:       choice,
                                              day:          day } ) }
  let(:choice)       { LemonadeStand::Choice.new }
  let(:day)          { LemonadeStand::Day.new }
  let(:glasses_sold) { nil }

  describe "expenses" do
    [
      [1,   2, 0, 0.02],
      [1,   2, 2, 0.32],
      [2,   2, 0, 0.04],
      [3,   4, 0, 0.12],
      [3,   4, 1, 0.27],
      [50, 15, 9, 8.85],
    ].map { |x| Struct.new(:cost_per_glass, :glasses_made, :signs, :expected).new(*x) }.each do |example|

      describe "multiple examples" do

        before do
          choice.signs        = example.signs
          choice.glasses_made = example.glasses_made
          day.stubs(:cost_per_glass).returns example.cost_per_glass
        end

        it "should be the cost per glass times the number of glasses made" do
          result.expenses.must_equal example.expected
        end

      end

    end

  end

end
