module LemonadeStand
  class GameMaster

    attr_reader :players, :game, :group

    def initialize(players=1)
      @group = []
      @players = players
      add_players_to_group
      setup_game
    end

    def add_players_to_group
      players.times.each do |player, index|
        @group << create_player(index)
      end
    end

    def total_days days
      @days = days
    end

    def rounds
      @days
    end

    def create_player index
      Player.new(index)
    end

    def start_game
      @game.play @days
    end

    def setup_game
      @game ||= LemonadeStand::Game.new self
    end
  end
end
