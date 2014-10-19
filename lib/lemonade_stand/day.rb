module LemonadeStand

  class Day

    def projected_weather_report
      @projected_weather_report ||= LemonadeStand::Weather.projected_weather_for self
    end

    def weather
      @weather ||= LemonadeStand::Weather.weather_for self
    end

  end

end
