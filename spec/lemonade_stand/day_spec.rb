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

end
