module LemonadeStand

  class Game

    def initialize number_of_players
      @number_of_players = number_of_players
    end

    def make_choice choice, options
      player = options[:player]
      day    = options[:day]
      @result = LemonadeStand::Calculation.calculate_sales day, choice
    end

    def days
      @days ||= []
    end

    def start_a_new_day
      @days ||= []
      day = LemonadeStand::Day.new
      @days << day
      day
    end

    def sales_results_for player, day
      @result
    end

    def players
      @players ||= (0...@number_of_players).map do |i|
                     p = LemonadeStand::Player.new
                     p.index = i
                     p.game = self
                     p
                   end
    end

  end

end
