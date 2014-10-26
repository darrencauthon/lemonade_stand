module LemonadeStand

  class Result

    attr_reader :glasses_sold

    def initialize data
      @glasses_sold = data[:glasses_sold]
      @choice       = data[:choice]
      @day          = data[:day]
    end

    def expenses
      @glasses_sold * @day.cost_per_glass
    end

  end

end
