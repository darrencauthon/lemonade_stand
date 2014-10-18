module LemonadeStand

  class Game

    def initialize number_of_players
      @number_of_players = number_of_players
    end

    def day
      1
    end

    def players
      (0...@number_of_players).map { |i| LemonadeStand::Player.new i }
    end

  end

end
