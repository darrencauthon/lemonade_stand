module LemonadeStand
  class GameMaster

    attr_reader :players

    def initialize(players=1)
      @players = players
      create_players
    end

    def create_players
      players.times.each do |player, index|
        create_player index
      end
    end

    def player_count
      players
    end

    def create_player index
      Player.new(index)
    end

    def total_days days
      @days = days
    end

    def game_in_days
      @days
    end

    def start_game
      'boom'
    end
  end
end
