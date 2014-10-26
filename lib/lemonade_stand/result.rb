module LemonadeStand

  class Result

    attr_reader :glasses_sold
    attr_reader :choice
    attr_reader :day

    def initialize data
      @glasses_sold = data[:glasses_sold]
      @choice       = data[:choice]
      @day          = data[:day]
    end

    def income
      (@glasses_sold * @choice.price_per_glass).round 2
    end

    def expenses
      glasses_cost = @choice.glasses_made * @day.cost_per_glass
      signs_cost   = 15 * @choice.signs
      (glasses_cost + signs_cost).round 2
    end

    def profit
      (income - expenses).round 2
    end

  end

end
