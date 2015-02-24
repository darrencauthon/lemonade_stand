require_relative '../spec_helper'

describe LemonadeStand::Day do

  let(:day) { LemonadeStand::Day.new }

  describe "the weather" do
    
    it "should pull the weather" do
      weather = Object.new
      LemonadeStand::Weather.stubs(:weather_for).with(day).returns weather
      day.weather.must_be_same_as weather
    end

    it "should return the same projected weather report" do
      weather = Object.new
      LemonadeStand::Weather.expects(:weather_for).returns weather
      day.weather
      day.weather # this call will fail if called twice
    end

  end

  describe "sales_for" do

    let(:day)    { LemonadeStand::Day.new }
    let(:choice) { Object.new }

    let(:glasses_sold) { Object.new }

    before do
      day.stubs(:calculate_glasses_sold).with(choice).returns glasses_sold
    end

    it "should return a result" do
      result = day.sales_for choice
      result.is_a?(LemonadeStand::Result).must_equal true
    end

    it "should return the calculated sales" do
      result = day.sales_for choice
      result.glasses_sold.must_equal glasses_sold
    end

    it "should pass along the day" do
      result = day.sales_for choice
      result.day.must_be_same_as day
    end

    it "should pass along the choice" do
      result = day.sales_for choice
      result.choice.must_be_same_as choice
    end

  end

  describe "calculate glasses sold" do

    let(:choice) { LemonadeStand::Choice.new }

    let(:event) do
      e = Object.new
      # default to an event that does not modify the number
      def e.modify choice
        choice.max_sales
      end
      e
    end

    let(:day) do
      d = LemonadeStand::Day.new
      d.stubs(:event).returns event
      d
    end

    describe "no glasses were made" do
      before { choice.glasses_made = 0 }

      describe "and the max sales for the day was 1" do
        before { choice.stubs(:max_sales).returns 1 }

        it "should report that no glasses were sold" do
          day.calculate_glasses_sold(choice).must_equal 0
        end
      end

    end

    describe "2 glasses were made" do
      before { choice.glasses_made = 2 }

      describe "and max sales for the day was 3" do
        before { choice.stubs(:max_sales).returns 3 }

        it "should report that 2 glasses was sold" do
          day.calculate_glasses_sold(choice).must_equal 2
        end

        describe "and the day's event modified the glasses to 3" do
          before { event.stubs(:modify).with(choice).returns 3 }

          it "should report that 2 were returned" do
            day.calculate_glasses_sold(choice).must_equal 2
          end
        end

        describe "and the day's event modified the glasses to 4" do
          before { event.stubs(:modify).with(choice).returns 4 }

          it "should report that 2 were returned" do
            day.calculate_glasses_sold(choice).must_equal 2
          end
        end
      end

      describe "and max sales for the day was 1" do
        before { choice.stubs(:max_sales).returns 1 }

        it "should report that 1 glass was sold" do
          day.calculate_glasses_sold(choice).must_equal 1
        end
      end

    end

    describe "4 glasses were made" do
      before { choice.glasses_made = 4 }

      describe "and max sales for the day was 3" do
        before { choice.stubs(:max_sales).returns 3 }

        it "should report that 3 glasses was sold" do
          day.calculate_glasses_sold(choice).must_equal 3
        end

        describe "and the day's event modified the glasses to 4" do
          before { event.stubs(:modify).with(choice).returns 4 }

          it "should report that 4 were returned" do
            day.calculate_glasses_sold(choice).must_equal 4
          end
        end

        describe "and the day's event modified the glasses to 5" do
          before { event.stubs(:modify).with(choice).returns 5 }

          it "should report that 4 were returned" do
            day.calculate_glasses_sold(choice).must_equal 4
          end
        end
      end

      describe "and max sales for the day was 1" do
        before { choice.stubs(:max_sales).returns 1 }

        it "should report that 1 glass was sold" do
          day.calculate_glasses_sold(choice).must_equal 1
        end
      end

    end

    describe "5.001 glasses were made" do
      before { choice.glasses_made = 5.001 }

      describe "and max sales for the day was 3.01" do
        before { choice.stubs(:max_sales).returns 3.01 }

        it "should report that 3 glasses was sold" do
          day.calculate_glasses_sold(choice).must_equal 3
        end

        describe "and the day's event modified the glasses to 5.01" do
          before { event.stubs(:modify).with(choice).returns 5.01 }

          it "should report that 5 were returned" do
            day.calculate_glasses_sold(choice).must_equal 5
          end
        end

        describe "and the day's event modified the glasses to 5.002" do
          before { event.stubs(:modify).with(choice).returns 5.002 }

          it "should report that 5 were returned" do
            day.calculate_glasses_sold(choice).must_equal 5
          end
        end
      end

      describe "and max sales for the day was 1.01" do
        before { choice.stubs(:max_sales).returns 1.01 }

        it "should report that 1 glass was sold" do
          day.calculate_glasses_sold(choice).must_equal 1
        end
      end

    end


  end

  describe "event" do

    let(:event) { Object.new }

    before { LemonadeStand::Event.stubs(:for).with(day).returns(event).then.returns(Object.new) }

    it "should look up the event for the day" do
      day.event.must_be_same_as event
    end

    it "should return the same day on every call" do
      day.event.must_be_same_as day.event
    end

  end

  describe "cost per glass" do

    [
      [1, 2],
      [2, 2],
      [3, 4],
      [4, 4],
      [5, 5],
      [6, 5],
    ].map { |x| Struct.new(:day_number, :cost).new *x }.each do |example|

      describe "day #{example.day_number}" do
        before { day.stubs(:number).returns example.day_number }
        it "should equal #{example.cost}" do
          day.cost_per_glass.must_equal example.cost
        end
      end

    end

  end

end
