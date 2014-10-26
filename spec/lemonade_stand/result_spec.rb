require_relative '../spec_helper'

describe LemonadeStand::Result do

  let(:result) { LemonadeStand::Result.new( { glasses_sold: glasses_sold,
                                              choice:       choice,
                                              day:          day } ) }
  let(:choice) { LemonadeStand::Choice.new }
  let(:day)    { LemonadeStand::Day.new }

  describe "expenses" do
    [
      [1, 2, 0, 2],
      [2, 2, 0, 4],
      [3, 4, 0, 12],
    ].map { |x| Struct.new(:cost_per_glass, :glasses_sold, :signs, :expected).new(*x) }.each do |example|

      describe "multiple examples" do

        let(:glasses_sold) { example.glasses_sold }

        before do
          choice.signs = example.signs
          day.stubs(:cost_per_glass).returns example.cost_per_glass
        end

        it "should be the cost per glass times the number of glasses made" do
          result.expenses.must_equal example.expected
        end

      end

    end

  end

end
