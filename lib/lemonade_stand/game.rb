module LemonadeStand
  class Game

    attr_reader :gamemaster

    def initialize(config)
      @gamemaster    = config[:gamemaster]
      @rounds        = config[:rounds]
      @current_round = 1
    end

    def play
      @rounds.each do |turn|
        todays_forecast(turn)
        take_turns turn
        weather_report(turn)
        @current_round += 1
      end
    end

    def take_turns turn
      gamemaster.players.each do |player|
        player.choose
      end
    end

    def weather_report turn
      turn.weather_report
    end

    def todays_forecast turn
      puts " --------------------------------------------"
      puts "                                day #{turn.id} of #{@gamemaster.round_count}"
      puts ""
      puts " TODAY'S FORECAST..."
      puts "  #{turn.forecast}"
    end
  end
end
