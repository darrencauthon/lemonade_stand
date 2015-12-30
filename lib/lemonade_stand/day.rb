module LemonadeStand
  class Day

    attr_accessor :weather_report

    def initialize
      @weather ||= LemonadeStand::Weather.new(self)
    end

    def forecast
      @weather.forecast
    end

    def weather_report
      @weather.report
    end

    def cost_of_goods
      @market = Market.new.price
    end
  end
end
