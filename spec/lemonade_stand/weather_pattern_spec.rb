require_relative '../spec_helper'

describe LemonadeStand::WeatherPattern do
  it 'has a forecast' do
    wp = LemonadeStand::WeatherPattern.new
    assert_equal 'sunny', wp.forecast
  end

  it 'has a report' do
    wp = LemonadeStand::WeatherPattern.new
    assert_equal 'hot', wp.report
  end
end
