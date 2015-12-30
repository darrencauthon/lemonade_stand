module LemonadeStand
  class Report

    attr_reader :id

    def initialize(config)
      @id            = (config[:index] += 1)
      @round_count   = config[:round_count]
      @player_count  = config[:player_count]
      @day           = config[:day]
    end

    def forecast
      @day.forecast
    end

    def weather_report
      @day.weather_report
    end
  end
end
