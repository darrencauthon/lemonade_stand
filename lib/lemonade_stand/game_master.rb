module LemonadeStand
  class GameMaster

    def initialize(config)
      # _dw how can I access these? for some reason, attr_reader wasn't working so I created these two methods rounds_to_play and all_players

      @group = []
      @all_rounds = []
      @players = config[:players]
      @rounds = config[:rounds]
      add_players_to_group
      create_rounds
      setup_game
    end

    ## I thought an attr_reader would work

    def rounds_to_play
      @rounds
    end

    def all_players
      @group
    end

    def all_rounds_to_pay
      @all_rounds
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
      @all_rounds[id]
    end

    def remaining_rounds(round)
        @remaining_rounds = @rounds - round
    end

    def current_round
      @all_rounds.count - @remaining_rounds
    end

    def rounds_played
      # _dw TODO
    end

    def add_players_to_group
      @players.times.each do |player, index|
        @group << create_player(index)
      end
    end

    def create_rounds
      @rounds.times do |round|
        build_round(round)
      end
    end

    def build_round round
      @all_rounds << LemonadeStand::Round.new(round)
    end

    def total_days days
      @rounds = days
    end

    def rounds
      @days
    end

    def create_player index
      Player.new(index)
    end
  end
end
