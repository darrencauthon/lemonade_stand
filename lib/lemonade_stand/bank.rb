module LemonadeStand
  class Bank
    def initialize(assets)
      @assets = assets
    end

    def balance
      @assets
    end
  end
end
