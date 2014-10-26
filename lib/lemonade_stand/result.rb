module LemonadeStand

  class Result

    attr_reader :glasses_sold

    def initialize data
      @glasses_sold = data[:glasses_sold]
      @choice       = data[:choice]
      @day          = data[:day]
    end

    def expenses
      result = @choice.glasses_made * @day.cost_per_glass + 15 * @choice.signs
      (result / 100.0).round(2)
    end

  end

end
