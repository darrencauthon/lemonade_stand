require_relative '../spec_helper'

describe LemonadeStand::Day do

  let(:day) { LemonadeStand::Day.new }

  describe "the projected weather report" do
    
    it "should pull a projected weather report" do
      report = Object.new
      LemonadeStand::Weather.stubs(:projected_weather_for).with(day).returns report
      day.projected_weather_report.must_be_same_as report
    end

    it "should return the same projected weather report" do
      report = Object.new
      LemonadeStand::Weather.expects(:projected_weather_for).returns report
      day.projected_weather_report
      day.projected_weather_report # this call will fail if called twice
    end

  end

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

    it "should return the calculated sales" do
      glasses_sold = Object.new
      day.stubs(:calculate_glasses_sold).with(choice).returns glasses_sold
      result = day.sales_for choice
      result.glasses_sold.must_equal glasses_sold
    end

  end

  describe "calculate glasses sold" do

    let(:choice) { LemonadeStand::Choice.new }
    let(:day)    { LemonadeStand::Day.new }

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
      end

      describe "and max sales for the day was 1" do
        before { choice.stubs(:max_sales).returns 1 }

        it "should report that 1 glass was sold" do
          day.calculate_glasses_sold(choice).must_equal 1
        end
      end

    end

  end

end
