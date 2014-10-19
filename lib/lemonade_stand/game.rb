module LemonadeStand

  class Game

    def initialize number_of_players
      @number_of_players = number_of_players
    end

    def day
      1
    end

    def make_choice choice, player
      @result = LemonadeStand::Calculation.calculate_sales days[0], choice
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
