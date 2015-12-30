module LemonadeStand
  class Round

    attr_reader :id

    def initialize(config)
      @id           = (config[:index] += 1)
      @round_count  =  config[:round_count]
      @player_count =  config[:player_count]
      @day          =  config[:day]
    end

    def current_round
      1
    end

    def forecast
      @day.forecast
    end

    def weather_report
      @day.weather_report
    end
  end
end
