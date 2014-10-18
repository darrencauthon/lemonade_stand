module LemonadeStand

  class Game

    def initialize number_of_players
      @number_of_players = number_of_players
    end

    def players
      (1..@number_of_players).map { Object.new }
    end

  end

end
