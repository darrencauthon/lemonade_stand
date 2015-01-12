module LemonadeStand

  class RainEvent < Event

    def chance_of_rain
      (rand * 0.5 + 0.3).round(2)
    end

    def modify choice
      ((1 - chance_of_rain) * choice.max_sales).round
    end

  end

end
