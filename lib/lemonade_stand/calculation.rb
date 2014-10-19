module LemonadeStand
  module Calculation

    HIGH_PRICE = 10.0
    DEMAND     = 30.0

    def self.sales_factor choice
      price_per_glass = choice.price_per_glass
      result = if price_per_glass < 10
                 (HIGH_PRICE - price_per_glass) / HIGH_PRICE * 0.8 * DEMAND + DEMAND
               else
                 (HIGH_PRICE * HIGH_PRICE) * DEMAND / (price_per_glass * price_per_glass)
               end
      result
    end

    def self.signs_factor choice
      1.0 - Math.exp((-1.0 * choice.signs) * 0.5)
    end

    def self.base_sales choice
      sales_factor = sales_factor choice
      signs_factor = signs_factor choice
      sales_factor + (sales_factor * signs_factor)
    end

  end
end
