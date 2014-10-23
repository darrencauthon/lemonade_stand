module LemonadeStand

  class Player
    attr_accessor :index
    attr_accessor :game

    def assets
      200
    end

    def choose choice
      game.make_choice choice, { player: self }
    end

  end

end
