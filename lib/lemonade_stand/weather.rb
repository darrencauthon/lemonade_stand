module LemonadeStand
  class Weather

    attr_reader :weather_pattern

    def initialize(day)
      @day = day
    end

    def forecast
      weather_pattern.forecast
    end

    def report
      weather_pattern.report
    end

    def weather_pattern
      @weather_pattern ||= LemonadeStand::WeatherPattern.new
    end
  end
end
