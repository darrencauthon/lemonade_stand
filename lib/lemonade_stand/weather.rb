module LemonadeStand
  class Weather

    def initialize(day)
      @day = day
    end

    def forecast
      @forecast = Event.new.forecast
    end

    def weather_report
      Event.new(@forecast)
    end
  end
end
