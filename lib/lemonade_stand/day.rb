module LemonadeStand

  class Day

    def projected_weather_report
      @projected_weather_report ||= LemonadeStand::ProjectedWeatherReport.build
    end

  end

end
