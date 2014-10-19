module LemonadeStand

  class Day

    def projected_weather_report
      @projected_weather_report ||= LemonadeStand::Weather.build_projected_weather_report
    end

  end

end
