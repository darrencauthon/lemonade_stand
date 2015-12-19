module LemonadeStand

  class HeatWaveEvent < Event;

    def modify choice
      choice.max_sales * 2
    end

  end

end
