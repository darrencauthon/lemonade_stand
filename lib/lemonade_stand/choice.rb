module LemonadeStand

  class Choice

    HIGH_PRICE = 10.0
    DEMAND     = 30.0

    attr_accessor :signs
    attr_accessor :price_per_glass
    attr_accessor :glasses_made

    def max_sales
      sales_factor + (sales_factor * signs_factor)
    end

    def signs
      @signs.to_i
    end

    def price_per_glass
      @price_per_glass.to_i
    end

    def glasses_made
      @glasses_made.to_i
    end

    private

    def sales_factor
      result = if price_per_glass < 10
                 (HIGH_PRICE - price_per_glass) / HIGH_PRICE * 0.8 * DEMAND + DEMAND
               else
                 (HIGH_PRICE * HIGH_PRICE) * DEMAND / (price_per_glass * price_per_glass)
               end
      result
    end

    def signs_factor
      1.0 - Math.exp((-1.0 * signs) * 0.5)
    end

  end

end
