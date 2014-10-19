module LemonadeStand
  module Calculation

    HIGH_PRICE = 10.0
    DEMAND     = 30.0

    def self.sales_factor choice
      result = if choice.price_per_glass < 10
                 (HIGH_PRICE - choice.price_per_glass) / HIGH_PRICE * 0.8 * DEMAND + DEMAND
               else
                 (HIGH_PRICE * HIGH_PRICE) * DEMAND / (choice.price_per_glass * choice.price_per_glass)
               end
      result
    end
  end
end
