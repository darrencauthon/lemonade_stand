module LemonadeStand
  class Squeezer
    def initialize(audit, player)
      @player = player
    end

    def player
      @player.profit
    end
  end
end
