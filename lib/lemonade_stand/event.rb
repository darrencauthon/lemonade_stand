module LemonadeStand
  class Event

    def initialize(forecast=nil)
      @forecast
    end

    def forecast
      "looks nice and sunny today!"
    end

    def weather_report
      "nope, it was soooooooo nice!!!"
    end
  end
end
