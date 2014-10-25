require_relative '../spec_helper'

describe LemonadeStand::Weather do

  describe "weather for a day" do

    let(:day) { Object.new }

    (1..2).to_a.each do |day_number|
      describe "and the day is #{day_number}" do
        before { day.stubs(:number).returns day_number }
        it "should return that the day is sunny" do
          result = LemonadeStand::Weather.weather_for day
          result.sunny?.must_equal true
          result.cloudy?.must_equal false
          result.hot_and_dry?.must_equal false
        end
      end
    end

    (3..10).to_a.each do |day_number|
      describe "and the day is #{day_number}" do
        before { day.stubs(:number).returns day_number }
        (1..5).each do |random_value|
          describe "random 0-9 is #{random_value}" do
            before { LemonadeStand::Weather.stubs(:rand).returns random_value }
            it "should be sunny" do
              result = LemonadeStand::Weather.weather_for day
              result.cloudy?.must_equal false
              result.sunny?.must_equal true
              result.hot_and_dry?.must_equal false
            end
          end
        end
        (6..7).each do |random_value|
          describe "random 0-9 is #{random_value}" do
            before { LemonadeStand::Weather.stubs(:rand).returns random_value }
            it "should be cloudy" do
              result = LemonadeStand::Weather.weather_for day
              result.cloudy?.must_equal true
              result.sunny?.must_equal false
              result.hot_and_dry?.must_equal false
            end
          end
        end
        (8..9).each do |random_value|
          describe "random 0-9 is #{random_value}" do
            before { LemonadeStand::Weather.stubs(:rand).returns random_value }
            it "should be cloudy" do
              result = LemonadeStand::Weather.weather_for day
              result.cloudy?.must_equal false
              result.sunny?.must_equal false
              result.hot_and_dry?.must_equal true
            end
          end
        end
      end
    end
  end
end
