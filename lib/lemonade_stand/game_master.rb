 module LemonadeStand
  class GameMaster

    attr_reader :round_count,
                :rounds,
                :player_count,
                :players

    def initialize(config)
      @round_count  = config[:rounds]
      @rounds       = []

      @player_count = config[:players]
      @players      = []

      add_players
      create_rounds
      game
    end

    def start_game
      game.play
    end

    def winner
      1
    end

    def game
      @game ||= LemonadeStand::Game.new({
          gamemaster: self,
          rounds: @rounds
        })
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

    def build_round index
      @rounds << LemonadeStand::Round.new({
        player_count: @player_count,
        index: index,
        round_count: @round_count,
        day: create_day
      })
    end

    def create_day
      LemonadeStand::Day.new
    end
  end
end
