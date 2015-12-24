module LemonadeStand
  class GameMaster

    attr_reader :round_count,
                :rounds,
                :player_count,
                :players

    def initialize(config)
      # know how many rounds and save each round
      @round_count = config[:rounds]
      @rounds = []

      # know how many players and save each player
      @player_count = config[:players]
      @players = []

      add_players
      create_rounds
      setup_game
    end

    def start_game
      @game.play @days
    end

    def setup_game
      @game ||= LemonadeStand::Game.new with_a_gamemaster
    end

    def with_a_gamemaster
      self
    end

    def round(id)
      id -= 1
      @rounds[id]
    end

    def remaining_rounds(round)
        @remaining_rounds = @round_count - round
    end

    def current_round
      @rounds.count - @remaining_rounds
    end

    def rounds_played
      # _dw TODO
    end

    def add_players
      @player_count.times.each do |player_id|
        @players << create_player(player_id)
      end
    end

    def create_player player_id
      Player.new(player_id)
    end

    def create_rounds
      @round_count.times do |round|
        build_round(round)
      end
    end

    def build_round round
      @rounds << LemonadeStand::Round.new(round)
    end

    def total_days days
      @round_count = days
    end
  end
end
